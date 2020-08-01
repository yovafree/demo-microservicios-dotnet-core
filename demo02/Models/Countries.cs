using System;
using System.ComponentModel.DataAnnotations;

namespace demo02.Models
{
    public class Countries
    {
        [Key]
        public string country_id { get; set; }
        public string country_name { get; set; }
        public int region_id { get; set; }
    }
}