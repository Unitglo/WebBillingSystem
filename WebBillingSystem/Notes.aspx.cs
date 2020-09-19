using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class Notes : System.Web.UI.Page
    {
        DataBaseHealpare dataBaseHealpare;
        protected void Page_Load(object sender, EventArgs e)
        {
            dataBaseHealpare = new DataBaseHealpare();
            MySqlDataReader reader = dataBaseHealpare.SelectAllValues(dataBaseHealpare.TableNote);
            Table1.Rows.Clear();
            TableHeaderRow tRow1 = new TableHeaderRow();
            Table1.Rows.Add(tRow1);

            TableHeaderCell tCell11 = new TableHeaderCell();
            tRow1.Cells.Add(tCell11);
            // Create a Hyperlink Web server control and add it to the cell.
            tCell11.Text = "Messages";
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
                tCell.Text = "" + reader["messages"];
                tCell = new TableCell();
                tRow.Cells.Add(tCell);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell.Text = "" + reader["note_date"];

            }
            reader.Close();
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            dataBaseHealpare.InsertIntoTable(dataBaseHealpare.TableNote, new String[] { "messages" }, new String[] { "" + TextBox1.Value });
            Response.Redirect("~/Notes.aspx");
        }
    }
}