using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ReportQutation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack){
            dbObject.CreateList(DropDownList1,dbObject.TablePurchaseOrderQuotation,new String[]{"purchase_order_quotation_id","purchase_order_quotation_id"});
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            dbObject.MessageBox(this,"Print Not Working");
        }

       protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
       {
           MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TablePurchaseOrderQuotation + "," + dbObject.TableSupplier, " where " + dbObject.TableSupplier + ".supplier_id=" + dbObject.TablePurchaseOrderQuotation + ".supplier_id and "+dbObject.TablePurchaseOrderQuotation+".purchase_order_quotation_id="+DropDownList1.SelectedValue);
           while (reader.Read())
           {
               Name.Text = "" + reader["supplier_name"];
               ContactNo.Text = "" + reader["contactno"];
               Address.Text = "" + reader["address"];
               Email.Text = "" + reader["email"];
               Dates.Text = "" + reader["purchase_date"];
               TotalVat.Text = "" + reader["vat"];
               TotalAmount.Text = "" + reader["total"];
           }
           reader.Close();
           GridView1.DataSource = dbObject.SelectAllValues(dbObject.TablePurchaseItemsQuotation, " where purchase_order_quotation_id=" + DropDownList1.SelectedValue);
           GridView1.DataBind();
       }
       DataBaseHealpare dbObject = new DataBaseHealpare();

    }
}