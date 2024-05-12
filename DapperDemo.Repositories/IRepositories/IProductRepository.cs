using DapperDemo.Entities;

namespace DapperDemo.Repositories
{
    public interface IProductRepository
    {
        List<ProductEntity> GetAllProducts();
        List<DropDownEntity> GetCurrencies();
        ProductEntity GetProductDetailById(int productId);
        bool AddProduct(ProductEntity product);
        bool UpdateProduct(ProductEntity product);
        bool DeleteProduct(int productId);
    }
}
