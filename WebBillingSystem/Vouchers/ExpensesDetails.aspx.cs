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
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;


namespace WebBillingSystem
{
    public partial class ExpensesDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList expenses_master;
        public string json_expenses_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.expenses_voucher_mst, "ORDER BY `manual_id` ASC");
            expenses_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                string status_label = "";
                string edit_button = "<a href='/Vouchers/ExpensesVoucher.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["exp_voucher_no"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>";
                edit_button += " " + "<a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/ExpensesVoucher.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["exp_voucher_no"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";

                if (reader["status"] + "" == "2")
                {
                    edit_button = "Invoice Cancel";
                }
                //1. role check  2. status check 3. label set
                if (Session["role_code"].ToString() == "CA")
                {
                    if (reader["ca_approved_status"].ToString() == "3")
                    {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else
                    {
                        status_label = "Open";
                    }
                }
                else if (Session["role_code"].ToString() == "COMPANY")
                {
                    if (reader["ca_approved_status"].ToString() == "3" || reader["ca_approved_status"].ToString() == "1")
                    {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else
                    {
                        status_label = "Open";
                    }
                }


                expenses_master.Add(new
                {
                    status_label = status_label,
                    exp_voucher_no = reader["manual_id"],
                    exp_voucher_date = Convert.ToDateTime(reader["exp_voucher_date"].ToString()).ToString("dd/MM/yyyy"),  //reader["invoice_date"],
                    exp_place_of_supply = reader["exp_place_of_supply"],
                    exp_reverse_charge = reader["exp_reverse_charge"],
                    exp_state = reader["exp_state"],
                    exp_state_code = reader["exp_state_code"],
                    exp_supplier_name = reader["exp_supplier_name"],
                    exp_supplier_addr = reader["exp_supplier_addr"],
                    exp_supplier_gstin = reader["exp_supplier_gstin"],
                    exp_supplier_state = reader["exp_supplier_state"],
                    exp_supplier_state_code = reader["exp_supplier_state_code"],
                    expenses_head = reader["expenses_head"],
                    total_cost = reader["total_cost"],
                    total_gst = reader["total_gst"],
                    total_igst = reader["total_igst"],
                    total_cgst = reader["total_cgst"],
                    total_sgst = reader["total_sgst"],
                    company_name = reader["company_name"],
                    auth_name = reader["auth_name"],
                    payment_mode = reader["payment_mode"],
                    edit_button = edit_button
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_expenses_obj = serializer.Serialize(expenses_master);

            }
        }
    }
}