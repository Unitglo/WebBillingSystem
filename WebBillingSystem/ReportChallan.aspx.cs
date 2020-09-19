using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ReportChallan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {
                dbObject.CreateList(DropDownList1, "challan", new String[] { "challan_id", "challan_id" });
            }
      
        }
        DataBaseHealpare dbObject;

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            dbObject.MessageBox(this, "Print Not Working");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MySqlDataReader reader = dbObject.SelectAllValues("challan", " where challan_id=" + DropDownList1.SelectedValue);
            while (reader.Read())
            {
                Label1.Text = "" + reader["receiver_name"];
                Label2.Text = "" + reader["destination"];
                Label3.Text = "" + reader["contact"];
                Label4.Text = "" + reader["vehicle_no"];
                Dates.Text = "" + reader["dates"];
            }
            reader.Close();
            GridView1.DataSource = dbObject.SelectAllValues("challan_items", " where challan_id=" + DropDownList1.SelectedValue);
            GridView1.DataBind();
        }
    }
}