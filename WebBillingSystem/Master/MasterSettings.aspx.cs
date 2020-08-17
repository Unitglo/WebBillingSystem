using MySql.Data.MySqlClient;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Text.RegularExpressions;

namespace WebBillingSystem
{
    public partial class MasterSettings : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        //DateTime dateTime = DateTime.UtcNow.Date;
        public System.Collections.ArrayList comp_master;
        public System.Collections.ArrayList inv_master;
        public System.Collections.ArrayList dr_master;
        public System.Collections.ArrayList cr_master;
        public string json_obj;
        public string json_obj_inv;
        public string json_obj_dr;
        public string json_obj_cr;

        protected void Page_Load(object sender, EventArgs e)
        {
            breadcrumb_title.InnerHtml = "Add Master Settings";
            baseHealpare = new DataBaseHealpare();

            sessionvalfirstauto.Value = Session["First_auth"].ToString();
            sessionvalsecauto.Value = Session["Second_auth"].ToString();

            comp_master = new System.Collections.ArrayList();
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "where status=0");
            int cont = 1;

            while (reader != null && reader.Read())
            {
                comp_master.Add(new
                {

                    company_primary_sign_name = reader["company_primary_sign_name"],
                    company_primary_sign_designation = reader["company_primary_sign_designation"],
                    address = reader["company_primary_sign_address"],
                    email1 = reader["company_primary_sign_email"],
                    mobile_no = reader["company_primapry_sign_phone"],
                    secondery_name = reader["company_secondery_sign_name"],
                    secondery_designation = reader["company_secondery_sign_designation"],
                    secondery_address = reader["company_secondery_sign_address"],
                    email2 = reader["company_secondery_sign_email"],
                    mobile_no2 = reader["company_secondery_sign_phone"],
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj = serializer.Serialize(comp_master);
            }
            inv_master = new System.Collections.ArrayList();
            MySqlDataReader inv_reader = baseHealpare.SelectManualQuery("SELECT id,series_no as inv_value FROM pms_master_setting_all_prefix_series_number WHERE generated_no ='invoice'");
            txtinvoiceno.Value = "0";
            cont = 1;
            while (inv_reader != null && inv_reader.Read())
            {
                inv_master.Add(new
                {
                    invoiceno = inv_reader["inv_value"].ToString(),
                    id = inv_reader["id"].ToString()
                });

                txtinvoiceno.Value = "" + (cont++);
            }
            if (inv_reader != null)
            {
                inv_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj_inv = serializer.Serialize(inv_master);
            }

            dr_master = new System.Collections.ArrayList();
            MySqlDataReader dr_reader = baseHealpare.SelectManualQuery("SELECT id,`series_no` as dr_value FROM `pms_master_setting_all_prefix_series_number` WHERE `generated_no`='debit'");
            txtDebitno.Value = "0";
            cont = 1;
            while (dr_reader != null && dr_reader.Read())
            {
                dr_master.Add(new
                {
                    Debitno = dr_reader["dr_value"].ToString(),
                    id = dr_reader["id"].ToString(),
                });
                txtDebitno.Value = "" + (cont++);
            }
            if (dr_reader != null)
            {
                dr_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj_dr = serializer.Serialize(dr_master);
            }
            cr_master = new System.Collections.ArrayList();
            MySqlDataReader cr_reader = baseHealpare.SelectManualQuery("SELECT id,`series_no` as cr_value FROM `pms_master_setting_all_prefix_series_number` WHERE `generated_no`='credit'");
            txtCreditno.Value = "0";
            cont = 1;
            while (cr_reader != null && cr_reader.Read())
            {
                cr_master.Add(new
                {
                    Creditno = cr_reader["cr_value"].ToString(),
                    id = cr_reader["id"].ToString(),
                });
                txtCreditno.Value = "" + (cont++);
            }
            if (cr_reader != null)
            {
                cr_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj_cr = serializer.Serialize(cr_master);
            }
            string val_count = null;
            MySqlDataReader val_reader = baseHealpare.SelectManualQuery("SELECT count(*) as count FROM `pms_master_settings` WHERE status=0");
            while (val_reader != null && val_reader.Read())
            {
                val_count = val_reader["count"].ToString();
            }
            if (val_reader != null)
            {
                val_reader.Close();
            }

            if (val_count == "0")
            {
                breadcrumb_title.InnerHtml = "Add Master Settings";
            }
            else
            {
                breadcrumb_title.InnerHtml = "Update Master Settings";
                if (!Page.IsPostBack)
                {
                    MySqlDataReader Sett_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status = 0");
                    while (Sett_reader != null && Sett_reader.Read())
                    {

                        master_setting_id.Value =Sett_reader["master_sett_id"].ToString();
                        termandcondition.Value = Sett_reader["terms_condition_tax_invoice"].ToString();
                        autorised_signatory_tax_invoice.Value = Sett_reader["authorized_signatory_tax_invoice"].ToString();
                        autorised_signatory_voucher.Value = Sett_reader["authorized_signatory_other_voucher"].ToString();
                        //-------------------------------------------------------------
                        if (Sett_reader["mrp_details"].ToString() == "1")
                        {
                            rbtn_mrpdtlreq_yes_id.Checked = true;
                            btn_mrpdtlreq_no_id.Checked = false;
                            //txt_MRPDtlReq_id.Value = Sett_reader["mrp_invoice_details"].ToString();
                        }
                        else
                        {
                            rbtn_mrpdtlreq_yes_id.Checked = false;
                            btn_mrpdtlreq_no_id.Checked = true;
                           // txt_MRPDtlReq_id.Value = "";
                        }
                        //-------------------------------------------------------------
                        if (Sett_reader["sale_price_details"].ToString() == "1")
                        {
                            rbtnSalePriceDtlReqYes.Checked = true;
                            rbtn_SalePriceDtlReq_no_id.Checked = false;
                            //SalePriceDtlReq_id.Value = Sett_reader["sale_price_details_info"].ToString();
                        }
                        else
                        {
                            rbtnSalePriceDtlReqYes.Checked = false;
                            rbtn_SalePriceDtlReq_no_id.Checked = true;
                            //SalePriceDtlReq_id.Value = "";
                        }
                        //-------------------------------------------------------------
                        string valDate = Sett_reader["expiry_monitoring_system_info"].ToString();
                        if (Sett_reader["expiry_monitoring_system"].ToString() == "1")
                        {
                            ExpMonSysReq_yes_id.Checked = true;
                            ExpMonSysReq_no_id.Checked = false;
                            
                            DateTime date = Convert.ToDateTime(valDate);
                            string s = date.ToString("dd/M/yyyy", CultureInfo.InvariantCulture);
                            //expiry_date_id.Value = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

                        }
                        else
                        {
                            ExpMonSysReq_yes_id.Checked = false;
                            ExpMonSysReq_no_id.Checked = true;
                            DateTime date = Convert.ToDateTime(valDate);
                            string s = date.ToString("dd/M/yyyy", CultureInfo.InvariantCulture);
                            //expiry_date_id.Value = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                        }
                        //-------------------------------------------------------------
                        if (Sett_reader["expiry_details_tax_invoice"].ToString() == "1")
                        {
                            rbtnExpireTaxInvoice_yes_id.Checked = true;
                            rbtnExpireTaxInvoice_no_id.Checked = false;
                        }
                        else
                        {
                            rbtnExpireTaxInvoice_yes_id.Checked = false;
                            rbtnExpireTaxInvoice_no_id.Checked = true;
                        }
                        //-------------------------------------------------------------
                        if (Sett_reader["batch_wise_details"].ToString() == "1")
                        {
                            BatchDtlReq_yes_id.Checked = true;
                            BatchDtlReq_no_id.Checked = false;
                            //txt_BatchDtlReq_id.Value = Sett_reader["batch_wise_details_info"].ToString();
                        }
                        else
                        {
                            BatchDtlReq_yes_id.Checked = false;
                            BatchDtlReq_no_id.Checked = true;
                            //txt_BatchDtlReq_id.Value = "";
                        }
                        //-------------------------------------------------------------
                        if (Sett_reader["batch_wise_details_tax_invoice"].ToString() == "1")
                        {
                            rbtnBatchDtlTaxInvoice_yes_id.Checked = true;
                            rbtnBatchDtlTaxInvoice_no_id.Checked = false;
                        }
                        else
                        {
                            rbtnBatchDtlTaxInvoice_yes_id.Checked = false;
                            rbtnBatchDtlTaxInvoice_no_id.Checked = true;
                        }
                        //-------------------------------------------------------------
                        Stock_OutMethod.SelectedIndex = Stock_OutMethod.Items.IndexOf(Stock_OutMethod.Items.FindByText(Sett_reader["stock_out_method"].ToString()));
                        stockValuationMethod.SelectedIndex = stockValuationMethod.Items.IndexOf(stockValuationMethod.Items.FindByText(Sett_reader["stock_valuation_method"].ToString()));
                        //-------------------------------------------------------------
                        if (Sett_reader["unit_conversion_method_required"].ToString() == "1")
                        {
                            rbtnUnitConvMethod_yes_id.Checked = true;
                            rbtnUnitConvMethod_no_id.Checked = false;
                        }
                        else
                        {
                            rbtnUnitConvMethod_yes_id.Checked = false;
                            rbtnUnitConvMethod_no_id.Checked = true;
                        }
                        //-------------------------------------------------------------


                        if (Sett_reader["prefix_generate_invoice_no"].ToString() == "1")
                        {

                            rbtninvoice_yes_id.Checked = true;
                            rbtninvoice_no_id.Checked = false;
                        }
                        else
                        {
                            rbtninvoice_yes_id.Checked = false;
                            rbtninvoice_no_id.Checked = true;
                            txtinvoiceno.Value = "0";
                        }

                        //-------------------------------------------------------------

                        if (Sett_reader["prefix_generate_debit_no"].ToString() == "1")
                        {

                            rbtndebit_yes_id.Checked = true;
                            rbtndebit_no_id.Checked = false;

                        }
                        else
                        {
                            rbtndebit_yes_id.Checked = false;
                            rbtndebit_no_id.Checked = true;
                            txtDebitno.Value = "0";
                        }

                        //-------------------------------------------------------------

                        if (Sett_reader["prefix_generate_credit_no"].ToString() == "1")
                        {

                            rbtncredit_yes_id.Checked = true;
                            rbtncredit_no_id.Checked = false;

                        }
                        else
                        {
                            rbtncredit_yes_id.Checked = false;
                            rbtncredit_no_id.Checked = true;
                            txtCreditno.Value = "0";
                        }

                        //-------------------------------------------------------------
                        if (Sett_reader["journal_accounting_entry"].ToString() == "1")
                        {
                            rbtnAccountEntry_yes_id.Checked = true;
                            rbtnAccountEntry_no_id.Checked = false;
                        }
                        else
                        {
                            rbtnAccountEntry_yes_id.Checked = false;
                            rbtnAccountEntry_no_id.Checked = true;
                        }
                        //-------------------------------------------------------------
                        if (Sett_reader["extra_information_tax_invoice"].ToString() == "1")
                        {
                            rbtnExtraInformation_yes_id.Checked = true;
                            rbtn_Extra_Information.Checked = false;
                            txtId1.Value = Sett_reader["caption_name1"].ToString();
                        }
                        else
                        {
                            rbtnExtraInformation_yes_id.Checked = false;
                            rbtn_Extra_Information.Checked = true;
                            txtId1.Value = "";
                        }
                        //-------------------------------------------------------------
                        if (Sett_reader["currency_sign_before_amount"].ToString() == "1")
                        {
                            rbtnCurrencySign_yes_id.Checked = true;
                            rbtnCurrencySign_no_id.Checked = false;
                        }
                        else
                        {
                            rbtnCurrencySign_yes_id.Checked = false;
                            rbtnCurrencySign_no_id.Checked = true;
                        }
                        //-------------------------------------------------------------
                    }
                    if (Sett_reader != null)
                    {
                        Sett_reader.Close();
                    }
                }
            }
        }
        protected void submit_account_details_event(object sender, EventArgs e)
        {
            string rbtSpdr = "", rbtnmrp = "", rbtnExpireManditory ="", rbtnExpireTaxInvoice="", rbtnBatchDtl="", rbtnCurrencySign="";
            string rbtnBatchDtlTaxInvoice = "", rbtnUnitConvMethod="", rbtnAccountEntry="", rbtnExtraInformation="";
            string rbtninvoiceno = "", rbtnDebitno = "", rbtnCreditno = "";
            foreach (string names in Request.Form.AllKeys)
            {
                if (names.Contains("rbtnmrp"))
                {
                    rbtnmrp = Request.Form[names];
                }

                if (names.Contains("rbtSpdr"))
                {
                    rbtSpdr = Request.Form[names];
                }


                if (names.Contains("rbtnExpireManditory"))
                {
                    rbtnExpireManditory = Request.Form[names];
                }

                if (names.Contains("rbtnExpireTaxInvoice"))
                {
                    rbtnExpireTaxInvoice = Request.Form[names];
                }

                if (names.Contains("rbtnBatchDtl_name"))
                {
                    rbtnBatchDtl = Request.Form[names];
                }

                if (names.Contains("rbtnBatchDtlTaxInvoice"))
                {
                    rbtnBatchDtlTaxInvoice = Request.Form[names];
                }

                
                if (names.Contains("rbtnUnitConvMethod"))
                {
                    rbtnUnitConvMethod = Request.Form[names];
                }

                if (names.Contains("rbtnAccountEntry"))
                {
                    rbtnAccountEntry = Request.Form[names];
                }

                if (names.Contains("rbtnExtraInformation"))
                {
                    rbtnExtraInformation = Request.Form[names];
                }

                if (names.Contains("rbtnCurrencySign"))
                {
                    rbtnCurrencySign = Request.Form[names];
                }
                if (names.Contains("rbtninvoiceno"))
                {
                    rbtninvoiceno = Request.Form[names];
                }
                if (names.Contains("rbtnDebitno"))
                {
                    rbtnDebitno = Request.Form[names];
                }

                if (names.Contains("rbtnCreditno"))
                {
                    rbtnCreditno = Request.Form[names];
                }
            }


            //if (Request.QueryString.Count == 0)
            if (breadcrumb_title.InnerText == "Add Master Settings")
            {
                 baseHealpare.InsertIntoTable(baseHealpare.master_settings_table,
                                    new string[] { "terms_condition_tax_invoice", "authorized_signatory_tax_invoice", "authorized_signatory_other_voucher", "mrp_details", "sale_price_details", "expiry_monitoring_system", "expiry_details_tax_invoice", "batch_wise_details", "batch_wise_details_tax_invoice", "stock_out_method", "stock_valuation_method", "unit_conversion_method_required", "prefix_generate_invoice_no", "invoiceno", "prefix_generate_debit_no", "debitno", "prefix_generate_credit_no", "creditno", "journal_accounting_entry", "extra_information_tax_invoice", "caption_name1", "currency_sign_before_amount" },
                                    new string[] { Regex.Replace(termandcondition.Value.ToString(), @"[^0-9a-zA-Z]+", " "), autorised_signatory_tax_invoice.Value.ToString(), autorised_signatory_voucher.Value.ToString(), rbtnmrp.ToString(), rbtSpdr, rbtnExpireManditory, rbtnExpireTaxInvoice, rbtnBatchDtl, rbtnBatchDtlTaxInvoice, textVal1.Value.ToString(), textVal2.Value.ToString(), rbtnUnitConvMethod, rbtninvoiceno, txtinvoiceno.Value.ToString(), rbtnDebitno, txtDebitno.Value.ToString(), rbtnCreditno, txtCreditno.Value.ToString(), rbtnAccountEntry, rbtnExtraInformation, txtId1.Value.ToString(), rbtnCurrencySign }
                                  );
                
                string jsonString = txthdnJson.Value.ToString();
                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                for (int i = 0; i < dict.Count; i++)
                {
                    string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                    if (result.Length > 1)
                    {
                        string id = result[2];
                        result.ToList().RemoveAt(2);
                        if (!id.Equals("0"))
                        {
                            baseHealpare.UpdateValue(baseHealpare.master_settings_series_table,
                                                new string[] { "generated_no", "series_no", "count" },
                                                result, "id=" + id);
                        }
                        else
                        {
                            baseHealpare.InsertIntoTable(baseHealpare.master_settings_series_table,
                            new string[] { "generated_no", "series_no", "count" },
                            result);
                        }
                    }
                }
            }
                else
                {
                
                //MySqlDataReader det_reader = baseHealpare.SelectManualQuery("DELETE FROM `pms_master_settings` WHERE status = 0");
                //det_reader.Close();
                 baseHealpare.UpdateValue(baseHealpare.master_settings_table,
                                        new string[] { "terms_condition_tax_invoice", "authorized_signatory_tax_invoice", "authorized_signatory_other_voucher", "mrp_details", "sale_price_details", "expiry_monitoring_system", "expiry_details_tax_invoice", "batch_wise_details", "batch_wise_details_tax_invoice", "stock_out_method", "stock_valuation_method", "unit_conversion_method_required",  "journal_accounting_entry", "extra_information_tax_invoice", "caption_name1", "currency_sign_before_amount" },
                                        new string[] { Regex.Replace(termandcondition.Value.ToString(), @"[^0-9a-zA-Z]+", " "), autorised_signatory_tax_invoice.Value.ToString(), autorised_signatory_voucher.Value.ToString(), rbtnmrp.ToString(), rbtSpdr, rbtnExpireManditory, rbtnExpireTaxInvoice, rbtnBatchDtl, rbtnBatchDtlTaxInvoice, textVal1.Value.ToString(), textVal2.Value.ToString(), rbtnUnitConvMethod,  rbtnAccountEntry, rbtnExtraInformation, txtId1.Value.ToString(), rbtnCurrencySign},
                                        "master_sett_id="+ master_setting_id.Value.ToString()
                                       );


                //det_reader = baseHealpare.SelectManualQuery("DELETE FROM `pms_master_setting_all_prefix_series_number` WHERE status = 0");
                //det_reader.Close();

                string jsonString = txthdnJson.Value.ToString();
                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                for (int i = 0; i < dict.Count; i++)
                {
                    string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                    string id = "";
                    if (result.Length > 1)
                    {
                        id = result[2];
                        result.ToList().RemoveAt(2);
                        if (!id.Equals("0"))
                        {
                            //baseHealpare.UpdateValue(baseHealpare.master_settings_series_table,
                            //                    new string[] { "generated_no", "series_no", "count" },
                            //                    result, "id=" + id);
                        }
                        else
                        {
                            baseHealpare.InsertIntoTable(baseHealpare.master_settings_series_table,
                            new string[] { "generated_no", "series_no", "count" },
                            result);
                        }
                    }
                }

            }
            Response.Redirect("~/Master/AccountDetails.aspx");
        }
       

            }
        }