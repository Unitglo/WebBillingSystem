using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.IO;

namespace WebBillingSystem
{
    public partial class import_db : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            string company_ucid = (String)HttpContext.Current.Session["company_code"];
            string ca_ucid = (String)HttpContext.Current.Session["ca_code"];
            string mode = "http://pms.unitglo.com/company/" + company_ucid + "/"+ca_ucid +"/"+ Request.QueryString["value"];
            if(Session["page_role"] + "" == "CA") {
                mode = "http://pms.unitglo.com/ca/" + ca_ucid + "/" + company_ucid + "/" + Request.QueryString["value"];
            }
            var webRequest = WebRequest.Create(mode);

            using (var response = webRequest.GetResponse())
            using (var content = response.GetResponseStream())
            using (var reader = new StreamReader(content))
            {
                var strContent = reader.ReadToEnd();
                if (Session["pms_db"].ToString() != "pms" && Session["pms_db"].ToString() != "pms_system")
                {
                    string filePath = Server.MapPath("~/upload/SQL/" + company_ucid + "-" + DateTime.Now.ToString("d-M-yyyy-HH-mm-ss") + "-restore.sql");
                    baseHealpare.DatabaseBackup(filePath);
                    baseHealpare.DropDataBase(Session["pms_db"].ToString());
                    baseHealpare.CreateDataBase(strContent, Session["pms_db"].ToString());
                }
            }
            Response.Redirect("~/Login.aspx");
        }
    }
}