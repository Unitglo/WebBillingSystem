using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class SalesInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            dbObject = new DataBaseHealpare();
                Label1.Text = "Sales Invoice";
                MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TableSalesOrder + "," + dbObject.TableVendor, " where "+dbObject.TableVendor + ".vendor_id=" + dbObject.TableSalesOrder + ".vendor_id ");
                TableHeaderRow tRow1 = new TableHeaderRow();
                Table1.Rows.Add(tRow1);

                TableHeaderCell tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Sales No.";

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
                tCell11.Text = "Mode Of Payment";

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
                    h.Text = reader["sales_order_id"] + ".";
                    h.NavigateUrl = "SalesInvoice.aspx?value=" + reader["sales_order_id"];
                    tCell.Controls.Add(h);
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["customer_name"];
                    // Create a new cell and add it to the row.
                    
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["total"];
                    tRow.Cells.Add(tCell); // Create a new cell and add it to the row.
                    
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["payment_modes"];
                    tRow.Cells.Add(tCell); // Create a new cell and add it to the row.
                    
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["sales_date"];
                    tRow.Cells.Add(tCell);

                }
                reader.Close();
                if (Request.QueryString.Count == 0)
                {
                    Table2.Visible = false;
                }
            else {
                Table2.Visible = true;
                Label1.Text = "Sales Items Info";

                 reader = dbObject.SelectAllValues(dbObject.TableSalesItems + "," + dbObject.TableItems, " where " + dbObject.TableSalesItems + ".item_id=" + dbObject.TableItems + ".item_id and " + dbObject.TableSalesItems + ".sales_order_id=" + Request.QueryString["value"]);

                TableHeaderRow tRow = new TableHeaderRow();
                Table2.Rows.Add(tRow);

                TableHeaderCell tCell = new TableHeaderCell();
                tRow.Cells.Add(tCell);

                // Create a Hyperlink Web server control and add it to the cell.
                tCell.Text = "Sr No.";
                // Create a new cell and add it to the row.


                tCell = new TableHeaderCell();
                tRow.Cells.Add(tCell);

                // Create a Hyperlink Web server control and add it to the cell.
                tCell.Text = "Item names" ;
                // Create a new cell and add it to the row.

                tCell = new TableHeaderCell();
                tRow.Cells.Add(tCell);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell.Text = "QTY" ;

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
                    Table2.Rows.Add(tRow111);
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
            }
        }
        DataBaseHealpare dbObject;
    }
}