using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class AddVendors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbobject = new DataBaseHealpare();

            if (Request.QueryString.Count == 0)
            {
                MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TableVendor);
                TableHeaderRow tRow1 = new TableHeaderRow();
                Table1.Rows.Add(tRow1);

                TableHeaderCell tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "No.";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Name";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Address";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Contact No.";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Pin Code";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "PAN no.";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "State";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Email Id";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Bank Name";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Branch Name";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "Account No.";
                tCell11 = new TableHeaderCell();
                tRow1.Cells.Add(tCell11);
                // Create a Hyperlink Web server control and add it to the cell.
                tCell11.Text = "IFSC No.";

                while (reader.Read())
                {
                    TableRow tRow = new TableRow();
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    // Create a Hyperlink Web server control and add it to the cell.
                    System.Web.UI.WebControls.HyperLink h = new HyperLink();
                    h.Text = reader["vendor_id"] + ".";
                    h.NavigateUrl = "AddVendors.aspx?value=" + reader["vendor_id"];
                    tCell.Controls.Add(h);
                    Table1.Rows.Add(tRow);
                    // Create a new cell and add it to the row.

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["customer_name"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["address"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["contactno"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["pincode"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["pancardno"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["state"];


                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["email"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["bank_name"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["branch_name"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["account_no"];

                    tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "" + reader["IFSC_code"];

                }
                reader.Close();
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    MySqlDataReader reader = dbobject.SelectAllValues(dbobject.TableVendor, " where vendor_id=" + Request.QueryString["value"]);
                    while (reader.Read())
                    {
                        Name.Text = "" + reader["customer_name"];
                        TextArea.Text = "" + reader["address"];
                        contact.Text = "" + reader["contactno"];
                        PinCode.Text = "" + reader["pincode"];
                        pan.Text = "" + reader["pancardno"];
                        State.Text = "" + reader["state"];
                        BankName.Text = "" + reader["bank_name"];
                        BranchName.Text = "" + reader["branch_name"];
                        AccountNo.Text = "" + reader["account_no"];
                        IFSC.Text = "" + reader["IFSC_code"];
                        emailid.Text = "" + reader["email"];
                    }
                    reader.Close();
                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            if (Name.Text.StartsWith(" ") || Name.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                Name.Focus();
            }
            else if (TextArea.Text.StartsWith(" ") || TextArea.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                TextArea.Focus();
            }
            else if (pan.Text.StartsWith(" ") || pan.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                pan.Focus();
            }
            else if (State.Text.StartsWith(" ") || State.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                State.Focus();
            }
            else if (PinCode.Text.StartsWith(" ") || PinCode.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                PinCode.Focus();
            }
            else if (BankName.Text.StartsWith(" ") || BankName.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                BankName.Focus();
            }
            else if (BranchName.Text.StartsWith(" ") || BranchName.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                BranchName.Focus();
            }
            else if (AccountNo.Text.StartsWith(" ") || AccountNo.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                AccountNo.Focus();
            }
            else if (IFSC.Text.StartsWith(" ") || IFSC.Text.Equals(""))
            {
                dbobject.MessageBox(this, "Enter Field ");
                IFSC.Focus();
            }
            else
            {
                if(Request.QueryString.Count==0)
                dbobject.MessageBox(this, "Data Enter " + dbobject.InsertIntoTable(dbobject.TableVendor, new String[] { "customer_name", "address", "contactno", "pincode", "pancardno", "state", "bank_name", "branch_name", "account_no", "IFSC_code", "email" }, new String[] { Name.Text, TextArea.Text, contact.Text, PinCode.Text, pan.Text, State.Text, BankName.Text, BranchName.Text, AccountNo.Text, IFSC.Text, emailid.Text }));
                else
                    dbobject.MessageBox(this, "Data Update " + dbobject.UpdateValue(dbobject.TableVendor, new String[] { "customer_name", "address", "contactno", "pincode", "pancardno", "state", "bank_name", "branch_name", "account_no", "IFSC_code", "email" }, new String[] { Name.Text, TextArea.Text, contact.Text, PinCode.Text, pan.Text, State.Text, BankName.Text, BranchName.Text, AccountNo.Text, IFSC.Text, emailid.Text }, " vendor_id="+Request.QueryString["value"]));
            }


        }
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            BankName.ReadOnly = false;
            BranchName.ReadOnly = false;
            AccountNo.ReadOnly = false;
            IFSC.ReadOnly = false;
            BankName.Text = "";
            BranchName.Text = "";
            AccountNo.Text = "";
            IFSC.Text = "";
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            BankName.ReadOnly = true;
            BranchName.ReadOnly = true;
            AccountNo.ReadOnly = true;
            IFSC.ReadOnly = true;
            BankName.Text = "NA";
            BranchName.Text = "NA";
            AccountNo.Text = "NA";
            IFSC.Text = "NA";
        }
        DataBaseHealpare dbobject;

       
    }
}