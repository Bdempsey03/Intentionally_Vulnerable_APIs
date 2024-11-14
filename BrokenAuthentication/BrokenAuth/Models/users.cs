using System.ComponentModel.DataAnnotations;

namespace BrokenAuth.Models
{
    public class users
    {
        [Key]
        public int userId { get; set; }

        public String username { get; } = "";
    }
}
