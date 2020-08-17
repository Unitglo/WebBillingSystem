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
    public partial class PurchaseRegister : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList journal_book_master;
        public System.Collections.ArrayList journal_book_day_details_master;
        public System.Collections.ArrayList journal_book_dtl_master;
        public string json_journal_book_obj;
        public string json_journal_book_day_obj;
        public string json_journal_book_dtl_obj;
        double acc_cl_bal = 0.00;
        string accn_cl_bal1 = "";
        string accn_cl_bal2 = "";
        double acc_cl_balance = 0.00;
        public string acc_cl_balance_type = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (!Page.IsPostBack)
            {
                DateTime dateTime = DateTime.UtcNow.Date;
                //from_date_id.Value = dateTime.ToString("yyyy-MM-dd");
                //to_date_id.Value = dateTime.ToString("yyyy-MM-dd");

                //int year = Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                //if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
                //{
                //    from_date_id.Value = (year - 1) + "-04-01";
                //}
                //else
                //{
                //    from_date_id.Value = year + "-04-01";
                //}

                //date_id.InnerHtml = Convert.ToDateTime(from_date_id.Value.ToString()).ToString("d-MMM-yyyy") + " TO " + Convert.ToDateTime(to_date_id.Value.ToString()).ToString("d-MMM-yyyy");

                //account_main_group.Items.Clear();
                //MySqlDataReader main_drop = baseHealpare.SelectAllValues(baseHealpare.TableAccountMainGroup, " where status=0");
                //while (main_drop != null && main_drop.Read())
                //{
                //    account_main_group.Items.Add(new ListItem(main_drop["main_group_name"].ToString(), main_drop["account_master_main_group_id"].ToString()));
                //}
                //if (main_drop != null)
                //{
                //    main_drop.Close();
                //}
                //    mainGroup_Changed(sender, e);

                comp_name_id.InnerHtml = Session["company_name"].ToString();
                MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "WHERE company_ucid='" + Session["company"].ToString() + "'");
                while (sess_login_reader != null && sess_login_reader.Read())
                {
                    comp_trade_name_id.InnerHtml = sess_login_reader["company_trade_name"].ToString();
                    comp_add_id.InnerHtml = sess_login_reader["company_address_one"] + " " + sess_login_reader["company_address_two"] + "" + sess_login_reader["company_address_three"]; ;
                    comp_gst_no_id.InnerHtml = sess_login_reader["company_gst_number"].ToString();
                    comp_email_id.InnerHtml = sess_login_reader["company_email"].ToString();
                    comp_pan_no_id.InnerHtml = sess_login_reader["company_pan_number"].ToString();
                    comp_phone_id.InnerHtml = sess_login_reader["company_phone_number"].ToString();
                    comp_cin_no_id.InnerHtml = sess_login_reader["company_cin_number"].ToString();
                }
                if (sess_login_reader != null)
                {
                    sess_login_reader.Close();
                }
            //}

            //MySqlDataReader acc_head_details = baseHealpare.SelectAllValues("*, " + "(SELECT pms_account_state_name FROM pms_account_state WHERE pms_account_state_code = account_state_code) as statename", baseHealpare.TableAddAccount, " where account_head='" + account_head_id.Value + "' and status=0");
            //while (acc_head_details != null && acc_head_details.Read())
            //{
            //    company_name_id.InnerHtml = acc_head_details["account_head"].ToString();
            //    auth_dealer_id.InnerHtml = acc_head_details["account_party_name"].ToString();
            //    state_id.InnerHtml = "(" + acc_head_details["statename"].ToString() + ")";
            //    address_id.InnerHtml = acc_head_details["account_add_one"].ToString() + " " + acc_head_details["account_add_two"].ToString();
            //    gstin_id.InnerHtml = acc_head_details["account_gst_number"].ToString();
            //    statecode_id.InnerHtml = acc_head_details["account_state_code"].ToString();
            //}
            //if (acc_head_details != null)
            //{
            //    acc_head_details.Close();
            //}

        }
        
        
        //MySqlDataReader account_details = baseHealpare.SelectManualQuery("SELECT account_opening_balance AMOUNT, account_opening_balance_type TYPE FROM `pms_account_master` WHERE account_head ='" + account_head_id.Value + "' and status != 2");
            MySqlDataReader account_details = baseHealpare.SelectManualQuery("SELECT account_opening_balance AMOUNT, account_opening_balance_type TYPE, account_head FROM `pms_account_master` WHERE  status != 2 and `account_main_group` = '7' and `account_sub_group` = '2'");
            while (account_details != null && account_details.Read())
            {
                if (account_details["AMOUNT"].ToString() != null)
                {
                    if (account_details["TYPE"].ToString() == "Debit")
                    {
                        op_bal_dr_id.InnerHtml = Math.Round(Convert.ToDouble(account_details["AMOUNT"].ToString()), 2).ToString("0.00") + " Dr";
                        op_bal_cr_id.InnerHtml = "0.00";
                        acc_cl_bal = Convert.ToDouble(account_details["AMOUNT"].ToString()) * -1;
                        acc_cl_balance = Convert.ToDouble(account_details["AMOUNT"].ToString()) * -1;
                        acc_cl_balance_type = account_details["TYPE"].ToString();
                    }
                    else
                    {
                        op_bal_cr_id.InnerHtml = Math.Round(Convert.ToDouble(account_details["AMOUNT"].ToString()),2).ToString("0.00") + " Cr";
                        op_bal_dr_id.InnerHtml = "0.00";
                        acc_cl_bal = Convert.ToDouble(account_details["AMOUNT"].ToString());
                        acc_cl_balance = Convert.ToDouble(account_details["AMOUNT"].ToString());
                    }
                } else
                {
                    op_bal_cr_id.InnerHtml = "0.00";
                    op_bal_dr_id.InnerHtml = "0.00";
                    acc_cl_bal = acc_cl_balance = 0.00;
                }
            }
            if (account_details != null)
            {
                account_details.Close();
            }

            journal_book_master = new System.Collections.ArrayList();
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT pms_journal_entry_dtl.*, jv_date, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', debit_amount, 0)),0) as dr_tot, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', credit_amount, 0)),0) as cr_tot, MONTHNAME(pms_journal_entry_mst.jv_date) as month, SUM(dr_total) all_tot, `master_id_type`, pms_journal_entry_mst.journal_id FROM pms_journal_entry_mst left join pms_journal_entry_dtl on pms_journal_entry_mst.journal_id = pms_journal_entry_dtl.journal_id where name = '" + account_head_id.Value.ToString() + "' and pms_journal_entry_mst.status != 2 group by MONTH(jv_date) ORDER BY jv_date ASC");
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT pms_journal_entry_dtl.*, jv_date, sum(debit_amount) as dr_tot, sum(credit_amount) as cr_tot, MONTHNAME(pms_journal_entry_mst.jv_date) as month, SUM(dr_total) all_tot, `master_id_type`, pms_journal_entry_mst.journal_id FROM pms_journal_entry_mst left join pms_journal_entry_dtl on pms_journal_entry_mst.journal_id = pms_journal_entry_dtl.journal_id where name in (SELECT account_head FROM `pms_account_master` WHERE status != 2 and `account_main_group` = '7' and `account_sub_group` = '2') and pms_journal_entry_mst.status != 2 group by MONTH(jv_date) ORDER BY jv_date ASC");
            while (reader != null && reader.Read())
            {
               string edit_button = "<a class='btn btn-xs btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";
                 edit_button += "<a class='btn btn-xs btn-light fa fa-file-excel-o btnExcelMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to Excel' style='font - size:20px; color: forestgreen' onclick='ExportToExcel(this)'></>";
                 edit_button += "<a class='btn btn-xs btn-light fa fa-file-pdf-o btnPdfMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to PDF' style='font - size:20px; color: red'></>";
                 edit_button += "<a class='btn btn-xs btn-light fa fa-file-word-o btnWordMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to Word Doc' style='font - size:20px; color: blue' onclick='ExportToDocMonth(this)'></>";
                 double cr_tot = Convert.ToDouble(reader["cr_tot"].ToString());
                 double dr_tot = Convert.ToDouble(reader["dr_tot"].ToString());
                 double all_tot= Convert.ToDouble(reader["all_tot"].ToString());

                acc_cl_balance =  Math.Round((acc_cl_balance + (cr_tot - dr_tot)),2);
                string a = Math.Round(acc_cl_balance).ToString("0.00");
                if (acc_cl_balance < 0)
                {
                    accn_cl_bal2 = Math.Round(System.Math.Abs(acc_cl_balance)).ToString("0.00") + " Dr";
                }
                else
                {
                    accn_cl_bal2 = Math.Round(acc_cl_balance).ToString("0.00") + " Cr";
                }
                
                journal_book_master.Add(new
                {
                    month = reader["month"],
                    drtotal = Math.Round(dr_tot, 2).ToString("0.00"),
                    crtotal = Math.Round(cr_tot, 2).ToString("0.00"),
                    acc_cl_balance = accn_cl_bal2,
                    action = edit_button
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                 json_journal_book_obj = serializer.Serialize(journal_book_master);
            }

            journal_book_dtl_master = new System.Collections.ArrayList();
            //reader = baseHealpare.SelectManualQuery("SELECT *, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', debit_amount, 0)),0) as dr_tot, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', credit_amount, 0)),0) as cr_tot, MONTHNAME(pms_journal_entry_mst.jv_date) as month, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '" + from_date_id.Value + "' and '" + to_date_id.Value + "' and status != 2 and `name` = '" + account_head_id.Value + "') group by pms_journal_entry_dtl.journal_id ORDER BY `manual_id` ASC");
            reader = baseHealpare.SelectManualQuery("SELECT *, sum(debit_amount) as dr_tot, sum(credit_amount) as cr_tot, MONTHNAME(pms_journal_entry_mst.jv_date) as month, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` left join `pms_account_master` on account_head = name WHERE `account_main_group` = '7' and `account_sub_group` = '2' and pms_journal_entry_dtl.status != 2) group by pms_journal_entry_dtl.journal_id ORDER BY `manual_id` ASC");
            while (reader != null && reader.Read())
            {
                string master_id = reader["master_id"].ToString();
                string master_type = reader["master_id_type"].ToString();
                string edit_button = "<a href='/Vouchers/JournalEntry.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["journal_id"]) + "' class='btn btn-sm fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record' style='color:#17a2b8;'></>  ";

                char[] MyChar = { '~' };
                if(!master_id.Equals("0"))

                edit_button = "<a onclick='preparePopup(this)' data-modal-title='Edit Record' data-message='Current JV is locked with " + master_type + " if you want to edit JV please click YES?' data-url='" + baseHealpare.RedirectURLS[master_type].Trim(MyChar) + "?value=" + baseHealpare.EncodeUrl(this, master_id) + "" + "' class='btn btn-sm fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record' style='color:#17a2b8;'></>";
                edit_button += "" + "<a onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/JournalEntry.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["journal_id"]) + "' class='btn btn-sm fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record' style='color: red;'></>";
                edit_button += "" + "<a data-jv-id='"+ reader["journal_id"] + "' data-date='"+ Convert.ToDateTime(reader["jv_date"].ToString()).ToString("dd/MM/yyyy") + "' onclick='format_day(this)' class='btn btn-xs btn-warning details-control-day fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";
                double cr = 0.00;
                string new_name =reader["voucher_name"].ToString();
                //new_name = new_name.Replace(account_head_id.Value+"<br>","");
                new_name = new_name.Substring(0, new_name.IndexOf("<br>"));

                cr = Convert.ToDouble(reader["cr_tot"].ToString());
                acc_cl_bal = Math.Round((acc_cl_bal + cr),2);
                cr = Convert.ToDouble(reader["dr_tot"].ToString());
                acc_cl_bal = Math.Round((acc_cl_bal - cr),2);
               
                if (acc_cl_bal < 0)
                {
                    accn_cl_bal1 = Math.Round(System.Math.Abs(Math.Round(acc_cl_bal, 2))).ToString("0.00")  + " Dr";
                } else
                {
                    accn_cl_bal1 = Math.Round(acc_cl_bal).ToString("0.00") + " Cr";
                }
                    journal_book_dtl_master.Add(new
                    {
                        jv_date = Convert.ToDateTime(reader["jv_date"].ToString()).ToString("dd/MM/yyyy"),
                        month = reader["month"],
                        note = reader["note"],
                        acc_head_name = new_name,
                        master_id_type = reader["master_id_type"],
                        journal_id = reader["journal_id"],
                        // dr_total = Math.Round(Convert.ToDouble(reader["debit_amount"]),2).ToString("0.00"),
                        // cr_total = Math.Round(Convert.ToDouble(reader["credit_amount"]),2).ToString("0.00"),
                        dr_total = Math.Round(Convert.ToDouble(reader["dr_tot"]), 2).ToString("0.00"),
                        cr_total = Math.Round(Convert.ToDouble(reader["cr_tot"]), 2).ToString("0.00"),
                        acc_cl_bal = accn_cl_bal1,
                        acc_cl_bal_type = acc_cl_balance_type,
                        edit_button = edit_button
                    });
            }
            if(reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_journal_book_dtl_obj = serializer.Serialize(journal_book_dtl_master);
            }

            journal_book_day_details_master = new System.Collections.ArrayList();
            //MySqlDataReader day_reader = baseHealpare.SelectManualQuery("SELECT *, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '" + from_date_id.Value + "' and '" + to_date_id.Value + "' and status != 2 and `name` = '" + account_head_id.Value + "' ORDER BY `journal_id` ASC) group by pms_journal_entry_dtl.journal_id");
            MySqlDataReader day_reader = baseHealpare.SelectManualQuery("SELECT *, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` left join `pms_account_master` on account_head = name WHERE `account_main_group` = '7' and `account_sub_group` = '2' and pms_journal_entry_dtl.status != 2 ORDER BY `journal_id` ASC) group by pms_journal_entry_dtl.journal_id");
            while (day_reader != null && day_reader.Read())
            {
                journal_book_day_details_master.Add(new
                {
                    jv_date = Convert.ToDateTime(day_reader["jv_date"].ToString()).ToString("dd/MM/yyyy"),
                    acc_head_name = day_reader["voucher_name"],
                    master_id_type = day_reader["master_id_type"],
                    journal_id = day_reader["journal_id"],
                    dr_total = day_reader["dramount"],
                    cr_total = day_reader["cramount"]
                });
            }
            if (day_reader != null)
            {
                day_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_journal_book_day_obj = serializer.Serialize(journal_book_day_details_master);
            }
        }
    }
}