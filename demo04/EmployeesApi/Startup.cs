using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading.Tasks;
using Consul;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Hosting.Server.Features;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace EmployeesApi
{
    public class Startup
    {
         public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddConsulConfig(Configuration);
            services.AddDbContext<DemoContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("DemoContext")));
            services.AddCors();
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        [Obsolete]
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            var configuration = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json")
            .AddJsonFile($"appsettings.{env.EnvironmentName}.json")
            .AddEnvironmentVariables()
            .Build();

            app.UseHttpsRedirection();
            app.UseConsul(env.EnvironmentName); 
            app.UseRouting();

            app.UseCors(builder => 
            builder.WithOrigins("http://localhost:4200") 
            .AllowAnyOrigin() 
            .AllowAnyHeader() 
            .AllowAnyMethod()); 
            
            
            
            //app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }

    public static class AppExtensions  
    {             
        public static IServiceCollection AddConsulConfig(this IServiceCollection services, IConfiguration configuration)  
        {  
            services.AddSingleton<IConsulClient, ConsulClient>(p => new ConsulClient(consulConfig =>  
            {  
                var address = configuration.GetValue<string>("Consul:Host");  
                consulConfig.Address = new Uri(address);  
            }));  
            return services;  
        }

        [Obsolete]
        public static IApplicationBuilder UseConsul(this IApplicationBuilder app, string EnvironmentName)  
        {  
            var consulClient = app.ApplicationServices.GetRequiredService<IConsulClient>();  
            var logger = app.ApplicationServices.GetRequiredService<ILoggerFactory>().CreateLogger("AppExtensions");  
            var lifetime = app.ApplicationServices.GetRequiredService<Microsoft.AspNetCore.Hosting.IApplicationLifetime>();  
      
            if (!(app.Properties["server.Features"] is FeatureCollection features)) return app;  
      
            var addresses = features.Get<IServerAddressesFeature>();  
            var address = addresses.Addresses.First();  
      
            var name = Dns.GetHostName(); // get container id
            var ip = Dns.GetHostEntry(name).AddressList.FirstOrDefault(x => x.AddressFamily == AddressFamily.InterNetwork);
            string ipStr = "";
            if (EnvironmentName == "Production"){
                Console.WriteLine($"address={ip}"); 
                ipStr = "http://" + ip.ToString(); 
            }else{
                Console.WriteLine($"address={address}"); 
                ipStr = address; 
            }
      
            var uri = new Uri(ipStr);  
            var registration = new AgentServiceRegistration()  
            {  
                ID = $"employees-api-{uri.Port}",  
                // servie name  
                Name = "employees-api",  
                Address = $"{uri.Host}",  
                Port = uri.Port  
            };  
      
            logger.LogInformation("Registering with Consul");  
            consulClient.Agent.ServiceDeregister(registration.ID).ConfigureAwait(true);  
            consulClient.Agent.ServiceRegister(registration).ConfigureAwait(true);  
      
            lifetime.ApplicationStopping.Register(() =>  
            {  
                logger.LogInformation("Unregistering from Consul");  
                consulClient.Agent.ServiceDeregister(registration.ID).ConfigureAwait(true);  
            });  
      
            return app;  
        }  
    }  
}
