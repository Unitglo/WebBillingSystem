using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class AddRowItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbobject = new DataBaseHealpare();
            //GridView1.DataSource = dbobject.SelectAllValues(dbobject.TableGrup);
            //GridView1.DataBind();
            if (Request.QueryString.Count == 0)
            {
                MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TableGrup);
                TableHeaderRow tRow1 = new TableHeaderRow();
                Table1.Rows.Add(tRow1);

                TableHeaderCell tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "No.";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Grup Name";
                while (reader.Read())
                {
                    TableRow tRow = new TableRow();
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    System.Web.UI.WebControls.HyperLink h = new HyperLink();
                    h.Text = reader["grup_type_id"] + ".";
                    h.NavigateUrl = "AddItemsGroup.aspx?value=" + reader["grup_type_id"];
                    tCell.Controls.Add(h);
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["grup_name"];
                    // Create a new cell and add it to the row.
                }
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TableGrup, " where grup_type_id=" + Request.QueryString["value"]);
                    while (reader.Read())
                    {
                        GrupNames.Text = "" + reader["grup_name"];
                    }
                }
            }
            
        }

        DataBaseHealpare dbobject;

        protected void Add_Click(object sender, EventArgs e)
        {
            if (!GrupNames.Text.ToString().Equals(""))
            {
                if (Request.QueryString.Count == 0)
                {
                    dbobject.MessageBox(this, "Data Adding " + dbobject.InsertIntoTable(dbobject.TableGrup, new String[] { "grup_name" }, new String[] { GrupNames.Text.ToString() }));
                }
                else
                {
                    dbobject.MessageBox(this,"Data Update "+dbobject.UpdateValue(dbobject.TableGrup, new String[] { "grup_name" }, new String[] { ""+GrupNames.Text }, " grup_type_id=" + Request.QueryString["value"]));
                }
            }
            else
            {
                GrupNames.Focus();
                dbobject.MessageBox(this, "Enter Grup Name");
            }
        }
   
    }
}