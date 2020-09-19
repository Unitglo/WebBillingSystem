using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class SalesRecipes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {
                BillNo.Text = "" + (Convert.ToInt32(dbObject.GetNo("sales_payment", "bill_id")) + 1);
                dbObject.CreateList(DropDownList1, dbObject.TableVendor, new String[] { "vendor_id", "customer_name" });
            }
        }

        DataBaseHealpare dbObject;

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = dbObject.SelectAllValues(dbObject.TableSalesItems, " where sales_order_id=" + DropDownList2.SelectedValue);
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbObject.CreateList(DropDownList2, dbObject.TableSalesOrder, new String[] { "sales_order_id", "sales_order_id" }, new String[] { "vendor_id=" + DropDownList1.SelectedValue });
        }

        protected void PrintBill_Click(object sender, EventArgs e)
        {
            if (!PaidAmount.Text.Equals("") && !dates.Value.Equals(""))
                dbObject.MessageBox(this, dbObject.InsertIntoTable("sales_payment", new String[] { "sales_order_id", "vendor_id", "amount", "bill_date", "mode_of_payment" }, new String[] { DropDownList2.SelectedValue, DropDownList1.SelectedValue, PaidAmount.Text, dates.Value, DropDownList4.SelectedValue }));
            else
                dbObject.MessageBox(this, "Check Value");
        }
    }
}