using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DapperDemo.Models
{
    public class ReCaptcha
    {

        [JsonProperty("success")]
        public string Success {
            get { return m_Success; }
            set { m_Success = value; }
        }

        private string m_Success;
        [JsonProperty("error-codes")]
        public List<string> ErrorCodes {
            get { return m_ErrorCodes; }
            set { m_ErrorCodes = value; }
        }

        private List<string> m_ErrorCodes;

        public ReCaptcha()
        {
            //
            // TODO: Add constructor logic here
            //
        }
       
    }
}
