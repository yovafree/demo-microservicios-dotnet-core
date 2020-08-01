using System;
using System.ComponentModel.DataAnnotations;

namespace demo02.Models
{
    public class Departments
    {
        [Key]
        public int department_id { get; set; }
        public string department_name { get; set; }
        public int location_id { get; set; }
    }
}