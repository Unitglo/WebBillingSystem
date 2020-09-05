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
    public partial class SaleInvoice : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList account_master;
        public System.Collections.ArrayList display_content;
        public System.Collections.ArrayList product_name;
        public System.Collections.ArrayList purchase_master;
        public System.Collections.ArrayList setting_master;
        public System.Collections.ArrayList branch_array;
        public System.Collections.ArrayList expi_date_array;
        public System.Collections.ArrayList sale_tot_qty_array;
        public System.Collections.ArrayList party_name;
        public System.Collections.ArrayList gstno_id;
        public System.Collections.ArrayList sale_master;
        public System.Collections.ArrayList mst_series_master;
        public System.Collections.ArrayList invoice_no_master;

        public string edit_index = "0";
        public string json_gstin_name;
        public string json_Party_name;
        public string json_obj;
        public string json_display_content;
        public string json_product;
        public string json_product_name;
        public string json_purchase_obj;
        public string json_sale_obj;
        public string json_setting_obj;
        public string json_branch_obj;
        public string json_expi_date_obj;
        public string json_sale_tot_qty_obj;
        public string json_obj_mst_series;
        public string json_invoice_no;
        string invoice_series = "";
        public string jv_id = "0";
        DateTime dateTime = DateTime.UtcNow.Date;

        protected void Page_Load(object sender, EventArgs e)
        {
            breadcrumb_title.InnerHtml = "Add Invoice";
            baseHealpare = new DataBaseHealpare();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            
            if (!Page.IsPostBack)
            {
                input_date.Attributes["min"] = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
                //input_date.Attributes["max"] = Convert.ToDateTime(Session["end_date"].ToString()).ToString("yyyy-MM-dd");
                input_date.Attributes["max"] = dateTime.ToString("yyyy-MM-dd");

                input_date.Value = dateTime.ToString("yyyy-MM-dd");
                DateOfSupply_Id.Value = dateTime.ToString("yyyy-MM-dd");
                
            }
            
            if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
            {
                MySqlDataReader master_id_reader = baseHealpare.SelectManualQuery("SELECT sale_jv_id FROM `pms_sale_invoice_mst` WHERE `sale_mst_id` = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                while (master_id_reader != null && master_id_reader.Read())
                {
                    jv_id = master_id_reader["sale_jv_id"].ToString();
                }
                if (master_id_reader != null)
                {
                    master_id_reader.Close();
                }

                baseHealpare.DeleteValue(baseHealpare.TableAddSaleMst, "sale_mst_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                baseHealpare.DeleteValue(baseHealpare.TableAddSaleDtl, "reference_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));

                if (!jv_id.Equals("0"))
                {
                    Response.Redirect("/Vouchers/JournalEntry.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + jv_id));
                }
                else
                {
                    Response.Redirect("~/Vouchers/SaleDetails.aspx");
                }
            }
            MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT * FROM pms_master_settings where status = 0");
            string inv_id = null;
            while (msq_reader != null && msq_reader.Read())
            {
                termcond_Id.InnerHtml = "" + msq_reader["terms_condition_tax_invoice"];
                inv_id = "" + msq_reader["invoiceno"];
                sign_Id.InnerHtml = "" + msq_reader["authorized_signatory_tax_invoice"];
                invoice_series = "" + msq_reader["prefix_generate_invoice_no"];
                //Batch_ID.Value = "" + msq_reader["batch_wise_details_info"];
                //Expiry_Date_Id.Value = Convert.ToDateTime(msq_reader["expiry_monitoring_system_info"]).ToString("yyyy-MM-dd");
            }
            if (msq_reader != null)
            {
                msq_reader.Close();
            }

            if(invoice_series == "1")
            {
                invoice_no.Visible = false;
                inv_no_id.Visible = true;
                MySqlDataReader mst_series_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_series_table, " where generated_no = 'invoice' and status=0");
                mst_series_master = new System.Collections.ArrayList();
                invoice_no_master = new System.Collections.ArrayList();

                while (mst_series_reader != null && mst_series_reader.Read())
                {
                    mst_series_master.Add(new
                    {
                        generated_no = mst_series_reader["generated_no"],
                        series_no = mst_series_reader["series_no"],// + "" + (int.Parse(mst_series_reader["count"].ToString())+1),//mst_series_reader["series_no"],
                        count = mst_series_reader["count"],
                    });
                    invoice_no_master.Add(mst_series_reader["series_no"]+ "" + (mst_series_reader["count"]) +1);
                }
                if (mst_series_reader != null)
                {
                    mst_series_reader.Close();
                    json_obj_mst_series = serializer.Serialize(mst_series_master);
                    serializer = new JavaScriptSerializer();
                    json_invoice_no = serializer.Serialize(invoice_no_master);
                }
            }
            else
            {
                invoice_no.Visible = true;
                inv_no_id.Visible = false;
            }

            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT max(invoice_no)+1 as invoice_no FROM pms_sale_invoice_mst where status= 0");

            while (reader != null && reader.Read())
            {
                invoice_no.InnerHtml = ""+reader["invoice_no"];
            }
            if (reader != null)
            {
                reader.Close();
            }

            string cucid = "";
            if (Session["company"].ToString() != null)
            {
                cucid = Session["company"].ToString();
                lblcomp.InnerHtml = cucid + " - " + Session["company_name"];

                MySqlDataReader company_val_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, " where company_ucid='" + cucid + "'");
                while (company_val_reader != null && company_val_reader.Read())
                {
                    state_name.InnerHtml = "" + company_val_reader["company_state"];
                    state_code.InnerHtml = "" + company_val_reader["company_state_code"];
                    bankAc_Id.Value = "" + company_val_reader["company_bank_account_number"];
                    bankIFSC_id.Value = "" + company_val_reader["company_bank_ifsc_code"];
                    bank_name.Value = "" + company_val_reader["company_bank_name"];
                }
                if (company_val_reader != null)
                {
                    company_val_reader.Close();
                }
            }
            
            MySqlDataReader company_reader = baseHealpare.SelectAllValues("*, " + "(SELECT pms_account_state_name FROM pms_account_state WHERE pms_account_state_code = account_state_code) as statename", baseHealpare.TableAddAccount, " where status=0 ");
            account_master = new System.Collections.ArrayList();
            party_name = new System.Collections.ArrayList();
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
                    account_state_code = company_reader["account_state_code"],
                    account_country = company_reader["account_country"],
                    account_pin_code = company_reader["account_pin_code"],
                    account_gst_number = company_reader["account_gst_number"],
                    account_pan_number = company_reader["account_pan_number"],
                    account_cin_number = company_reader["account_cin_number"],
                    account_phone_number = company_reader["account_phone_number"],
                    account_email = company_reader["account_email"],
                    account_opening_balance = company_reader["account_opening_balance"],
                    account_opening_balance_type = company_reader["account_opening_balance_type"]                    
                });

                party_name.Add(company_reader["account_party_name"]);
                gstno_id.Add(company_reader["account_gst_number"]);
            }
            if (company_reader != null)
            {
                company_reader.Close();
               
                json_obj = serializer.Serialize(account_master);
                serializer = new JavaScriptSerializer();
                json_Party_name = serializer.Serialize(party_name);
                json_gstin_name = serializer.Serialize(gstno_id);
            }
           
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
                    stock_mrp = company_reader["stock_mrp"],
                    stock_product_name = company_reader["stock_product_name"],
                    stock_unit_of_measurment = company_reader["stock_unit_of_measurment"],
                    stock_reorder_quantity = company_reader["stock_reorder_quantity"],
                    stock_minimum_stock_reminder = company_reader["stock_minimum_stock_reminder"],
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
            if (company_reader != null)
            {
                company_reader.Close();
                serializer = new JavaScriptSerializer();
                json_product = serializer.Serialize(account_master);
                serializer = new JavaScriptSerializer();
                json_product_name = serializer.Serialize(product_name);
            }
            company_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status=0");
            setting_master = new System.Collections.ArrayList();
            while (company_reader != null && company_reader.Read())
            {
                setting_master.Add(new
                {
                    authorized_signatory_tax_invoice = company_reader["authorized_signatory_tax_invoice"],
                    authorized_signatory_other_voucher = company_reader["authorized_signatory_other_voucher"],
                    mrp_details = company_reader["mrp_details"],
                    sale_price_details = company_reader["sale_price_details"],
                    expiry_monitoring_system = company_reader["expiry_monitoring_system"],
                    expiry_details_tax_invoice = company_reader["expiry_details_tax_invoice"],
                    batch_wise_details = company_reader["batch_wise_details"],
                    batch_wise_details_tax_invoice = company_reader["batch_wise_details_tax_invoice"],
                    stock_out_method = company_reader["stock_out_method"],
                    unit_conversion_method_required = company_reader["unit_conversion_method_required"],
                    journal_accounting_entry = company_reader["journal_accounting_entry"],
                    extra_information_tax_invoice = company_reader["extra_information_tax_invoice"],
                    caption_name1 = company_reader["caption_name1"],
                    currency_sign_before_amount = company_reader["currency_sign_before_amount"],
                    prefix_generate_invoice_no = company_reader["prefix_generate_invoice_no"],
                    prefix_generate_debit_no = company_reader["prefix_generate_debit_no"],
                    prefix_generate_credit_no = company_reader["prefix_generate_credit_no"],
                    
                });
            }
            if (company_reader != null)
            {
                company_reader.Close();
                serializer = new JavaScriptSerializer();
                json_setting_obj = serializer.Serialize(setting_master);
            }

            //MySqlDataReader batch_drop_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, " where status !=2");
            MySqlDataReader batch_drop_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl);
            branch_array = new System.Collections.ArrayList();
            while (batch_drop_reader != null && batch_drop_reader.Read())
            {
                string invoice_date = "";
                if (batch_drop_reader["invoice_date"].ToString() == "") {
                    invoice_date = "2020-01-01";
                }
                else{
                    invoice_date = batch_drop_reader["invoice_date"].ToString();
                }
                branch_array.Add(new
                {
                    product_desc = batch_drop_reader["product_desc"],
                    batch = batch_drop_reader["batch"],
                    invoice_date = Convert.ToDateTime(invoice_date).ToString("yyyy-MM-dd"),
                    qty = batch_drop_reader["qty"],
                    expiry_date = Convert.ToDateTime(batch_drop_reader["expiry_date"].ToString()).ToString("yyyy-MM-dd")
                });
            }
            if (batch_drop_reader != null)
            {
                batch_drop_reader.Close();
                serializer = new JavaScriptSerializer();
                json_branch_obj = serializer.Serialize(branch_array);
            }

            //MySqlDataReader sale_batch_qty_tot_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleDtl, " where status !=2");
            MySqlDataReader sale_batch_qty_tot_reader = baseHealpare.SelectManualQuery("select * from pms_sale_invoice_dtl LEFT JOIN pms_sale_invoice_mst ON sale_mst_id = reference_id where pms_sale_invoice_mst.status != 2");
            //MySqlDataReader sale_batch_qty_tot_reader = baseHealpare.SelectManualQuery("SELECT SUM(pms_purchase_invoice_dtl.qty)-SUM(pms_sale_invoice_dtl.qty) bal_qty, pms_purchase_invoice_dtl.batch batch, pms_purchase_invoice_dtl.product_desc product_desc FROM pms_purchase_invoice_dtl LEFT JOIN pms_sale_invoice_dtl ON pms_sale_invoice_dtl.product_desc = pms_purchase_invoice_dtl.product_desc AND pms_sale_invoice_dtl.expiry_date = pms_purchase_invoice_dtl.expiry_date and pms_sale_invoice_dtl.batch = pms_purchase_invoice_dtl.batch WHERE pms_purchase_invoice_dtl.status != 2 GROUP BY pms_purchase_invoice_dtl.expiry_date, pms_purchase_invoice_dtl.batch");
            sale_tot_qty_array = new System.Collections.ArrayList();
            while (sale_batch_qty_tot_reader != null && sale_batch_qty_tot_reader.Read())
            {
                sale_tot_qty_array.Add(new
                {
                   product_desc = sale_batch_qty_tot_reader["product_desc"],
                   qty = sale_batch_qty_tot_reader["qty"],
                   batch = sale_batch_qty_tot_reader["batch"],
                   invoice_date = sale_batch_qty_tot_reader["invoice_date"]                   
                });
            }
            if (sale_batch_qty_tot_reader != null)
            {
                sale_batch_qty_tot_reader.Close();
                serializer = new JavaScriptSerializer();
                json_sale_tot_qty_obj = serializer.Serialize(sale_tot_qty_array);
            }

            //==============code for view data==========================
            if (Request.QueryString.Count == 0)
            {
                breadcrumb_title.InnerHtml = "Add Sale";
                MySqlDataReader Max_Date_reader = baseHealpare.SelectManualQuery("SELECT MAX(invoice_date) as invoiceDate FROM pms_sale_invoice_mst WHERE status = 0");
                while (Max_Date_reader != null && Max_Date_reader.Read())
                {
                    try
                    {
                        input_date.Attributes["min"] = Convert.ToDateTime(Max_Date_reader["invoiceDate"].ToString()).ToString("yyyy-MM-dd");
                    }
                    catch (Exception)
                    {
                        input_date.Attributes["min"] = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
                    }
                    
                }

            }
            else
            {
                if (!Page.IsPostBack)
                {
                    breadcrumb_title.InnerHtml = "Update Sale";
                    int cnt = 0;
                    string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleMst, "where sale_mst_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' "+ ca_status_condition);
                    while (update_reader != null && update_reader.Read())
                    {
                        cnt++;
                        invoice_no.InnerHtml = update_reader["invoice_no"].ToString();
                        input_date.Value = Convert.ToDateTime(update_reader["invoice_date"].ToString()).ToString("yyyy-MM-dd");
                        reverse_charge.SelectedIndex = reverse_charge.Items.IndexOf(reverse_charge.Items.FindByText(update_reader["reverse_charge"].ToString()));
                        state_name.InnerHtml = update_reader["i_state"].ToString();
                        state_code.InnerHtml = update_reader["statecode"].ToString();
                        txtTransportMode.Value = update_reader["transport_mode"].ToString();
                        VehicleNumber_Id.Value = update_reader["vehicle_no"].ToString();
                        DateOfSupply_Id.Value = Convert.ToDateTime(update_reader["date_of_supply"].ToString()).ToString("yyyy-MM-dd");
                        PlaceOfSupply_Id.Value = update_reader["place_of_supply"].ToString();
                        Bill_Party_Name_Id.Value = update_reader["seller_name"].ToString();
                        Bill_Party_address_id.InnerHtml = update_reader["Seller_address"].ToString();
                        Bill_Party_gstin_id.Value = update_reader["gstin"].ToString();
                        Bill_Party_state_id.InnerHtml = update_reader["s_state"].ToString();
                        Bill_Party_stateCode_Id.InnerHtml = update_reader["state_code"].ToString();
                        string shipName = update_reader["ship_party_name"].ToString();
                        ship_party_id.SelectedIndex = ship_party_id.Items.IndexOf(ship_party_id.Items.FindByValue(shipName));
                        ship_party_address_id.InnerHtml = update_reader["ship_party_address"].ToString();
                        ship_party_gstin_id.Value = update_reader["ship_party_gstin"].ToString();
                        ship_party_state_id.InnerHtml = update_reader["ship_party_state"].ToString();
                        ship_party_statecode_id.InnerHtml = update_reader["ship_party_state_code"].ToString();
                        txtremark.Value = update_reader["remark"].ToString();
                        selectPayMode.SelectedIndex = selectPayMode.Items.IndexOf(selectPayMode.Items.FindByText(update_reader["payment_mode"].ToString()));
                        selectPayStatus.SelectedIndex = selectPayStatus.Items.IndexOf(selectPayStatus.Items.FindByText(update_reader["payment_status"].ToString()));
                    }


                    update_reader.Close();
                    if (invoice_series == "1")
                    {
                        invoice_no_master.Add("" + invoice_no.InnerText);
                        mst_series_master.Add(new
                        {
                            generated_no = "invoice",
                            series_no = invoice_no.InnerText,
                            count = -1
                        });
                        json_obj_mst_series = serializer.Serialize(mst_series_master);
                        serializer = new JavaScriptSerializer();
                        json_invoice_no = serializer.Serialize(invoice_no_master);
                    }

                    if (cnt > 0)
                    {
                        reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleDtl, " where reference_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                        purchase_master = new System.Collections.ArrayList();

                        while (reader != null && reader.Read())
                        {
                            purchase_master.Add(new
                            {
                                invoice_no = reader["invoice_no"],
                                batch = reader["batch"],
                                expiry_date = Convert.ToDateTime(reader["expiry_date"].ToString()).ToString("yyyy-MM-dd"),
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
                    }
                    else
                    {
                        baseHealpare.MessageBox(this,"You Dont Have Permission To Update Data is already Approved..!!!");
                    }
                }


                MySqlDataReader sale_update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleMst, "where sale_mst_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                sale_master = new System.Collections.ArrayList();
                while (sale_update_reader != null && sale_update_reader.Read())
                {
                    sale_master.Add(new
                    {
                        ship_party_id = sale_update_reader["ship_party_name"]
                        
                    });
                }
                if (reader != null)
                {
                    reader.Close();
                    serializer = new JavaScriptSerializer();
                    json_sale_obj = serializer.Serialize(sale_master);

                }

            }
        }
        
        string jv_sale_id = "";
        protected void submit_sale_details_event(object sender, EventArgs e)
        {
            {
                if (Request.QueryString.Count == 0)
                {
                    Random r = new Random();
                    var cont = r.Next(0, 1000000);
                    if (invoice_series == "1")
                    {
                        var a = series_id.Value.ToString();
                        MySqlDataReader cnt_reader = baseHealpare.SelectManualQuery("SELECT (count+1) as cnt FROM pms_master_setting_all_prefix_series_number WHERE series_no = " + "'" + a + "' and status!=2");
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

                    string reference_id = baseHealpare.InsertIntoTableGetID(baseHealpare.TableAddSaleMst,
                                        new string[] { "invoice_no", "invoice_irn_no", "sale_invoice_type", "invoice_date", "reverse_charge", "i_state", "statecode", "transport_mode", "vehicle_no", "date_of_supply", "place_of_supply", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "bank_name", "bank_ac_no", "bank_ifsc_code", "company_name", "terms_and_condition", "auth_name", "payment_mode", "payment_status", "remark" },
                                        new string[] { series_id.Value.ToString(), Invoice_IRN_No_id.Value.ToString(), Invoice_type_id.Value.ToString(), input_date.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), txtTransportMode.Value, VehicleNumber_Id.Value, DateOfSupply_Id.Value, PlaceOfSupply_Id.Value, billname.Value, billaddr.Value.ToString(), billgstin.Value.ToString(), billstate.Value.ToString(), billcode.Value.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), bank_name.Value.ToString(), bankAc_Id.Value.ToString(), bankIFSC_id.Value.ToString(), hdn_company_id.Value.ToString(), terms_and_condition_id.Value.ToString(), hdn_auth_name_id.Value.ToString(), payment_mode.Value.ToString(), payment_status.Value.ToString(), Regex.Replace(txtremark.Value.ToString(), @"[^0-9a-zA-Z]+", " ") }
                                        );
                    if (Regex.IsMatch(reference_id, "^[0-9]+$"))
                    {
                        jv_sale_id = reference_id;
                        string jsonString = txthdnJson.Value.ToString();
                        var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                        for (int i = 0; i < dict.Count; i++)
                        {
                            dict[i]["reference_id"] = reference_id;
                            dict[i]["INVOICENO"] = series_id.Value.ToString();
                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                            string[] keys = dict[i].Select(kv => kv.Key.ToString()).ToArray();

                            baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddSaleDtl,
                                                                            new string[] { "invoice_no", "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "rate", "amount", "discount", "tax_val", "igst_rate", "igst_amt", "cgst_rate", "cgst_amt", "sgst_rate", "sgst_amount", "reference_id" },
                                                    result));
                        }
                    }
                }
                else
                {
                    jv_sale_id = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));
                    string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                    string msg = baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst,
                                 new string[] { "invoice_irn_no", "sale_invoice_type", "invoice_date", "reverse_charge", "i_state", "statecode", "transport_mode", "vehicle_no", "date_of_supply", "place_of_supply", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "bank_name", "bank_ac_no", "bank_ifsc_code", "company_name", "terms_and_condition", "auth_name", "payment_mode", "payment_status", "remark" },
                                 new string[] { Invoice_IRN_No_id.Value.ToString(), Invoice_type_id.Value.ToString(), input_date.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), txtTransportMode.Value, VehicleNumber_Id.Value, DateOfSupply_Id.Value, PlaceOfSupply_Id.Value, billname.Value, billaddr.Value.ToString(), billgstin.Value.ToString(), billstate.Value.ToString(), billcode.Value.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), bank_name.Value.ToString(), bankAc_Id.Value.ToString(), bankIFSC_id.Value.ToString(), hdn_company_id.Value.ToString(), terms_and_condition_id.Value.ToString(), hdn_auth_name_id.Value.ToString(), payment_mode.Value.ToString(), payment_status.Value.ToString(), Regex.Replace(txtremark.Value.ToString(), @"[^0-9a-zA-Z]+", " ") },
                                 "sale_mst_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' " + ca_status_condition
                );

                    if (Session["page_role"] + "" == "CA")
                    {
                        baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst,
                                      new string[] { "ca_approved_status" },
                                      new string[] { "2" },
                                      "sale_mst_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    }

                    if (msg == "DONE")
                    {

                        MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM pms_sale_invoice_dtl WHERE reference_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' and ca_approved_status != 3");
                        if (reader != null)
                        {
                            reader.Close();
                        }
                        string jsonString = txthdnJson.Value.ToString();
                        var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                        for (int i = 0; i < dict.Count; i++)
                        {
                            dict[i]["reference_id"] = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));

                            string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();


                            baseHealpare.InsertIntoTable(baseHealpare.TableAddSaleDtl,
                                               new string[] { "invoice_no", "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "rate", "amount", "discount", "tax_val", "igst_rate", "igst_amt", "cgst_rate", "cgst_amt", "sgst_rate", "sgst_amount", "reference_id" },
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
                    MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT " +
                      "(select account_head from pms_account_master where account_party_name ='" + billname.Value.ToString() + "' limit 1) as sell_head," +
                      "(select account_head from pms_account_master where account_head LIKE '%SGST-OTL A/C%' limit 1) as sgst_head," +
                      "(select account_head from pms_account_master where account_head LIKE '%CGST-OTL A/C%' limit 1) as CGST_HEAD," +
                      "(select account_head from pms_account_master where account_head LIKE '%IGST-OTL A/C%' limit 1) igst_head," +
                      "(select account_head from pms_account_master where account_head LIKE '%SALES A/C%' limit 1) as purc_head, " +
                      "(SELECT sale_jv_id FROM `pms_sale_invoice_mst` WHERE sale_mst_id = " + jv_sale_id + ") as jv_id");

                    while (msq_reader != null && msq_reader.Read())
                    {
                        System.Collections.ArrayList session_jv = new System.Collections.ArrayList();
                        session_jv.Add(new
                        {
                            account_head = "" + msq_reader["sell_head"],
                            debit_entry = "" + total_total_amt.Value.ToString(),
                            credit_entry = "0"
                        });

                        if (!total_cgst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                            {
                                account_head = "" + msq_reader["CGST_HEAD"],
                                debit_entry = "0",
                                credit_entry = "" + total_cgst.Value.ToString(),
                            });
                        if (!total_sgst.Value.ToString().Equals("0.00"))
                            session_jv.Add(new
                            {
                                account_head = "" + msq_reader["sgst_head"],
                                debit_entry = "0",
                                credit_entry = "" + total_sgst.Value.ToString(),
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
                            account_head = "" + msq_reader["purc_head"],
                            debit_entry = "0",
                            credit_entry = "" + (double.Parse(total_cost.Value.ToString()) - double.Parse(total_cgst.Value.ToString()) - double.Parse(total_sgst.Value.ToString()) - double.Parse(total_igst.Value.ToString())),
                        });

                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        json_obj = serializer.Serialize(session_jv);

                        Session["sales"] = new
                        {
                            session_jv = json_obj,
                            //account_head = "" + msq_reader["sell_head"],
                            //    total_cost = "" + (float.Parse(total_cost.Value.ToString()) - float.Parse(total_cgst.Value.ToString()) - float.Parse(total_sgst.Value.ToString()) - float.Parse(total_igst.Value.ToString())),
                            //    cgt_account_head = "" + msq_reader["CGST_HEAD"],
                            //    cgst_amt = "" + total_cgst.Value.ToString(),
                            //    sgt_account_head = "" + msq_reader["sgst_head"],
                            //    sgst_amt = "" + total_sgst.Value.ToString(),
                            //    igt_account_head = "" + msq_reader["igst_head"],
                            //    igst_amt = "" + total_igst.Value.ToString(),
                            //    seller_account_head = msq_reader["purc_head"],
                            //    total_amt = "" + total_cost.Value.ToString(),
                            jv_id = "" + msq_reader["jv_id"],
                            main_id = jv_sale_id,
                            jv_date = input_date.Value.ToString()
                        };
                        Response.Redirect("/Vouchers/JournalEntry.aspx?jvtype=sales");
                    }
                    msq_reader.Close();
                }
                else
                {
                    Response.Redirect("~/Vouchers/SaleDetails.aspx");
                }
            }
        }

        protected void btnPrintClick(object sender, EventArgs e)
        {
            Response.Redirect("/Reports/SalePrint.aspx?value=" + baseHealpare.EncodeUrl(this, "" + hdn_invoice_id.Value.ToString()));
        }

        protected void cancel_event(object sender, EventArgs e)
        {
            Response.Redirect("~/Vouchers/SaleDetails.aspx");
        }

        protected void yes_event(object sender, EventArgs e)
        {
            baseHealpare.InsertIntoTable(baseHealpare.TableAddAccount,
                                                new string[] { "account_head", "account_main_group", "account_sub_group", "account_party_name", "account_add_one", "account_state", "account_state_code", "account_gst_number", "account_opening_balance", "account_opening_balance_type" },
                                                new string[] { billname.Value, "Share Holder Fund", "Share Capital", billname.Value, billaddr.Value.ToString(), billstate.Value.ToString(), billcode.Value.ToString(), billgstin.Value.ToString(), "0", "Credit" }
                                        );
            Response.Redirect("/Vouchers/SaleInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, "" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))));
        }
        
    }
}