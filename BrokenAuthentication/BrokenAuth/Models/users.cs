using System.ComponentModel.DataAnnotations;

namespace BrokenAuth.Models
{
    public class Users
    {
        [Key]
        public int userId { get; set; }
        [Required]
        public String username { get; set; } = "";
        [Required]
        public bool isAdmin { get; set; } = true;
    }
}
