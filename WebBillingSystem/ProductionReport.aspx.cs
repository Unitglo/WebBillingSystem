using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ProductionReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
            dbObject.CreateList(DropDownList1, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=2 " });

        }
        DataBaseHealpare dbObject;

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = dbObject.SelectAllValues(dbObject.TableManufacturingIssue, " where manufacturing_id=" + DropDownList1.SelectedValue);
            GridView1.DataBind();
            //MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TableManufacturingItem, " where item_id=" + DropDownList1.SelectedValue);
            //TableHeaderRow tRow1 = new TableHeaderRow();
            //Table1.Rows.Add(tRow1);

            //TableHeaderCell tCell11 = new TableHeaderCell();
            //tRow1.Cells.Add(tCell11);
            //// Create a Hyperlink Web server control and add it to the cell.
            //tCell11.Text = "Purchase No.";

            //lable1.Text = "Manufacturing Reports";
            //while (reader.Read())
            //{
            //    TableRow tRow = new TableRow();
            //    Table1.Rows.Add(tRow);
            //    // Create a new cell and add it to the row.
            //    TableCell tCell = new TableCell();
            //    tRow.Cells.Add(tCell);
            //    // Create a Hyperlink Web server control and add it to the cell.
            //    System.Web.UI.WebControls.HyperLink h = new HyperLink();
            //    h.Text = reader["Purchase_order_id"] + ".";
            //    h.NavigateUrl = "GRN.aspx?value=" + reader["Purchase_order_id"];
            //    tCell.Controls.Add(h);
            //    Table1.Rows.Add(tRow);
            //}
            //reader.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedValue.Equals("0"))
            {
                List<String> templist1 = new List<String>();
                List<String> templist2 = new List<String>();
                dbObject.UpdateValue(dbObject.TableItems, new String[] { "stock_count=stock_count+" + TextBox1.Text }, " item_id= " + DropDownList1.SelectedValue);
                MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TableManufacturingIssue, " where manufacturing_id=" + DropDownList1.SelectedValue);
                while (reader.Read())
                {
                    templist1.Add("" + reader["item_id"]);
                    templist2.Add("" + reader["material"]);
                }
                reader.Close();
                for (int i = 0; i < templist1.Count; i++)
                {
                    dbObject.UpdateValue(dbObject.TableItems, new String[] { "stock_count=stock_count-(" + templist2.ElementAt(i) + "*" + TextBox1.Text + ")" }, " item_id=" + templist1.ElementAt(i));
                }
                dbObject.MessageBox(this, dbObject.InsertIntoTable(dbObject.TableManufacturingItem, new String[] { "item_id", "qty", "dates" }, new String[] { DropDownList1.SelectedValue, TextBox1.Text, dates.Value }));
            }
            else
            {
                dbObject.MessageBox(this, "Select Item ");
            }
        }
    }
}
