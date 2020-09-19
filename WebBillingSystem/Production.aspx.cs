using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class Production : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
            dbObject.CreateList(DropDownList1, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=2 " });
            dbObject.CreateList(DropDownList2, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=1 " });
            dbObject.CreateList(DropDownList3, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=1 " });
            dbObject.CreateList(DropDownList4, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=1 " });
            dbObject.CreateList(DropDownList5, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=1 " });
            dbObject.CreateList(DropDownList6, dbObject.TableItems, new String[] { "item_id", "item_names" }, new String[] { " item_type_id=1 " });
        }

        DataBaseHealpare dbObject;

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!unit1.Text.Equals(""))
            {
                dbObject.InsertIntoTable(dbObject.TableManufacturingIssue, new String[] { "manufacturing_id", "item_id", "material" }, new String[] { DropDownList1.SelectedValue, DropDownList2.SelectedValue, unit1.Text });
            }
            if (!unit2.Text.Equals(""))
            {
                dbObject.InsertIntoTable(dbObject.TableManufacturingIssue, new String[] { "manufacturing_id", "item_id", "material" }, new String[] { DropDownList1.SelectedValue, DropDownList2.SelectedValue, unit1.Text });
            }
            if (!unit3.Text.Equals(""))
            {
                dbObject.InsertIntoTable(dbObject.TableManufacturingIssue, new String[] { "manufacturing_id", "item_id", "material" }, new String[] { DropDownList1.SelectedValue, DropDownList2.SelectedValue, unit1.Text });
            }
            if (!unit4.Text.Equals(""))
            {
                dbObject.InsertIntoTable(dbObject.TableManufacturingIssue, new String[] { "manufacturing_id", "item_id", "material" }, new String[] { DropDownList1.SelectedValue, DropDownList2.SelectedValue, unit1.Text });
            }
            if (!unit5.Text.Equals(""))
            {
                dbObject.InsertIntoTable(dbObject.TableManufacturingIssue, new String[] { "manufacturing_id", "item_id", "material" }, new String[] { DropDownList1.SelectedValue, DropDownList2.SelectedValue, unit1.Text });
            }

            MySqlDataReader reader = dbObject.SelectAllValues(" sum(manufacturing_issue.material*items.pare) as projected ", " manufacturing_issue,items ", "where manufacturing_id=" + DropDownList1.SelectedValue + " and manufacturing_issue.item_id=items.item_id");
            String val = "0";
            while (reader.Read())
            {
                val =""+ reader["projected"];
            }
            reader.Close();
             dbObject.MessageBox(this,   dbObject.UpdateValue(dbObject.TableItems, new String[] { "pare='" + val+"'" }, "item_id="+DropDownList1.SelectedValue));

        }
    }
}