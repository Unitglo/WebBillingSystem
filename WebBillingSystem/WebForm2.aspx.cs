using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        int noOfRows = new int();

        protected void Page_Init(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MakeTable();
        }

        /// <summary>
        /// On first visit to page, create a data table (zero rows) in which to store user-entered data
        /// If postback, create a new ASP table called "tblMyTable" of n rows where n = saved viewstate "NoOfRows" 
        /// and insert it into form at Placeholder1; each row of the ASP table contains a label (text to be added later) 
        /// and a "Delete" button
        /// </summary>
        private void MakeTable()
        {
            //On first visit to page...
            if (!Page.IsPostBack)
            {
                DataTable myDataTable = new DataTable();
                DataColumn myCol = myDataTable.Columns.Add();
                myCol.DataType = System.Type.GetType("System.String");
                ViewState["MyDataTable"] = myDataTable;
                ViewState["NoOfRows"] = 0;
            }
            //On postback...
            else
            {
                //Fetch number of rows from view state
                noOfRows = (int)ViewState["NoOfRows"];

                Table myTable = new Table();
                myTable.ID = "tblMyTable";
                TableRow myRow = null;
                TableCell myCell = null;
                Label myLabel = null;
                Button myButton = null;
                for (int i = 0; i < noOfRows + 1; i++)
                {
                    myRow = new TableRow();
                    myCell = new TableCell();
                    myLabel = new Label();
                    myLabel.ID = "lblLabel" + i.ToString();
                    myCell.Controls.Add(myLabel);
                    myRow.Cells.Add(myCell);
                    myCell = new TableCell();
                    myButton = new Button();
                    myButton.ID = "btnDelete" + i.ToString();
                    myButton.Text = "Delete";
                    myButton.CommandName = "Delete";
                    //CommandArgument identifies the row number
                    myButton.CommandArgument = i.ToString();
                    myButton.Click += new EventHandler(btnDelete_Click);
                    myCell.Controls.Add(myButton);
                    myRow.Cells.Add(myCell);
                    myTable.Rows.Add(myRow);
                }
                PlaceHolder1.Controls.Add(myTable);
            }
        }

        /// <summary>
        /// Clicking on the form's Add button causes a new row to be added to data table, and the contents of the
        /// text box are copied to this new row. The MyDataTable view state is saved, and the NoOfRows view state is 
        /// incremented by 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DataTable myDataTable = (DataTable)ViewState["MyDataTable"];
            if (TextBox1.Text != "")
            {
                TextBox1.Text = "";

                for (int i = 0; i < 10; i++)
                {
                    DataRow myDataRow = myDataTable.NewRow();
                    myDataRow[i] = i;
                    myDataTable.Rows.Add(myDataRow);
                    ViewState["MyDataTable"+i] = myDataTable;
                    noOfRows++;
                    ViewState["NoOfRows"+i] = noOfRows;
                }
            }

            //Copy values from data table to labels in ASP table
        }

        /// <summary>
        /// Each row in tblMyTable has a "Delete" button. When the Delete button is clicked, the corresponding row 
        /// in the data table is deleted, then the values in the data table are copied to the corresponding labels in 
        /// the ASP table, and then the last two rows of the ASP table are hidden
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void btnDelete_Click(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            //The row number is stored in each Delete button's CommandArgument
            int thisRow = Convert.ToInt32(myButton.CommandArgument);
            //Retrieve data table from view state, delete row, then save data table back to view state
            DataTable myDataTable = (DataTable)ViewState["MyDataTable"];
            myDataTable.Rows[thisRow].Delete();
            ViewState["MyDataTable"] = myDataTable;
            //Save NoOfRows view state, which is now 1 less than before Delete button was clicked
            noOfRows = myDataTable.Rows.Count;
            ViewState["NoOfRows"] = noOfRows;
            //Copy data from data table to labels in ASP table

            //Hide last two rows of ASP table
            Table myTable = (Table)Page.Form.FindControl("tblMyTable");
            myTable.Rows[myTable.Rows.Count - 1].Visible = false;
            myTable.Rows[myTable.Rows.Count - 2].Visible = false;
        }

        /// <summary>
        /// Fill the ASP table "tblMyTable" by setting each rows label equal to the corresponding value
        /// in the data table "myDataTable"
        /// </summary>
        /// <param name="myDataTable"></param>
        
    }
}