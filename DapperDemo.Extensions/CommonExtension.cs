using DapperDemo.Entities;
using DapperDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DapperDemo.Extensions
{
    public static class CommonExtension
    {
        public static List<DropDownModel> ToDropDownModelList(this List<DropDownEntity> list)
        {
            return list.Select(x => new DropDownModel()
            {
                Id = x.Id,
                Name = x.Name,
                IsSelected = x.IsSelected,
                Value = x.Value,
            }).ToList();
        }

    }

}
