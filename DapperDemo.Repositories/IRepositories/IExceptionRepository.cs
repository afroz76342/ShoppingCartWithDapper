

using DapperDemo.Entities;

namespace DapperDemo.Repositories
{
    public interface IExceptionRepository
    {
        public void LogException(ExceptionEntity exception);
    }
}
