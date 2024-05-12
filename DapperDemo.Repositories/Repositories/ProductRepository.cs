
using Dapper;
using DapperDemo.Entities;
using System.Data;

namespace DapperDemo.Repositories.Repository
{
    public class ProductRepository : IProductRepository
    {
        #region "-- Local Variable/Object Declaration --"
        private readonly IDbConnection _dbConnection;
        #endregion

        #region "-- Constructor Declaration --"
        public ProductRepository(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }
        #endregion

        #region "-- Repository Methods --"
        public  List<ProductEntity> GetAllProducts()
        {
            return  _dbConnection.Query<ProductEntity>("[Master].[GetAllProducts]", commandType: CommandType.StoredProcedure).ToList();
        
        }

        public List<DropDownEntity> GetCurrencies()
        {
            return _dbConnection.Query<DropDownEntity>("[Master].[GetCurrencies]", commandType: CommandType.StoredProcedure).ToList();
        }

        public ProductEntity GetProductDetailById(int productId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@ID", productId);
            return _dbConnection.Query<ProductEntity>("[Master].[GetProductDetailById]", parameters, commandType: CommandType.StoredProcedure)?.FirstOrDefault()?? new ProductEntity();
        }
        public bool AddProduct(ProductEntity product)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Name", product.Name);
            parameters.Add("@Price", product.Price);
            parameters.Add("@Currency", product.Currency);

            return _dbConnection.Execute("[Master].[AddProducts]", parameters, commandType: CommandType.StoredProcedure) > 0;
        }
        public bool UpdateProduct(ProductEntity product)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Name", product.Name);
            parameters.Add("@Price", product.Price);
            parameters.Add("@Currency", product.Currency);
            parameters.Add("@ID", product.Id);

            return _dbConnection.Execute("[Master].[UpdateProducts]", parameters, commandType: CommandType.StoredProcedure) > 0;
        }
        public bool DeleteProduct(int productId)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@ID", productId);
            return _dbConnection.Execute("[Master].[DeleteProduct]", parameters, commandType: CommandType.StoredProcedure) > 0;
        }
        #endregion

    }
}
