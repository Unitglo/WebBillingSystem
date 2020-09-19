using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ReportStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
            if (Request.QueryString.Count!=0)
            {
              GridView1.DataSource=dbObject.SelectAllValues(dbObject.TableItems, " where item_type_id=" + Request.QueryString["value"]);
              GridView1.DataBind();
            }
        }
        DataBaseHealpare dbObject;
    }
}