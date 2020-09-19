using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ReportPurchasePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dbObject.CreateList(DropDownList1, "purchase_payment", new String[] { "purchase_order_id", "bill_id" });
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
            MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TablePurchaseOrderQuotation + "," + dbObject.TableSupplier, " where " + dbObject.TableSupplier + ".supplier_id=" + dbObject.TablePurchaseOrderQuotation + ".supplier_id and " + dbObject.TablePurchaseOrderQuotation + ".purchase_order_quotation_id=" + DropDownList1.SelectedValue);
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
            reader = null;
            reader = dbObject.SelectAllValues(dbObject.TablePurchaseItems + "," + dbObject.TableItems, " where " + dbObject.TablePurchaseItems + ".item_id=" + dbObject.TableItems + ".item_id and " + dbObject.TablePurchaseItems + ".Purchase_order_id=" +DropDownList1.SelectedValue);

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
            tCell.Text = "Accept Items";
            int i = 1;
            while (reader.Read())
            {
                TableRow tRow1 = new TableRow();
                Table1.Rows.Add(tRow1);
                // Create a new cell and add it to the row.

                TableCell tCell1 = new TableCell();
                tRow1.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + i++;


                tCell1 = new TableCell();
                tRow1.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["item_names"];
                // Create a new cell and add it to the row.

                tCell1 = new TableCell();
                tRow1.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["qty"];

                tCell1 = new TableCell();
                // Create a new cell and add it to the row.  tCell = new TableCell();
                tRow1.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["vat"];
                // Create a new cell and add it to the row.

                tCell1 = new TableCell();
                // Create a new cell and add it to the row.  tCell = new TableCell();
                tRow1.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["rate"];

                tCell1 = new TableCell();
                // Create a new cell and add it to the row.  tCell = new TableCell();
                tRow1.Cells.Add(tCell1);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell1.Text = "" + reader["accept_items"];

            }
            reader.Close();


          //  GridView1.DataSource = dbObject.SelectAllValues(dbObject.TablePurchaseItems, " where purchase_order_id=" + DropDownList1.SelectedValue);
          //  GridView1.DataBind();
           
            GridView2.DataSource = dbObject.SelectAllValues("purchase_payment", " where purchase_order_id=" + DropDownList1.SelectedValue);
            GridView2.DataBind();

        }
        DataBaseHealpare dbObject = new DataBaseHealpare();

    }
}