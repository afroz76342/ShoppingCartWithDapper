using DapperDemo.Models;
using DapperDemo.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System.Diagnostics;

namespace DapperDemo.Controllers
{
    public class HomeController : Controller
    {
        #region "-- Local varibale/Object Decalaation --"
        private readonly IProductService _productService;
        private readonly IConfiguration _configuration;
        #endregion

        #region "--Constructor --"
        public HomeController(IProductService productService, IConfiguration configuration)
        {
            _productService = productService;
            _configuration = configuration;
        }

        #endregion


        #region "-- Controller Actions --"
     
        public IActionResult Index()
        {
            return View("Home", _productService.GetAllProducts());
        }


        [HttpGet, Route("Add")]
        public IActionResult Add()
        {
            ViewBag.Currencies = _productService.GetCurrencies().Select(x => new SelectListItem() { Text = x.Name, Value = x.Value }).OrderBy(x => x.Text).ToList();
            return View("Add");
        }



        [HttpPost, Route("AddProduct")]
        public IActionResult AddProduct(ProductListingModel model)
        {
            if (ModelState.IsValid)
            {
                if (ValidateReCaptcha())
                {
                    TempData["Status"] = _productService.AddProduct(model);
                    TempData["Message"] = Convert.ToBoolean(TempData["Status"]) ? "Product Added Successfully." : "Something Went Wrong !!!";

                    if (Convert.ToBoolean(TempData["Status"]))
                    {
                        return RedirectToAction("Index");
                    };
                } else
                {
                    ModelState.AddModelError("ReCaptcha", "Invalid Recaptcha");
                }
                ViewBag.Currencies = _productService.GetCurrencies().Select(x => new SelectListItem() { Text = x.Name, Value = x.Value }).OrderBy(x => x.Text).ToList();
            }
            return View("Add");
        }

        [HttpGet, Route("Edit/{productId}")]
        public IActionResult Edit(int productId)
        {
            ProductListingModel model = _productService.GetProductDetailById(productId);
            ViewBag.Currencies = _productService.GetCurrencies().Select(x => new SelectListItem() { Text = x.Name, Value = x.Value, Selected = x.Value.ToLower() == model.Currency.ToLower() }).OrderBy(x => x.Text).ToList();
            return View("Edit", model);
        }

        [HttpPost, Route("EditProduct")]
        public IActionResult EditProduct(ProductListingModel model)
        {
            if (ModelState.IsValid)
            {
                if (ValidateReCaptcha())
                {
                    TempData["Status"] = _productService.UpdateProduct(model);
                    TempData["Message"] = Convert.ToBoolean(TempData["Status"]) ? "Product Updated Successfully." : "Something Went Wrong !!!";

                    if (Convert.ToBoolean(TempData["Status"]))
                    {
                        return RedirectToAction("Index");
                    }
                } else
                {
                    ModelState.AddModelError("ReCaptcha", "Invalid Recaptcha");
                }
            }
            ViewBag.Currencies = _productService.GetCurrencies().Select(x => new SelectListItem() { Text = x.Name, Value = x.Value, Selected = x.Value.ToLower() == model.Currency.ToLower() }).OrderBy(x => x.Text).ToList();
            return View("Edit");
        }

        [HttpGet, Route("Delete/{productId}")]
        public IActionResult DeleteProduct(int productId)
        {
            TempData["Status"] = _productService.DeleteProduct(productId);
            TempData["Message"] = Convert.ToBoolean(TempData["Status"]) ? "Product Deleted Successfully." : "Something Went Wrong !!!";
            return RedirectToAction("Index");
        }


        public bool ValidateReCaptcha()
        {
            var response = Request.Form["g-recaptcha-response"];
            var secret = _configuration.GetSection("GoogleCaptcha:SecretKey").Value;
            using (HttpClient client = new HttpClient())
            {
                var reply = client.GetAsync($"https://www.google.com/recaptcha/api/siteverify?secret={secret}&response={response}").Result;

                if (reply.IsSuccessStatusCode)
                {
                    var responseContent = reply.Content.ReadAsStringAsync().Result;
                    var captchaResponse = JsonConvert.DeserializeObject<ReCaptcha>(responseContent);
                    return captchaResponse?.Success.ToLower() == "true";
                }
                return false;
            }
        }

        #endregion

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
