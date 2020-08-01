using System;
using api.Models;
using Microsoft.EntityFrameworkCore;

namespace api
{
    public class DemoContext : DbContext
    {
        public DemoContext(DbContextOptions<DemoContext> options)
            : base(options)
        { }

        public DbSet<Countries> Countries { get; set; }

        public DbSet<Departments> Departments { get; set; }

        public DbSet<Dependents> Dependents { get; set; }

        public DbSet<Employees> Employees { get; set; }

        public DbSet<Jobs> Jobs { get; set; }

        public DbSet<Models.Locations> Locations { get; set; }

        public DbSet<Models.Regions> Regions { get; set; }
    }
}