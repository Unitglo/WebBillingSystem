using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using Newtonsoft.Json.Linq;
using System.Text.RegularExpressions;

namespace WebBillingSystem
{
    public partial class JournalEntry : System.Web.UI.Page
    {
        public DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList journal_master;
        public System.Collections.ArrayList edit_dtl_master;
        public System.Collections.ArrayList party_name;
        public System.Collections.ArrayList update_dtl_master;
        public string json_head_name;
        private JavaScriptSerializer serializer;
        public string json_dtl_obj;
        public string json_obj;
        public string json_display_content;
        public string json_jv_redirect_entry;
        public string json_session_jv = "0";
        public string json_display_comp;
        public string master_id = "0";
        public string master_type= "journal";
        string mainId = "0";
        int JVId = 0;
        string jv_auto_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();            
            string a = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
            Voucher_Date_id.Attributes["min"] = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
            Voucher_Date_id.Attributes["max"] = Convert.ToDateTime(Session["end_date"].ToString()).ToString("yyyy-MM-dd");
            DateTime dateTime = DateTime.UtcNow.Date;
            DateTime today = DateTime.Today;
            Voucher_Date_id.Value = dateTime.ToString("yyyy-MM-dd");
            
            if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
            {
                MySqlDataReader master_id_reader = baseHealpare.SelectManualQuery("SELECT `master_id` mst_id, `master_id_type` mst_type FROM `pms_journal_entry_mst` WHERE `journal_id` = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + " and status!=2");
                while (master_id_reader != null && master_id_reader.Read())
                {
                    master_id = master_id_reader["mst_id"].ToString();
                    master_type = master_id_reader["mst_type"].ToString();
                }
                if (master_id_reader != null)
                {
                    master_id_reader.Close();
                }
                
                Dictionary<string, string> dict_edit_mst_master  = new Dictionary<string, string>();
                MySqlDataReader edit_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryMst, " WHERE journal_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                while (edit_reader != null && edit_reader.Read())
                {
                    dict_edit_mst_master.Add("comp_name", ""+edit_reader["comp_name"]);
                    dict_edit_mst_master.Add("journal_id", ""+edit_reader["journal_id"]);
                    dict_edit_mst_master.Add("jv_date", ""+ Convert.ToDateTime(edit_reader["jv_date"]).ToString("yyyy-MM-dd"));
                    dict_edit_mst_master.Add("dr_total", ""+edit_reader["dr_total"]);
                    dict_edit_mst_master.Add("cr_total", ""+edit_reader["cr_total"]);
                    dict_edit_mst_master.Add("note", " Cancellation JV against "+ edit_reader["master_id_type"] + " number " + edit_reader["master_id"]);
                    dict_edit_mst_master.Add("master_id", ""+edit_reader["master_id"]);
                    dict_edit_mst_master.Add("master_id_type", ""+edit_reader["master_id_type"]);
                }
                if (edit_reader != null)
                {
                     edit_reader.Close();
                     jv_auto_id = baseHealpare.InsertIntoTableGetID(baseHealpare.TableAddJournalEntryMst,
                                   new string[] { "comp_name", "jv_date", "dr_total", "cr_total", "note", "master_id", "master_id_type", "status" },
                                   new string[] { dict_edit_mst_master["comp_name"], dict_edit_mst_master["jv_date"], dict_edit_mst_master["dr_total"], dict_edit_mst_master["cr_total"], Regex.Replace(dict_edit_mst_master["note"], @"[^0-9a-zA-Z]+", " "), dict_edit_mst_master["master_id"], dict_edit_mst_master["master_id_type"], "0" });
                 }

                edit_dtl_master = new System.Collections.ArrayList();

                edit_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryDtl, " WHERE journal_id=" + dict_edit_mst_master["journal_id"]);
                while (edit_reader != null && edit_reader.Read())
                {
                Dictionary<string, string> dict_edit_dtl_master = new Dictionary<string, string>();
                    dict_edit_dtl_master.Add("comp_name", ""+ edit_reader["comp_name"]);
                    dict_edit_dtl_master.Add("name", "" + edit_reader["name"]);
                    dict_edit_dtl_master.Add("debit_amount", "" + edit_reader["debit_amount"]);
                    dict_edit_dtl_master.Add("credit_amount", "" + edit_reader["credit_amount"]);
                    edit_dtl_master.Add(dict_edit_dtl_master);
                }
                if (edit_reader != null)
                {
                    edit_reader.Close();
                    for (int i = 0; edit_dtl_master.Count> i; i++) {

                        Dictionary<string, string> dict_edit_dtl_master = (Dictionary<string, string>)edit_dtl_master[i];
                        
                        baseHealpare.InsertIntoTable(baseHealpare.TableAddJournalEntryDtl,
                                           new string[] { "comp_name", "name", "credit_amount", "debit_amount", "status", "journal_id" },
                                           new string[] { dict_edit_dtl_master["comp_name"], dict_edit_dtl_master["name"], dict_edit_dtl_master["debit_amount"], dict_edit_dtl_master["credit_amount"], "0", jv_auto_id });

                        baseHealpare.updateIds("pms_journal_entry_mst", "0", "manual_id", "jv_date");
                    }
                }

                if (!master_id.Equals("0"))
                {
                    string redirect = master_type + "" +"Details";
                    Response.Redirect(baseHealpare.RedirectURLS[redirect]);
                } else
                {
                    Response.Redirect("~/Vouchers/JournalVouchersDetails.aspx");
                }
            }

            lblcomp.InnerHtml = Session["company"].ToString() + " - " + Session["company_name"];
            
             serializer = new JavaScriptSerializer();
            if (Request.QueryString["jvtype"] != null)
            {
                btnCancel.Visible = false;
                json_jv_redirect_entry = serializer.Serialize(Session["" + Request.QueryString["jvtype"].ToString()]);
                dynamic data = JObject.Parse(json_jv_redirect_entry);
                mainId = data.main_id;
                JVId = data.jv_id;
                Voucher_Date_id.Value = data.jv_date;
                master_type = Request.QueryString["jvtype"].ToString();
                if(((JObject)data).Property("session_jv")!= null) {                    
                    json_session_jv = data.session_jv;
                }
            }

            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT max(`journal_id`)+1 as id FROM `pms_journal_entry_mst`");
            //while (reader != null && reader.Read())
            //{
            //    journal_number_id.InnerHtml = "" + reader["id"];
            //}
            //reader.Close();

            MySqlDataReader journal_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status=0");
            journal_master = new System.Collections.ArrayList();
            party_name = new System.Collections.ArrayList();

            while (journal_reader != null && journal_reader.Read())
            {
                journal_master.Add(new
                {
                    account_id = journal_reader["account_id"],
                    account_head = journal_reader["account_head"],
                    account_main_group = journal_reader["account_main_group"],
                    account_sub_group = journal_reader["account_sub_group"],
                    account_party_name = journal_reader["account_party_name"],
                    account_inventory_value_affected = journal_reader["account_inventory_value_affected"],
                    account_add_one = journal_reader["account_add_one"],
                    account_add_two = journal_reader["account_add_two"],
                    account_district = journal_reader["account_district"],
                    account_state = journal_reader["account_state"],
                    account_state_code = journal_reader["account_state_code"],
                    account_country = journal_reader["account_country"],
                    account_pin_code = journal_reader["account_pin_code"],
                    account_gst_number = journal_reader["account_gst_number"],
                    account_pan_number = journal_reader["account_pan_number"],
                    account_cin_number = journal_reader["account_cin_number"],
                    account_phone_number = journal_reader["account_phone_number"],
                    account_email = journal_reader["account_email"],
                    account_opening_balance = journal_reader["account_opening_balance"],
                    account_opening_balance_type = journal_reader["account_opening_balance_type"],
                    status = journal_reader["status"],
                    default_date = journal_reader["default_date"]

                });
                 party_name.Add(journal_reader["account_head"]);
            }
            if (journal_reader != null)
            {
                journal_reader.Close();
                json_obj = serializer.Serialize(journal_master);
                serializer = new JavaScriptSerializer();
                json_head_name = serializer.Serialize(party_name);
            }

                //==============code for view data==========================
                if (Request.QueryString.Count == 0)
                {
                    breadcrumb_title.InnerHtml = "Add Journal Entry";
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        if (Request.QueryString["jvtype"] != null)
                        {
                        }
                        else if (Request.QueryString["value"] != null)
                        {
                            breadcrumb_title.InnerHtml = "Update Journal Entry";
                            int cnt = 0;
                            string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                            MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryMst, "where journal_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'" + ca_status_condition);
                            while (update_reader != null && update_reader.Read())
                            {
                                cnt++;
                                jv_auto_id = update_reader["journal_id"].ToString();
                                Voucher_Date_id.Value = Convert.ToDateTime(update_reader["jv_date"].ToString()).ToString("yyyy-MM-dd");
                                tot_Amt_dr.InnerHtml = update_reader["dr_total"].ToString();
                                tot_Amt_cr.InnerHtml = update_reader["cr_total"].ToString();
                                note_id.Value = update_reader["note"].ToString();
                            //master_id = update_reader["master_id"].ToString();
                            //master_type = update_reader["master_id_type"].ToString();
                            }
                            if (update_reader != null)
                            {
                                update_reader.Close();
                            }

                            if (cnt > 0)
                            {
                                MySqlDataReader update_dtl_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddJournalEntryDtl, " where journal_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'" + " order by `credit_amount`");
                                update_dtl_master = new System.Collections.ArrayList();

                                while (update_dtl_reader != null && update_dtl_reader.Read())
                                {
                                    update_dtl_master.Add(new
                                    {
                                        //journal_id = update_dtl_reader["journal_id"],
                                        name = update_dtl_reader["name"],
                                        debit_amount = update_dtl_reader["debit_amount"],
                                        credit_amount = update_dtl_reader["credit_amount"],
                                    });
                                }
                                if (update_dtl_reader != null)
                                {
                                    update_dtl_reader.Close();
                                    serializer = new JavaScriptSerializer();
                                    json_dtl_obj = serializer.Serialize(update_dtl_master);

                                }
                            }
                            else
                            {
                                baseHealpare.MessageBox(this, "You Dont Have Permission To Update Data is already Approved..!!!");
                            }
                        }
                    }
                }
        }
        
        protected void jv_submit_account_details_event(object sender, EventArgs e)
        {
            {
                string valueStr = lblcomp.InnerText;
                char[] spearator = { ' ', '-' };
                string valComp = valueStr.Split(spearator)[0];
                if (JVId != 0)
                {
                    breadcrumb_title.InnerText = "Update Journal Entry";
                }
                if (breadcrumb_title.InnerText == "Add Journal Entry")
                {
                     jv_auto_id = baseHealpare.InsertIntoTableGetID(baseHealpare.TableAddJournalEntryMst,
                                   new string[] { "comp_name", "jv_date", "dr_total", "cr_total", "note", "master_id", "master_id_type", "status" },
                                   new string[] { valComp, hdn_Voucher_Date_id.Value, tot_AmtDr.Value, tot_AmtCr.Value.ToString(), Regex.Replace(note_id.Value, @"[^0-9a-zA-Z]+", " "), mainId, master_type, "0" });
                    
                    string jsonString = txthdnJson.Value.ToString();
                    var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                    for (int i = 0; i < dict.Count; i++)
                    {
                        dict[i]["JV_ID"] = jv_auto_id;
                        string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                        
                        baseHealpare.InsertIntoTable(baseHealpare.TableAddJournalEntryDtl,
                                        new string[] { "comp_name", "name", "debit_amount", "credit_amount", "status", "journal_id" },
                                         result);
                    }
                    baseHealpare.updateIds("pms_journal_entry_mst", "0", "manual_id", "jv_date");
                    if (Request.QueryString["jvtype"] == "purchase")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst, new string[] { "purchase_journal_id" }, new string[] { jv_auto_id }, "pur_mst_auto_id = " + mainId);
                    } else if (Request.QueryString["jvtype"] == "expenses")
                    {
                        baseHealpare.UpdateValue(baseHealpare.expenses_voucher_mst, new string[] { "expenses_jv_id" }, new string[] { jv_auto_id }, "exp_voucher_no = " + mainId);
                    }
                    else if (Request.QueryString["jvtype"] == "sales")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst, new string[] { "sale_jv_id " }, new string[] { jv_auto_id }, "sale_mst_id  = " + mainId);
                    }
                    else if (Request.QueryString["jvtype"] == "debit")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst, new string[] { "dr_cr_jv_id" }, new string[] { jv_auto_id }, "dr_cr_Id = " + mainId);
                    }
                    else if (Request.QueryString["jvtype"] == "credit")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst, new string[] { "dr_cr_jv_id" }, new string[] { jv_auto_id }, "dr_cr_Id = " + mainId);
                    }
                }
                else
                {
                    if (JVId == 0)
                    {
                        JVId = Convert.ToInt32(System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    }
                    string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                    string msg = baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryMst,
                                    new string[] { "comp_name", "jv_date", "dr_total", "cr_total", "note", "master_id", "master_id_type", "status"},
                                    new string[] { valComp, hdn_Voucher_Date_id.Value, tot_AmtDr.Value, tot_AmtCr.Value.ToString(), Regex.Replace(note_id.Value, @"[^0-9a-zA-Z]+", " "), mainId, master_type,"0"},
                    "journal_id=" + "'" + JVId + "'" + ca_status_condition);

                    if (Session["page_role"] + "" == "CA")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryMst,
                                      new string[] { "ca_approved_status" },
                                      new string[] { "2" },
                                      "journal_id = " + JVId);
                    }

                    if (msg == "DONE")
                    {
                        string jsonString = txthdnJson.Value.ToString();
                        var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                        MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM pms_journal_entry_dtl WHERE journal_id = " + "'" + JVId + "' and ca_approved_status != 3");
                        reader.Close();

                        for (int i = 0; i < dict.Count; i++)
                        {
                            dict[i]["JV_ID"] = JVId;
                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();

                            baseHealpare.InsertIntoTable(baseHealpare.TableAddJournalEntryDtl,
                                           new string[] { "comp_name", "name", "debit_amount", "credit_amount", "status", "journal_id" },
                                            result);
                        }
                        baseHealpare.updateIds("pms_journal_entry_mst", "0", "manual_id", "jv_date");
                        baseHealpare.MessageBox(this, "Data Updated ");
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "Data Error " + msg);
                    }
                }                
            }
            Response.Redirect("/Vouchers/JournalVouchersDetails.aspx");
        }

        protected void cancel_event(object sender, EventArgs e)
        {
            Response.Redirect("~/Vouchers/JournalVouchersDetails.aspx");
        }
    }
}
