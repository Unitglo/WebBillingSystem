using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

namespace WebBillingSystem
{
    public partial class ExpensesVoucher : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList party_name;
        public System.Collections.ArrayList Account_head;
        public System.Collections.ArrayList account_master;
        public System.Collections.ArrayList expe_master;
        public System.Collections.ArrayList product_name;
        public System.Collections.ArrayList setting_master;
        public System.Collections.ArrayList gstno_id;

        public string json_gstin_name;
        public string json_Party_name;
        public string json_Account_head;
        public string json_obj;
        public string json_product_name;
        public string json_exp_obj;
        public string json_setting_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            breadcrumb_title.InnerHtml = "Add Expenses Voucher";
            baseHealpare = new DataBaseHealpare();

            if (!Page.IsPostBack)
            {
                Voucher_Date_id.Attributes["min"] = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
                Voucher_Date_id.Attributes["max"] = Convert.ToDateTime(Session["end_date"].ToString()).ToString("yyyy-MM-dd");


                if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
                {
                    baseHealpare.DeleteValue(baseHealpare.expenses_voucher_mst, "exp_voucher_no=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    baseHealpare.DeleteValue(baseHealpare.expenses_voucher_dtl, "exp_voucherno=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    Response.Redirect("~/Vouchers/ExpensesDetails.aspx");
                }

                DateTime dateTime = DateTime.UtcNow.Date;
                Voucher_Date_id.Value = dateTime.ToString("yyyy-MM-dd");
                state_name.InnerText = Session["statename"].ToString();
                state_code.InnerText = Session["statecode"].ToString();

                MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT count(*)+1 as vouc_no FROM pms_expenses_voucher_mst");
                while (msq_reader != null && msq_reader.Read())
                {
                    voucher_number_id.InnerHtml = "" + msq_reader["vouc_no"];

                }
                msq_reader.Close();

                lblCompName.InnerHtml = Session["company_name"].ToString();
                msq_reader = baseHealpare.SelectManualQuery("SELECT * FROM pms_master_settings");
                while (msq_reader != null && msq_reader.Read())
                {
                    auth_id.InnerHtml = "" + msq_reader["authorized_signatory_tax_invoice"];

                }
                if (msq_reader != null)
                {
                    msq_reader.Close();
                }

                MySqlDataReader product_reader = baseHealpare.SelectAllValues(baseHealpare.expenses_voucher_product_name, " where status=0");

                product_name = new System.Collections.ArrayList();

                while (product_reader != null && product_reader.Read())
                {
                    product_name.Add(product_reader["expe_product_name"]);
                }
                if (product_reader != null)
                {
                    product_reader.Close();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    serializer = new JavaScriptSerializer();
                    json_product_name = serializer.Serialize(product_name);
                }

                MySqlDataReader company_reader = baseHealpare.SelectAllValues("*, " + "(SELECT pms_account_state_name FROM pms_account_state WHERE pms_account_state_code = account_state_code) as statename", baseHealpare.TableAddAccount, " where status=0");
                account_master = new System.Collections.ArrayList();
                party_name = new System.Collections.ArrayList();
                Account_head = new System.Collections.ArrayList();
                gstno_id = new System.Collections.ArrayList();

                while (company_reader != null && company_reader.Read())
                {
                    account_master.Add(new
                    {

                        account_id = company_reader["account_id"],
                        account_head = company_reader["account_head"],
                        account_main_group = company_reader["account_main_group"],
                        account_sub_group = company_reader["account_sub_group"],
                        account_party_name = company_reader["account_party_name"],
                        account_inventory_value_affected = company_reader["account_inventory_value_affected"],
                        account_add_one = company_reader["account_add_one"],
                        account_add_two = company_reader["account_add_two"],
                        account_district = company_reader["account_district"],
                        account_state = company_reader["statename"],
                        //account_state = company_reader["account_state"],
                        account_state_code = company_reader["account_state_code"],
                        account_country = company_reader["account_country"],
                        account_pin_code = company_reader["account_pin_code"],
                        account_gst_number = company_reader["account_gst_number"],
                        account_pan_number = company_reader["account_pan_number"],
                        account_cin_number = company_reader["account_cin_number"],
                        account_phone_number = company_reader["account_phone_number"],
                        account_email = company_reader["account_email"],
                        account_opening_balance = company_reader["account_opening_balance"],
                        account_opening_balance_type = company_reader["account_opening_balance_type"],
                        status = company_reader["status"],
                        default_date = company_reader["default_date"]

                    });

                    party_name.Add(company_reader["account_party_name"]);
                    Account_head.Add(company_reader["account_head"]);
                    gstno_id.Add(company_reader["account_gst_number"]);
                }
                if (company_reader != null)
                {
                    company_reader.Close();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    json_obj = serializer.Serialize(account_master);
                    json_Party_name = serializer.Serialize(party_name);
                    json_Account_head = serializer.Serialize(Account_head);
                    json_gstin_name = serializer.Serialize(gstno_id);
                }

                company_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status=0");
                setting_master = new System.Collections.ArrayList();
                while (company_reader != null && company_reader.Read())
                {
                    setting_master.Add(new
                    {
                        mrp_details = company_reader["mrp_details"],
                        sale_price_details = company_reader["sale_price_details"],
                        expiry_monitoring_system = company_reader["expiry_monitoring_system"],
                        expiry_details_tax_invoice = company_reader["expiry_details_tax_invoice"],
                        batch_wise_details = company_reader["batch_wise_details"],
                        batch_wise_details_tax_invoice = company_reader["batch_wise_details_tax_invoice"],
                        journal_accounting_entry = company_reader["journal_accounting_entry"],
                        prefix_generate_invoice_no = company_reader["prefix_generate_invoice_no"],

                    });
                }
                if (company_reader != null)
                {
                    company_reader.Close();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    json_setting_obj = serializer.Serialize(setting_master);
                }



                //==============code for view data==========================
                if (Request.QueryString.Count == 0)
                {
                    breadcrumb_title.InnerHtml = "Add Expenses Voucher";
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        breadcrumb_title.InnerHtml = "Update Expenses Voucher";
                        int cnt = 0;
                        string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                        MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.expenses_voucher_mst, "where exp_voucher_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'" + ca_status_condition);
                        while (update_reader != null && update_reader.Read())
                        {
                            cnt++;
                            voucher_number_id.InnerHtml = update_reader["exp_voucher_no"].ToString();
                            Voucher_Date_id.Value = Convert.ToDateTime(update_reader["exp_voucher_date"].ToString()).ToString("yyyy-MM-dd");
                            place_suppl_id.Value = update_reader["exp_place_of_supply"].ToString();
                            reverse_charge.SelectedIndex = reverse_charge.Items.IndexOf(reverse_charge.Items.FindByText(update_reader["exp_reverse_charge"].ToString()));
                            state_name.InnerHtml = update_reader["exp_state"].ToString();
                            state_code.InnerHtml = update_reader["exp_state_code"].ToString();
                            txtInvoiceNo_Id.Value = update_reader["exp_invoice_no"].ToString();
                            txtInvoiceIRNNo_id.Value = update_reader["exp_invoice_IRN"].ToString();
                            Supplier_Name_Id.Value = update_reader["exp_supplier_name"].ToString();
                            addressid.Value = update_reader["exp_supplier_addr"].ToString();
                            gstinid.Value = update_reader["exp_supplier_gstin"].ToString();
                            state_id.InnerHtml = update_reader["exp_supplier_state"].ToString();
                            statecode_id.InnerHtml = update_reader["exp_supplier_state_code"].ToString();
                            expenses_id.Value = update_reader["expenses_head"].ToString();
                            selectPayMode.SelectedIndex = selectPayMode.Items.IndexOf(selectPayMode.Items.FindByText(update_reader["payment_mode"].ToString()));
                        }
                        if (update_reader != null)
                        {
                            update_reader.Close();
                        }

                        if (cnt > 0)
                        {
                            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.expenses_voucher_dtl, " where exp_voucherno=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                            expe_master = new System.Collections.ArrayList();

                            while (reader != null && reader.Read())
                            {
                                expe_master.Add(new
                                {
                                    exp_product_name = reader["exp_product_name"],
                                    exp_hsn_code = reader["exp_hsn_code"],
                                    exp_tax_value = reader["exp_tax_value"],
                                    rate = reader["rate"],
                                    exp_igst_rate = reader["exp_igst_rate"],
                                    exp_igst_amount = reader["exp_igst_amount"],
                                    exp_cgst_rate = reader["exp_cgst_rate"],
                                    exp_cgst_amount = reader["exp_cgst_amount"],
                                    exp_sgst_rate = reader["exp_sgst_rate"],
                                    exp_sgst_amount = reader["exp_sgst_amount"],
                                    exp_total_amount = reader["exp_total_amount"],

                                });
                            }
                            if (reader != null)
                            {
                                reader.Close();
                                JavaScriptSerializer serializer = new JavaScriptSerializer();
                                json_exp_obj = serializer.Serialize(expe_master);

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
        string jv_expense_id = "";
        protected void submit_expenses_details_event(object sender, EventArgs e)
        {
            if (Supplier_Name_Id.Value == "" || Supplier_Name_Id.Value == null)
            {
                baseHealpare.MessageBox(this, "Please Select Supplier Name");
                return;
            }
            else
            if (expenses_id.Value == "" || expenses_id.Value == null)
            {
                baseHealpare.MessageBox(this, "Please Select Expenses Head");
                return;
            }
            else
            {
                baseHealpare.controlDefaultValueCheck(statecode_id, "0");
                baseHealpare.controlDefaultValueCheck(state_code, "0");

                if (Request.QueryString.Count == 0)
                {

                    string auto_id = baseHealpare.InsertIntoTableGetID(baseHealpare.expenses_voucher_mst,
                                     new string[] { "exp_invoice_no", "exp_invoice_IRN", "exp_voucher_date", "exp_place_of_supply", "exp_reverse_charge", "exp_state", "exp_state_code", "exp_supplier_name", "exp_supplier_addr", "exp_supplier_gstin", "exp_supplier_state", "exp_supplier_state_code", "expenses_head", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "company_name", "auth_name", "payment_mode" },
                                     new string[] {txtInvoiceNo_Id.Value.ToString(), txtInvoiceIRNNo_id.Value.ToString(), Voucher_Date_id.Value.ToString(), place_suppl_id.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), Supplier_Name_Id.Value.ToString(), suppAddr.Value.ToString(), suppGstin.Value.ToString(), suppstate.Value.ToString(), suppstatecode.Value.ToString(), expenses_id.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), lblCompName.InnerText.ToString(), auth_id.InnerText.ToString(), payment_mode.Value.ToString() }
                                     );

                    if (Regex.IsMatch(auto_id, "^[0-9]+$"))
                    {
                        jv_expense_id = auto_id;
                        string jsonString = txthdnJson.Value.ToString();
                        var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                        for (int i = 0; i < dict.Count; i++)
                        {
                            dict[i]["VOUCNO"] = auto_id;
                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                            string[] keys = dict[i].Select(kv => kv.Key.ToString()).ToArray();

                            baseHealpare.InsertIntoTable(baseHealpare.expenses_voucher_product_name,
                                     new string[] { "expe_product_name" },
                                     new string[] { dict[i]["PROD"].ToString() }
                                     );

                            baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.expenses_voucher_dtl,
                                             new string[] { "exp_voucherno", "expenses_head", "exp_product_name", "exp_hsn_code", "exp_tax_value", "rate", "exp_igst_rate", "exp_igst_amount", "exp_cgst_rate", "exp_cgst_amount", "exp_sgst_rate", "exp_sgst_amount", "exp_total_amount" },
                                             result));
                        }
                    }

                }
                else
                {
                    jv_expense_id = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));

                    string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                    string msg = baseHealpare.UpdateValue(baseHealpare.expenses_voucher_mst,
                                        new string[] { "exp_invoice_no", "exp_invoice_IRN", "exp_voucher_date", "exp_place_of_supply", "exp_reverse_charge", "exp_state", "exp_state_code", "exp_supplier_name", "exp_supplier_addr", "exp_supplier_gstin", "exp_supplier_state", "exp_supplier_state_code", "expenses_head", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "company_name", "auth_name", "payment_mode" },
                                        new string[] { txtInvoiceNo_Id.Value.ToString(), txtInvoiceIRNNo_id.Value.ToString(), Voucher_Date_id.Value.ToString(), place_suppl_id.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), Supplier_Name_Id.Value.ToString(), suppAddr.Value.ToString(), suppGstin.Value.ToString(), suppstate.Value.ToString(), suppstatecode.Value.ToString(), expenses_id.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), lblCompName.InnerText.ToString(), auth_id.InnerText.ToString(), payment_mode.Value.ToString() },
                                        "exp_voucher_no = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'" + ca_status_condition
                                        );
                    if (Session["page_role"] + "" == "CA")
                    {
                        baseHealpare.UpdateValue(baseHealpare.expenses_voucher_mst,
                                      new string[] { "ca_approved_status" },
                                      new string[] { "2" },
                                      "exp_voucher_no = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    }

                    if (msg == "DONE")
                    {
                        MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM pms_expenses_voucher_dtl WHERE exp_voucherno = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' and ca_approved_status != 3");
                        reader.Close();
                        string jsonString = txthdnJson.Value.ToString();
                        var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                        for (int i = 0; i < dict.Count; i++)
                        {
                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                            // ADD PRODUCT
                            baseHealpare.InsertIntoTable(baseHealpare.expenses_voucher_product_name,
                                         new string[] { "expe_product_name" },
                                         new string[] { dict[i]["PROD"].ToString() }
                                         );
                            //ADD EXPENSES DETAILS TABLE
                            baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.expenses_voucher_dtl,
                                             new string[] { "exp_voucherno", "expenses_head", "exp_product_name", "exp_hsn_code", "exp_tax_value", "rate", "exp_igst_rate", "exp_igst_amount", "exp_cgst_rate", "exp_cgst_amount", "exp_sgst_rate", "exp_sgst_amount", "exp_total_amount" },
                                             result));
                        }
                        
                        baseHealpare.MessageBox(this, "Data Updated ");
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "Data Error " + msg);
                    }
                }
                baseHealpare.updateIds("pms_expenses_voucher_mst", "0", "manual_id", "exp_voucher_date");

                if (chkJV_id.Checked == true)
                {
                    MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT " +
                        "(select account_head from pms_account_master where account_head LIKE '%SGST-ITC A/C%') as sgst_head," +
                        "(select account_head from pms_account_master where `account_head` LIKE '%CGST-ITC A/C%') as CGST_HEAD," +
                        "(select account_head from pms_account_master where account_head LIKE '%IGST-ITC A/C%') igst_head," +
                        "(select account_head from pms_account_master where account_head LIKE '%CASH A/C%') as cash_head, " +
                        "(SELECT expenses_jv_id FROM `pms_expenses_voucher_mst` WHERE exp_voucher_no = " + jv_expense_id + ") as jv_id");

                    while (msq_reader != null && msq_reader.Read())
                    {
                        System.Collections.ArrayList session_jv = new System.Collections.ArrayList();
                        session_jv.Add(new
                        {
                            account_head = expenses_id.Value.ToString(),
                            debit_entry = "" + (double.Parse(total_cost.Value.ToString()) - double.Parse(total_cgst.Value.ToString()) - double.Parse(total_sgst.Value.ToString()) - double.Parse(total_igst.Value.ToString())), //double.Parse(total_without_tax.Value.ToString()),
                            credit_entry = "0"
                        });
                        if (!total_cgst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                        {
                            account_head = "" + msq_reader["CGST_HEAD"],
                            debit_entry = "" + total_cgst.Value.ToString(),
                            credit_entry = "0"
                        });
                        if (!total_sgst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                        {
                            account_head = "" + msq_reader["sgst_head"],
                            debit_entry = "" + total_sgst.Value.ToString(),
                            credit_entry = "0"
                        });
                        if (!total_igst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                        {
                            account_head = "" + msq_reader["igst_head"],
                            debit_entry = "" + total_igst.Value.ToString(),
                            credit_entry = "0"
                        });


                        if (selectPayMode.Value == "Cash")
                        {
                            session_jv.Add(new
                            {
                                account_head = "" + msq_reader["cash_head"],
                                debit_entry = "0",
                                credit_entry = "" + total_cost.Value.ToString(),
                            });

                            JavaScriptSerializer serializer = new JavaScriptSerializer();
                            json_obj = serializer.Serialize(session_jv);

                            Session["expenses"] = new
                            {
                                session_jv = json_obj,
                                account_head = expenses_id.Value.ToString(),
                                total_cost = "" + (float.Parse(total_cost.Value.ToString()) - float.Parse(total_cgst.Value.ToString()) - float.Parse(total_sgst.Value.ToString()) - float.Parse(total_igst.Value.ToString())),
                                cgt_account_head = "" + msq_reader["CGST_HEAD"],
                                cgst_amt = "" + total_cgst.Value.ToString(),
                                sgt_account_head = "" + msq_reader["sgst_head"],
                                sgst_amt = "" + total_sgst.Value.ToString(),
                                igt_account_head = "" + msq_reader["igst_head"],
                                igst_amt = "" + total_igst.Value.ToString(),
                                seller_account_head = "" + msq_reader["cash_head"],
                                total_amt = "" + total_cost.Value.ToString(),
                                jv_id = "" + msq_reader["jv_id"],
                                main_id = jv_expense_id,
                                jv_date = Voucher_Date_id.Value.ToString()
                            };

                        }
                        else
                        {
                            session_jv.Add(new
                            {
                                account_head = Supplier_Name_Id.Value.ToString(),
                                debit_entry = "0",
                                credit_entry = "" + total_cost.Value.ToString(),
                            });

                            JavaScriptSerializer serializer = new JavaScriptSerializer();
                            json_obj = serializer.Serialize(session_jv);

                            Session["expenses"] = new
                            {
                                session_jv = json_obj,
                                account_head = expenses_id.Value.ToString(),
                                total_cost = "" + (float.Parse(total_cost.Value.ToString()) - float.Parse(total_cgst.Value.ToString()) - float.Parse(total_sgst.Value.ToString()) - float.Parse(total_igst.Value.ToString())), //float.Parse(total_without_tax.Value.ToString()),
                                cgt_account_head = "" + msq_reader["CGST_HEAD"],
                                cgst_amt = "" + total_cgst.Value.ToString(),
                                sgt_account_head = "" + msq_reader["sgst_head"],
                                sgst_amt = "" + total_sgst.Value.ToString(),
                                igt_account_head = "" + msq_reader["igst_head"],
                                igst_amt = "" + total_igst.Value.ToString(),
                                seller_account_head = Supplier_Name_Id.Value.ToString(),
                                total_amt = "" + total_cost.Value.ToString(),
                                jv_id = "" + msq_reader["jv_id"],
                                main_id = jv_expense_id,
                                jv_date = Voucher_Date_id.Value.ToString()
                            };
                        }
                        Response.Redirect("/Vouchers/JournalEntry.aspx?jvtype=expenses");
                    }
                    //msq_reader.Close();
                }
                else
                {
                    Response.Redirect("/Vouchers/ExpensesDetails.aspx");
                }
            }
        }

        protected void btnPrintClick(object sender, EventArgs e)
        {
            Response.Redirect("/Prints/ExpensePrint.aspx?value=" + Request.QueryString["value"].ToString());

        }
    }
}