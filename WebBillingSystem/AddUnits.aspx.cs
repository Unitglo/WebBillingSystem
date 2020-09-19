using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class AddUnits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbobject = new DataBaseHealpare();
            //GridView1.DataSource = dbobject.SelectAllValues(dbobject.TableGrup);
            //GridView1.DataBind();
            if (Request.QueryString.Count == 0)
            {
                MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TableUnit);
                TableHeaderRow tRow1 = new TableHeaderRow();
                Table1.Rows.Add(tRow1);

                TableHeaderCell tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "No.";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = " Name";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Short Name";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Description";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Symbols";

                while (reader.Read())
                {
                    TableRow tRow = new TableRow();
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    System.Web.UI.WebControls.HyperLink h = new HyperLink();
                    h.Text = reader["id"] + ".";
                    h.NavigateUrl = "AddUnits.aspx?value=" + reader["id"];
                    tCell.Controls.Add(h);
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["unit_name"];
                    // Create a new cell and add it to the row.
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["sort_name"];
                    // Create a new cell and add it to the row.
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["description"];
                    // Create a new cell and add it to the row.
                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    tCell.Text = "" + reader["symbols"];
                    // Create a new cell and add it to the row.
                }
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TableUnit, " where id=" + Request.QueryString["value"]);
                    while (reader.Read())
                    {
                        UnitNameText.Text = "" + reader["unit_name"];
                        UnitSortNameText.Text = "" + reader["sort_name"];
                        DescriptionText.Text = "" + reader["description"];
                        SymbolsText.Text = "" + reader["symbols"];
                    }
                }
            }

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (UnitNameText.Text.Equals(""))
            {
                UnitNameText.Focus();
                dbobject.MessageBox(this, "Fill Fields");
            }
            else if (UnitSortNameText.Text.Equals(""))
            {
                UnitSortNameText.Focus();
                dbobject.MessageBox(this, "Fill Fields");
            }
            else if (DescriptionText.Text.Equals(""))
            {
                DescriptionText.Focus();
                dbobject.MessageBox(this, "Fill Fields");
            }
            else if (SymbolsText.Text.Equals(""))
            {
                SymbolsText.Focus();
                dbobject.MessageBox(this, "Fill Fields");
            }
            else
            {
                if (Request.QueryString.Count == 0)
                    dbobject.MessageBox(this, "Data Adding " + dbobject.InsertIntoTable(dbobject.TableUnit, new String[] { "unit_name", "sort_name", "description", "symbols" }, new String[] { UnitNameText.Text, UnitSortNameText.Text, DescriptionText.Text, SymbolsText.Text }));
                else
                    dbobject.MessageBox(this, "Data Adding " + dbobject.UpdateValue(dbobject.TableUnit, new String[] { "unit_name", "sort_name", "description", "symbols" }, new String[] { UnitNameText.Text, UnitSortNameText.Text, DescriptionText.Text, SymbolsText.Text }, " id=" + Request.QueryString["value"]));
            }
        }

        DataBaseHealpare dbobject;
    }
}