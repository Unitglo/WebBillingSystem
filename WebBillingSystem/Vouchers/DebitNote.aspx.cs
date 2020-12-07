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
    public partial class DebitNote : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList account_master; 
        public System.Collections.ArrayList purchase_sale;
        public System.Collections.ArrayList display_content;
        public System.Collections.ArrayList product_name;
        public System.Collections.ArrayList debit_master;
        public System.Collections.ArrayList setting_master;
        public System.Collections.ArrayList debitmaster;
        public System.Collections.ArrayList mst_series_master;
        public System.Collections.ArrayList debit_no_master;
        public System.Collections.ArrayList purchase_setvalue_mst_master;
        public System.Collections.ArrayList purchase_setvalue_dtl_master;
        public System.Collections.ArrayList gstno_id;

        public string json_purchase_setvalue_mst_obj;
        public string json_purchase_setvalue_dtl_obj;
        public string json_dr_obj;
        public string json_setting_obj;
        public string json_debit_obj;
        public string json_obj;
        public string json_display_content;
        public string json_product;
        public string json_product_name;
        public string json_purchase_sale_obj;
        public string json_gstin_name;
        public string json_obj_mst_series;
        public string json_debit_no;
        string invoice_series = "";
        public string jv_id = "0";
        string issue_date = "";
        public string final_year_date = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            breadcrumb_title.InnerHtml= "Add Debit Note";
            baseHealpare = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {
                dateInvoice.Attributes["min"] = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
                dateInvoice.Attributes["max"] = Convert.ToDateTime(Session["end_date"].ToString()).ToString("yyyy-MM-dd");

                DateTime dateTime = DateTime.UtcNow.Date;
                dateIssue.Value = dateTime.ToString("yyyy-MM-dd");
                dateInvoice.Value = dateTime.ToString("yyyy-MM-dd");

                int year = Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
                {
                    final_year_date = (year - 1) + "-04-01";
                }
                else
                {
                    final_year_date = year + "-04-01";
                }
                dateIssue.Value = dateTime.ToString("yyyy-MM-dd");
                dateInvoice.Value = dateTime.ToString("yyyy-MM-dd");
            }
            if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
            {
                MySqlDataReader master_id_reader = baseHealpare.SelectManualQuery("SELECT dr_cr_jv_id FROM `pms_voucher_dr_cr_note_mst` WHERE `dr_cr_Id` = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                while (master_id_reader != null && master_id_reader.Read())
                {
                    jv_id = master_id_reader["dr_cr_jv_id"].ToString();
                }
                if (master_id_reader != null)
                {
                    master_id_reader.Close();
                }

                baseHealpare.DeleteValue(baseHealpare.TableAddDebitCreditMst, "dr_cr_Id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                baseHealpare.DeleteValue(baseHealpare.TableAddDebitCreditDtl, "refrance_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));

                if (!jv_id.Equals("0"))
                {
                    Response.Redirect("/Vouchers/JournalEntry.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + jv_id));
                }
                else
                {
                    Response.Redirect("~/Vouchers/DebitDetails.aspx");
                }
            }

            MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT * FROM pms_master_settings where status != 2");
            
            string dr_id = null;
            while (msq_reader != null && msq_reader.Read())
            {
                dr_id = "" + msq_reader["debitno"];
                termcond_Id.InnerHtml = "" + msq_reader["terms_condition_tax_invoice"];
                sign_Id.InnerHtml = "" + msq_reader["authorized_signatory_tax_invoice"];
                invoice_series = "" + msq_reader["prefix_generate_debit_no"];
                //Batch_ID.Value = "" + msq_reader["batch_wise_details_info"];
                //Expiry_Date_Id.Value = Convert.ToDateTime(msq_reader["expiry_monitoring_system_info"]).ToString("yyyy-MM-dd");
            }
            msq_reader.Close();
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT count(*)+1 as debit_no FROM pms_voucher_dr_cr_note_mst where note_type ='debit' ");
          
            while (reader != null && reader.Read())
            {
                doc_no.InnerHtml = "" + reader["debit_no"];
                //dr_no_id.InnerHtml = dr_id + "" + reader["debit_no"];
            }


            reader.Close();

            string cucid = "";
            if (Session["company"].ToString() != null)
            {
                cucid = Session["company"].ToString();
                lblcomp.InnerHtml = cucid + " - " + Session["company_name"];

                MySqlDataReader comp_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, " where company_ucid='" + cucid + "'");

                while (comp_reader != null && comp_reader.Read())
                {
                    //lblCompName.InnerHtml = "" + comp_reader["company_surname"] + " " + comp_reader["company_middle_name"] + " " + comp_reader["company_middle_name"];
                    doc_state.InnerHtml = "" + comp_reader["company_state"];
                    doc_code.InnerHtml = "" + comp_reader["company_state_code"];
                    bankAc_Id.Value = "" + comp_reader["company_bank_account_number"];
                    bankIFSC_id.Value = "" + comp_reader["company_bank_ifsc_code"];
                    bank_name.Value = "" + comp_reader["company_bank_name"];

                }
                if (comp_reader != null)
                {
                    comp_reader.Close();
                }
            }

            MySqlDataReader company_reader = baseHealpare.SelectAllValues("*, " + "(SELECT pms_account_state_name FROM pms_account_state WHERE pms_account_state_code = account_state_code) as statename", baseHealpare.TableAddAccount, " where status=0");
            account_master  = new System.Collections.ArrayList();
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
                gstno_id.Add(company_reader["account_gst_number"]);
            }
            company_reader.Close();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            json_obj = serializer.Serialize(account_master);
            json_gstin_name = serializer.Serialize(gstno_id);

            company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStock, " where status=0");
            account_master = new System.Collections.ArrayList();
            product_name = new System.Collections.ArrayList();
            
            while (company_reader != null && company_reader.Read())
            {
                account_master.Add(new
                {
                    stock_nature_of_opration = company_reader["stock_nature_of_opration"],
                    stock_group = company_reader["stock_group"],
                    stock_hsn_sac_code = company_reader["stock_hsn_sac_code"],
                    stock_gst_rate = company_reader["stock_gst_rate"],
                    stock_product_name = company_reader["stock_product_name"],
                    stock_unit_of_measurment = company_reader["stock_unit_of_measurment"],
                    stock_reorder_quantity = company_reader["stock_reorder_quantity"],
                    stock_sale_price_without_gst = company_reader["stock_sale_price_without_gst"],
                    
                    stock_opening_qty = company_reader["stock_opening_qty"],
                    stock_purc_price_per_unit = company_reader["stock_purc_price_per_unit"],
                    stock_opening_amt = company_reader["stock_opening_amt"],
                    stock_pri_unit_of_measurment = company_reader["stock_pri_unit_of_measurment"],
                    stock_sec_unit_of_measurement = company_reader["stock_sec_unit_of_measurement"],
                    stock_conversion_factor = company_reader["stock_conversion_factor"],
                  });
                product_name.Add(company_reader["stock_product_name"]);
            }
            company_reader.Close();
            serializer = new JavaScriptSerializer();
            json_product = serializer.Serialize(account_master);
            serializer = new JavaScriptSerializer();
            json_product_name = serializer.Serialize(product_name);

            company_reader = null;
            company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, "where status=0");
            purchase_sale = new System.Collections.ArrayList();
            while (company_reader != null && company_reader.Read())
            {
                purchase_sale.Add(new
                {
                    invoice_no = company_reader["invoice_no"].ToString(),
                });
            }
            if (company_reader != null)
            {
                company_reader.Close();
                serializer = new JavaScriptSerializer();
                json_purchase_sale_obj = serializer.Serialize(purchase_sale);
            }

            if (invoice_series == "1")
            {
                doc_no.Visible = false;
                dr_no_id.Visible = true;
                MySqlDataReader mst_series_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_series_table, " where generated_no = 'debit' and status=0");
                mst_series_master = new System.Collections.ArrayList();
                debit_no_master = new System.Collections.ArrayList();

                while (mst_series_reader != null && mst_series_reader.Read())
                {
                    mst_series_master.Add(new
                    {
                        generated_no = mst_series_reader["generated_no"],
                        series_no = mst_series_reader["series_no"], // + "" + (int.Parse(mst_series_reader["count"].ToString())+1),//mst_series_reader["series_no"],
                        count = mst_series_reader["count"]
                    });
                    debit_no_master.Add(mst_series_reader["series_no"] + "" + (mst_series_reader["count"])+1);
                }
                if (mst_series_reader != null)
                {
                    mst_series_reader.Close();
                    json_obj_mst_series = serializer.Serialize(mst_series_master);
                    serializer = new JavaScriptSerializer();
                    json_debit_no = serializer.Serialize(debit_no_master);
                }
            }
            else
            {
                doc_no.Visible = true;
                dr_no_id.Visible = false;
            }

            company_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status=0");
            setting_master = new System.Collections.ArrayList();
            while (company_reader != null && company_reader.Read())
            {
                setting_master.Add(new
                {

                    terms_condition_tax_invoice = company_reader["terms_condition_tax_invoice"],
                    authorized_signatory_tax_invoice = company_reader["authorized_signatory_tax_invoice"],
                    authorized_signatory_other_voucher = company_reader["authorized_signatory_other_voucher"],
                    mrp_details = company_reader["mrp_details"],
                    sale_price_details = company_reader["sale_price_details"],
                    expiry_monitoring_system = company_reader["expiry_monitoring_system"],
                    expiry_details_tax_invoice = company_reader["expiry_details_tax_invoice"],
                    batch_wise_details = company_reader["batch_wise_details"],
                    batch_wise_details_tax_invoice = company_reader["batch_wise_details_tax_invoice"],
                    stock_out_method = company_reader["stock_out_method"],
                    //stock_valuation_method = company_reader["stock_valuation_method"],
                    unit_conversion_method_required = company_reader["unit_conversion_method_required"],
                    journal_accounting_entry = company_reader["journal_accounting_entry"],
                    extra_information_tax_invoice = company_reader["extra_information_tax_invoice"],
                    caption_name1 = company_reader["caption_name1"],
                    currency_sign_before_amount = company_reader["currency_sign_before_amount"],
                    //create_date = company_reader["create_date"],
                    //  update_date = company_reader["update_date"],
                    prefix_generate_invoice_no = company_reader["prefix_generate_invoice_no"],
                    // invoiceno = company_reader["invoiceno"],
                    prefix_generate_debit_no = company_reader["prefix_generate_debit_no"],
                    //debitno = company_reader["debitno"],
                    prefix_generate_credit_no = company_reader["prefix_generate_credit_no"],
                    //                    creditno = company_reader["creditno"],

                });
            }
            if (company_reader != null)
            {
                company_reader.Close();
                serializer = new JavaScriptSerializer();
                json_setting_obj = serializer.Serialize(setting_master);
            }



            if (Request.QueryString.Count == 0)
            {
                breadcrumb_title.InnerHtml = "Add Debit Note";

                MySqlDataReader Max_Date_reader = baseHealpare.SelectManualQuery("SELECT MAX(date_of_invoice) AS invdate FROM pms_voucher_dr_cr_note_mst WHERE note_type = 'debit' and status = 0");
                while (Max_Date_reader != null && Max_Date_reader.Read())
                {
                    try
                    {
                        if (Max_Date_reader["invdate"].ToString() != "" && Max_Date_reader["invdate"].ToString() != "00/00/0000")
                            issue_date = Convert.ToDateTime(Max_Date_reader["invdate"].ToString()).ToString("yyyy-MM-dd");
                        else
                            issue_date = final_year_date;

                    }
                    catch (Exception e2)
                    {
                        dateIssue.Attributes["min"] = final_year_date;
                    }
                }

                Max_Date_reader = baseHealpare.SelectManualQuery("SELECT MAX(date_of_issue) AS crdate FROM pms_voucher_dr_cr_note_mst WHERE note_type = 'debit'  and status = 0");
                while (Max_Date_reader != null && Max_Date_reader.Read())
                {
                    try
                    {
                        if (Max_Date_reader["crdate"].ToString() != "" && Max_Date_reader["crdate"].ToString() != "00/00/0000")
                        {
                            if (Convert.ToDateTime(Max_Date_reader["crdate"].ToString()) >= Convert.ToDateTime(issue_date))
                            {
                                dateIssue.Attributes["min"] = Convert.ToDateTime(Max_Date_reader["crdate"].ToString()).ToString("yyyy-MM-dd");
                            }
                            else
                            {
                                dateIssue.Attributes["min"] = issue_date;
                            }
                        }
                        else
                        {
                            dateIssue.Attributes["min"] = issue_date;
                        }
                    }
                    catch (Exception e2)
                    {
                        //01-03-2019
                        dateIssue.Attributes["min"] = issue_date;
                    }

                }
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    breadcrumb_title.InnerHtml = "Update Debit Note";
                    int cnt = 0;
                    string ca_status_condition = baseHealpare.ApprovalCheckStatus();
                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditMst, "where dr_cr_Id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'" + ca_status_condition);
                    while (update_reader != null && update_reader.Read())
                    {
                        cnt++;
                        doc_no.InnerHtml = update_reader["document_no"].ToString();
                        dateIssue.Value = Convert.ToDateTime(update_reader["date_of_issue"].ToString()).ToString("yyyy-MM-dd");
                        doc_state.InnerHtml = update_reader["doc_state"].ToString();
                        doc_code.InnerHtml = update_reader["doc_state_code"].ToString();
                        // againstinvoice.SelectedIndex = againstinvoice.Items.IndexOf(againstinvoice.Items.FindByText(update_reader["against_invoice"].ToString()));
                        dateInvoice.Value = Convert.ToDateTime(update_reader["date_of_invoice"].ToString()).ToString("yyyy-MM-dd");
                        billPartyName.SelectedIndex = billPartyName.Items.IndexOf(billPartyName.Items.FindByValue(update_reader["bill_party_name"].ToString()));
                        billPartyAddress.InnerHtml = update_reader["bill_party_address"].ToString();
                        billPartygstin.Value = update_reader["bill_party_gstin"].ToString();
                        billparty_statename.InnerHtml = update_reader["bill_party_state"].ToString();
                        bill_statecode.InnerHtml = update_reader["bill_party_state_code"].ToString();
                        shipPartyName.SelectedIndex = shipPartyName.Items.IndexOf(shipPartyName.Items.FindByValue(update_reader["ship_party_name"].ToString()));
                        shipPartyAddress.InnerHtml = update_reader["ship_party_address"].ToString();
                        shipPartygst_in.Value = update_reader["ship_party_gstin"].ToString();
                        shipPartystate.InnerHtml = update_reader["ship_party_state"].ToString();
                        shipPartystatecode.InnerHtml = update_reader["ship_party_code"].ToString();
                        txtremark.Value = update_reader["remarks"].ToString();
                        //  selectPayMode.SelectedIndex = selectPayMode.Items.IndexOf(selectPayMode.Items.FindByText(update_reader["against_invoice"].ToString()));
                        //selectPayStatus.SelectedIndex = selectPayStatus.Items.IndexOf(selectPayStatus.Items.FindByText(update_reader["against_invoice"].ToString()));

                    }
                    if (update_reader != null)
                    {
                        update_reader.Close();
                    }
                    if (invoice_series == "1")
                    {
                        debit_no_master.Add("" + doc_no.InnerText);
                        mst_series_master.Add(new
                        {
                            generated_no = "debit",
                            series_no = doc_no.InnerText,
                            count = -1,
                        });
                        json_obj_mst_series = serializer.Serialize(mst_series_master);
                        serializer = new JavaScriptSerializer();
                        json_debit_no = serializer.Serialize(debit_no_master);
                    }
                    
                    if (cnt > 0)
                    {
                        reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditDtl, " where refrance_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    debitmaster = new System.Collections.ArrayList();

                    while (reader != null && reader.Read())
                    {
                        debitmaster.Add(new
                        {
                            document_no = reader["document_no"],
                            againt_invoice = reader["againt_invoice"],
                            bill_party_name = reader["bill_party_name"],
                            ship_party_name = reader["ship_party_name"],
                            product_name = reader["product_name"],
                            hsn_code = reader["hsn_code"],
                            uom = reader["uom"],
                            batch = reader["batch"],
                            //expiry_date = reader["expiry_date"],
                            quantity = reader["quantity"],
                            rate = reader["rate"],
                            amount = reader["amount"],
                            discount = reader["discount"],
                            tax_value = reader["tax_value"],
                            igst_rate = reader["igst_rate"],
                            igst_amount = reader["igst_amount"],
                            cgst_rate = reader["cgst_rate"],
                            cgst_amount = reader["cgst_amount"],
                            sgst_rate = reader["sgst_rate"],
                            sgst_amount = reader["sgst_amount"],
                            total = reader["total"],

                        });
                    }
                    if (reader != null)
                    {
                        reader.Close();
                        serializer = new JavaScriptSerializer();
                        json_dr_obj = serializer.Serialize(debitmaster);

                    }
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "You Dont Have Permission To Update Data is already Approved..!!!");
                    }

                }



                MySqlDataReader debit_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditMst, "where dr_cr_Id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                debit_master = new System.Collections.ArrayList();

                while (debit_reader != null && debit_reader.Read())
                {
                    debit_master.Add(new
                    {
                        document_no = debit_reader["document_no"],
                        //date_of_issue = debit_reader["date_of_issue_format"],
                        doc_state = debit_reader["doc_state"] + " - " + debit_reader["doc_state_code"],
                        doc_state_code = debit_reader["doc_state_code"],
                        againstinvoice = debit_reader["against_invoice"],
                        //date_of_invoice = Convert.ToDateTime(debit_reader["date_of_invoice"]),
                        bill_party_name = debit_reader["bill_party_name"],
                        bill_party_address = debit_reader["bill_party_address"],
                        bill_party_gstin = debit_reader["bill_party_gstin"],
                        bill_party_state = debit_reader["bill_party_state"],
                        bill_party_state_code = debit_reader["bill_party_state_code"],
                        ship_party_name = debit_reader["ship_party_name"],
                        ship_party_address = debit_reader["ship_party_address"],
                        ship_party_gstin = debit_reader["ship_party_gstin"],
                        ship_party_state = debit_reader["ship_party_state"],
                        ship_party_code = debit_reader["ship_party_code"],
                        total_cost = debit_reader["total_cost"],
                        total_gst = debit_reader["total_gst"],
                        total_igst = debit_reader["total_igst"],
                        total_cgst = debit_reader["total_cgst"],
                        total_sgst = debit_reader["total_sgst"],
                        total_discount = debit_reader["total_discount"],
                        note_type = debit_reader["note_type"],
                        remarks = debit_reader["remarks"],
                    });
                }
                if (debit_reader != null)
                {
                    debit_reader.Close();
                    serializer = new JavaScriptSerializer();
                    json_debit_obj = serializer.Serialize(debit_master);

                }
            }

            MySqlDataReader purchase_setvalue_mst_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, "where status = 0");
            purchase_setvalue_mst_master = new System.Collections.ArrayList();

            while (purchase_setvalue_mst_reader != null && purchase_setvalue_mst_reader.Read())
            {
                purchase_setvalue_mst_master.Add(new
                {
                    invoice_no = purchase_setvalue_mst_reader["invoice_no"],
                    invoice_date = Convert.ToDateTime(purchase_setvalue_mst_reader["invoice_date"]).ToString("yyyy-MM-dd"),
                    seller_name = purchase_setvalue_mst_reader["seller_name"],
                    Seller_address = purchase_setvalue_mst_reader["Seller_address"],
                    gstin = purchase_setvalue_mst_reader["gstin"],
                    s_state = purchase_setvalue_mst_reader["s_state"],
                    state_code = purchase_setvalue_mst_reader["state_code"],

                });
            }
            if (purchase_setvalue_mst_reader != null)
            {
                purchase_setvalue_mst_reader.Close();
                serializer = new JavaScriptSerializer();
                json_purchase_setvalue_mst_obj = serializer.Serialize(purchase_setvalue_mst_master);
            }

            MySqlDataReader purchase_setvalue_dtl_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, "where invoice_type = 'purchase' AND status != 2");
            purchase_setvalue_dtl_master = new System.Collections.ArrayList();

            while (purchase_setvalue_dtl_reader != null && purchase_setvalue_dtl_reader.Read())
            {
                purchase_setvalue_dtl_master.Add(new
                {
                    invoice_no = purchase_setvalue_dtl_reader["invoice_no"],
                    product_desc = purchase_setvalue_dtl_reader["product_desc"],
                    hsn_code = purchase_setvalue_dtl_reader["hsn_code"],
                    qty = purchase_setvalue_dtl_reader["qty"],
                    //rate = purchase_setvalue_dtl_reader["rate"],
                    amount = purchase_setvalue_dtl_reader["amount"] == null ? "0" : purchase_setvalue_dtl_reader["amount"],
                    discount = purchase_setvalue_dtl_reader["discount"],
                    tax_val = purchase_setvalue_dtl_reader["tax_val"] == null ? "0" : purchase_setvalue_dtl_reader["tax_val"],
                    igst_rate = purchase_setvalue_dtl_reader["igst_rate"],
                    igst_amt = purchase_setvalue_dtl_reader["igst_amt"] == null ? "0" : purchase_setvalue_dtl_reader["igst_amt"],
                    cgst_rate = purchase_setvalue_dtl_reader["cgst_rate"],
                    cgst_amt = purchase_setvalue_dtl_reader["cgst_amt"] == null ? "0" : purchase_setvalue_dtl_reader["cgst_amt"],
                    sgst_rate = purchase_setvalue_dtl_reader["sgst_rate"],
                    sgst_amount = purchase_setvalue_dtl_reader["sgst_amount"] == null ? "0" : purchase_setvalue_dtl_reader["sgst_amount"],
                    uom = purchase_setvalue_dtl_reader["uom"]
                });
            }
            if (purchase_setvalue_dtl_reader != null)
            {
                purchase_setvalue_dtl_reader.Close();
                serializer = new JavaScriptSerializer();
                json_purchase_setvalue_dtl_obj = serializer.Serialize(purchase_setvalue_dtl_master);
            }
        }
        string jv_debit_id = "";
        protected void submit_account_details_event(object sender, EventArgs e)
        {
            {
                baseHealpare.controlDefaultValueCheck(doc_code, "0");
                baseHealpare.controlDefaultValueCheck(shipPartystatecode, "0");
                baseHealpare.controlDefaultValueCheck(bill_statecode, "0");
                baseHealpare.controlDefaultValueCheck(Expiry_Date_Id, "0001-01-01");

                if (Request.QueryString.Count == 0)
                {
                    Random r = new Random();
                    var cont = r.Next(0, 1000000);
                    if (invoice_series == "1")
                    {
                        var a = series_id.Value.ToString();
                        MySqlDataReader cnt_reader = baseHealpare.SelectManualQuery("SELECT (count+1) as cnt FROM pms_master_setting_all_prefix_series_number WHERE series_no = " + "'" + a + "'");
                        while (cnt_reader != null && cnt_reader.Read())
                        {
                            cont = Convert.ToInt32(cnt_reader["cnt"]);
                        }
                        cnt_reader.Close();
                        baseHealpare.MessageBox(this, "Data Updated " + baseHealpare.UpdateValue(baseHealpare.master_settings_series_table,
                                       new string[] { "count" },
                                       new string[] { ""+cont },
                                       "series_no=" + "'" + a + "'"
                      ));
                    }
                    series_id.Value = series_id.Value.ToString() + "" + cont.ToString("000000");

                    string refrance_id  = baseHealpare.InsertIntoTableGetID(baseHealpare.TableAddDebitCreditMst,
                                                           new string[] { "document_no", "date_of_issue", "doc_state", "doc_state_code", "against_invoice", "date_of_invoice", "bill_party_name", "bill_party_address", "bill_party_gstin", "bill_party_state", "bill_party_state_code", "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "note_type", "remarks", "invoice_date" },
                                                           new string[] { series_id.Value.ToString(), dateIssue.Value.ToString(), doc_state.InnerText.ToString(), doc_code.InnerText.ToString(), hdninvoice_id.Value.ToString(), dateInvoice.Value.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), shipname.Value.ToString(), shipaddr.Value.ToString(), shipgstin.Value.ToString(), shipstate.Value.ToString(), shipcode.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), note_type.Value.ToString(), Regex.Replace(txtremark.Value.ToString(), @"[^0-9a-zA-Z]+", " ") , dateInvoice.Value.ToString()}
                                                           );
                    if (Regex.IsMatch(refrance_id, "^[0-9]+$"))
                    {
                        jv_debit_id = refrance_id;
                        string jsonString = txthdnJson.Value.ToString();
                        var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                        for (int i = 0; i < dict.Count; i++)
                        {
                            dict[i]["refrance_id"] = refrance_id;
                            dict[i]["INVOICENO"] = series_id.Value.ToString();
                            dict[i]["invoice_date"] = dateInvoice.Value.ToString();
                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                            baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddDebitCreditDtl,
                                                new string[] { "document_no", "againt_invoice", "date_of_issue", "bill_party_name", "ship_party_name", "product_name", "hsn_code", "uom", "batch", "expiry_date", "quantity", "rate", "amount", "discount", "tax_value", "igst_rate", "igst_amount", "cgst_rate", "cgst_amount", "sgst_rate", "sgst_amount", "total", "refrance_id", "invoice_date" },
                                                 result));
                        }
                    }
                }
                else
                {
                    jv_debit_id = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));
                      string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                    string msg = baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst,
                                        new string[] { "date_of_issue", "doc_state", "doc_state_code", "against_invoice", "date_of_invoice", "bill_party_name", "bill_party_address", "bill_party_gstin", "bill_party_state", "bill_party_state_code", "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "note_type", "remarks", "invoice_date" },
                                        new string[] {dateIssue.Value.ToString(), doc_state.InnerText.ToString(), doc_code.InnerText.ToString(), hdninvoice_id.Value.ToString(), dateInvoice.Value.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), shipname.Value.ToString(), shipaddr.Value.ToString(), shipgstin.Value.ToString(), shipstate.Value.ToString(), shipcode.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), note_type.Value.ToString(), Regex.Replace(txtremark.Value.ToString(), @"[^0-9a-zA-Z]+", " "), dateInvoice.Value.ToString() },
                                        "dr_cr_Id = " + "'" + jv_debit_id + "'" + ca_status_condition
                                        );
                    if (Session["page_role"] + "" == "CA")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst,
                                      new string[] { "ca_approved_status" },
                                      new string[] { "2" },
                                      "dr_cr_Id = " + jv_debit_id);
                    }

                    if (msg == "DONE")
                    {
                        MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM "+baseHealpare.TableAddDebitCreditDtl+ " WHERE refrance_id= " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' and ca_approved_status != 3");
                    reader.Close();
                    string jsonString = txthdnJson.Value.ToString();
                    var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);
                    for (int i = 0; i < dict.Count; i++)
                    {
                        dict[i]["refrance_id"] = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));
                            dict[i]["invoice_date"] = dateInvoice.Value.ToString();

                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                        baseHealpare.InsertIntoTable(baseHealpare.TableAddDebitCreditDtl,
                                                                  new string[] {"document_no", "againt_invoice", "date_of_issue", "bill_party_name", "ship_party_name", "product_name", "hsn_code", "uom", "batch", "expiry_date", "quantity", "rate", "amount", "discount", "tax_value", "igst_rate", "igst_amount", "cgst_rate", "cgst_amount", "sgst_rate", "sgst_amount", "total", "refrance_id", "invoice_date" },
                                                                   result);
                    }
                        baseHealpare.MessageBox(this, "Data Updated ");
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "Data Error " + msg);
                    }
                }

                if (chkJV_id.Checked == true)
                {

                    //MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT distinct (select account_head from pms_account_master where account_party_name ='" + sell_name.Value.ToString() + "' limit 1) as deb_head,(select account_head from pms_account_master where account_head LIKE '%SGST%') as sgst_head,(select account_head from pms_account_master where `account_head` LIKE '%CGST%') as CGST_HEAD,(select account_head from pms_account_master where account_head LIKE '%IGST%') igst_head,(select account_head from pms_account_master where `account_head` LIKE '%DEBIT%') as cre_head,  (SELECT `dr_cr_jv_id` FROM `pms_voucher_dr_cr_note_mst` WHERE `dr_cr_Id` = " + jv_debit_id + ") as jv_id FROM `pms_account_master`");
                    MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT distinct (select account_head from pms_account_master where account_party_name ='" + sell_name.Value.ToString() + "' limit 1) as deb_head,(select account_head from pms_account_master where account_head LIKE '%CGST-ITC A/C%') as sgst_head,(select account_head from pms_account_master where `account_head` LIKE '%CGST-ITC A/C%') as CGST_HEAD,(select account_head from pms_account_master where account_head LIKE '%IGST-ITC A/C%') igst_head,(select account_head from pms_account_master where `account_head` LIKE '%PURCHASE RETURN A/C%') as cre_head,  (SELECT `dr_cr_jv_id` FROM `pms_voucher_dr_cr_note_mst` WHERE `dr_cr_Id` = " + jv_debit_id + ") as jv_id FROM `pms_account_master`");
                    while (msq_reader != null && msq_reader.Read())
                    {
                        System.Collections.ArrayList session_jv = new System.Collections.ArrayList();
                        session_jv.Add(new
                        {
                            account_head = "" + msq_reader["deb_head"],
                            debit_entry = "" + total_total_amt.Value.ToString(),
                            credit_entry = "0"
                        });
                        if (!total_cgst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                        {
                            account_head = "" + msq_reader["CGST_HEAD"],
                            debit_entry = "0",
                            credit_entry = "" + total_cgst.Value.ToString()
                        });
                        if (!total_sgst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                        {
                            account_head = "" + msq_reader["sgst_head"],
                            debit_entry = "0",
                            credit_entry = "" + total_sgst.Value.ToString()
                        });
                        if (!total_igst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                        {
                            account_head = "" + msq_reader["igst_head"],
                            debit_entry = "0",
                            credit_entry = "" + total_igst.Value.ToString()
                        });
                        session_jv.Add(new
                        {
                            account_head = "" + msq_reader["cre_head"],
                            debit_entry = "0",
                            credit_entry = "" + (double.Parse(total_total_amt.Value.ToString()) - double.Parse(total_cgst.Value.ToString()) - double.Parse(total_sgst.Value.ToString()) - double.Parse(total_igst.Value.ToString()))
                        });

                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        json_obj = serializer.Serialize(session_jv);

                        Session["debit"] = new
                        {
                            session_jv = json_obj,
                            jv_id = "" + msq_reader["jv_id"],
                            main_id = jv_debit_id,
                            jv_date = dateIssue.Value.ToString()
                        };
                        Response.Redirect("/Vouchers/JournalEntry.aspx?jvtype=debit");
                    }
                    if (msq_reader != null)
                    {
                        msq_reader.Close();
                    }
                }
                else
                {
                    Response.Redirect("~/Vouchers/DebitDetails.aspx");
                }
                
            }
        }

      
        protected void btnPrintClick(object sender, EventArgs e)
        {
            // Response.Redirect("/Reports/debitPrint.aspx?value=" + baseHealpare.EncodeUrl(this, "" + hdnDOC_id.Value.ToString()));
            Response.Redirect("/Prints/DebitNotePrint.aspx?value=" + Request.QueryString["value"].ToString());

        }

        protected void cancel_event(object sender, EventArgs e)
        {
            Response.Redirect("~/Vouchers/DebitDetails.aspx");
        }
    }
}