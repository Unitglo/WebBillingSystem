using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class PurchasePayment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            dbobject = new DataBaseHealpare();
            if (SupplierNameList.Items.Count < 2)
            {
                BillNo.Text = "" + (Convert.ToInt32(dbobject.GetNo(dbobject.TablePurchasePayment, "bill_id")) + 1);
                dbobject.CreateList(SupplierNameList, dbobject.TableSupplier, new String[] { "supplier_id", "supplier_name" });
            }
            if (Request.QueryString.Count == 0)
            {
                disc.Visible = false;

            }
            else
            {

                headssss.Visible = true;
                disc.Visible = true;
                if (!Page.IsPostBack)
                {
                    //              MySqlDataReader reader = dbobject.SelectAllValues(dbobject.ReportPurchase, " where supplier_id=" + Request.QueryString["supplier_id"] + " and main_order_id=" + Request.QueryString["value"]);
                    MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TablePurchasePayment, " where supplier_id=" + Request.QueryString["supplier_id"] + " and purchase_order_id=" + Request.QueryString["value"]);
                    TableHeaderRow tRow1 = new TableHeaderRow();
                    Table1.Rows.Add(tRow1);

                    TableHeaderCell tCell11 = new TableHeaderCell();
                    tRow1.Cells.Add(tCell11);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell11.Text = "Bill Sr No.";
                    tCell11 = new TableHeaderCell();
                    tRow1.Cells.Add(tCell11);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell11.Text = "Amount";
                    tCell11 = new TableHeaderCell();
                    tRow1.Cells.Add(tCell11);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell11.Text = "Date";
                    int i = 1;
                    while (reader.Read())
                    {
                        TableRow tRow = new TableRow();
                        Table1.Rows.Add(tRow);
                        // Create a new cell and add it to the row.

                        TableCell tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        tCell.Text = "" + (i++);

                        tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        HyperLink h = new HyperLink();
                        h.Text = reader["purchase_order_id"] + ".";
                        h.NavigateUrl = "PurchaseInvoice.aspx?value=" + reader["purchase_order_id"];
                        tCell.Controls.Add(h);
                        Table1.Rows.Add(tRow);

                        tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        tCell.Text = "" + reader["bill_date"];

                        tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        tCell.Text = "" + reader["amount"];

                        tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        HyperLink h2 = new HyperLink();
                        h2.Text = "Payment";
                        h2.NavigateUrl = "PurchasePayment.aspx?value=" + reader["purchase_order_id"] + "&supplier_id=" + reader["supplier_id"];
                        tCell.Controls.Add(h);
                        Table1.Rows.Add(tRow);

                    }
                    reader.Close();
                    reader = null;
                    reader = dbobject.SelectAllValues(dbobject.TablePurchaseOrder, " where supplier_id=" + Request.QueryString["supplier_id"] + " and purchase_order_id=" + Request.QueryString["value"]);
                    while (reader.Read())
                    {
                        TotalOrderAmount.Text = "" + reader["total"];
                    }
                    reader.Close();
                    reader = null;
                    reader = dbobject.SelectAllValues("sum(amount) as total", dbobject.TablePurchasePayment, " where supplier_id=" + Request.QueryString["supplier_id"] + " and purchase_order_id=" + Request.QueryString["value"]);
                    while (reader.Read())
                    {
                        if (reader["total"].ToString().Equals(""))
                        {
                            PaidOrderAmount.Text = "0";
                        }
                        else
                            PaidOrderAmount.Text = "" + reader["total"];
                    }
                    reader.Close();
                    reader = null;
                    reader = dbobject.SelectAllValues("sum(accept_item_total) as total", dbobject.ReportPurchase, " where supplier_id=" + Request.QueryString["supplier_id"] + " and main_order_id=" + Request.QueryString["value"]);
                    while (reader.Read())
                    {
                        Accept_Order.Text = "" + reader["total"];
                    }
                    PendingOrderAmount.Text = "" + (Convert.ToDouble(Accept_Order.Text) - Convert.ToDouble(PaidOrderAmount.Text));
                    reader.Close();
                    TotalPendingAmount1.Text = ""+(Convert.ToDouble(TotalOrderAmount.Text) - Convert.ToDouble(PaidOrderAmount.Text));
                }
            }

        }
        DataBaseHealpare dbobject;

        protected void SupplierNameList_SelectedIndexChanged(object sender, EventArgs e)
        {
            MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TablePurchaseOrder, " where supplier_id=" + SupplierNameList.SelectedValue);
            TableHeaderRow tRow1 = new TableHeaderRow();
            Table1.Rows.Add(tRow1);

            TableHeaderCell tCell11 = new TableHeaderCell();
            tRow1.Cells.Add(tCell11);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell11.Text = "Sr No.";
            tCell11 = new TableHeaderCell();
            tRow1.Cells.Add(tCell11);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell11.Text = "Order No";
            tCell11 = new TableHeaderCell();
            tRow1.Cells.Add(tCell11);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell11.Text = "Order Date";
            tCell11 = new TableHeaderCell();
            tRow1.Cells.Add(tCell11);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell11.Text = "Order Amount";
            tCell11 = new TableHeaderCell();
            tRow1.Cells.Add(tCell11);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell11.Text = "Action";
            int i = 1;
            while (reader.Read())
            {
                TableRow tRow = new TableRow();
                Table1.Rows.Add(tRow);
                // Create a new cell and add it to the row.

                TableCell tCell = new TableCell();
                tRow.Cells.Add(tCell);
                tCell.Text = "" + i++;

                tCell = new TableCell();
                tRow.Cells.Add(tCell);
                System.Web.UI.WebControls.HyperLink h = new HyperLink();
                h.Text = reader["purchase_order_id"] + ".";
                h.NavigateUrl = "PurchaseInvoice.aspx?value=" + reader["purchase_order_id"];
                tCell.Controls.Add(h);
                Table1.Rows.Add(tRow);

                tCell = new TableCell();
                tRow.Cells.Add(tCell);
                tCell.Text = "" + reader["purchase_date"];

                tCell = new TableCell();
                tRow.Cells.Add(tCell);
                tCell.Text = "" + reader["total"];



                tCell = new TableCell();
                tRow.Cells.Add(tCell);
                h = new HyperLink();
                h.Text = "Payment";
                h.NavigateUrl = "PurchasePayment.aspx?value=" + reader["purchase_order_id"] + "&supplier_id=" + reader["supplier_id"];
                tCell.Controls.Add(h);
                Table1.Rows.Add(tRow);
            }
            reader.Close();

            Panel1.Visible = true;

        }

        protected void PrintBill_Click(object sender, EventArgs e)
        {
            if (!dates.Value.Equals("") && !PaidAmount.Text.Equals(""))
                dbobject.MessageBox(this, dbobject.InsertIntoTable(dbobject.TablePurchasePayment, new String[] { "purchase_order_id", "supplier_id", "amount", "bill_date", "mode_of_payment" }, new String[] { "" + Request.QueryString["value"], "" + Request.QueryString["supplier_id"], "" + PaidAmount.Text, "" + dates.Value, "" + DropDownList4.SelectedValue }));
            else
                dbobject.MessageBox(this, "Check values");
        }

        protected void PaidAmount_TextChanged(object sender, EventArgs e)
        {

        }
    }
}