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
    public partial class StockLedger : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList journal_book_master;
        public System.Collections.ArrayList journal_book_day_details_master;
        public System.Collections.ArrayList json_day_stk_ledger_array;
        public string json_month_stk_ledger_obj;
        public string json_journal_book_day_obj;
        public string json_day_stk_ledger_obj;
        public System.Collections.ArrayList months;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (!Page.IsPostBack)
            {
                DateTime dateTime = DateTime.UtcNow.Date;
                from_date_id.Value = dateTime.ToString("yyyy-MM-dd");
                to_date_id.Value = dateTime.ToString("yyyy-MM-dd");

                int year = Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("yyyy"));
                if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
                {
                    from_date_id.Value = (year - 1) + "-04-01";
                }
                else
                {
                    from_date_id.Value = year + "-04-01";
                }

                date_id.InnerHtml = Convert.ToDateTime(from_date_id.Value.ToString()).ToString("d-MMM-yyyy") + " TO " + Convert.ToDateTime(to_date_id.Value.ToString()).ToString("d-MMM-yyyy");

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
                if(sess_login_reader != null)
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

        double op_balance_qty = 0.00;
        double op_balance_val = 0.00;
        protected void search_jv_details_event(object sender, EventArgs e)
        {
            company_name_id.InnerHtml = product_desc_id.Value;

            //MySqlDataReader account_details = baseHealpare.SelectManualQuery("SELECT account_opening_balance AMOUNT, account_opening_balance_type TYPE FROM `pms_account_master` WHERE account_head ='" + product_desc_id.Value + "' and status != 2");
            MySqlDataReader account_details = baseHealpare.SelectManualQuery("SELECT stock_opening_qty qty_amount, stock_opening_amt amount FROM `pms_stock`WHERE `stock_product_name` ='" + product_desc_id.Value + "' and status != 2");
            while (account_details != null && account_details.Read())
            {
                if (account_details["amount"].ToString() != null)
                {
                    op_bal_qty_id.InnerHtml = Math.Round(Convert.ToDouble(account_details["qty_amount"].ToString()), 2).ToString("0.00");
                    op_bal_val_id.InnerHtml = Math.Round(Convert.ToDouble(account_details["amount"].ToString()), 2).ToString("0.00");
                    op_balance_qty = Convert.ToDouble(account_details["qty_amount"].ToString());
                    op_balance_val = Convert.ToDouble(account_details["amount"].ToString());

                } else
                {
                    op_bal_qty_id.InnerHtml = "0.00";
                    op_bal_val_id.InnerHtml = "0.00";
                }
            }
            if (account_details != null)
            {
                account_details.Close();
            }

            string[] monthNames = {"April", "May", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March"};
            //string[] mo nthNames = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
            double op_balance_month = op_balance_qty;
            journal_book_master = new System.Collections.ArrayList();
            double inward_cost = 0.00;
            double outward_cost = 0.00;
            double inward_qty_sec = 0.00;
            double inward_val_sec = 0.00;

            double cl_value = 0.00;

            for (int i = 0; i < 12; i++)
            {
                MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT qty as quantity, value, month, monthname, static_type FROM (SELECT invoice_type static_type, monthname(`invoice_date`) monthname, month(`invoice_date`) month, sum(pms_sale_invoice_dtl.qty) qty, sum(pms_sale_invoice_dtl.tax_val) value FROM `pms_sale_invoice_dtl`where product_desc ='" + product_desc_id.Value + "' and status != 2 group by monthname(`invoice_date`) UNION SELECT invoice_type type, monthname(`invoice_date`) monthname, month(`invoice_date`) month, sum(pms_purchase_invoice_dtl.qty) qty, sum(pms_purchase_invoice_dtl.tax_val) value FROM `pms_purchase_invoice_dtl`where invoice_type = 'purchase' and product_desc ='" + product_desc_id.Value + "' and status != 2 group by monthname(invoice_date) UNION select note_type static_type, monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) monthname, month(pms_voucher_dr_cr_note_dtl.date_of_issue) month, sum(pms_voucher_dr_cr_note_dtl.quantity) qty, sum(pms_voucher_dr_cr_note_dtl.tax_value) value from pms_voucher_dr_cr_note_dtl right join pms_voucher_dr_cr_note_mst on refrance_id = dr_cr_Id where `product_name` ='" + product_desc_id.Value + "' and note_type = 'purchaseReturn' and pms_voucher_dr_cr_note_dtl.status != 2 group by monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) UNION select note_type static_type, monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) monthname, month(pms_voucher_dr_cr_note_dtl.date_of_issue) month, sum(pms_voucher_dr_cr_note_dtl.quantity) qty, sum(pms_voucher_dr_cr_note_dtl.tax_value) value from pms_voucher_dr_cr_note_dtl right join pms_voucher_dr_cr_note_mst on refrance_id = dr_cr_Id where `product_name` ='" + product_desc_id.Value + "' and note_type = 'saleReturn' and pms_voucher_dr_cr_note_dtl.status != 2 group by monthname(pms_voucher_dr_cr_note_dtl.date_of_issue)) t1");
                string edit_button = "<a class='btn btn-xs btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";
                double month_sale_qty = 0.00, month_sale_value = 0.00, month_pur_qty = 0.00, month_pur_value = 0.00, month_purRet_qty = 0.00, month_purRet_value = 0.00, month_saleRet_qty = 0.00, month_saleRet_value = 0.00;
                
                while (reader != null && reader.Read())
                {
                    edit_button = "<a class='btn btn-xs btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";
                    //  edit_button += "<a class='btn btn-xs btn-light fa fa-file-excel-o btnExcelMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to Excel' style='font - size:20px; color: forestgreen' onclick='ExportToExcel(this)'></>";
                    //  edit_button += "<a class='btn btn-xs btn-light fa fa-file-pdf-o btnPdfMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to PDF' style='font - size:20px; color: red'></>";
                    // edit_button += "<a class='btn btn-xs btn-light fa fa-file-word-o btnWordMonth' data-toggle='tooltip-dark' data-placement='top' title='Export to Word Doc' style='font - size:20px; color: blue' onclick='ExportToDocMonth(this)'></>";
                    if (reader["static_type"].ToString() == "sales" && reader["monthname"].ToString() == monthNames[i])
                    {
                        month_sale_qty = month_sale_qty + Convert.ToDouble(reader["quantity"].ToString());
                        month_sale_value = month_sale_value + Convert.ToDouble(reader["value"]);
                    }

                    if (reader["static_type"].ToString() == "purchase" && reader["monthname"].ToString() == monthNames[i])
                    {
                        month_pur_qty = month_pur_qty + Convert.ToDouble(reader["quantity"].ToString());
                        month_pur_value = month_pur_value + Convert.ToDouble(reader["value"]);
                    }

                    if (reader["static_type"].ToString() == "purchaseReturn" && reader["monthname"].ToString() == monthNames[i])
                    {
                        month_purRet_qty = month_purRet_qty + Convert.ToDouble(reader["quantity"].ToString());
                        month_purRet_value = month_purRet_value + Convert.ToDouble(reader["value"]);
                    }

                    if (reader["static_type"].ToString() == "saleReturn" && reader["monthname"].ToString() == monthNames[i])
                    {
                        month_saleRet_qty = month_saleRet_qty + Convert.ToDouble(reader["quantity"].ToString());
                        month_saleRet_value = month_saleRet_value + Convert.ToDouble(reader["value"]);
                    }
                }

                double st_inward_qty = Convert.ToDouble(month_pur_qty + month_saleRet_qty);
                double st_inward_value = Convert.ToDouble(month_pur_value + month_saleRet_value);
                double st_outward_qty =  Convert.ToDouble(month_sale_qty + month_purRet_qty);
                double st_outward_value= Convert.ToDouble(month_sale_value + month_purRet_value);
                op_balance_month = Convert.ToDouble(op_balance_month + (st_inward_qty)-(st_outward_qty));

                ////inward_cost = Convert.ToDouble(Math.Round((inward_val_sec + st_inward_value) / (inward_qty_sec + st_inward_qty)).ToString("0.00"));
                //if (st_inward_value != 0 || op_balance_val != 0)
                //{
                //    //inward_cost = (op_balance_val + st_inward_value);
                //    //if (st_inward_qty != 0 || op_balance_qty != 0)
                //    //{
                //        inward_cost = Convert.ToDouble((op_balance_val + st_inward_value)/ (op_balance_qty+st_inward_qty));
                //    //}
                //}

                //if (inward_val_sec != 0)
                //{
                //    //outward_cost = inward_val_sec;
                //    //if (inward_qty_sec != 0)
                //    //{
                //        outward_cost = Convert.ToDouble(Math.Round(inward_qty_sec/inward_val_sec).ToString("0.00"));
                //    //}
                //}


                //if (op_balance_month != 0)
                //{
                //    if (inward_cost != 0)
                //    {
                //        cl_value = ((inward_cost / 2) * op_balance_month);
                //        if (outward_cost != 0)
                //        {
                //            cl_value = (((inward_cost + outward_cost) / 2) * op_balance_month);
                //        }
                //    } 
                //}
                //else
                //{
                //    if (inward_cost != 0)
                //    {
                //        cl_value = ((inward_cost / 2));
                //        if (outward_cost != 0)
                //        {
                //            cl_value = (((inward_cost + outward_cost) / 2));

                //        }
                //    }
                //}

                double val = (inward_val_sec + st_inward_value);
                double qty = (inward_qty_sec + st_inward_qty);
                val = val+op_balance_val;
                qty = qty + op_balance_qty;
                if (val != 0 || qty != 0) 
                {
                    inward_cost = (val / qty);
                }
                //if(qty != 0)
                //{
                //    inward_cost = (val / qty);
                //}

                if (inward_cost != 0)
                {
                    cl_value = inward_cost;
                }
                
                if (op_balance_month != 0)
                {
                    cl_value = op_balance_month;
                }

                if (inward_cost != 0)
                {
                    if (op_balance_month != 0)
                    {
                        cl_value = (inward_cost*op_balance_month);
                    }
                }

                //if ("" + cl_value == "NaN")
                //{
                //    cl_value = 0.00;
                //}
                if (Math.Round(op_balance_month).ToString("0.00").Equals("0.00")) {
                    cl_value = 0;
                }
                journal_book_master.Add(new
                {
                    month = monthNames[i],
                    inward_qty = Math.Round(st_inward_qty).ToString("0.00"),
                    inward_value =  Math.Round(st_inward_value).ToString("0.00"),
                    outward_qty =   Math.Round(st_outward_qty).ToString("0.00"),  
                    outward_value = Math.Round(st_outward_value).ToString("0.00"),
                    cl_bal_qty = Math.Round(op_balance_month).ToString("0.00"),   
                    cl_bal_value = Math.Round(cl_value).ToString("0.00"),
                    action = edit_button
                });


                //inward_qty_sec = st_inward_qty;
                //inward_val_sec = st_inward_value;
                inward_qty_sec = op_balance_month;
                inward_val_sec = cl_value;

                if (reader != null)
                {
                    reader.Close();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    json_month_stk_ledger_obj = serializer.Serialize(journal_book_master);
                }
            }
            // per day details
            double op_balance_day = op_balance_qty;
            //double day_sale_qty = 0.00, day_sale_value = 0.00, day_pur_qty = 0.00, day_pur_value = 0.00, day_purRet_qty = 0.00, day_purRet_value = 0.00, day_saleRet_qty = 0.00, day_saleRet_value = 0.00;
            json_day_stk_ledger_array = new System.Collections.ArrayList();
             MySqlDataReader day_reader = baseHealpare.SelectManualQuery("SELECT reference_id, inv_date, party_name, monthname, static_type, qty as quantity, value FROM ( SELECT reference_id, pms_sale_invoice_dtl.invoice_type static_type, monthname(pms_sale_invoice_dtl.invoice_date) monthname, pms_sale_invoice_mst.invoice_date inv_date, pms_sale_invoice_dtl.qty qty, pms_sale_invoice_dtl.tax_val value, seller_name party_name FROM `pms_sale_invoice_dtl` LEFT JOIN pms_sale_invoice_mst ON reference_id = sale_mst_id WHERE product_desc = '" + product_desc_id.Value + "' and pms_sale_invoice_dtl.status != 2 UNION ALL SELECT reference_id, pms_purchase_invoice_dtl.invoice_type type, monthname(pms_purchase_invoice_dtl.invoice_date) monthname, pms_purchase_invoice_dtl.invoice_date inv_date, pms_purchase_invoice_dtl.qty qty, pms_purchase_invoice_dtl.tax_val value, seller_name party_name FROM `pms_purchase_invoice_dtl` left join pms_purchase_invoice_mst on pur_mst_auto_id = reference_id and pms_purchase_invoice_mst.status != 2 where pms_purchase_invoice_dtl.invoice_type = 'purchase' and product_desc = '" + product_desc_id.Value + "' and pms_purchase_invoice_dtl.status != 2 UNION ALL select refrance_id reference_id, 'PurchaseReturn' static_type, monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) monthname, pms_voucher_dr_cr_note_dtl.date_of_issue inv_date, pms_voucher_dr_cr_note_dtl.quantity qty, pms_voucher_dr_cr_note_dtl.tax_value value, pms_voucher_dr_cr_note_mst.bill_party_name party_name FROM pms_voucher_dr_cr_note_dtl LEFT JOIN pms_voucher_dr_cr_note_mst on refrance_id = dr_cr_Id WHERE `product_name` = '" + product_desc_id.Value + "' and note_type = 'purchaseReturn' and pms_voucher_dr_cr_note_dtl.status != 2 UNION ALL select refrance_id reference_id, 'SaleReturn' static_type, monthname(pms_voucher_dr_cr_note_dtl.date_of_issue) monthname, pms_voucher_dr_cr_note_dtl.date_of_issue inv_date, pms_voucher_dr_cr_note_dtl.quantity qty, pms_voucher_dr_cr_note_dtl.tax_value value, pms_voucher_dr_cr_note_mst.bill_party_name party_name from pms_voucher_dr_cr_note_dtl right join pms_voucher_dr_cr_note_mst on refrance_id = dr_cr_Id where `product_name` = '" + product_desc_id.Value + "' and note_type = 'saleReturn' and pms_voucher_dr_cr_note_dtl.status != 2 group by monthname(pms_voucher_dr_cr_note_dtl.date_of_issue)) t1");
            while (day_reader != null && day_reader.Read())
            {
                char[] MyChar = { '~' };
                string edit_button = "<a href='" + baseHealpare.RedirectURLS[day_reader["static_type"].ToString()].Trim(MyChar) + "?value=" + baseHealpare.EncodeUrl(this, day_reader["reference_id"].ToString()) + "' class='btn btn-sm fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record' style='color:#17a2b8;'></>  ";
                edit_button = "<a onclick='preparePopup(this)' data-modal-title='Edit Record' data-message='Current Account is locked with " + day_reader["static_type"].ToString() + " if you want to edit Voucher please click YES?' data-url='" + baseHealpare.RedirectURLS[day_reader["static_type"].ToString()].Trim(MyChar) + "?value=" + baseHealpare.EncodeUrl(this, day_reader["reference_id"].ToString()) + "" + "' class='btn btn-sm fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record' style='color:#17a2b8;'></>";
                edit_button += "" + "<a onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='" + baseHealpare.RedirectURLS[day_reader["static_type"].ToString()].Trim(MyChar) + "?delete=delete&value=" + baseHealpare.EncodeUrl(this, day_reader["reference_id"].ToString()) + "' class='btn btn-sm fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record' style='color: red;'></>";

                double st_outward_qty = 0.00;
                double st_outward_value = 0.00;
                double st_inward_qty = 0.00;
                double st_inward_value = 0.00;

                if (day_reader["static_type"].ToString() == "sales")
                {
                    st_outward_qty = Convert.ToDouble(day_reader["quantity"].ToString());
                    st_outward_value = Convert.ToDouble(day_reader["value"]);
                }
                if (day_reader["static_type"].ToString() == "purchase")
                {
                    st_inward_qty = Convert.ToDouble(day_reader["quantity"].ToString());
                    st_inward_value = Convert.ToDouble(day_reader["value"]);
                }
                if (day_reader["static_type"].ToString() == "PurchaseReturn")
                {
                    st_outward_qty = Convert.ToDouble(day_reader["quantity"].ToString());
                    st_outward_value = Convert.ToDouble(day_reader["value"]);
                }
                if (day_reader["static_type"].ToString() == "SaleReturn")
                {
                    st_inward_qty = Convert.ToDouble(day_reader["quantity"].ToString());
                    st_inward_value = Convert.ToDouble(day_reader["value"]);
                }
                    op_balance_day = Convert.ToDouble(op_balance_day + (st_inward_qty) - (st_outward_qty));

                double val = (inward_val_sec + st_inward_value);
                double qty = (inward_qty_sec + st_inward_qty);
                val = val + op_balance_val;
                qty = qty + op_balance_qty;
                if (val != 0 || qty != 0)
                {
                    inward_cost = (val / qty);
                }
                
                if (inward_cost != 0)
                {
                    cl_value = inward_cost;
                }

                if (op_balance_day != 0)
                {
                    cl_value = op_balance_day;
                }

                if (inward_cost != 0)
                {
                    if (op_balance_day != 0)
                    {
                        cl_value = (inward_cost * op_balance_day);
                    }
                }

                json_day_stk_ledger_array.Add(new
                {
                    month = day_reader["monthname"],
                    inv_date = Convert.ToDateTime(day_reader["inv_date"]).ToString("dd/MM/yyyy"),
                    party_name = day_reader["party_name"],
                    inward_qty = Math.Round(st_inward_qty).ToString("0.00"),
                    inward_value = Math.Round(st_inward_value).ToString("0.00"),
                    outward_qty = Math.Round(st_outward_qty).ToString("0.00"),
                    outward_value = Math.Round(st_outward_value).ToString("0.00"),
                    cl_bal_qty = Math.Round(op_balance_day).ToString("0.00"),
                    cl_bal_value = Math.Round(cl_value).ToString("0.00"),
                    action = edit_button
                });
                inward_qty_sec = op_balance_day;
                inward_val_sec = cl_value;
            }
            if (day_reader != null)
            {
                day_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_day_stk_ledger_obj = serializer.Serialize(json_day_stk_ledger_array);
            }
        }
    }
}