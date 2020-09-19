using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
         private int numOfRows = 1;
  
 
    protected void Page_Load(object sender, EventArgs e)
    {
        //Generate the Rows on Initial Load
        if (!Page.IsPostBack)
        {
            GenerateTable(numOfRows);
        }
 
    }
          protected void Button1_Click(object sender, EventArgs e)
    {
        if (ViewState["RowsCount"] != null)
        {
            numOfRows = Convert.ToInt32(ViewState["RowsCount"].ToString());
            GenerateTable(numOfRows);
        }
    }
 
    protected void Button2_Click(object sender, EventArgs e)
    {
        GetSelectedRows();
    }
 
    private void SetPreviousData(int rowsCount, int colsCount)
    {
        Table table = (Table)Page.FindControl("Table1");
        if (table != null)
        {
            for (int i = 0; i < rowsCount; i++)
            {
                for (int j = 0; j < colsCount; j++)
                {
                    if (j == 0)
                    {
                        //Get the Checked value of the CheckBox using the Request objects
                        string check = Request.Form["CheckBoxRow_" + i + "Col_" + j];
                        //Extract the CheckBox Control from within the Table
                        CheckBox cb = (CheckBox)table.Rows[i].Cells[j].FindControl("CheckBoxRow_" + i + "Col_" + j);
                        if (check == "on") //If selected
                        {
                            cb.Checked = true;
                        }
                    }
                    else
                    {
                        TextBox tb = (TextBox)table.Rows[i].Cells[j].FindControl("TextBoxRow_" + i + "Col_" + j);
                        tb.Text = Request.Form["TextBoxRow_" + i + "Col_" + j];
                    }
                }
            }
        }
    }
 
    private void GenerateTable(int rowsCount)
    {
        //Creat the Table and Add it to the Page
       
        //The number of Columns to be generated
        const int colsCount = 3;//You can changed the value of 3 based on you requirements
 
        // Now iterate through the table and add your controls
        for (int i = 0; i < rowsCount; i++)
        {
            TableRow row = new TableRow();
            for (int j = 0; j < colsCount; j++)
            {
                TableCell cell = new TableCell();
 
                if (j == 0) //means the first column of the Table
                {
                    //Create the CheckBox
                    CheckBox cb = new CheckBox();
                    // Set a unique ID for each CheckBox
                    cb.ID = "CheckBoxRow_" + i + "Col_" + j;
                    // Add the control to the FIRST TableCell
                    cell.Controls.Add(cb);
                    // Add the TableCell to the TableRow
                    row.Cells.Add(cell);
                   
                }
                else
                {
                    //Create the TextBox
                    TextBox tb = new TextBox();
                    // Set a unique ID for each TextBox
                    tb.ID = "TextBoxRow_" + i + "Col_" + j;
                    // Add the control to the TableCell
                    cell.Controls.Add(tb);
                    // Add the TableCell to the TableRow
                    row.Cells.Add(cell);
                }
            }
 
            // And finally, add the TableRow to the Table
            Table1.Rows.Add(row);
        }
 
        //Set Previous Data on PostBacks
        SetPreviousData(rowsCount, colsCount);
 
        //Sore the current Rows Count in ViewState
        rowsCount++;
        ViewState["RowsCount"] = rowsCount;
    }

    private void GetSelectedRows()
    {
        if (ViewState["RowsCount"] != null)
        {
            numOfRows = Convert.ToInt32(ViewState["RowsCount"].ToString());
            int removedRows = numOfRows - 1;

            //Re create the Table on Postbacks
            GenerateTable(numOfRows - 1);

            Table table = (Table)Page.FindControl("Table1");
            if (table != null)
            {
                if (table.Rows.Count > 0)
                {
                    for (int i = table.Rows.Count - 1; i >= 0; i--)
                    {
                        //Get the Checked value of the CheckBox using the Request objects
                        string check = Request.Form["CheckBoxRow_" + i + "Col_" + 0];
                        //Extract the CheckBox Control from within the Table
                        if (check == "on") //If selected
                        {
                            table.Rows.Remove(table.Rows[i]);
                            removedRows--;
                        }
                    }
                    ViewState["RowsCount"] = removedRows + 1;
                }
            }
        }
    }
 
    }
}