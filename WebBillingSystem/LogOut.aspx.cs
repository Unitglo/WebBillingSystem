using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["UserSession"] = "";
            //Session.Clear();
             Session.RemoveAll();
             
            Response.Redirect("~/Login.aspx");
        }
    }
}