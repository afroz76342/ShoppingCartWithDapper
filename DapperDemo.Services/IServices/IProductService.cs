using DapperDemo.Models;

namespace DapperDemo.Services
{
    public interface IProductService
    {
        ProductModel GetAllProducts();
        List<DropDownModel> GetCurrencies();
        public ProductListingModel GetProductDetailById(int productId);
        bool AddProduct(ProductListingModel product);
        bool UpdateProduct(ProductListingModel product);
        bool DeleteProduct(int productId);
    }
}
