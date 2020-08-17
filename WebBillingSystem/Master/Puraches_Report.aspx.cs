using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class Puraches_Report : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare = new DataBaseHealpare();
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlDataReader state = baseHealpare.SelectAllValues(baseHealpare.TableAccountstate, "where status=0");
            while (state != null && state.Read())
            {
                Select_state.Items.Add(new ListItem(state["pms_account_state_name"].ToString(), state["pms_account_state_name"].ToString()));
            }
            state.Close();

            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStock);
            while (reader.Read())
            {
                //table.Append("<tr>");
                //table.Append("<td>" + reader["stock_product_name"] + "</td>");
                //table.Append("<td>" + reader["stock_hsn_sac_code"] + "</td>");
                //table.Append("<td>" + reader["stock_unit_of_measurment"] + "</td>");
                //table.Append("<td>" + reader["stock_gst_rate"] + "</td>");

                //TableRow tRow = new TableRow();
                //table.Rows.Add(tRow);

                //TableCell tCell = new TableCell();
                //tRow.Cells.Add(tCell);

                //System.Web.UI.WebControls.HyperLink h = new HyperLink();
                //h.Text = reader["pms_stock_id"] + ".";
                //h.NavigateUrl = "Puraches_Report.aspx?value=" + reader["pms_stock_id"];
                //tCell.Controls.Add(h);
                //table.Rows.Add(tRow);
                //// Create a new cell and add it to the row.

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["supplier_name"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["address"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["contactno"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["pincode"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["pancardno"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["state"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["vat_no"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["email"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["bank_name"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["branch_name"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["account_no"];

                //tCell = new TableCell();
                //tRow.Cells.Add(tCell);
                //tCell.Text = "" + reader["IFSC_code"];

            }
            reader.Close();
        }
    }
  }
