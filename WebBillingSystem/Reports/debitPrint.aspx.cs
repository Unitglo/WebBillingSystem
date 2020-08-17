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
    public partial class debitPrint : System.Web.UI.Page
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

        public string json_dr_obj;
        public string json_setting_obj;
        public string json_debit_obj;
        public string json_obj;
        public string json_display_content;
        public string json_product;
        public string json_product_name;
        public string json_purchase_sale_obj;

        public string json_obj_mst_series;
        public string json_debit_no;
        string invoice_series = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (Request.QueryString["value"] != null && Request.QueryString["saleRet"] != null)
            {
                Header_ID.InnerHtml = "Sale Return";
            }
            
            DateTime dateTime = DateTime.UtcNow.Date;
            dateIssue.Value = dateTime.ToString("yyyy-MM-dd");
            dateInvoice.Value = dateTime.ToString("yyyy-MM-dd");

            MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT * FROM pms_master_settings");

            string dr_id = null;
            while (msq_reader != null && msq_reader.Read())
            {
                dr_id = "" + msq_reader["debitno"];
                termcond_Id.InnerHtml = "" + msq_reader["terms_condition_tax_invoice"];
                sign_Id.InnerHtml = "" + msq_reader["authorized_signatory_tax_invoice"];
                invoice_series = "" + msq_reader["prefix_generate_invoice_no"];
                //Batch_ID.Value = "" + msq_reader["batch_wise_details_info"];
                //Expiry_Date_Id.Value = Convert.ToDateTime(msq_reader["expiry_monitoring_system_info"]).ToString("yyyy-MM-dd");
            }
            msq_reader.Close();
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT count(*)+1 as debit_no FROM pms_voucher_dr_cr_note_mst where note_type ='debit' ");

            while (reader != null && reader.Read())
            {
                doc_no.InnerHtml = dr_id + "" + reader["debit_no"];
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
                    lblCompName.InnerHtml = "" + comp_reader["company_surname"] + " " + comp_reader["company_middle_name"] + " " + comp_reader["company_middle_name"];
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

            MySqlDataReader company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status=0");
            account_master = new System.Collections.ArrayList();


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
                    account_state = company_reader["account_state"],
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
            }
            company_reader.Close();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            json_obj = serializer.Serialize(account_master);
            display_content = new System.Collections.ArrayList();
            display_content.Add(new
            {
                account_head = "Account Head ",
                account_main_group = "Account Main Group",
                account_sub_group = "Account Sub Group",
                account_party_name = "Account Party Name"
            });
            serializer = new JavaScriptSerializer();
            json_display_content = serializer.Serialize(display_content);

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
                        series_no = mst_series_reader["series_no"] + "" + (int.Parse(mst_series_reader["count"].ToString()) + 1),//mst_series_reader["series_no"],
                        count = mst_series_reader["count"]
                    });
                    debit_no_master.Add(mst_series_reader["series_no"] + "" + (mst_series_reader["count"]) + 1);
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
                
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    
                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditMst, "where dr_cr_Id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    while (update_reader != null && update_reader.Read())
                    {
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
                    update_reader.Close();
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
                    //update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditDtl, "where refrance_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    //while (update_reader != null && update_reader.Read())
                    //{
                    //    txtproduct_name.Value = update_reader["product_name"].ToString();
                    //    lblhsncode.InnerHtml = update_reader["hsn_code"].ToString();
                    //    lblgst_rate.InnerHtml = update_reader["rate"].ToString();
                    //    lbluom.InnerHtml = update_reader["uom"].ToString();
                    //    Batch_ID.Value = update_reader["batch"].ToString();
                    //    //Expiry_Date_Id.Value = Convert.ToDateTime(update_reader["expiry_date"].ToString()).ToString("yyyy-MM-dd");
                    //    txtAmount.Value = update_reader["amount"].ToString();
                    //    txtQty.Value = update_reader["quantity"].ToString();
                    //    //string total = int.Parse(update_reader["amount"].ToString()) * int.Parse(update_reader["qty"].ToString());
                    //    //lblTotal.InnerHtml = "20";
                    //    txtdisc.Value = update_reader["discount"].ToString();

                    //}


                    update_reader.Close();
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
        }

    }

}