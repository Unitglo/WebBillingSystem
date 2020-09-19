using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ReportSalesPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {
                dbObject.CreateList(DropDownList1, "sales_payment", new String[] { "sales_order_id", "bill_id" });
            }
        }
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
            MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TableSalesOrder + "," + dbObject.TableVendor, " where " + dbObject.TableVendor + ".vendor_id=" + dbObject.TableSalesOrder + ".vendor_id and " + dbObject.TableSalesOrder + ".sales_order_id=" + DropDownList1.SelectedValue);
            while (reader.Read())
            {
                Name.Text = "" + reader["customer_name"];
                ContactNo.Text = "" + reader["contactno"];
                Address.Text = "" + reader["address"];
                Email.Text = "" + reader["email"];
                Dates.Text = "" + reader["sales_date"];
                TotalVat.Text = "" + reader["vat"];
                TotalAmount.Text = "" + reader["total"];
            }
            reader.Close();
            reader = null;
            reader = dbObject.SelectAllValues(dbObject.TableSalesItems + "," + dbObject.TableItems, " where " + dbObject.TableSalesItems + ".item_id=" + dbObject.TableItems + ".item_id and " + dbObject.TableSalesItems + ".sales_order_id=" + DropDownList1.SelectedValue);

            TableHeaderRow tRow = new TableHeaderRow();
            Table1.Rows.Add(tRow);

            TableHeaderCell tCell = new TableHeaderCell();
            tRow.Cells.Add(tCell);

            // Create a Hyperlink Web server control and add it to the cell.
            tCell.Text = "Sr No.";
            // Create a new cell and add it to the row.


            tCell = new TableHeaderCell();
            tRow.Cells.Add(tCell);

            // Create a Hyperlink Web server control and add it to the cell.
            tCell.Text = "Item names";
            // Create a new cell and add it to the row.

            tCell = new TableHeaderCell();
            tRow.Cells.Add(tCell);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell.Text = "QTY";

            tCell = new TableHeaderCell();
            // Create a new cell and add it to the row.  tCell = new TableCell();
            tRow.Cells.Add(tCell);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell.Text = "Vat";
            // Create a new cell and add it to the row.

            tCell = new TableHeaderCell();
            // Create a new cell and add it to the row.  tCell = new TableCell();
            tRow.Cells.Add(tCell);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell.Text = "Rate";


            tCell = new TableHeaderCell();
            // Create a new cell and add it to the row.  tCell = new TableCell();
            tRow.Cells.Add(tCell);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell.Text = "Return Items";
            int i = 1;
            while (reader.Read())
            {
                TableRow tRow111 = new TableRow();
                Table1.Rows.Add(tRow111);
                // Create a new cell and add it to the row.

                TableCell tCell1 = new TableCell();
                tRow111.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + i++;


                tCell1 = new TableCell();
                tRow111.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["item_names"];
                // Create a new cell and add it to the row.

                tCell1 = new TableCell();
                tRow111.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["qty"];

                tCell1 = new TableCell();
                // Create a new cell and add it to the row.  tCell = new TableCell();
                tRow111.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["vat"];
                // Create a new cell and add it to the row.

                tCell1 = new TableCell();
                // Create a new cell and add it to the row.  tCell = new TableCell();
                tRow111.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["rate"];


                tCell1 = new TableCell();
                // Create a new cell and add it to the row.  tCell = new TableCell();
                tRow111.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["return_items"];

            }
            reader.Close();
            GridView2.DataSource = dbObject.SelectAllValues("sales_payment", " where sales_order_id=" + DropDownList1.SelectedValue);
            GridView2.DataBind();
        }
        DataBaseHealpare dbObject;
    }
}