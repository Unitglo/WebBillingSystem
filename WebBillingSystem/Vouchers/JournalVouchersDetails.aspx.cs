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
    public partial class JournalVouchersDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList jv_master;
        public System.Collections.ArrayList jv_details;
        public string json_obj_dt_jv;
        public string json_obj_dt_jv_dtl;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            MySqlDataReader jv_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryMst, " where `comp_name` = '" + Session["company"].ToString() + "'  and status != 2  ORDER BY `manual_id` ASC");
            jv_master = new System.Collections.ArrayList();

            while (jv_reader != null && jv_reader.Read())
            {
                string master_id = jv_reader["master_id"].ToString();
                string master_type = jv_reader["master_id_type"].ToString();
                string status_label = "";
                string edit_button = "<a href='/Vouchers/JournalEntry.aspx?value=" + baseHealpare.EncodeUrl(this, "" + jv_reader["journal_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>  ";

                char[] MyChar = { '~' };
                if (!master_id.Equals("0"))
                edit_button = "<a href='#' onclick='preparePopup(this)' data-modal-title='Edit Record' data-message='Current JV is locked with " + master_type + " if you want to edit JV please click YES?' data-url='" + baseHealpare.RedirectURLS[master_type].Trim(MyChar) + "?value=" + baseHealpare.EncodeUrl(this, master_id) + "" + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>";
                edit_button += " " + "  <a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/JournalEntry.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + jv_reader["journal_id"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                edit_button += " " + "<a href='#' class='btn btn-sm btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>"; ;
                
                //1. role check  2. status che  ck 3. label set
                if (Session["role_code"].ToString() == "CA")
                {
                    if (jv_reader["ca_approved_status"].ToString() == "3")
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
                    if (jv_reader["ca_approved_status"].ToString() == "3" || jv_reader["ca_approved_status"].ToString() == "1")
                    {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else
                    {
                        status_label = "Open";
                    }
                }

                jv_master.Add(new
                {
                    status_label = status_label,
                    comp_name = jv_reader["comp_name"],
                    journal_id = jv_reader["journal_id"],
                    manual_id = jv_reader["manual_id"],
                    jv_date = Convert.ToDateTime(jv_reader["jv_date"].ToString()).ToString("dd/MM/yyyy"),                    
                    dr_total = jv_reader["dr_total"],
                    cr_total = jv_reader["cr_total"],
                    note = jv_reader["note"],
                    edit_button = edit_button

                });
            }
            if(jv_reader != null){
                jv_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer { MaxJsonLength = Int32.MaxValue, RecursionLimit = 100 };
                json_obj_dt_jv = serializer.Serialize(jv_master);
            }

            jv_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryDtl, " where `comp_name` = '" + Session["company"].ToString() + "' and status=0 ORDER BY jv_dtl_id ASC");
            jv_details = new System.Collections.ArrayList();
            while (jv_reader != null && jv_reader.Read())
            {
                jv_details.Add(new
                {
                    jv_dtl_id = jv_reader["jv_dtl_id"],
                    comp_name = jv_reader["comp_name"],
                    journal_id = jv_reader["journal_id"],
                    name = jv_reader["name"],
                    debit_amount = jv_reader["debit_amount"],
                    credit_amount = jv_reader["credit_amount"],
                    ca_approved_status = jv_reader["ca_approved_status"]
                });
            }

            if (jv_reader != null)
            {
                jv_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj_dt_jv_dtl = serializer.Serialize(jv_details);
            }
        }
    }
}