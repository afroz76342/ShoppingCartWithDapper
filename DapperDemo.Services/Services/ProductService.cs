using DapperDemo.Models;
using DapperDemo.Repositories;
using DapperDemo.Entities;
using DapperDemo.Extensions;
using Newtonsoft.Json;

namespace DapperDemo.Services
{
    public class ProductService : IProductService
    {

        #region "-- local variable Object ddeclaration --"
        private readonly IProductRepository _productRepository;
        private readonly IExceptionRepository _exceptionRepository;
        private readonly string _serviceName;
        #endregion

        #region "-- Constructor --"
        public ProductService(IProductRepository productRepository, IExceptionRepository exceptionRepository)
        {
            _productRepository = productRepository;
            _exceptionRepository = exceptionRepository;
            _serviceName = "ProductService";
        }
        #endregion

        #region "-- Service Methods --"

        public ProductModel GetAllProducts()
        {
            ProductModel result = new ProductModel();
            try
            {
              
                result.Products = _productRepository.GetAllProducts().ToProductModelList();
                int count = 0;
                result.Products?.ForEach(x => { count++; x.Sequence = count; });
                result.Currenties = _productRepository.GetCurrencies().ToDropDownModelList();
            }
            catch (Exception ex)
            {
                _exceptionRepository.LogException(new ExceptionEntity()
                {
                    ExceptionDetails = ex.Message,
                    ServiceName = _serviceName,
                    MethodName = "GetAllProducts",
                    Request = string.Empty,

                });
            }
            return result;
        }

        
        public bool AddProduct(ProductListingModel model)
        {
            bool isValid=false;
            try
            {
              isValid= _productRepository.AddProduct(model.ToProductEntity());

            }
            catch (Exception ex)
            {
                _exceptionRepository.LogException(new ExceptionEntity()
                {
                    ExceptionDetails = ex.Message,
                    ServiceName = _serviceName,
                    MethodName = "AddProduct",
                    Request = $"model= { JsonConvert.SerializeObject(model)}",
                });
            }

            return isValid;
        }

        public List<DropDownModel> GetCurrencies()
        {
           List<DropDownModel> result = new List<DropDownModel>();
            try
            {
                result = _productRepository.GetCurrencies().ToDropDownModelList();

            }
            catch (Exception ex)
            {
                _exceptionRepository.LogException(new ExceptionEntity()
                {
                    ExceptionDetails = ex.Message,
                    ServiceName = _serviceName,
                    MethodName = "GetCurrencies",
                    Request = string.Empty
                }) ;
            }

            return result;
        }
        public ProductListingModel GetProductDetailById(int productId)
        {
            ProductListingModel model = new ProductListingModel();
            try
            {
                model = _productRepository.GetProductDetailById(productId).ToProductModel();

            }
            catch (Exception ex)
            {
                _exceptionRepository.LogException(new ExceptionEntity()
                {
                    ExceptionDetails = ex.Message,
                    ServiceName = _serviceName,
                    MethodName = "GetProductDetailById",
                    Request = $"productId={productId}",
                });
            }
            return model;

        }

        public bool UpdateProduct(ProductListingModel model)
        {
            bool isValid=false;
            try
            {
               isValid= _productRepository.UpdateProduct(model.ToProductEntity());

            }
            catch (Exception ex)
            {
                _exceptionRepository.LogException(new ExceptionEntity()
                {
                    ExceptionDetails = ex.Message,
                    ServiceName = _serviceName,
                    MethodName = "UpdateProduct",
                    Request = $"model= {JsonConvert.SerializeObject(model)}",
                });
            }
            return isValid;

        }
        public bool DeleteProduct(int productId)
        {
            bool isValid=false;
            try
            {
              isValid=  _productRepository.DeleteProduct(productId);

            }
            catch (Exception ex)
            {
                _exceptionRepository.LogException(new ExceptionEntity()
                {
                    ExceptionDetails = ex.Message,
                    ServiceName = _serviceName,
                    MethodName = "DeleteProduct",
                    Request = $"productId={productId}"
                });
            }
            return isValid;
        }


        #endregion
    }
}
