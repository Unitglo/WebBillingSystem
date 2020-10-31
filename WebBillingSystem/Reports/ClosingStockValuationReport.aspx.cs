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

    public partial class ClosingStockValuationReport : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        //        public System.Collections.ArrayList journal_book_master;
        //        public System.Collections.ArrayList journal_book_day_details_master;
        //        public System.Collections.ArrayList json_day_stk_ledger_array;
        public System.Collections.ArrayList all_products;
        public System.Collections.ArrayList month_wise_products;
        public string stock_valuation_method;
        public string all_products_json;
        public string month_wise_products_json;


        public string json_month_stk_ledger_obj;
        public string json_journal_book_day_obj;
        public string json_day_stk_ledger_obj;
        public System.Collections.ArrayList months;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            MySqlDataReader Sett_reader = baseHealpare.SelectAllValues(baseHealpare.master_settings_table, "where status = 0");
            while (Sett_reader != null && Sett_reader.Read())
            {
                // 	<option value="CMPL">Cost or Market Price whichever is lower</option>
                //<option selected="selected" value="CP">Cost Price</option>
                //<option value="MP"></option>
                stock_valuation_method = "" + Sett_reader["stock_valuation_method"].ToString();
                if (stock_valuation_method == "Market Price")
                {
                    stock_valuation_method = "MP";
                }
                else if (stock_valuation_method == "Cost Price")
                {
                    stock_valuation_method = "CP";
                }
                else
                {
                    stock_valuation_method = "CMPL";
                }
            }
            if (Sett_reader != null)
                Sett_reader.Close();

            if (!Page.IsPostBack)
            {
                DateTime dateTime = DateTime.UtcNow.Date;
                from_date_id.Value = dateTime.ToString("yyyy-MM-dd");

                //from_date_id.Value = dateTime.ToString("yyyy-MM-dd");
                //to_date_id.Value = dateTime.ToString("yyyy-MM-dd");

                //int year = Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                //if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
                //{
                //    from_date_id.Value = (year - 1) + "-04-01";
                //}
                //else
                //{
                //    from_date_id.Value = year + "-04-01";
                //}

                MySqlDataReader main_group = baseHealpare.SelectAllValues(baseHealpare.TableStockGroup, " where stock_nature_of_opration_id= 1");
                while (main_group != null && main_group.Read())
                {
                    stock_group_id.Items.Add(new ListItem(main_group["stock_group_name"].ToString(), main_group["stock_group_id"].ToString()));
                }
                if (main_group != null)
                {
                    main_group.Close();
                }
                Group_Changed(sender, e);

                comp_name_id.InnerHtml = Session["company_name"].ToString();
                MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "WHERE company_ucid='" + Session["company"].ToString() + "'");
                while (sess_login_reader != null && sess_login_reader.Read())
                {
                    comp_trade_name_id.InnerHtml = sess_login_reader["company_trade_name"].ToString();
                    comp_add_id.InnerHtml = sess_login_reader["company_address_one"] + " " + sess_login_reader["company_address_two"] + "" + sess_login_reader["company_address_three"]; ;
                    comp_gst_no_id.InnerHtml = sess_login_reader["company_gst_number"].ToString();
                    comp_email_id.InnerHtml = sess_login_reader["company_email"].ToString();
                    comp_pan_no_id.InnerHtml = sess_login_reader["company_pan_number"].ToString();
                    comp_phone_id.InnerHtml = sess_login_reader["company_phone_number"].ToString();
                    comp_cin_no_id.InnerHtml = sess_login_reader["company_cin_number"].ToString();
                }
                if (sess_login_reader != null)
                {
                    sess_login_reader.Close();
                }
            }

            company_name_id.InnerHtml = product_desc_id.Value;

            ClientScriptManager cs = Page.ClientScript;
            this.stock_group_id.Attributes.Add("onchange", cs.GetPostBackEventReference(this.stock_group_id, this.stock_group_id.ID));

        }

        protected void Group_Changed(object sender, EventArgs e)
        {
            product_desc_id.Items.Clear();
            //product_desc_id.add
            product_desc_id.Items.Add(new ListItem("All...", "0"));
            MySqlDataReader product_desc_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddStock, " where status != 2 ORDER BY stock_product_name");
            if (stock_group_id.Value != "0")
            {
                product_desc_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddStock, " WHERE stock_group = '" + stock_group_id.Value + "' AND status != 2 ORDER BY stock_product_name");
            }
            while (product_desc_drop != null && product_desc_drop.Read())
            {
                product_desc_id.Items.Add(new ListItem(product_desc_drop["stock_product_name"].ToString(), product_desc_drop["stock_product_name"].ToString()));
            }
            if (product_desc_drop != null)
            {
                product_desc_drop.Close();
            }

        }
        protected void details()
        {
            string product_name_condition_group = "";

            if (!product_desc_id.Value.Equals("0"))
            {
                //                product_name_condition_group = " t1.product_name ='" + product_desc_id.Value + "' and";
                product_name_condition_group = " and pms_stock.stock_product_name like '%" + product_desc_id.Value + "%' ";
            }
            //            product_name_condition_group = "pms_stock.product_name ='WRITING PAPER(GRAPHICA)58.5X91 / 18.6 KG'";
            MySqlDataReader reader = null;

            // day wise details 
            all_products = new System.Collections.ArrayList();
            month_wise_products = new System.Collections.ArrayList();

            reader = baseHealpare.SelectManualQuery("select pms_stock.*,pms_stock_addgroup.stock_group_name from pms_stock left join pms_stock_addgroup on pms_stock_addgroup.stock_group_id = pms_stock.stock_group and pms_stock.stock_nature_of_opration = pms_stock_addgroup.stock_nature_of_opration_id where pms_stock.stock_nature_of_opration = 1 " + product_name_condition_group);
            while (reader != null && reader.Read())
            {
                //stock_purc_price_per_unit , stock_opening_amt
                all_products.Add(
                new
                {
                    pms_stock_id = ""+reader["pms_stock_id"],
                    product_name = "" + reader["stock_product_name"],
                    product_group = "" + reader["stock_group_name"],
                    product_open_qty = "" + reader["stock_opening_qty"],
                    product_close_qty = "0",
                    product_open_cost = "" + reader["stock_opening_qty"],
                    product_close_cost = "0",
                    product_open_unit_rate = "" + reader["stock_purc_price_per_unit"],
                    product_close_unit_rate = "0",
                    product_open_value = "" + reader["stock_opening_amt"],
                    product_mrp = "" + reader["stock_mrp"],
                    product_valuation_qty = "0" + reader["product_valuation_qty"],
                    product_valuation_rate = "0" + reader["product_valuation_rate"],
                    product_valuation_amt = "0" + reader["product_valuation_amt"],
                    close_product_valuation_qty = "0" + reader["valuation_close_qty"],
                    close_product_valuation_rate = "0" + reader["valuation_close_rate"],
                    colse_product_valuation_amt = "0" + reader["valuation_close_amt"],
                    product_sale_price = "" + reader["stock_sale_price_without_gst"],
                    product_close_value = "0",
                    batch = reader["stock_batch"],
                    expiry_date = reader["stock_expiry_date"]

                }
                );

            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                all_products_json = serializer.Serialize(all_products);
            }
            //            int month = Int32.Parse(Convert.ToDateTime(from_date_id.Value.ToString()).ToString("MM"));
            string selected_date = "" + from_date_id.Value;
            reader = baseHealpare.SelectManualQuery("SELECT t1.product_name,t1.qty as quantity, t1.value, t1.month, t1.monthname, t1.static_type,t1.batch from    (SELECT invoice_type static_type, monthname(`invoice_date`) monthname, month(`invoice_date`) month, sum(pms_sale_invoice_dtl.qty) qty, sum(pms_sale_invoice_dtl.tax_val) value, product_desc product_name, batch FROM `pms_sale_invoice_dtl` where status != 2 and invoice_date <='" + selected_date + "' group by monthname(`invoice_date`), product_desc, batch UNION SELECT invoice_type type, monthname(`invoice_date`) monthname, month(`invoice_date`) month, sum(pms_purchase_invoice_dtl.qty) qty, sum(pms_purchase_invoice_dtl.tax_val) value, product_desc product_name, batch FROM `pms_purchase_invoice_dtl`where invoice_type = 'purchase' and status != 2 and invoice_date <='" + selected_date + "' group by monthname(invoice_date), product_desc, batch UNION select note_type static_type, monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) monthname, month(pms_voucher_dr_cr_note_dtl.date_of_issue) month, sum(pms_voucher_dr_cr_note_dtl.quantity) qty, sum(pms_voucher_dr_cr_note_dtl.tax_value) value, pms_voucher_dr_cr_note_dtl.product_name, batch from pms_voucher_dr_cr_note_dtl right join pms_voucher_dr_cr_note_mst on refrance_id = dr_cr_Id where note_type = 'purchaseReturn' and pms_voucher_dr_cr_note_dtl.status != 2 and pms_voucher_dr_cr_note_dtl.date_of_issue <='" + selected_date + "'  group by monthname(pms_voucher_dr_cr_note_dtl.date_of_issue), pms_voucher_dr_cr_note_dtl.product_name, batch UNION select note_type static_type, monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) monthname, month(pms_voucher_dr_cr_note_dtl.date_of_issue) month, sum(pms_voucher_dr_cr_note_dtl.quantity) qty, sum(pms_voucher_dr_cr_note_dtl.tax_value) value, pms_voucher_dr_cr_note_dtl.product_name, batch from pms_voucher_dr_cr_note_dtl right join pms_voucher_dr_cr_note_mst on refrance_id = dr_cr_Id where note_type = 'saleReturn' and pms_voucher_dr_cr_note_dtl.status != 2  and pms_voucher_dr_cr_note_dtl.date_of_issue <='" + selected_date + "' group by monthname(pms_voucher_dr_cr_note_dtl.date_of_issue), pms_voucher_dr_cr_note_dtl.product_name, batch) t1 where t1.month > 0");
            while (reader != null && reader.Read())
            {
                month_wise_products.Add(new
                {
                    product_name = reader["product_name"],
                    product_qty = reader["quantity"],
                    product_value = reader["value"],
                    batch = reader["batch"],
                    product_month = reader["month"],
                    product_monthname = reader["monthname"],
                    product_static_type = reader["static_type"]
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                month_wise_products_json = serializer.Serialize(month_wise_products);
            }
        }


        protected void search_jv_details_event(object sender, EventArgs e)
        {
            company_name_id.InnerHtml = product_desc_id.Value;
            details();
        }
        protected void save_closing_stock_value(object sender, EventArgs e)
        {
          //  baseHealpare.MessageBox(this, "" + close_stock_json.Value);
            var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(close_stock_json.Value);
            baseHealpare = new DataBaseHealpare();
            for (int i = 0; i < dict.Count; i++)
            {
                baseHealpare.UpdateValue(baseHealpare.TableAddStock,
                    new string[] { "product_valuation_qty", "product_valuation_rate", "product_valuation_amt", "valuation_close_qty", "valuation_close_rate", "valuation_close_amt" },
                    new string[] { dict[i]["product_valuation_qty"].ToString(), dict[i]["product_valuation_rate"].ToString(), dict[i]["product_valuation_amt"].ToString(), dict[i]["valuation_close_qty"].ToString(), dict[i]["valuation_close_rate"].ToString(), dict[i]["valuation_close_amt"].ToString() },
                    "pms_stock_id='" + dict[i]["pms_stock_id"] + "'");
            }

            //  var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(close_stock_json.InnerHtml.ToString());
                         //save_closing_stock_value

        }

    }
}
