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
    public partial class SalePrint : System.Web.UI.Page
    {
DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList account_master;
        public System.Collections.ArrayList display_content;
        public System.Collections.ArrayList product_name;
        public System.Collections.ArrayList purchase_master;
        public System.Collections.ArrayList setting_master;
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
        public string json_obj_mst_series;
        public string json_invoice_no;
        string invoice_series = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
            {
                MySqlDataReader delete_reader = baseHealpare.SelectManualQuery("DELETE FROM `pms_sale_invoice_mst` WHERE `sale_mst_id` = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                delete_reader.Close();
                delete_reader = baseHealpare.SelectManualQuery("DELETE FROM pms_sale_invoice_dtl WHERE reference_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                delete_reader.Close();
                Response.Redirect("~/Vouchers/SaleDetails.aspx");
            }

            DateTime dateTime = DateTime.UtcNow.Date;
            input_date.Value = dateTime.ToString("yyyy-MM-dd");
            DateOfSupply_Id.Value = dateTime.ToString("yyyy-MM-dd");
           
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
                        series_no = mst_series_reader["series_no"] + "" + (int.Parse(mst_series_reader["count"].ToString())+1),//mst_series_reader["series_no"],
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

            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT count(*)+1 as invoice_no FROM pms_sale_invoice_mst where status= 0");

            while (reader != null && reader.Read())
            {
                invoice_no.InnerHtml = inv_id + "" + reader["invoice_no"];
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
                    //company_name.InnerHtml= company_val_reader["company_surname"]+" "+company_val_reader["company_middle_name"]+" "+company_val_reader["company_middle_name"];
                    //company_val_reader["company_surname"];

                    lblCompName.InnerHtml = "" + company_val_reader["company_surname"] + " " + company_val_reader["company_middle_name"] + " " + company_val_reader["company_middle_name"];
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
            MySqlDataReader company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status=0");
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
                    stock_product_name = company_reader["stock_product_name"],
                    stock_unit_of_measurment = company_reader["stock_unit_of_measurment"],
                    stock_reorder_quantity = company_reader["stock_reorder_quantity"],
                    stock_minimum_stock_reminder = company_reader["stock_minimum_stock_reminder"],
                    stock_sale_price_without_gst = company_reader["stock_sale_price_without_gst"],


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
            
                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleMst, "where sale_mst_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    while (update_reader != null && update_reader.Read())
                    {
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
                        //ship_party_id.SelectedIndex = ship_party_id.Items.FindByText(shipName);
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
                        //edit_index = "" + (invoice_no_master.Count - 1);
                    }
                    

                    reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleDtl, " where reference_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    purchase_master = new System.Collections.ArrayList();

                    while (reader != null && reader.Read())
                    {
                        purchase_master.Add(new
                        {
                            invoice_no = reader["invoice_no"],
                            seller_no = reader["seller_no"],
                            //statecode = reader["statecode"],
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

                


                MySqlDataReader sale_update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleMst, "where sale_mst_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                sale_master = new System.Collections.ArrayList();
                while (sale_update_reader != null && sale_update_reader.Read())
                {
                    sale_master.Add(new
                    {
                        invoice_no = sale_update_reader["invoice_no"],
                        //input_date = Convert.ToDateTime(sale_update_reader["invoice_date"].ToString()).ToString("yyyy-MM-dd");
                        reverse_charge = sale_update_reader["reverse_charge"],
                        state_name = sale_update_reader["i_state"],
                        state_code = sale_update_reader["statecode"],
                        txtTransportMode = sale_update_reader["transport_mode"],
                        VehicleNumber_Id = sale_update_reader["vehicle_no"],
                        //DateOfSupply_Id = Convert.ToDateTime(sale_update_reader["date_of_supply"].ToString()).ToString("yyyy-MM-dd");
                        PlaceOfSupply_Id = sale_update_reader["place_of_supply"],
                        Bill_Party_Name_Id = sale_update_reader["seller_name"],
                        Bill_Party_address_id = sale_update_reader["Seller_address"],
                        Bill_Party_gstin_id = sale_update_reader["gstin"],
                        Bill_Party_state_id = sale_update_reader["s_state"],
                        Bill_Party_stateCode_Id = sale_update_reader["state_code"],

                        ship_party_id = sale_update_reader["ship_party_name"],
                        ship_party_address_id = sale_update_reader["ship_party_address"],
                        ship_party_gstin_id = sale_update_reader["ship_party_gstin"],
                        ship_party_state_id = sale_update_reader["ship_party_state"],
                        ship_party_statecode_id = sale_update_reader["ship_party_state_code"],
                        txtremark = sale_update_reader["remark"],
                        selectPayMode = sale_update_reader["payment_mode"],
                        selectPayStatus = sale_update_reader["payment_status"],

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
}