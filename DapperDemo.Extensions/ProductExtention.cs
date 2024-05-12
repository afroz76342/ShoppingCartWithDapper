using DapperDemo.Entities;
using DapperDemo.Models;

namespace DapperDemo.Extensions
{
    public static class ProductExtention
    {

        public static ProductEntity ToProductEntity(this ProductListingModel product)
        {
            return new ProductEntity()
            {
                Id = product.Id,
                Name = product.Name,
                Price = product.Price,
                Currency = product.Currency,
            };
        }

        public static ProductListingModel ToProductModel(this ProductEntity product)
        {
            return new ProductListingModel()
            {
                Id = product.Id,
                Name = product.Name,
                Price = product.Price,
                Currency = product.Currency,
            };
        }


        public static List<ProductListingModel> ToProductModelList(this IEnumerable<ProductEntity> products)
        {
            return  products.Select(x => new ProductListingModel()
            {
                Id = x.Id,
                Name = x.Name,
                Price = x.Price,
                Currency = x.Currency,
            }).ToList();
               
        }
    }
}
