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
    public partial class PurchaseInvoice : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList account_master;
        public System.Collections.ArrayList display_content;
        public System.Collections.ArrayList product_name;
        public System.Collections.ArrayList purchase_master;
        public System.Collections.ArrayList setting_master;
        public System.Collections.ArrayList purchasemaster;
        public System.Collections.ArrayList gstno_id;

        public string json_obj;
        public string json_display_content;
        public string json_product;
        public string json_product_name;
        public string json_purchase_obj;
        public string json_setting_obj;
        public string json_pur_obj;
        public string jv_id = "0";
        public string json_gstin_name;

        protected void Page_Load(object sender, EventArgs e)
        {
            breadcrumb_title.InnerHtml = "Add Invoice";
            baseHealpare = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {
                input_date.Attributes["min"] = Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy-MM-dd");
                input_date.Attributes["max"] = Convert.ToDateTime(Session["end_date"].ToString()).ToString("yyyy-MM-dd");

                if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
                {                    
                    MySqlDataReader master_id_reader = baseHealpare.SelectManualQuery("SELECT purchase_journal_id FROM `pms_purchase_invoice_mst` WHERE pur_mst_auto_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    while (master_id_reader != null && master_id_reader.Read())
                    {
                        jv_id = master_id_reader["purchase_journal_id"].ToString();
                    }
                    if (master_id_reader != null)
                    {
                        master_id_reader.Close();
                    }

                    baseHealpare.DeleteValue(baseHealpare.TableAddStockPuchaseMst, "pur_mst_auto_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    baseHealpare.DeleteValue(baseHealpare.TableAddStockPuchaseDtl, "invoice_type = 'purchase' AND reference_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));

                    if (!jv_id.Equals("0"))
                    {
                        Response.Redirect("/Vouchers/JournalEntry.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + jv_id));
                    }
                    else
                    {
                        Response.Redirect("~/Vouchers/PurchaseDetails.aspx");
                    }
                }

                DateTime dateTime = DateTime.UtcNow.Date;
                input_date.Value = dateTime.ToString("yyyy-MM-dd");
            }

            string cucid = Session["company"].ToString();
            MySqlDataReader company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, " where company_ucid='" + cucid + "'");

            while (company_reader != null && company_reader.Read())
            {
                //company_name.InnerHtml= company_reader["company_surname"]+" "+company_reader["company_middle_name"]+" "+company_reader["company_middle_name"];
                //company_reader["company_surname"];
                state_name.InnerHtml = "" + company_reader["company_state"];
                state_code.InnerHtml = "" + company_reader["company_state_code"];
            }
            if (company_reader != null)
            {
                company_reader.Close();
            }
            company_reader = baseHealpare.SelectAllValues("*, " + "(SELECT pms_account_state_name FROM pms_account_state WHERE pms_account_state_code = account_state_code) as statename", baseHealpare.TableAddAccount, " where status=0");
            account_master = new System.Collections.ArrayList();
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
                    account_add_on = company_reader["account_add_one"],
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
                    stock_mrp = company_reader["stock_mrp"],
                    stock_sale_price_without_gst = company_reader["stock_sale_price_without_gst"],
                    stock_product_name = company_reader["stock_product_name"],
                    stock_unit_of_measurment = company_reader["stock_unit_of_measurment"],
                    stock_reorder_quantity = company_reader["stock_reorder_quantity"],
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


            company_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status=0");
            setting_master = new System.Collections.ArrayList();
            while (company_reader != null && company_reader.Read())
            {
                setting_master.Add(new
                {
                    mrp_details = company_reader["mrp_details"],
                    //mrp_invoice_details = company_reader["mrp_invoice_details"],
                    sale_price_details = company_reader["sale_price_details"],
                    //sale_price_details_info = company_reader["sale_price_details_info"],
                    expiry_monitoring_system = company_reader["expiry_monitoring_system"],
                    //expiry_monitoring_system_info = Convert.ToDateTime(company_reader["expiry_monitoring_system_info"].ToString()).ToString("yyyy-MM-dd"),
                    expiry_details_tax_invoice = company_reader["expiry_details_tax_invoice"],
                    batch_wise_details = company_reader["batch_wise_details"],
                    //batch_wise_details_info = company_reader["batch_wise_details_info"],
                    batch_wise_details_tax_invoice = company_reader["batch_wise_details_tax_invoice"],
                    journal_accounting_entry = company_reader["journal_accounting_entry"],
                    prefix_generate_invoice_no = company_reader["prefix_generate_invoice_no"],
                    
                });
            }
            if (company_reader != null)
            {
                company_reader.Close();
                serializer = new JavaScriptSerializer();
                json_setting_obj = serializer.Serialize(setting_master);
            }


            //==============code for view data==========================
            if (Request.QueryString.Count == 0)
            {
                breadcrumb_title.InnerHtml = "Add Purcahse";
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    breadcrumb_title.InnerHtml = "Update Purchase";
                    int cnt = 0;
                    string ca_status_condition = baseHealpare.ApprovalCheckStatus();
                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, "where pur_mst_auto_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'" + ca_status_condition);
                    while (update_reader != null && update_reader.Read())
                    {
                        cnt++;
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

                    update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, "where invoice_type = 'purchase' AND reference_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
                    while (update_reader != null && update_reader.Read())
                    {
                        txtproduct_name.Value = update_reader["product_desc"].ToString();
                        lblhsncode.InnerHtml = update_reader["hsn_code"].ToString();
                        //lblgst_rate.InnerHtml = update_reader["rate"].ToString();
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

                    if (cnt > 0)
                    {
                        MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, " where invoice_type = 'purchase' AND reference_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
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
                            rate =  (Convert.ToInt32(reader["igst_rate"])+Convert.ToInt32(reader["cgst_rate"])+Convert.ToInt32(reader["sgst_rate"])),
                            amount = reader["amount"],
                            discount = reader["discount"],
                            tax_val = reader["tax_val"],
                            igst_rate = reader["igst_rate"],
                            igst_amt = reader["igst_amt"],
                            cgst_rate = reader["cgst_rate"],
                            cgst_amt = reader["cgst_amt"],
                            sgst_rate = reader["sgst_rate"],
                            sgst_amount = reader["sgst_amount"],
                            uom = reader["uom"]
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
                        baseHealpare.MessageBox(this, "You Dont Have Permission To Update Data is already Approved..!!!");
                    }

                    MySqlDataReader purchase_update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, "where pur_mst_auto_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
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
            }

        }
        string reference_id = "";
        string jv_purc_id = "";
        protected void submit_account_details_event(object sender, EventArgs e)
        {


            if (Request.QueryString.Count == 0)
            {
                 reference_id = baseHealpare.InsertIntoTableGetID(baseHealpare.TableAddStockPuchaseMst,
                                    new string[] { "invoice_no", "invoice_irn_no", "invoice_date", "reverse_charge", "i_state", "statecode", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "payment_mode", "payment_status", "invoice_type", "remark" },
                                    new string[] { invoice_no.Value.ToString(), Invoice_IRN_No_id.Value.ToString(), input_date.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), payment_mode.Value.ToString(), payment_status.Value.ToString(), invoice_type.Value.ToString(), Regex.Replace(txtremark.Value.ToString(), @"[^0-9a-zA-Z]+", " ") }
                                    );
                if (Regex.IsMatch(reference_id, "^[0-9]+$"))
                {
                    jv_purc_id = reference_id;
                    string jsonString = txthdnJson.Value.ToString();
                    var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                    for (int i = 0; i < dict.Count; i++)
                    {
                        dict[i]["reference_id"] = reference_id;
                        string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                        baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseDtl,
                                            new string[] { "invoice_no", "invoice_date", "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "amount", "discount", "tax_val", "igst_rate", "igst_amt", "cgst_rate", "cgst_amt", "sgst_rate", "sgst_amount", "status", "invoice_type", "reference_id" },
                                             result));
                    }
                }
                
            }
            else
            {
                jv_purc_id = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));
                string ca_status_condition = baseHealpare.ApprovalCheckStatus();

                 string msg = baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst,
                                    new string[] { "invoice_irn_no", "invoice_date", "reverse_charge", "i_state", "statecode", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "payment_mode", "payment_status", "invoice_type", "remark" },
                                    new string[] { Invoice_IRN_No_id.Value.ToString(), input_date.Value.ToString(), reverse_charge.Value.ToString(), state_name.InnerText.ToString(), state_code.InnerText.ToString(), sell_name.Value.ToString(), sell_address.Value.ToString(), txtgstin.Value.ToString(), txt_sell_state.Value.ToString(), txt_sell_state_code.Value.ToString(), total_cost.Value.ToString(), total_gst.Value.ToString(), total_igst.Value.ToString(), total_cgst.Value.ToString(), total_sgst.Value.ToString(), total_discount.Value.ToString(), payment_mode.Value.ToString(), payment_status.Value.ToString(), invoice_type.Value.ToString(), Regex.Replace(txtremark.Value.ToString(), @"[^0-9a-zA-Z]+", " ") },
                                    "pur_mst_auto_id=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))+ "'" + ca_status_condition
                  );

                if (Session["page_role"] + "" == "CA")
                {
                    baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst,
                                  new string[] { "ca_approved_status" },
                                  new string[] { "2" },
                                  "pur_mst_auto_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                }

                if (msg == "DONE")
                {
                    string jsonString = txthdnJson.Value.ToString();
                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM pms_purchase_invoice_dtl WHERE invoice_type = 'purchase' AND reference_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))+ "' and ca_approved_status != 3");
                reader.Close();
                for (int i = 0; i < dict.Count; i++)
                {
                    dict[i]["reference_id"] = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));
                    string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();


                    baseHealpare.MessageBox(this, "Data Updating " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseDtl,
                                            new string[] { "invoice_no", "invoice_date", "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "amount", "discount", "tax_val", "igst_rate", "igst_amt", "cgst_rate", "cgst_amt", "sgst_rate", "sgst_amount",  "status", "invoice_type", "reference_id" },
                                             result
                     ));

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
                    "(select account_head from pms_account_master where account_party_name ='" + sell_name.Value.ToString() + "' limit 1) as purc_head," +
                    "(select account_head from pms_account_master where account_head LIKE '%SGST-ITC A/C%' limit 1) as sgst_head," +
                    "(select account_head from pms_account_master where `account_head` LIKE '%CGST-ITC A/C%' limit 1) as CGST_HEAD," +
                    "(select account_head from pms_account_master where account_head LIKE '%IGST-ITC A/C%' limit 1) igst_head," +
                    "(select account_head from pms_account_master where `account_head` LIKE '%PURCHASE A/C%' limit 1) as sell_head, " +
                    "(SELECT purchase_journal_id FROM pms_purchase_invoice_mst WHERE pur_mst_auto_id =" + jv_purc_id + " ) as jv_id");
                
                while (msq_reader != null && msq_reader.Read())
                {
                    System.Collections.ArrayList session_jv = new System.Collections.ArrayList();
                    session_jv.Add(new
                    {
                        account_head = "" + msq_reader["sell_head"],
                        debit_entry = "" + (double.Parse(total_total_amt.Value.ToString()) - double.Parse(total_cgst.Value.ToString()) - double.Parse(total_sgst.Value.ToString()) - double.Parse(total_igst.Value.ToString())), //double.Parse(total_without_tax.Value.ToString()),
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
                    session_jv.Add(new
                    {
                        account_head = "" + msq_reader["purc_head"],
                        debit_entry = "0",
                        credit_entry = "" + total_total_amt.Value.ToString(),
                    });

                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    json_obj = serializer.Serialize(session_jv);

                    Session["purchase"] = new
                    {
                        session_jv = json_obj,
                        //account_head = "" + msq_reader["sell_head"],
                        //total_cost = "" + (float.Parse(total_total_amt.Value.ToString()) - float.Parse(total_cgst.Value.ToString()) - float.Parse(total_sgst.Value.ToString()) - float.Parse(total_igst.Value.ToString())), //float.Parse(total_without_tax.Value.ToString()),
                        //cgt_account_head = "" + msq_reader["CGST_HEAD"],
                        //cgst_amt = "" + total_cgst.Value.ToString(),
                        //sgt_account_head = "" + msq_reader["sgst_head"],
                        //sgst_amt = "" + total_sgst.Value.ToString(),
                        //igt_account_head = "" + msq_reader["igst_head"],
                        //igst_amt = "" + total_igst.Value.ToString(),
                        //seller_account_head = msq_reader["purc_head"],
                        //total_amt = "" + total_total_amt.Value.ToString(),
                        jv_id = "" + msq_reader["jv_id"],
                        main_id = jv_purc_id,
                        jv_date = input_date.Value.ToString()
                    };
                    Response.Redirect("/Vouchers/JournalEntry.aspx?jvtype=purchase");
                }
                if (msq_reader != null)
                {
                    msq_reader.Close();
                }
            }
            else
            {
                Response.Redirect("~/Vouchers/PurchaseDetails.aspx");
            }
        }


        protected void btnPrintClick(object sender, EventArgs e)
        {
            Response.Redirect("/Reports/testPrint.aspx?value=" + baseHealpare.EncodeUrl(this, "" + hdn_invoice_id.Value.ToString()));
        }

        protected void cancel_event(object sender, EventArgs e)
        {
            Response.Redirect("~/Vouchers/PurchaseDetails.aspx");
        }
    }
}