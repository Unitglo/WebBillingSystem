using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace WebBillingSystem
{
    public partial class AddAccount : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        double dr_tot = 0.00;
        double cr_tot = 0.00;
        double diff_tot = 0.00;
        public System.Collections.ArrayList acc_master;
        public string json_acc_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            
            if (!Page.IsPostBack)
            {
                
                if (Request.QueryString["value"] != null && Request.QueryString["delete"]!=null)
                    {
                    baseHealpare.DeleteValue(baseHealpare.TableAddAccount, "account_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    baseHealpare.DeleteValue(baseHealpare.TableAddSaleMst, "seller_name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) +"'"); 
                    baseHealpare.DeleteValue(baseHealpare.TableAddSaleMst, "ship_party_name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");
                    baseHealpare.SelectManualQuery("update `pms_sale_invoice_dtl` set status = 2 WHERE reference_id in (SELECT `sale_mst_id` FROM `pms_sale_invoice_mst` WHERE `seller_name` = '"+ System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "')");
                    baseHealpare.SelectManualQuery("update `pms_sale_invoice_dtl` set status = 2 WHERE reference_id in (SELECT `sale_mst_id` FROM `pms_sale_invoice_mst` WHERE `ship_party_name` = '" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "')");

                    baseHealpare.DeleteValue(baseHealpare.TableAddDebitCreditMst, "bill_party_name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");
                    baseHealpare.DeleteValue(baseHealpare.TableAddDebitCreditMst, "ship_party_name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");
                    baseHealpare.SelectManualQuery("update `pms_voucher_dr_cr_note_dtl` set status = 2 WHERE refrance_id in (SELECT `dr_cr_Id` FROM `pms_voucher_dr_cr_note_mst` WHERE `bill_party_name` = '" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "')");
                    baseHealpare.SelectManualQuery("update `pms_voucher_dr_cr_note_dtl` set status = 2 WHERE refrance_id in (SELECT `dr_cr_Id` FROM `pms_voucher_dr_cr_note_mst` WHERE `ship_party_name` = '" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "')");

                    baseHealpare.DeleteValue(baseHealpare.TableAddStockPuchaseMst, "seller_name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");
                    baseHealpare.SelectManualQuery("update `pms_purchase_invoice_dtl` set status = 2 WHERE reference_id in (SELECT `pur_mst_auto_id` FROM `pms_purchase_invoice_mst` WHERE `seller_name` = '" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "')");

                    baseHealpare.DeleteValue(baseHealpare.expenses_voucher_mst, "exp_supplier_name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");
                    baseHealpare.DeleteValue(baseHealpare.expenses_voucher_mst, "expenses_head='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["account_head_name"].ToString()))) + "'");
                    baseHealpare.SelectManualQuery("update `pms_expenses_voucher_dtl` set status = 2 WHERE exp_voucherno in (SELECT `exp_voucher_no` FROM `pms_expenses_voucher_mst` WHERE `exp_supplier_name` = '" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "')");
                    baseHealpare.SelectManualQuery("update `pms_expenses_voucher_dtl` set status = 2 WHERE exp_voucherno in (SELECT `exp_voucher_no` FROM `pms_expenses_voucher_mst` WHERE `expenses_head` = '" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["account_head_name"].ToString()))) + "')");

                    baseHealpare.DeleteValue(baseHealpare.TableAddJournalEntryDtl, "name='" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["account_head_name"].ToString()))) + "'");
                    Response.Redirect("~/Master/AccountDetails.aspx");
            }
            account_main_group.Items.Clear();
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

            MySqlDataReader state = baseHealpare.SelectAllValues(baseHealpare.TableAccountstate, "where status=0");
            while (state != null && state.Read())
            {
                account_state.Items.Add(new ListItem(state["pms_account_state_name"].ToString(), state["pms_account_state_id"].ToString()));
            }
            if (state != null)
            {
                state.Close();
            }
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where account_opening_balance_type = 'Credit'");
            while (reader != null && reader.Read())
            {
                double credit_tot = double.Parse(reader["account_opening_balance"].ToString());
                cr_tot = cr_tot + credit_tot;
                total_cr.InnerHtml = cr_tot.ToString("0.00");
            }
            if (reader != null)
            {
                reader.Close();
            }
            
            reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where account_opening_balance_type= 'Debit'");
            while (reader != null && reader.Read())
            {
                dr_tot = dr_tot + double.Parse(reader["account_opening_balance"].ToString());
                total_dr.InnerHtml = dr_tot.ToString("0.00");

            }
            if (reader != null)
            {
                reader.Close();
            }

            if (cr_tot > dr_tot)
            {
                diff_tot = (cr_tot - dr_tot);
                total_diff.InnerHtml = diff_tot.ToString("0.00");

            }
            else if (cr_tot < dr_tot)
            {
                {
                    diff_tot = (dr_tot - cr_tot);
                    total_diff.InnerHtml = diff_tot.ToString("0.00");

                }
            }

                if (Request.QueryString["val"] != null && Request.QueryString["redirect"] != null)
                {
                    string json_String = Request.QueryString["val"].ToString();
                    if (json_String != null)
                    {
                        JArray jsonArray = JArray.Parse(json_String);
                        //dynamic data = JObject.Parse(jsonArray[0].ToString());
                        dynamic data = JObject.Parse(jsonArray[0].ToString());
                        account_head.Value = data.party_name;
                        account_party_name.Value = data.party_name;
                        account_state.SelectedIndex = account_state.Items.IndexOf(account_state.Items.FindByValue(data.state.ToString()));
                        account_state_code.Value = data.statecode;
                        account_gst_number.Value = data.gstin;
                    }
                }

                if (Request.QueryString["value"] == null)
            {
                breadcrumb_title.InnerText = "Add account";
            }
            else
            {
                breadcrumb_title.InnerText = "Update account";
                    string sub_value = "";
                    
                    reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where account_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    while (reader != null && reader.Read())
                    {
                        account_head.Value = reader["account_head"].ToString();
                       account_ucid.Value = reader["UCID"].ToString();
                        account_main_group.SelectedIndex = account_main_group.Items.IndexOf(account_main_group.Items.FindByValue(reader["account_main_group"].ToString()));
                        sub_value = reader["account_sub_group"].ToString();
                        account_party_name.Value = reader["account_party_name"].ToString();
                        account_invenory_value.SelectedIndex = account_invenory_value.Items.IndexOf(account_invenory_value.Items.FindByText(reader["account_inventory_value_affected"].ToString()));
                        account_add_one.Value = reader["account_add_one"].ToString();
                        account_add_two.Value = reader["account_add_two"].ToString();
                        account_district.Value = reader["account_district"].ToString();
                        account_state.SelectedIndex = account_state.Items.IndexOf(account_state.Items.FindByValue(reader["account_state"].ToString()));
                        account_state_code.Value = reader["account_state_code"].ToString();
                        account_country.Value = reader["account_country"].ToString();
                        account_pincode.Value = reader["account_pin_code"].ToString();
                        account_gst_number.Value = reader["account_gst_number"].ToString();
                        account_pan_number.Value = reader["account_pan_number"].ToString();
                        account_cin_number.Value = reader["account_cin_number"].ToString();
                     

                        account_phone_number.Value = reader["account_phone_number"].ToString();
                        account_email.Value = reader["account_email"].ToString();
                        account_opening_balance.Value = reader["account_opening_balance"].ToString();
                        account_opening_balance_type.SelectedIndex = account_opening_balance_type.Items.IndexOf(account_opening_balance_type.Items.FindByText(reader["account_opening_balance_type"].ToString()));
                        Text1.Value = reader["rate of depreciation"].ToString();
                        natural_assets.Value = reader["natural_assets"].ToString();
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    mainGroup_Changed(sender, e);
                    account_sub_group.SelectedIndex = account_sub_group.Items.IndexOf(account_sub_group.Items.FindByValue(sub_value));
                }
            }
            ClientScriptManager cs = Page.ClientScript;
            this.account_main_group.Attributes.Add("onchange", cs.GetPostBackEventReference(this.account_main_group, this.account_main_group.ID));
        }

        protected void mainGroup_Changed(object sender, EventArgs e)
        {
         //account_main_group.SelectedIndex = account_main_group.SelectedIndex(account_main_group.Value
            account_sub_group.Items.Clear();
            MySqlDataReader sub_drop = baseHealpare.SelectAllValues(baseHealpare.TableAccountsubGroup, "where account_master_main_group_id=" + account_main_group.Value);
            while (sub_drop != null && sub_drop.Read())
            {
                account_sub_group.Items.Add(new ListItem(sub_drop["account_master_sub_group_name"].ToString(), sub_drop["account_master_sub_group_id"].ToString()));
            }
            account_sub_group.Items.Add(new ListItem("Add New", "add"));
            if(sub_drop!=null)
            sub_drop.Close();

        }
        protected void add_new_sub_group(object sender, EventArgs e)
        {
            int oldIndex = account_sub_group.SelectedIndex;
            account_sub_group.SelectedIndex = oldIndex - 1;
            int sub_group_id = int.Parse(account_sub_group.Value.ToString());
            account_sub_group.SelectedIndex = oldIndex;
            baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAccountsubGroup,
                    new string[] { "account_master_main_group_id", "account_master_sub_group_id", "account_master_sub_group_name" },
                    new string[] { account_main_group.Value.ToString(), sub_group_id+ 1+"", new_sub_group_name.Value.ToString()}));
            account_sub_group.Items.Clear();
            MySqlDataReader sub_drop = baseHealpare.SelectAllValues(baseHealpare.TableAccountsubGroup, "where account_master_main_group_id=" + account_main_group.Value);
            while (sub_drop != null && sub_drop.Read())
            {
                account_sub_group.Items.Add(new ListItem(sub_drop["account_master_sub_group_name"].ToString(), sub_drop["account_master_sub_group_id"].ToString()));
            }
            account_sub_group.Items.Add(new ListItem("Add New", "add"));
            account_sub_group.SelectedIndex = oldIndex;
            sub_drop.Close();

        }

       
        protected void submit_account_details_event(object sender, EventArgs e)
        {
            
            if (account_head.Value == "" || account_head.Value == null)
            {
                baseHealpare.MessageBox(this, "Please Enter Account Head");
                return;
            }
            else
            if (account_main_group.Value == "" || account_main_group.Value == null)
            {
                baseHealpare.MessageBox(this, "Please Select Main Group");
                return;
            }
            else
            if (account_sub_group.Value == "" || account_sub_group.Value == null)
            {
                baseHealpare.MessageBox(this, "Please Select Sub Group");
                return;
            } else
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showAddModal();", true);
                double account_balance = Double.Parse(account_opening_balance.Value);
                account_balance = Math.Round(account_balance, 2);


                if (Request.QueryString["value"] == null && !account_main_group.Value.ToString().Equals("add"))
                {
                    MySqlDataReader comfirm_master = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, "where account_head = '"+ account_head.Value.ToString()+"'");
                    if(comfirm_master.HasRows == false)
                    {
                        comfirm_master.Close();
                        baseHealpare.InsertIntoTable(baseHealpare.TableAddAccount,
                                        new string[] { "account_head", "account_main_group", "account_sub_group", "account_party_name", "account_inventory_value_affected", "account_add_one", "account_add_two", "account_district", "account_state", "account_state_code", "account_country", "account_pin_code", "account_gst_number", "account_pan_number", "account_cin_number", "account_phone_number", "account_email", "account_opening_balance", "account_opening_balance_type", "UCID", "rate of depreciation", "natural_assets" },
                                        new string[] { account_head.Value.ToString(), account_main_group.Value.ToString(), account_sub_group.Value.ToString(), account_party_name.Value.ToString(), account_invenory_value.Value.ToString(), account_add_one.Value.ToString(), account_add_two.Value.ToString(), account_district.Value.ToString(), account_state.Value.ToString(), account_state_code.Value.ToString(), account_country.Value.ToString(), account_pincode.Value.ToString(), account_gst_number.Value.ToString(), account_pan_number.Value.ToString(), account_cin_number.Value.ToString(), account_phone_number.Value.ToString(), account_email.Value.ToString(), account_balance.ToString(), account_opening_balance_type.Value.ToString(), account_ucid.Value.ToString(), Text1.Value.ToString(), natural_assets.Value.ToString() });
                        
                    }
                    else {
                        //baseHealpare.MessageBox(this, "Account Already Exist...!!!");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
                        return;
                    }
                }
                else
                {
                    if (chkConfirm.Checked == true)
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddAccount,
                           new string[] { "account_head", "account_main_group", "account_sub_group", "account_party_name", "account_inventory_value_affected", "account_add_one", "account_add_two", "account_district", "account_state", "account_state_code", "account_country", "account_pin_code", "account_gst_number", "account_pan_number", "account_cin_number", "account_phone_number", "account_email", "account_opening_balance", "account_opening_balance_type" },
                           new string[] { account_head.Value.ToString(), account_main_group.Value.ToString(), account_sub_group.Value.ToString(), account_party_name.Value.ToString(), account_invenory_value.Value.ToString(), account_add_one.Value.ToString(), account_add_two.Value.ToString(), account_district.Value.ToString(), account_state.Value.ToString(), account_state_code.Value.ToString(), account_country.Value.ToString(), account_pincode.Value.ToString(), account_gst_number.Value.ToString(), account_pan_number.Value.ToString(), account_cin_number.Value.ToString(), account_phone_number.Value.ToString(), account_email.Value.ToString(), account_opening_balance.Value.ToString(), account_opening_balance_type.Value.ToString() },
                           "account_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))
                           );

                        baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst,
                                   new string[] { "seller_name", "Seller_address", "gstin", "s_state", "state_code" },
                                   new string[] { account_party_name.Value, account_add_one.Value, account_gst_number.Value, account_state.Value, account_state_code.Value },
                                   "seller_name= " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst,
                                      new string[] { "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_state_code" },
                                      new string[] { account_party_name.Value, account_add_one.Value, account_gst_number.Value, account_state.Value, account_state_code.Value },
                                      "ship_party_name= " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst,
                                      new string[] { "seller_name", "Seller_address", "gstin", "s_state", "state_code" },
                                      new string[] { account_party_name.Value, account_add_one.Value, account_gst_number.Value, account_state.Value, account_state_code.Value },
                                      "seller_name= " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst,
                                      new string[] { "bill_party_name", "bill_party_address", "bill_party_gstin", "bill_party_state", "bill_party_state_code" },
                                      new string[] { account_party_name.Value, account_add_one.Value, account_gst_number.Value, account_state.Value, account_state_code.Value },
                                      "bill_party_name = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst,
                                      new string[] { "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_code" },
                                      new string[] { account_party_name.Value, account_add_one.Value, account_gst_number.Value, account_state.Value, account_state_code.Value },
                                      "ship_party_name = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["party_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryDtl,
                                               new string[] { "name" },
                                               new string[] { account_head.Value },
                                               "name = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["account_head_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditDtl,
                                               new string[] { "bill_party_name", "ship_party_name" },
                                               new string[] { account_head.Value },
                                               "bill_party_name = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["account_head_name"].ToString()))) + "'");

                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditDtl,
                                               new string[] { "ship_party_name" },
                                               new string[] { account_head.Value },
                                               "ship_party_name = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["account_head_name"].ToString()))) + "'");
                    }
                    else
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddAccount,
                           new string[] { "account_head", "account_main_group", "account_sub_group", "account_party_name", "account_inventory_value_affected", "account_add_one", "account_add_two", "account_district", "account_state", "account_state_code", "account_country", "account_pin_code", "account_gst_number", "account_pan_number", "account_cin_number", "account_phone_number", "account_email", "account_opening_balance", "account_opening_balance_type" },
                           new string[] { account_head.Value.ToString(), account_main_group.Value.ToString(), account_sub_group.Value.ToString(), account_party_name.Value.ToString(), account_invenory_value.Value.ToString(), account_add_one.Value.ToString(), account_add_two.Value.ToString(), account_district.Value.ToString(), account_state.Value.ToString(), account_state_code.Value.ToString(), account_country.Value.ToString(), account_pincode.Value.ToString(), account_gst_number.Value.ToString(), account_pan_number.Value.ToString(), account_cin_number.Value.ToString(), account_phone_number.Value.ToString(), account_email.Value.ToString(), account_opening_balance.Value.ToString(), account_opening_balance_type.Value.ToString() },
                           "account_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))
                           );
                    }
                }
                if (Request.QueryString["redirect"] != null)
                {
                    if (Request.QueryString["editId"] != null)
                        Response.Redirect(baseHealpare.RedirectURLS[Request.QueryString["redirect"]]+"?value=" +Request.QueryString["editId"]);
                    Response.Redirect(baseHealpare.RedirectURLS[Request.QueryString["redirect"]]);
                }
                else
                    Response.Redirect("~/Master/AccountDetails.aspx");
            }
        }

        protected void cancel_event(object sender, EventArgs e)
        {
            if (Request.QueryString["redirect"] != null)
            {
                if (Request.QueryString["editId"] != null)
                    Response.Redirect(baseHealpare.RedirectURLS[Request.QueryString["redirect"]] + "?value=" + Request.QueryString["editId"]);
                Response.Redirect(baseHealpare.RedirectURLS[Request.QueryString["redirect"]]);
            }
            else
            {
                Response.Redirect("~/Master/AccountDetails.aspx");
            }
        }

    }
}