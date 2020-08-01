using System;
using System.ComponentModel.DataAnnotations;

namespace CatalogsApi.Models
{
    public class Countries
    {
        [Key]
        public string country_id { get; set; }
        public string country_name { get; set; }
        public int region_id { get; set; }
    }
}