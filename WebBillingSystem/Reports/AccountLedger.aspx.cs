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
    public partial class AccountLedger : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList journal_book_master;
        public System.Collections.ArrayList journal_book_day_details_master;
        public System.Collections.ArrayList journal_book_dtl_master;
        public string json_journal_book_obj;
        public string json_journal_book_day_obj;
        public string json_journal_book_dtl_obj;
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (!Page.IsPostBack)
            {
                DateTime dateTime = DateTime.UtcNow.Date;
                from_date_id.Value = dateTime.ToString("yyyy-MM-dd");
                to_date_id.Value = dateTime.ToString("yyyy-MM-dd");

                int year = 2020;
                try {
                  year=  Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                }
                catch (Exception e1) {
                    year = Int32.Parse(Convert.ToDateTime(dateTime).ToString("yyyy"));
                }
                if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
                {
                    //from_date_id.Value = (year - 1) + "-04-01";
                from_date_id.Value = dateTime.AddYears(-1).ToString("yyyy-MM-dd");
                }
                else
                {
                     from_date_id.Value = year + "-04-01";                   
                }

            date_id.InnerHtml = Convert.ToDateTime(from_date_id.Value.ToString()).ToString("d-MMM-yyyy") + " TO " + Convert.ToDateTime(to_date_id.Value.ToString()).ToString("d-MMM-yyyy");
                 //account_main_group.Items.Clear();
                MySqlDataReader main_drop = baseHealpare.SelectAllValues(baseHealpare.TableAccountMainGroup, " where status=0");
                while (main_drop != null && main_drop.Read())
                {
                    account_main_group.Items.Add(new ListItem(main_drop["main_group_name"].ToString(), main_drop["account_master_main_group_id"].ToString()));
                }
                if (main_drop != null)
                {
                    main_drop.Close();
                }
                mainGroup_Changed(sender, e);

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
                if(sess_login_reader != null)
                {
                    sess_login_reader.Close();
                }
            }
            
            MySqlDataReader acc_head_details = baseHealpare.SelectAllValues("*, " + "(SELECT pms_account_state_name FROM pms_account_state WHERE pms_account_state_code = account_state_code) as statename", baseHealpare.TableAddAccount, " where account_head='" + account_head_id.Value + "' and status=0");
            while (acc_head_details != null && acc_head_details.Read())
            {
                company_name_id.InnerHtml = acc_head_details["account_head"].ToString();
                auth_dealer_id.InnerHtml = acc_head_details["account_party_name"].ToString();
                state_id.InnerHtml = "(" + acc_head_details["statename"].ToString() + ")";
                address_id.InnerHtml = acc_head_details["account_add_one"].ToString() + " " + acc_head_details["account_add_two"].ToString();
                gstin_id.InnerHtml = acc_head_details["account_gst_number"].ToString();
                statecode_id.InnerHtml = acc_head_details["account_state_code"].ToString();
            }
            if (acc_head_details != null)
            {
                acc_head_details.Close();
            }
        
            ClientScriptManager cs = Page.ClientScript;
            this.account_main_group.Attributes.Add("onchange", cs.GetPostBackEventReference(this.account_main_group, this.account_main_group.ID));
            this.account_sub_group.Attributes.Add("onchange", cs.GetPostBackEventReference(this.account_sub_group, this.account_sub_group.ID));

            if (Request.QueryString.Count != 0)
            {
                account_head_id.SelectedIndex = account_head_id.Items.IndexOf(account_head_id.Items.FindByText(System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))));
                search_jv_details_event(sender, e);
            }
        }

        protected void mainGroup_Changed(object sender, EventArgs e)
        {
            //account_main_group.SelectedIndex = account_main_group.SelectedIndex(account_main_group.Value
            account_sub_group.Items.Clear();
            MySqlDataReader sub_drop = baseHealpare.SelectAllValues(baseHealpare.TableAccountsubGroup, "where account_master_main_group_id=" + account_main_group.Value);
            account_sub_group.Items.Add(new ListItem("All...", "0"));
            while (sub_drop != null && sub_drop.Read())
            {
                account_sub_group.Items.Add(new ListItem(sub_drop["account_master_sub_group_name"].ToString(), sub_drop["account_master_sub_group_id"].ToString()));
            }
            //account_sub_group.Items.Add(new ListItem("Add New", "add"));
            sub_drop.Close();
            Group_Changed(sender, e);
        }

        protected void Group_Changed(object sender, EventArgs e)
        {
            account_head_id.Items.Clear();
            MySqlDataReader acc_head_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status != 2");
            if (account_main_group.Value == "0" && account_sub_group.Value == "0")
            {
                acc_head_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status != 2");
            }
            else if (account_main_group.Value != "0" && account_sub_group.Value == "0")
            {
                acc_head_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " WHERE account_main_group = '" + account_main_group.Value + "' AND status != 2 ORDER BY `account_head` ASC");
            }
            else if (account_main_group.Value != "0" && account_sub_group.Value != "0")
            {
                acc_head_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " WHERE account_main_group = '" + account_main_group.Value + "' AND account_sub_group = '" + account_sub_group.Value + "' AND status != 2 ORDER BY `account_head` ASC");
            }

            while (acc_head_drop != null && acc_head_drop.Read())
            {
                account_head_id.Items.Add(new ListItem(acc_head_drop["account_head"].ToString(), acc_head_drop["account_head"].ToString()));
            }
            if (acc_head_drop != null)
            {
                acc_head_drop.Close();
            }
            
        }

        double acc_cl_bal = 0.00;
        string accn_cl_bal1 = "";
        string accn_cl_bal2 = "";
        double acc_cl_balance = 0.00;
        public string acc_cl_balance_type = "";
        protected void search_jv_details_event(object sender, EventArgs e)
        {
            MySqlDataReader account_details = baseHealpare.SelectManualQuery("SELECT account_opening_balance AMOUNT, account_opening_balance_type TYPE FROM `pms_account_master` WHERE account_head ='" + account_head_id.Value + "' and status != 2");
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
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT MONTHNAME(pms_journal_entry_mst.jv_date) as month, SUM(debit_amount) dramt, SUM(credit_amount) cramt, `master_id_type` master_id_type, pms_journal_entry_mst.journal_id, jv_date, name voucher_name FROM pms_journal_entry_mst left join pms_journal_entry_dtl on pms_journal_entry_mst.journal_id = pms_journal_entry_dtl.journal_id where name = '" + account_head_id.Value.ToString() + "' and pms_journal_entry_mst.status != 2 group by Month(pms_journal_entry_mst.`jv_date`)");
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT m.MONTH, n.dramt, n.cramt FROM (SELECT 'April' AS MONTH UNION SELECT 'May' AS MONTH UNION SELECT 'June' AS MONTH UNION SELECT 'July' AS MONTH UNION SELECT 'August' AS MONTH UNION SELECT 'September' AS MONTH UNION SELECT 'October' AS MONTH UNION SELECT 'November' AS MONTH UNION SELECT 'December' AS MONTH UNION SELECT 'January' AS MONTH UNION SELECT 'February' AS MONTH UNION SELECT 'March' AS MONTH ) m right JOIN (SELECT mst.*,SUM(dr_total) dramt, SUM(cr_total) cramt, MONTHNAME(jv_date) AS MONTH FROM pms_journal_entry_mst mst left join pms_journal_entry_dtl dtl on dtl.journal_id = mst.journal_id WHERE name = '" + account_head_id.Value.ToString() + "' GROUP BY MONTHNAME(jv_date),MONTH(jv_date)) n ON m.MONTH=n.MONTH ORDER BY m.MONTH");
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT pms_journal_entry_dtl.*, jv_date, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', debit_amount, 0)),0) as dr_tot, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', credit_amount, 0)),0) as cr_tot, MONTHNAME(pms_journal_entry_mst.jv_date) as month, SUM(dr_total) all_tot, `master_id_type`, pms_journal_entry_mst.journal_id FROM pms_journal_entry_mst left join pms_journal_entry_dtl on pms_journal_entry_mst.journal_id = pms_journal_entry_dtl.journal_id where name = '" + account_head_id.Value.ToString() + "' and pms_journal_entry_mst.status != 2 group by MONTH(jv_date) ORDER BY jv_date ASC");
            while (reader != null && reader.Read())
            {
               string edit_button = "<a class='btn btn-xs btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";
                 edit_button += "<a class='btn btn-xs btn-light fa fa-file-excel-o btnExcelMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to Excel' style='font - size:20px; color: forestgreen' onclick='ExportToExcel(this)'></>";
                 edit_button += "<a class='btn btn-xs btn-light fa fa-file-pdf-o btnPdfMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to PDF' style='font - size:20px; color: red' onclick='ExportToExcel(this)'></>";
                 edit_button += "<a class='btn btn-xs btn-light fa fa-file-word-o btnWordMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to Word Doc' style='font - size:20px; color: blue' onclick='ExportToDocMonth(this)'></>";
                 double cr_tot = Convert.ToDouble(reader["cr_tot"].ToString());
                 double dr_tot = Convert.ToDouble(reader["dr_tot"].ToString());
                 double all_tot= Convert.ToDouble(reader["all_tot"].ToString());

                string a = Math.Round(acc_cl_balance).ToString("0.00");
                acc_cl_balance =  Math.Round((Convert.ToDouble(a) + (cr_tot - dr_tot)),2);
                if (acc_cl_balance < 0)
                {
                    accn_cl_bal2 = Math.Round(acc_cl_balance,2).ToString("0.00") + " Dr";
                }
                else
                {
                    accn_cl_bal2 = Math.Round(acc_cl_balance,2).ToString("0.00") + " Cr";
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
            reader = baseHealpare.SelectManualQuery("SELECT *, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', debit_amount, 0)),0) as dr_tot, IFNULL(sum(if (name = '" + account_head_id.Value.ToString() + "', credit_amount, 0)),0) as cr_tot, MONTHNAME(pms_journal_entry_mst.jv_date) as month, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '" + from_date_id.Value + "' and '" + to_date_id.Value + "' and status != 2 and `name` = '" + account_head_id.Value + "') group by pms_journal_entry_dtl.journal_id ORDER BY `manual_id` ASC");
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
                new_name = new_name.Replace(account_head_id.Value+"<br>","");
                new_name = new_name.Substring(0, new_name.IndexOf("<br>"));

                cr = Convert.ToDouble(reader["cr_tot"].ToString());
                acc_cl_bal = Math.Round((acc_cl_bal + cr),2);
                cr = Convert.ToDouble(reader["dr_tot"].ToString());
                acc_cl_bal = Math.Round((acc_cl_bal - cr),2);
               
                if (acc_cl_bal < 0)
                {
                    accn_cl_bal1 = Math.Round(acc_cl_bal, 2).ToString("0.00")  + " Dr";
                } else
                {
                    accn_cl_bal1 = Math.Round(acc_cl_bal,2).ToString("0.00") + " Cr";
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
            MySqlDataReader day_reader = baseHealpare.SelectManualQuery("SELECT *, REPLACE(GROUP_CONCAT(CONCAT(name,'<br>')),',','') as voucher_name, REPLACE(GROUP_CONCAT(CONCAT(debit_amount,'<br>')),',','') as dramount , REPLACE(GROUP_CONCAT(CONCAT(credit_amount,'<br>')),',','') as cramount FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '" + from_date_id.Value + "' and '" + to_date_id.Value + "' and status != 2 and `name` = '" + account_head_id.Value + "' ORDER BY `journal_id` ASC) group by pms_journal_entry_dtl.journal_id");
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT * FROM `pms_journal_entry_dtl` RIGHT JOIN `pms_journal_entry_mst` ON `pms_journal_entry_dtl`.`journal_id` = `pms_journal_entry_mst`.`journal_id` WHERE pms_journal_entry_dtl.`journal_id` in (SELECT journal_id FROM `pms_journal_entry_dtl` WHERE `jv_date` BETWEEN '2020-01-21' and '2020-01-24' and `name` = 'SHRI DURGA PRINTING WORKS' ORDER BY `journal_id` ASC)");
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