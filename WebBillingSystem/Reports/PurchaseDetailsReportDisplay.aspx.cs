using MySql.Data.MySqlClient;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class PurchaseDetailsReportDisplay : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList purchase_master;
        public string json_purchase_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, " where invoice_type='purchase'");
            purchase_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                purchase_master.Add(new
                {
                    invoice_no = reader["invoice_no"],
                    //invoice_date = reader["invoice_date"],
                    reverse_charge = reader["reverse_charge"],
                    i_state = reader["i_state"],
                    statecode = reader["statecode"],
                    seller_name = reader["seller_name"],
                    Seller_address = reader["Seller_address"],
                    gstin = reader["gstin"],
                    s_state = reader["s_state"],
                    state_code = reader["state_code"],
                    total_cost = reader["total_cost"],
                    total_gst = reader["total_gst"],
                    total_igst = reader["total_igst"],
                    total_cgst = reader["total_cgst"],
                    total_sgst = reader["total_sgst"],
                    total_discount = reader["total_discount"],
                    payment_mode = reader["payment_mode"],
                    payment_status = reader["payment_status"],
                    invoice_type = reader["invoice_type"],
                    remark = reader["remark"],
                    //edit_button = "<a href='/Vouchers/PurchaseInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, ""+reader["invoice_no"] ) + "' class='btn btn-info' >Edit</>",
                    // del_button = "<a href='/Vouchers/PurchaseInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["invoice_no"]) + "' class='btn btn-danger' >Delete</>"
                });
            }
            if(reader != null)
            {
                reader.Close();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            json_purchase_obj = serializer.Serialize(purchase_master);

            }
            
        }
    }
}