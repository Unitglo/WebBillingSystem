using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class CreateChalan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbObject = new DataBaseHealpare();
           ChalanNo.Text=""+(Convert.ToInt32(dbObject.GetNo("challan", "challan_id"))+1);
        }
        protected void PrintChalan_Click(object sender, EventArgs e)
        {
            if (ReceiverName.Text.Equals(""))
            {
                ReceiverName.Focus();
                dbObject.MessageBox(this, "Enter Field");
            }
            else if (Destination.Text.Equals(""))
            {
                Destination.Focus();
                dbObject.MessageBox(this, "Enter Field");
            }
            else if (ContactNo.Text.Equals(""))
            {
                ContactNo.Focus();
                dbObject.MessageBox(this, "Enter Field");
            }
            else if (VehicleNo.Text.Equals(""))
            {
                VehicleNo.Focus();
                dbObject.MessageBox(this,"Enter Field");
            }
            else {
                dbObject.MessageBox(this, dbObject.InsertIntoTable("challan", new String[] { "receiver_name", "destination", "contact", "vehicle_no" }, new String[] { ReceiverName.Text, Destination.Text, ContactNo.Text, VehicleNo.Text}));
//                dbObject.MessageBox(this, dbObject.InsertIntoTable("challan", new String[] { "receiver_name", "destination", "contact", "vehicle_no", "dates" }, new String[] { ReceiverName.Text, Destination.Text, ContactNo.Text, VehicleNo.Text, dates.Text }));
            }
             if (!ItemName1.Text.Equals("") && !UnitName1.Text.Equals("") && !QTY1.Text.Equals(""))
            {
                dbObject.InsertIntoTable("challan_items", new String[] { "challan_id", "challan_item_name", "challan_item_unit", "challan_item_qty" }, new String[] { ChalanNo.Text,ItemName1.Text,UnitName1.Text,QTY1.Text });
            }
             if (!ItemName2.Text.Equals("") && !UnitName2.Text.Equals("") && !QTY2.Text.Equals(""))
            {
                dbObject.InsertIntoTable("challan_items", new String[] { "challan_id", "challan_item_name", "challan_item_unit", "challan_item_qty" }, new String[] { ChalanNo.Text, ItemName2.Text, UnitName2.Text, QTY2.Text });
            }
             if (!ItemName3.Text.Equals("") && !UnitName3.Text.Equals("") && !QTY3.Text.Equals(""))
            {
                dbObject.InsertIntoTable("challan_items", new String[] { "challan_id", "challan_item_name", "challan_item_unit", "challan_item_qty" }, new String[] { ChalanNo.Text, ItemName3.Text, UnitName3.Text, QTY3.Text });
            }
            if (!ItemName4.Text.Equals("") && !UnitName4.Text.Equals("") && !QTY4.Text.Equals(""))
            {
                dbObject.InsertIntoTable("challan_items", new String[] { "challan_id", "challan_item_name", "challan_item_unit", "challan_item_qty" }, new String[] { ChalanNo.Text, ItemName4.Text, UnitName4.Text, QTY4.Text });
            }
             if (!ItemName5.Text.Equals("") && !UnitName5.Text.Equals("") && !QTY5.Text.Equals(""))
            {
                dbObject.InsertIntoTable("challan_items", new String[] { "challan_id", "challan_item_name", "challan_item_unit", "challan_item_qty" }, new String[] { ChalanNo.Text, ItemName5.Text, UnitName5.Text, QTY5.Text });
            }
          
        }

        DataBaseHealpare dbObject;

    }
}