using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class AddStock : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList purchase_master_dtl;
        public System.Collections.ArrayList setting_master;
        public string json_purchase_dtl;
        public string json_setting_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
                {
                    baseHealpare.DeleteValue(baseHealpare.TableAddStock, "pms_stock_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    baseHealpare.DeleteValue(baseHealpare.TableAddStockPuchaseDtl, "invoice_type = 'stock' AND reference_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    Response.Redirect("~/Master/StockDetails.aspx");
                }
                //inv_nature_operation.Items.Clear();
                MySqlDataReader nature_operation = baseHealpare.SelectAllValues(baseHealpare.TableNatureofOpration, " where status=0");
                while (nature_operation != null && nature_operation.Read())
                {
                    inv_nature_operation.Items.Add(new ListItem(nature_operation["nature_of_opration_name"].ToString(), nature_operation["stock_nature_of_opration_id"].ToString()));
                }
                if(nature_operation!=null)
                nature_operation.Close();

                MySqlDataReader unit_of_Measurement = baseHealpare.SelectAllValues(baseHealpare.TableUnitofmeasurment, " where status=0");
                while (unit_of_Measurement != null && unit_of_Measurement.Read())
                {
                    inv_unit_measurement.Items.Add(new ListItem(unit_of_Measurement["unit_unitof_measuremt_name"].ToString(), unit_of_Measurement["unit_unitof_measuremt_name"].ToString()));
                }
                if (unit_of_Measurement != null)
                {
                    unit_of_Measurement.Close();
                }

                if (Request.QueryString["value"] == null)
                {
                }
                else
                {
                    breadcrumb_title.InnerHtml = "Update Stock";
                    string group_value = "";
                    MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStock, "where pms_stock_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    while (reader != null && reader.Read())
                    {
                        inv_nature_operation.SelectedIndex = inv_nature_operation.Items.IndexOf(inv_nature_operation.Items.FindByValue(reader["stock_nature_of_opration"].ToString()));
                        group_value = reader["stock_group"].ToString();
                        //inv_group.SelectedIndex = inv_group.Items.IndexOf(inv_group.Items.FindByValue(reader["stock_group"].ToString()));
                        inv_product_name.Value = reader["stock_product_name"].ToString();
                        inv_unit_measurement.SelectedIndex = inv_unit_measurement.Items.IndexOf(inv_unit_measurement.Items.FindByText(reader["stock_pri_unit_of_measurment"].ToString()));
                        if (reader["stock_chk_default_id"].ToString() == "0")
                        {
                            rbtn_primuom_id.Checked = true;
                        }
                        else if (reader["stock_chk_default_id"].ToString() == "1")
                        {
                            rbtn_secouom_id.Checked = true;
                        }
                        secounitmesure_id.Value = reader["stock_sec_unit_of_measurement"].ToString();
                        convfactor_id.Value = reader["stock_conversion_factor"].ToString();
                        inv_hsn_sac_code.Value = reader["stock_hsn_sac_code"].ToString();
                        inv_gst_rate.Value = reader["stock_gst_rate"].ToString();
                        mrp_id.Value = reader["stock_mrp"].ToString();
                        salePriceGst_id.Value = reader["stock_sale_price_without_gst"].ToString();
                        //expiry_date_id.Value = Convert.ToDateTime(reader["stock_expiry_date"].ToString()).ToString("yyyy-MM-dd");
                        //Batch_id.Value = reader["stock_batch"].ToString();

                        qty_id.Value = reader["stock_opening_qty"].ToString();
                        pur_price_unit_id.Value = reader["stock_purc_price_per_unit"].ToString();
                        amount_id.Value = reader["stock_opening_amt"].ToString();
                        inv_recorder_level.Value = reader["stock_reorder_level"].ToString();
                        inv_recorder_quantity.Value = reader["stock_reorder_quantity"].ToString();
                        inv_minimum_stock_reminder.Value = reader["stock_minimum_stock_reminder"].ToString();
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    NatureOperation_Changed(sender, e);
                    inv_group.SelectedIndex = inv_group.Items.IndexOf(inv_group.Items.FindByValue(group_value));

                    MySqlDataReader dtl_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, " where status = 0 and reference_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' and invoice_type='stock' ");
                    purchase_master_dtl = new System.Collections.ArrayList();

                    while (dtl_reader != null && dtl_reader.Read())
                    {
                        purchase_master_dtl.Add(new
                        {
                            product_desc = dtl_reader["product_desc"],
                            hsn_code = dtl_reader["hsn_code"],
                            uom = dtl_reader["uom"],
                            expiry_date = Convert.ToDateTime(dtl_reader["expiry_date"].ToString()).ToString("yyyy-MM-dd"),
                            batch = dtl_reader["batch"],
                            qty = dtl_reader["qty"],
                            rate = dtl_reader["rate"],
                            amount = dtl_reader["amount"],
                        });
                    }
                    if (dtl_reader != null)
                    {
                        dtl_reader.Close();
                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        json_purchase_dtl = serializer.Serialize(purchase_master_dtl);

                    }
                }
            }
                MySqlDataReader setting_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status=0");
                setting_master = new System.Collections.ArrayList();
                while (setting_reader != null && setting_reader.Read())
                {
                    setting_master.Add(new
                    {

                        //terms_condition_tax_invoice = setting_reader["terms_condition_tax_invoice"],
                        authorized_signatory_tax_invoice = setting_reader["authorized_signatory_tax_invoice"],
                        authorized_signatory_other_voucher = setting_reader["authorized_signatory_other_voucher"],
                        mrp_details = setting_reader["mrp_details"],
                        sale_price_details = setting_reader["sale_price_details"],
                        expiry_monitoring_system = setting_reader["expiry_monitoring_system"],
                        expiry_details_tax_invoice = setting_reader["expiry_details_tax_invoice"],
                        batch_wise_details = setting_reader["batch_wise_details"],
                        batch_wise_details_tax_invoice = setting_reader["batch_wise_details_tax_invoice"],
                        stock_out_method = setting_reader["stock_out_method"],
                        //stock_valuation_method = setting_reader["stock_valuation_method"],
                        unit_conversion_method_required = setting_reader["unit_conversion_method_required"],
                        journal_accounting_entry = setting_reader["journal_accounting_entry"],
                        extra_information_tax_invoice = setting_reader["extra_information_tax_invoice"],
                        caption_name1 = setting_reader["caption_name1"],
                        currency_sign_before_amount = setting_reader["currency_sign_before_amount"],
                        prefix_generate_invoice_no = setting_reader["prefix_generate_invoice_no"],
                        prefix_generate_debit_no = setting_reader["prefix_generate_debit_no"],
                        prefix_generate_credit_no = setting_reader["prefix_generate_credit_no"],

                    });
                }
                if (setting_reader != null)
                {
                    setting_reader.Close();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    json_setting_obj = serializer.Serialize(setting_master);
                }
                
            ClientScriptManager cs = Page.ClientScript;
            this.inv_nature_operation.Attributes.Add("onchange", cs.GetPostBackEventReference(this.inv_nature_operation, this.inv_nature_operation.ID));
        }

        protected void NatureOperation_Changed(object sender, EventArgs e)
        {
            inv_group.Items.Clear();
            MySqlDataReader main_group = baseHealpare.SelectAllValues(baseHealpare.TableStockGroup, " where stock_nature_of_opration_id=" + inv_nature_operation.Value);
            while (main_group != null && main_group.Read())
            {
                inv_group.Items.Add(new ListItem(main_group["stock_group_name"].ToString(), main_group["stock_group_id"].ToString()));
            }
            inv_group.Items.Add(new ListItem("Add New", "add"));
            if (main_group != null)
            {
                main_group.Close();
            }
        }
        string stock_unit_of_measurment = "";
        string rbtn_Value = "0";
        string group_val = "";
        protected void add_new_group(object sender, EventArgs e)
        {
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT count(stock_group_id)+1 as groupval FROM pms_stock_addgroup WHERE stock_nature_of_opration_id =" + inv_nature_operation.Value.ToString());
            while (reader != null && reader.Read())
            {
                group_val = reader["groupval"].ToString();
            }
            if (reader != null)
            {
                reader.Close();
            }

            baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableStockGroup,
                    new string[] { "stock_nature_of_opration_id","stock_group_id", "stock_group_name"},
                    new string[] { inv_nature_operation.Value.ToString(), group_val, new_group_name.Value.ToString()}));
            inv_group.Items.Clear();
            MySqlDataReader main_group = baseHealpare.SelectAllValues(baseHealpare.TableStockGroup, " where stock_nature_of_opration_id=" + inv_nature_operation.Value);
            while (main_group != null && main_group.Read())
            {
                inv_group.Items.Add(new ListItem(main_group["stock_group_name"].ToString(), main_group["stock_group_id"].ToString()));
            }          
            inv_group.Items.Add(new ListItem("Add New", "add"));
            inv_group.SelectedIndex = inv_group.Items.Count-2;
            main_group.Close();

        }
        string stock_id = "";
        protected void submit_stock_details_even(object sender, EventArgs e)
        {
            {
                if (inv_nature_operation.Value == "0" || inv_nature_operation.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Select nature Of operation");
                    return;
                }
                else if (inv_group.Value == "0" || inv_group.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Select Group");
                    return;
                }
                else if (inv_product_name.Value == "" || inv_product_name.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Enter product name");
                    return;
                }
                else
                {
                    if (Request.QueryString["value"] == null)
                    {
                        //string exdate = expiry_date_id.Value; //= dt.ToString("yyyy-MM-dd");
                        //if (exdate.Equals(""))
                        //{
                        //    expiry_date_id.Value = "0001-01-01";
                        //}
                        //else
                        //{
                        //    expiry_date_id.Value = expiry_date_id.Value;
                        //}

                        if (rbtn_primuom_id.Checked == true)
                        {
                            stock_unit_of_measurment = inv_unit_measurement.Value;
                            rbtn_Value = "0";
                        }
                        else if (rbtn_secouom_id.Checked == true)
                        {
                            stock_unit_of_measurment = secounitmesure_id.Value;
                            rbtn_Value = "1";
                        }
                        MySqlDataReader comfirm_master = baseHealpare.SelectAllValues(baseHealpare.TableAddStock, "where stock_product_name = '" + inv_product_name.Value.ToString() + "'");
                        if (comfirm_master.HasRows == false)
                        {
                            comfirm_master.Close();
                            stock_id = baseHealpare.InsertIntoTableGetID(baseHealpare.TableAddStock,
                                        new string[] { "stock_nature_of_opration", "stock_group", "stock_product_name", "stock_unit_of_measurment", "stock_pri_unit_of_measurment", "stock_sec_unit_of_measurement", "stock_conversion_factor", "stock_chk_default_id", "stock_hsn_sac_code", "stock_gst_rate", "stock_mrp", "stock_sale_price_without_gst", "stock_opening_qty", "stock_purc_price_per_unit", "stock_opening_amt", "stock_reorder_level", "stock_reorder_quantity", "stock_minimum_stock_reminder" },
                                        new string[] { inv_nature_operation.Value, inv_group.Value, inv_product_name.Value, stock_unit_of_measurment, inv_unit_measurement.Value, secounitmesure_id.Value, convfactor_id.Value, rbtn_Value, inv_hsn_sac_code.Value, inv_gst_rate.Value, mrp_id.Value, salePriceGst_id.Value, qty_id.Value, pur_price_unit_id.Value, amount_id.Value, inv_recorder_level.Value, inv_recorder_quantity.Value, inv_minimum_stock_reminder.Value }
                                        );
                            if (Regex.IsMatch(stock_id, "^[0-9]+$"))
                            {
                                string jsonString = txthdnJson.Value.ToString();
                                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                                for (int i = 0; i < dict.Count; i++)
                                {
                                    dict[i]["stock_id"] = stock_id;
                                    dict[i]["invoice_date"] = Session["start_date"].ToString();
                                    string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                                    baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseDtl,
                                            new string[] { "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "rate", "amount", "invoice_type", "reference_id", "invoice_date" },
                                             result));

                                }
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
                            return;
                        }
                    }
                    else
                    {
                        //string exdate = expiry_date_id.Value; //= dt.ToString("yyyy-MM-dd");
                        //if (exdate.Equals(""))
                        //{
                        //    expiry_date_id.Value = "0001-01-01";
                        //}
                        //else
                        //{
                        //    expiry_date_id.Value = expiry_date_id.Value;
                        //}


                        if (rbtn_primuom_id.Checked == true)
                        {
                            stock_unit_of_measurment = inv_unit_measurement.Value;
                            rbtn_Value = "0";
                        }
                        else if (rbtn_secouom_id.Checked == true)
                        {
                            stock_unit_of_measurment = secounitmesure_id.Value;
                            rbtn_Value = "1";
                        }

                        string msg = baseHealpare.UpdateValue(baseHealpare.TableAddStock,
                                    new string[] { "stock_nature_of_opration", "stock_group", "stock_product_name", "stock_unit_of_measurment", "stock_pri_unit_of_measurment", "stock_sec_unit_of_measurement", "stock_conversion_factor", "stock_chk_default_id", "stock_hsn_sac_code", "stock_gst_rate", "stock_mrp", "stock_sale_price_without_gst", "stock_opening_qty", "stock_purc_price_per_unit", "stock_opening_amt", "stock_reorder_level", "stock_reorder_quantity", "stock_minimum_stock_reminder" },
                                    new string[] { inv_nature_operation.Value, inv_group.Value, inv_product_name.Value, stock_unit_of_measurment, inv_unit_measurement.Value, secounitmesure_id.Value, convfactor_id.Value, rbtn_Value, inv_hsn_sac_code.Value, inv_gst_rate.Value, mrp_id.Value, salePriceGst_id.Value, qty_id.Value, pur_price_unit_id.Value, amount_id.Value, inv_recorder_level.Value, inv_recorder_quantity.Value, inv_minimum_stock_reminder.Value },
                                    "pms_stock_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))
                        );

                        if (msg == "DONE")
                        {
                            string jsonString = txthdnJson.Value.ToString();
                            var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);

                            MySqlDataReader reader = baseHealpare.SelectManualQuery("DELETE FROM pms_purchase_invoice_dtl WHERE reference_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "' AND invoice_type = 'stock' AND ca_approved_status != 3");
                            reader.Close();
                            for (int i = 0; i < dict.Count; i++)
                            {
                                dict[i]["reference_id"] = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())));
                                string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();


                                baseHealpare.MessageBox(this, "Data Updating " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseDtl,
                                                        new string[] { "product_desc", "hsn_code", "uom", "batch", "expiry_date", "qty", "rate", "amount", "invoice_type", "reference_id" },
                                                         result
                                 ));

                            }
                        }
                    }
                    if (Request.QueryString["redirect"] != null)
                        Response.Redirect(baseHealpare.RedirectURLS[Request.QueryString["redirect"]]);
                    else
                        Response.Redirect("~/Master/StockDetails.aspx");
                }
            }
        }
        protected void cancel_event(object sender, EventArgs e)
        {
            Response.Redirect("~/Master/StockDetails.aspx");
        }
    }
}