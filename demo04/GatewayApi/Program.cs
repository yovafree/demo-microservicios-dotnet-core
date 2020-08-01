using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;
using Consul;
using Ocelot.Provider.Consul;

namespace GatewayApi
{
    public class Program
    {
        public static void Main(string[] args)  
    {  
        CreateWebHostBuilder(args).Build().Run();  
    }  
  
    public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>  
        WebHost.CreateDefaultBuilder(args)  
         .UseUrls("http://*:9000")  
         .ConfigureAppConfiguration((hostingContext, config) =>  
         {  
             if (hostingContext.HostingEnvironment.EnvironmentName == "Production"){
                 config  
                .SetBasePath(hostingContext.HostingEnvironment.ContentRootPath)  
                .AddJsonFile("ocelot.Production.json")  
                .AddEnvironmentVariables();
             }else{
                 config  
                .SetBasePath(hostingContext.HostingEnvironment.ContentRootPath)  
                .AddJsonFile("ocelot.json")  
                .AddEnvironmentVariables();
             }
              
         })  
        .ConfigureServices(services =>  
        {  
            services.AddOcelot()
            .AddConsul(); 
        })  
        .Configure(app =>  
        {  
            app.UseOcelot().Wait();  
        });  
    }
}
