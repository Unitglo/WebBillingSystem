using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class SupperAdminHome : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if(Session["page_role"]==null || Session["page_role"]!= "SUPERADMIN")
               Response.Redirect("~/Login");
            
        }
    }
}