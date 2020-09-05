using MySql.Data.MySqlClient;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebBillingSystem
{
    public partial class AdminMainPage : System.Web.UI.MasterPage
    {
        //  DataBaseHealpare DataBaseHealpare;
        public string default_prefix = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            string json = "";
            if (File.Exists("C:/PMS/Base/configuration.json"))
            {
                json = File.ReadAllText("C:/PMS/Base/configuration.json");
            }
            else
            {
                json = File.ReadAllText(Server.MapPath("~/Base/configuration.json"));
            }
            var myJObject = JObject.Parse(json);
            default_prefix = myJObject.SelectToken("default_prefix").Value<string>(); ;
            
            changeComp.InnerHtml = (String)HttpContext.Current.Session["company_name"];  //Session["company_name"].ToString();

            CompanyDetails.Visible = false;
            //changeComp.Visible = false;
            object value = HttpContext.Current.Session["role_code"];
            String a = (String)value;
            if (value != null && !a.Equals(""))
            {
                String role = a;
                if (!role.Equals("page_role")) {
                    CompanyDetails.Visible = true;
                    changeComp.Visible = true;
                }
            }

        }
        protected void backupChange(object sender, EventArgs e)
        {
            string company_ucid = (String)HttpContext.Current.Session["company"];
            string filePath = Server.MapPath("~/upload/SQL/"+ company_ucid +"-"+ DateTime.Now.ToString("d-M-yyyy")+"-database.sql");
            
            DataBaseHealpare dataBaseHealpare = new DataBaseHealpare();
            dataBaseHealpare.DatabaseBackup(filePath);
            dataBaseHealpare.closeConnection();
                Response.Redirect("/ca_comp_fileupload/company_file_upload_code.aspx?value=" + dataBaseHealpare.EncodeUrl((Page)HttpContext.Current.Handler, filePath));
        }

        public void fileUpload() {
            //File upload 
        }
    }
}