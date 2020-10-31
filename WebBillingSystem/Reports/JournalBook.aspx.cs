using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBillingSystem
{
    public partial class JournalBook : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList journal_book_master;
        public System.Collections.ArrayList journal_book_note_master;
        public System.Collections.ArrayList jv_details;
        public string json_journal_book_obj;
        public string json_journal_book_note_obj;
        public string json_obj_dt_jv_dtl;
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (!Page.IsPostBack)
            {
                DateTime dateTime = DateTime.UtcNow.Date;
                from_date_id.Value = dateTime.ToString("yyyy-MM-dd");
                to_date_id.Value = dateTime.ToString("yyyy-MM-dd");
                int year = 2020;
                try
                {
                    year = Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                }
                catch (Exception e1)
                {
                    year = Int32.Parse(Convert.ToDateTime(dateTime).ToString("yyyy"));
                }
                //int year = Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
                {
                   // from_date_id.Value = (year - 1) + "-04-01";
                    from_date_id.Value = dateTime.AddYears(-1).ToString("yyyy-MM-dd");

                }
                else
                {
                    from_date_id.Value = year + "-04-01";
                }
            }

            //MySqlDataReader acc_head_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status=0");
            //while (acc_head_drop != null && acc_head_drop.Read())
            //{
            //    account_head_id.Items.Add(new ListItem(acc_head_drop["account_head"].ToString(), acc_head_drop["account_head"].ToString()));
            //}
            //if (acc_head_drop != null)
            //{
            //    acc_head_drop.Close();
            //}

            fr_date_id.InnerHtml = Convert.ToDateTime(from_date_id.Value.ToString()).ToString("d-MMM-yyyy");
            todate_id.InnerHtml = Convert.ToDateTime(to_date_id.Value.ToString()).ToString("d-MMM-yyyy");

            MySqlDataReader company_details = baseHealpare.SelectAllValues("*,  (Select pms_account_state_name FROM pms_account_state where company_state = pms_account_state_code) comp_name", baseHealpare.TableAddCompany, " where company_ucid = '" + Session["company"].ToString() + "' and status=0");
            while (company_details != null && company_details.Read())
            {
                company_name_id.InnerHtml = company_details["company_first_name"].ToString()+" " + company_details["company_middle_name"].ToString() +" "+company_details["company_surname"].ToString();
                //auth_dealer_id.InnerHtml = company_details["account_party_name"].ToString();
                state_id.InnerHtml = company_details["comp_name"].ToString();
                address_id.InnerHtml = company_details["company_address_one"].ToString() +" "+ company_details["company_address_two"].ToString()+" "+ company_details["company_address_three"].ToString();
                gstin_id.InnerHtml = company_details["company_gst_number"].ToString();
                statecode_id.InnerHtml = company_details["company_state_code"].ToString();
                //date_id.InnerHtml = company_details["account_state_code"].ToString();
            }
            if (company_details != null)
            {
                company_details.Close();
            }                   
        }

        protected void search_jv_details_event(object sender, EventArgs e)
        {
            journal_book_master = new System.Collections.ArrayList();
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT *, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount, master_id vou_no FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '"+ from_date_id.Value +"' and '"+ to_date_id.Value +"' ORDER BY `journal_id` ASC) group by pms_journal_entry_dtl.journal_id");
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT * FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '2020-01-21' and '2020-01-24' and `name` = 'SHRI DURGA PRINTING WORKS' ORDER BY `journal_id` ASC)");
            while (reader != null && reader.Read())
            {
                string master_id = reader["master_id"].ToString();
                string master_type = reader["master_id_type"].ToString();
                string edit_button = "<a href='/Vouchers/JournalEntry.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["journal_id"]) + "' class='btn btn-sm fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record' style='color:#17a2b8;'></>  ";

                char[] MyChar = { '~' };
                if (!master_id.Equals("0"))

                edit_button = "<a href='#' onclick='preparePopup(this)' data-modal-title='Edit Record' data-message='Current JV is locked with " + master_type + " if you want to edit JV please click YES?' data-url='" + baseHealpare.RedirectURLS[master_type].Trim(MyChar) + "?value=" + baseHealpare.EncodeUrl(this, master_id) + "" + "' class='btn btn-sm fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record' style='color:#17a2b8;'></>";
                edit_button += " " + "  <a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/JournalEntry.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["journal_id"]) + "' class='btn btn-sm fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record' style='color: red;'></>";
                
                //1. role check  2. status che  ck 3. label set
                if (Session["role_code"].ToString() == "CA")
                {
                    if (reader["ca_approved_status"].ToString() == "3")
                    {
                        edit_button = "";
                    }
                }
                else if (Session["role_code"].ToString() == "company")
                {
                    if (reader["ca_approved_status"].ToString() == "3" || reader["ca_approved_status"].ToString() == "1")
                    {
                        edit_button = "";
                    }
                }


                journal_book_master.Add(new
                {
                    jv_date = Convert.ToDateTime(reader["jv_date"].ToString()).ToString("dd/MM/yyyy"),
                    acc_head_name = reader["voucher_name"],
                    master_id_type = reader["master_id_type"],
                    journal_id = reader["journal_id"],
                    vou_no = reader["vou_no"],
                    particular_name = reader["voucher_name"],
                    debit_amount = reader["dramount"],
                    credit_amount = reader["cramount"],
                    edit_button = edit_button
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer { MaxJsonLength = Int32.MaxValue, RecursionLimit = 100 };
                json_journal_book_obj = serializer.Serialize(journal_book_master);
            }

            reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryMst, " where jv_date BETWEEN '" + from_date_id.Value + "' and '" + to_date_id.Value + "'  and status=0 ORDER BY `manual_id` ASC");
            journal_book_note_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                journal_book_note_master.Add(new
                {
                    jv_date = Convert.ToDateTime(reader["jv_date"].ToString()).ToString("dd/MM/yyyy"),
                    master_id_type = reader["master_id_type"],
                    journal_id = reader["manual_id"],
                    note = reader["note"]                 
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_journal_book_note_obj = serializer.Serialize(journal_book_note_master);
            }

            reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryDtl, " where `comp_name` = '" + Session["company"].ToString() + "' and status=0 ORDER BY jv_dtl_id ASC");
            jv_details = new System.Collections.ArrayList();
            while (reader != null && reader.Read())
            {
                jv_details.Add(new
                {
                    jv_dtl_id = reader["jv_dtl_id"],
                    comp_name = reader["comp_name"],
                    journal_id = reader["journal_id"],                    
                    name = reader["name"],
                    debit_amount = reader["debit_amount"],
                    credit_amount = reader["credit_amount"],
                    ca_approved_status = reader["ca_approved_status"]
                });
            }

            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj_dt_jv_dtl = serializer.Serialize(jv_details);
            }
        }
    }
}