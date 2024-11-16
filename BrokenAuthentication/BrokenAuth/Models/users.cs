using System.ComponentModel.DataAnnotations;

namespace BrokenAuth.Models
{
    public class Users
    {
        [Key]
        public int userId { get; set; }

        public String username { get; } = "";
    }
}
