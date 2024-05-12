

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DapperDemo.Models
{
    public class ProductModel
    {
        public List<ProductListingModel> Products { get; set; }
        public List<DropDownModel> Currenties { get; set; }
    }
    public class ProductListingModel
    {
        public int Id { get; set; }
        [DisplayName("Product *"), Required(ErrorMessage = "Name is required")]
        [RegularExpression(@"^[a-zA-Z\s]*$", ErrorMessage = "Name can only contain alphabets and spaces")]
        public string Name { get; set; }

        [DisplayName("Price *"), Required(ErrorMessage = "Price is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Price must be a positive number")]
        public decimal Price { get; set; }

        [DisplayName("Currency *"),Required]
        public string Currency { get; set; }
        public int Sequence { get; set; }
    }


}
