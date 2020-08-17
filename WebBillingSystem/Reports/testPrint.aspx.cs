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
    public partial class testPrint : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList account_master;
        public System.Collections.ArrayList display_content;
        public System.Collections.ArrayList product_name;
        public System.Collections.ArrayList purchase_master;
        public System.Collections.ArrayList setting_master;
        public System.Collections.ArrayList purchasemaster;

        public string json_obj;
        public string json_display_content;
        public string json_product;
        public string json_product_name;
        public string json_purchase_obj;
        public string json_setting_obj;
        public string json_pur_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            //Session["companyucid"] ;
            DateTime dateTime = DateTime.UtcNow.Date;
            input_date.Value = dateTime.ToString("yyyy-MM-dd");


            string cucid = "";
            if (Session["company"].ToString() != null)
            {
                cucid = Session["company"].ToString();
                //lblcomp.InnerHtml = cucid + " - " + Session["company_name"];


                MySqlDataReader comp_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, " where company_ucid='" + cucid + "'");

                while (comp_reader != null && comp_reader.Read())
                {
                    //company_name.InnerHtml= comp_reader["company_surname"]+" "+comp_reader["company_middle_name"]+" "+comp_reader["company_middle_name"];
                    //comp_reader["company_surname"];
                    state_name.InnerHtml = "" + comp_reader["company_state"];
                    state_code.InnerHtml = "" + comp_reader["company_state_code"];
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
                    account_add_on = company_reader["account_add_one"],
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


                });
                product_name.Add(company_reader["stock_product_name"]);
            }
            company_reader.Close();
            serializer = new JavaScriptSerializer();
            json_product = serializer.Serialize(account_master);
            serializer = new JavaScriptSerializer();
            json_product_name = serializer.Serialize(product_name);


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


            //==============code for view data==========================
                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, "where invoice_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    while (update_reader != null && update_reader.Read())
                    {
                        invoice_no.Value = update_reader["invoice_no"].ToString();
                        input_date.Value = Convert.ToDateTime(update_reader["invoice_date"].ToString()).ToString("yyyy-MM-dd");
                        reverse_charge.SelectedIndex = reverse_charge.Items.IndexOf(reverse_charge.Items.FindByText(update_reader["reverse_charge"].ToString()));
                        state_name.InnerHtml = update_reader["i_state"].ToString();
                        state_code.InnerHtml = update_reader["statecode"].ToString();
                        sellername.SelectedIndex = sellername.Items.IndexOf(sellername.Items.FindByValue(update_reader["seller_name"].ToString()));
                        selleraddress.InnerHtml = update_reader["Seller_address"].ToString();
                        gst_in.Value = update_reader["gstin"].ToString();
                        sellerstate.InnerHtml = update_reader["s_state"].ToString();
                        sellerstate_code.InnerHtml = update_reader["state_code"].ToString();
                        txtremark.Value = update_reader["remark"].ToString();
                        selectPayMode.SelectedIndex = selectPayMode.Items.IndexOf(selectPayMode.Items.FindByText(update_reader["payment_mode"].ToString()));
                        selectPayStatus.SelectedIndex = selectPayStatus.Items.IndexOf(selectPayStatus.Items.FindByText(update_reader["payment_status"].ToString()));
                    }


                    update_reader.Close();

                    update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, "where invoice_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    while (update_reader != null && update_reader.Read())
                    {
                        txtproduct_name.Value = update_reader["product_desc"].ToString();
                        lblhsncode.InnerHtml = update_reader["hsn_code"].ToString();
                        lblgst_rate.InnerHtml = update_reader["rate"].ToString();
                        lbluom.InnerHtml = update_reader["uom"].ToString();
                        Batch_ID.Value = update_reader["batch"].ToString();
                        //Expiry_Date_Id.Value = Convert.ToDateTime(update_reader["expiry_date"].ToString()).ToString("yyyy-MM-dd");
                        txtAmount.Value = update_reader["amount"].ToString();
                        txtQty.Value = update_reader["qty"].ToString();
                        //string total = int.Parse(update_reader["amount"].ToString()) * int.Parse(update_reader["qty"].ToString());
                        //lblTotal.InnerHtml = "20";
                        txtdisc.Value = update_reader["discount"].ToString();

                    }


                    update_reader.Close();


                    MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, " where invoice_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    purchase_master = new System.Collections.ArrayList();

                    while (reader != null && reader.Read())
                    {
                        purchase_master.Add(new
                        {
                            invoice_no = reader["invoice_no"],
                            seller_no = reader["seller_no"],
                            statecode = reader["statecode"],
                            product_desc = reader["product_desc"],
                            hsn_code = reader["hsn_code"],
                            qty = reader["qty"],
                            rate = reader["rate"],
                            amount = reader["amount"],
                            discount = reader["discount"],
                            tax_val = reader["tax_val"],
                            igst_rate = reader["igst_rate"],
                            igst_amt = reader["igst_amt"],
                            cgst_rate = reader["cgst_rate"],
                            cgst_amt = reader["cgst_amt"],
                            sgst_rate = reader["sgst_rate"],
                            sgst_amount = reader["sgst_amount"],
                            uom = reader["uom"],

                        });
                    }
                    if (reader != null)
                    {
                        reader.Close();
                        serializer = new JavaScriptSerializer();
                        json_purchase_obj = serializer.Serialize(purchase_master);

                    }

                    MySqlDataReader purchase_update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, "where invoice_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    //MySqlDataReader purchase_update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, "where invoice_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    purchasemaster = new System.Collections.ArrayList();
                    while (purchase_update_reader != null && purchase_update_reader.Read())
                    {
                        purchasemaster.Add(new
                        {
                            sellername = purchase_update_reader["seller_name"],
                        });
                    }

                    if (purchase_update_reader != null)
                    {
                        purchase_update_reader.Close();
                        serializer = new JavaScriptSerializer();
                        json_pur_obj = serializer.Serialize(purchasemaster);

                    }

                }
            

        

        protected void submit_account_details_event(object sender, EventArgs e)
        {


            if (Request.QueryString.Count == 0)
            {
                baseHealpare.MessageBox(this, "Data Adding" + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseMst,
                                    new string[] { "invoice_no", "invoice_date", "reverse_charge", "i_state", "statecode", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "payment_mode", "payment_status", "invoice_type", "remark" },
                                    new string[] { invoice_no.Value.ToString(), input_date.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), payment_mode.Value.ToString(), payment_status.Value.ToString(), invoice_type.Value.ToString(), txtremark.Value.ToString() }));

                string jsonString = txthdnJson.Value.ToString();
                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                for (int i = 0; i < dict.Count; i++)
                {
                    string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();



                    //baseHealpare.MessageBox(this, "" + result);

                    baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseDtl,
                                        new string[] { "invoice_no", "seller_no", "statecode", "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "rate", "amount", "discount", "tax_val", "igst_rate", "igst_amt", "cgst_rate", "cgst_amt", "sgst_rate", "sgst_amount", "status", "invoice_type" },
                                         result));
                }
            }
            else
            {

                baseHealpare.MessageBox(this, "Data Updated " + baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst,
                                    new string[] { "invoice_date", "reverse_charge", "i_state", "statecode", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "payment_mode", "payment_status", "invoice_type", "remark" },
                                    new string[] { input_date.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), payment_mode.Value.ToString(), payment_status.Value.ToString(), invoice_type.Value.ToString(), txtremark.Value.ToString() },
                                    "invoice_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'"
                  ));

                string jsonString = txthdnJson.Value.ToString();
                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);


                MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM pmc_stock_purchase_dtl WHERE invoice_no = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                

                for (int i = 0; i < dict.Count; i++)
                {
                    string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();


                    baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseDtl,
                                            new string[] { "invoice_no", "seller_no", "statecode", "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "rate", "amount", "discount", "tax_val", "igst_rate", "igst_amt", "cgst_rate", "cgst_amt", "sgst_rate", "sgst_amount", "status", "invoice_type" },
                                             result
                     ));

                }

            }

            }
        
        protected void btnPrintClick(object sender, EventArgs e)
        {
        }

    }
}