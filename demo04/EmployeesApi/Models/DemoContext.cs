using System;
using EmployeesApi.Models;
using Microsoft.EntityFrameworkCore;

namespace EmployeesApi
{
    public class DemoContext : DbContext
    {
        public DemoContext(DbContextOptions<DemoContext> options)
            : base(options)
        { }

        public DbSet<Employees> Employees { get; set; }
    }
}