using Dapper;
using DapperDemo.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DapperDemo.Repositories
{
    public class ExceptionRepository : IExceptionRepository
    {

        #region "-- Local Variable/Object Declaration --"
        private readonly IDbConnection _dbConnection;
        #endregion

        #region "-- Constructor Declaration --"
        public ExceptionRepository(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }
        #endregion

        #region "-- Repository Methods --"
        public void LogException(ExceptionEntity exception)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Service", exception.ServiceName);
            parameters.Add("@Method", exception.MethodName);
            parameters.Add("@Exception", exception.ExceptionDetails);
            parameters.Add("@Parameters", exception.Request);
            
            _dbConnection.Execute("[Exception].[LogException]", parameters, commandType: CommandType.StoredProcedure);

        }

        #endregion
    }
}
