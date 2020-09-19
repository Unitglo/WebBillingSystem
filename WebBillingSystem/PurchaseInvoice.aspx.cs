using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class PurchaseInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Purchase Invoice Info";
            dbObject = new DataBaseHealpare();
            if (Request.QueryString.Count == 0)
            {
                MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TablePurchaseOrder + "," + dbObject.TableSupplier, " where " + dbObject.TableSupplier + ".supplier_id=" + dbObject.TablePurchaseOrder + ".supplier_id ");
                TableHeaderRow tRow1 = new TableHeaderRow();
                Table1.Rows.Add(tRow1);

                TableHeaderCell tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Purchase No.";

                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Customer Name";

                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Total Bill";

                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Date";

                while (reader.Read())
                {
                    TableRow tRow = new TableRow();
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    System.Web.UI.WebControls.HyperLink h = new HyperLink();
                    h.Text = reader["Purchase_order_id"] + ".";
                    h.NavigateUrl = "PurchaseInvoice.aspx?value=" + reader["Purchase_order_id"];
                    tCell.Controls.Add(h);
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["supplier_name"];
                    // Create a new cell and add it to the row.

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["total"];
                    tRow.Cells.Add(tCell); // Create a new cell and add it to the row.

                  
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["Purchase_date"];
                    tRow.Cells.Add(tCell);

                }
                reader.Close();
            }
            else
            {

                Label1.Text = "Purchase Items Info";
                MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TablePurchaseItems + "," + dbObject.TableItems, " where " + dbObject.TablePurchaseItems + ".item_id=" + dbObject.TableItems + ".item_id and " + dbObject.TablePurchaseItems + ".Purchase_order_id=" + Request.QueryString["value"]);

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
            }
        }
        DataBaseHealpare dbObject;
    }
}