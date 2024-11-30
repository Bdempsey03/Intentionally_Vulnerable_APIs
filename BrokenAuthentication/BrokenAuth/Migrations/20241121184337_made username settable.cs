using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BrokenAuth.Migrations
{
    /// <inheritdoc />
    public partial class madeusernamesettable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "username",
                table: "users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "username",
                table: "users");
        }
    }
}
