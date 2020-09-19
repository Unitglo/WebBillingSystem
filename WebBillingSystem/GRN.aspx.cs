using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class GRN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            dbObject = new DataBaseHealpare();
            if (Request.QueryString.Count == 0)
            {
                Label1.Text = "Parches Order Info";
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
                    Label1.Text = "Parches Items Info";
                    TableRow tRow = new TableRow();
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    System.Web.UI.WebControls.HyperLink h = new HyperLink();
                    h.Text = reader["Purchase_order_id"] + ".";
                    h.NavigateUrl = "GRN.aspx?value=" + reader["Purchase_order_id"];
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


                MySqlDataReader reader = dbObject.SelectAllValues("*", dbObject.TablePurchaseItems + "," + dbObject.TableItems, " where " + dbObject.TablePurchaseItems + ".item_id=" + dbObject.TableItems + ".item_id and " + dbObject.TablePurchaseItems + ".Purchase_order_id=" + Request.QueryString["value"]);

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
                tCell.Text = "Accepted Items";
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
                    tCell1.Text = "" + i;
                    ItemsId.Add("" + reader["purchase_item_id"]);

                    tCell1 = new TableCell();
                    tRow1.Cells.Add(tCell1);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell1.Text = "" + reader["item_names"];
                    // Create a new cell and add it to the row.
                    ItemsIdS.Add("" + reader["item_id"]);
                    tCell1 = new TableCell();
                    tRow1.Cells.Add(tCell1);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell1.Text = "" + reader["qty"];
                    QTYList.Add(Convert.ToDouble(reader["qty"]));
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

                    tCell1 = new TableCell();
                    TextBox tb = new TextBox();
                    tb.ID = "TextBoxRow_" + i;
                    tb.Text = "" + reader["accept_items"];
                    tb.AutoPostBack = true;
                    tb.TextChanged += new EventHandler(this.TextBox_TextChanged);
                    GRNQTY.Add(tb);
                    GRNQTYOLD.Add("" + reader["accept_items"]);
                    tCell1.Controls.Add(tb);
                    tRow1.Cells.Add(tCell1);
                    i++;
                }
                Button b = new Button();
                b.Text = "Submit";
                b.Click += new EventHandler(this.Button_Click);
                Panel1.Controls.Add(b);
                reader.Close();
            }
        }

        private void Button_Click(object sender, EventArgs e)
        {
            String temp="";
            for (int i = 0; i < GRNQTY.Count;i++ )
            {
                temp = dbObject.UpdateValue(dbObject.TablePurchaseItems, new String[] { "accept_items" }, new String[] { GRNQTY.ElementAt(i).Text }, " purchase_item_id=" + ItemsId.ElementAt(i));
               Double tmp= Convert.ToDouble(GRNQTY.ElementAt(i).Text) - Convert.ToDouble(GRNQTYOLD.ElementAt(i));
              if(tmp !=0)
              {
                  if (tmp > 0)
                      temp = dbObject.UpdateValue(dbObject.TableItems, new String[] { "stock_count = stock_count+" + tmp }, " item_id=" + ItemsIdS.ElementAt(i));
                  else
                  {
                      dbObject.InsertIntoTable("purchase_return", new String[] { "purchase_order_id", "item_id", "qty" }, new String[] { "" + Request.QueryString["value"], "" + ItemsIdS.ElementAt(i), "" + tmp });
                      temp = dbObject.UpdateValue(dbObject.TableItems, new String[] { "stock_count = stock_count " + tmp }, " item_id=" + ItemsIdS.ElementAt(i));
                  }
              }
            }
            dbObject.MessageBox(this,"Data Insertion "+temp);
            Response.Redirect(Request.RawUrl);
        }

        private void TextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            try
            {
                
                int i = Convert.ToInt32(tb.ID.Replace("TextBoxRow_", ""));
                if (Convert.ToDouble(tb.Text) > QTYList.ElementAt(i - 1))
                {
                    dbObject.MessageBox(this, "Enter Qty less Than " + QTYList.ElementAt(i - 1));
                    tb.Text = "";
                    tb.Focus();
                }
            }
            catch(Exception xe){
                tb.Text = "";
                tb.Focus();
                dbObject.MessageBox(this, "Enter No" );
            }
        }
        List<String> ItemsIdS = new List<String>();
        
        List<String> ItemsId = new List<String>();
        List<TextBox> GRNQTY = new List<TextBox>();
        List<String> GRNQTYOLD = new List<String>();
        public List<Double> QTYList = new List<Double>();
        DataBaseHealpare dbObject;
    }
}