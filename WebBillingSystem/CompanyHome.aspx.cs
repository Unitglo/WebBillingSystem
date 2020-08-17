using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class CompanyHome : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public string company_name;
        public string address_name;
        public string gst_no;
        public string json_obj_expenses_count;
        public string json_obj_saleinv_count;
        public string json_obj_dr_cr_count;
        public string json_obj_purchaseinv_count;
        public string json_obj_opstock_count;
        public string json_obj_expense_count;
        public string json_obj_nonexpenses_count;
        public string json_obj;
        public System.Collections.ArrayList news_master;
        public System.Collections.ArrayList exp_obj_count;
        public System.Collections.ArrayList saleinv_obj_count;
        public System.Collections.ArrayList credit_debit_obj_count;
        public System.Collections.ArrayList purchaseinv_obj_count;
        public System.Collections.ArrayList opstock_obj_count;
        public System.Collections.ArrayList expense_obj_count;
        public System.Collections.ArrayList nonexpenses_obj_count;
        public string final_json_obj_count;
        public System.Collections.ArrayList final_obj_count;
        public System.Collections.ArrayList purchase_obj_count;
        public System.Collections.ArrayList sale_obj_count;
        public System.Collections.ArrayList dabit_obj_count;
        public System.Collections.ArrayList credit_obj_count;
        DateTime dateTime = DateTime.UtcNow.Date;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            if(Session["role_code"] == null || Session["role_code"] + "" != "COMPANY") { 
                Response.Redirect("~/Login");
        }

            MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "WHERE company_ca_ucid='" + Session["ca_code"].ToString() + "'  and company_ucid = '" + Session["company_code"] + "'");
            if (sess_login_reader != null)
            {
                if (sess_login_reader != null && sess_login_reader.Read())
                {
                    company_name = sess_login_reader["company_first_name"] + " " + sess_login_reader["company_middle_name"] + " " + sess_login_reader["company_surname"];
                    address_name = sess_login_reader["company_address_one"] + " " + sess_login_reader["company_address_two"] + "" + sess_login_reader["company_address_three"];
                    gst_no = "" + sess_login_reader["company_gst_number"];
                }
            }
// SALE COUNT START
            MySqlDataReader sale_count = baseHealpare.SelectManualQuery("SELECT month(pms_sale_invoice_mst.invoice_date) as month,sum(qty) as qty,sum(igst_amt) as igst_amt,sum(cgst_amt) as cgst_amt,sum(sgst_amount) as sgst_amt ,sum(amount) as total FROM pms_sale_invoice_dtl left join pms_sale_invoice_mst on pms_sale_invoice_mst.sale_mst_id = pms_sale_invoice_dtl.reference_id where pms_sale_invoice_mst.status != 2 group by Month(pms_sale_invoice_mst.invoice_date)");
            saleinv_obj_count = new System.Collections.ArrayList();
            while (sale_count != null && sale_count.Read())
            {
                saleinv_obj_count.Add(new
                {
                    month = sale_count["month"],
                    qty = sale_count["qty"],
                    igst_amt = sale_count["igst_amt"],
                    cgst_amt = sale_count["cgst_amt"],
                    sgst_amt = sale_count["sgst_amt"],
                    total = sale_count["total"]
                });
            }
            if (sale_count != null)
            {
                sale_count.Close();
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_saleinv_count = serializer_obj.Serialize(saleinv_obj_count);
            }
    // SALE COUNT STOP
    // DEBIT CREDIT COUNT START
            MySqlDataReader credit_debit_count = baseHealpare.SelectManualQuery("SELECT Month(pms_voucher_dr_cr_note_mst.date_of_issue) as month ,pms_voucher_dr_cr_note_mst.note_type AS note_type,sum(quantity) as qty,sum(total) as total,sum(igst_amount) as igst_total,sum(cgst_amount) as cgst_total,sum(sgst_amount) as sgst_total FROM `pms_voucher_dr_cr_note_dtl` left join pms_voucher_dr_cr_note_mst on pms_voucher_dr_cr_note_dtl.refrance_id = pms_voucher_dr_cr_note_mst.dr_cr_Id group by pms_voucher_dr_cr_note_mst.note_type, Month(pms_voucher_dr_cr_note_mst.date_of_issue)");
            credit_debit_obj_count = new System.Collections.ArrayList();
            while (credit_debit_count != null && credit_debit_count.Read())
            {
                credit_debit_obj_count.Add(new
                {
                    month = credit_debit_count["month"],
                    qty = credit_debit_count["qty"],
                    note_type = credit_debit_count["note_type"],
                    igst_amt = credit_debit_count["igst_total"],
                    cgst_amt = credit_debit_count["cgst_total"],
                    sgst_amt = credit_debit_count["sgst_total"],
                    total = credit_debit_count["total"]
                });
            }
            if (credit_debit_count != null)
            {
                credit_debit_count.Close();
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_dr_cr_count = serializer_obj.Serialize(credit_debit_obj_count);
            }
    // DEBIT CREDIT COUNT STOP

    // PURCHASE COUNT START
            MySqlDataReader purchase_count = baseHealpare.SelectManualQuery("SELECT month(pms_purchase_invoice_mst.invoice_date) as month,sum(qty) as qty,sum(igst_amt) as igst_amt,sum(cgst_amt) as cgst_amt,sum(sgst_amount) as sgst_amt ,sum(amount) as total FROM `pms_purchase_invoice_dtl` left join pms_purchase_invoice_mst on pms_purchase_invoice_mst.pur_mst_auto_id = pms_purchase_invoice_dtl.reference_id where pms_purchase_invoice_mst.status != 2 group by Month(pms_purchase_invoice_mst.invoice_date)");
            purchaseinv_obj_count = new System.Collections.ArrayList();
            while (purchase_count != null && purchase_count.Read())
            {
                purchaseinv_obj_count.Add(new
                {
                    month = purchase_count["month"],
                    qty = purchase_count["qty"],
                    igst_amt = purchase_count["igst_amt"],
                    cgst_amt = purchase_count["cgst_amt"],
                    sgst_amt = purchase_count["sgst_amt"],
                    total = purchase_count["total"],
                });
            }
            if (purchase_count != null)
            {
                purchase_count.Close();
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_purchaseinv_count = serializer_obj.Serialize(purchaseinv_obj_count);
            }
    // PURCHASE COUNT STOP

    // OP STOCK COUNT START
            MySqlDataReader opstock_count = baseHealpare.SelectManualQuery("SELECT Month(default_date) AS month, sum(stock_opening_amt) openi_amt_cnt FROM pms_stock WHERE status != 2 group by Month(default_date)");
            opstock_obj_count = new System.Collections.ArrayList();
            while (opstock_count != null && opstock_count.Read())
            {
                opstock_obj_count.Add(new
                {
                    month = opstock_count["month"],
                    op_stock_cnt = opstock_count["openi_amt_cnt"]
                });
            }
            if (opstock_count != null)
            {
                opstock_count.Close();
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_opstock_count = serializer_obj.Serialize(opstock_obj_count);
            }

    // OP STOCK COUNT STOP
    
    // EXPENSES COUNT START
            expense_obj_count = new System.Collections.ArrayList();
            MySqlDataReader expenses_count = baseHealpare.SelectManualQuery("SELECT Month(pms_expenses_voucher_mst.exp_voucher_date) as month, 0 as qty,sum(exp_tax_value) as total ,sum(exp_igst_amount) as igst_total, sum(exp_cgst_amount) as cgst_total, sum(exp_sgst_amount) as sgst_total FROM pms_expenses_voucher_dtl left join pms_expenses_voucher_mst on pms_expenses_voucher_dtl.exp_voucherno = pms_expenses_voucher_mst.exp_voucher_no group by Month(pms_expenses_voucher_mst.exp_voucher_date)");
            while (expenses_count != null && expenses_count.Read())
            {
                expense_obj_count.Add(new
                {
                    qty = expenses_count["qty"],
                    gst_expensestotal = expenses_count["total"],
                    month = expenses_count["month"],
                    expeses_igst = expenses_count["igst_total"],
                    expeses_cgst = expenses_count["cgst_total"],
                    expeses_sgst = expenses_count["sgst_total"]
                });
            }
            if (expenses_count != null)
            {
                expenses_count.Close();                
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_expense_count = serializer_obj.Serialize(expense_obj_count);
            }
    // EXPENSES COUNT STOP
    // NON-EXPENSES COUNT START
            nonexpenses_obj_count = new System.Collections.ArrayList();
            MySqlDataReader non_expenses_count = baseHealpare.SelectManualQuery("select month(pms_journal_entry_mst.jv_date) as month,sum(debit_amount)as debit_amount ,sum(credit_amount)as credit_amount from pms_journal_entry_dtl left join pms_journal_entry_mst on pms_journal_entry_dtl.journal_id=pms_journal_entry_mst.journal_id left join pms_account_master on pms_journal_entry_dtl.name=pms_account_master.account_head where pms_account_master.account_main_group=7 group by month(pms_journal_entry_mst.jv_date)");
            while (non_expenses_count != null && non_expenses_count.Read())
            {
                nonexpenses_obj_count.Add(new
                {
                    month = non_expenses_count["month"],
                    debit_amount = non_expenses_count["debit_amount"]
                });
            }
            if (non_expenses_count != null)
            {
                non_expenses_count.Close();
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_nonexpenses_count = serializer_obj.Serialize(nonexpenses_obj_count);

            }
     // NON-EXPENSES COUNT STOP 
     
            MySqlDataReader graph_count = baseHealpare.SelectAllValues(
                "IFNULL(sum(pms_purchase_invoice_mst.total_cost),0) as purchase_tot," +
                "IFNULL(sum(pms_sale_invoice_mst.total_cost), 0) as sale_tot," +
                "IFNULL(sum(if (note_type = 'credit',   pms_voucher_dr_cr_note_mst.total_cost,   0)    ),0) as credit_tot," +
                "IFNULL(sum(if (pms_voucher_dr_cr_note_mst.note_type = 'credit',0,pms_voucher_dr_cr_note_mst.total_cost)),0) as debit_tot," +
                "meses.month",
                "  (" +
                       "  SELECT 4 AS MONTH " +
                       "  UNION SELECT 5 AS MONTH " +
                       "  UNION SELECT 6 AS MONTH " +
                       "  UNION SELECT 7 AS MONTH " +
                       "  UNION SELECT 8 AS MONTH " +
                       "  UNION SELECT 9 AS MONTH " +
                       "  UNION SELECT 10 AS MONTH " +
                       "  UNION SELECT 11 AS MONTH " +
                       "  UNION SELECT 12 AS MONTH " +
                       "  UNION SELECT 1 AS MONTH " +
                       "  UNION SELECT 2 AS MONTH " +
                       "  UNION SELECT 3 AS MONTH " +
            "  ) as meses " +
                "LEFT JOIN pms_sale_invoice_mst ON meses.month = MONTH(pms_sale_invoice_mst.invoice_date)" +
                "LEFT JOIN pms_purchase_invoice_mst ON meses.month = MONTH(pms_purchase_invoice_mst.invoice_date)" +
                "LEFT JOIN pms_voucher_dr_cr_note_mst ON meses.month = MONTH(pms_voucher_dr_cr_note_mst.date_of_invoice)"
                , "GROUP BY meses.month order by  IF(meses.month < '4',meses.month + 12, meses.month), meses.month");
            purchase_obj_count = new System.Collections.ArrayList();
            sale_obj_count = new System.Collections.ArrayList();
            dabit_obj_count = new System.Collections.ArrayList();
            credit_obj_count = new System.Collections.ArrayList();
            while (graph_count != null && graph_count.Read())
            {
                purchase_obj_count.Add(graph_count["purchase_tot"]);
                sale_obj_count.Add(graph_count["sale_tot"]);
                dabit_obj_count.Add(graph_count["debit_tot"]);
                credit_obj_count.Add(graph_count["credit_tot"]);
            }
            if (graph_count != null)
                graph_count.Close();

            final_obj_count = new System.Collections.ArrayList();
            final_obj_count.Add(new
            {
                purchase_amount = purchase_obj_count,
                sale_amount = sale_obj_count,
                dabit_amount = dabit_obj_count,
                credit_amount = credit_obj_count
            }
        );

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            final_json_obj_count = serializer.Serialize(final_obj_count);

            MySqlDataReader expense_count = baseHealpare.SelectAllValues("sum(total_cost) as exp_tot, MONTH(exp_voucher_date) as month_id", baseHealpare.expenses_voucher_mst, "GROUP BY MONTH(exp_voucher_date)");
            exp_obj_count = new System.Collections.ArrayList();
            while (expense_count != null && expense_count.Read())
            {
                exp_obj_count.Add(new
                {
                    exp_tot = expense_count["exp_tot"],
                    month_id = "" + expense_count["month_id"]
                });
            }
            if (expense_count != null)
            {
                expense_count.Close();
                JavaScriptSerializer serializer_obj = new JavaScriptSerializer();
                json_obj_expenses_count = serializer_obj.Serialize(exp_obj_count);
            }

            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.news_and_update_table, " where status = 0 and pms_news_validate_from_date <= '"+ dateTime.ToString("yyyy-MM-dd") + "' and pms_news_validate_to_date >= '" + dateTime.ToString("yyyy-MM-dd") + "'");
            news_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                news_master.Add(new
                {
                    pms_news_title = reader["pms_news_title"],
                    pms_news_description = Regex.Replace(reader["pms_news_description"].ToString(), @"[^0-9a-zA-Z]+", " "),
                    pms_news_validate_from_date = Convert.ToDateTime(reader["pms_news_validate_from_date"].ToString()).ToString("yyyy-MM-dd"),
                    pms_news_validate_to_date = Convert.ToDateTime(reader["pms_news_validate_to_date"].ToString()).ToString("yyyy-MM-dd"),
                    pms_news_in_out_app = reader["pms_news_in_out_app"],
                    pms_news_outapp_link = reader["pms_news_outapp_link"]
                });
            }
            if (reader != null)
            {
                reader.Close();
                serializer = new JavaScriptSerializer();
                json_obj = serializer.Serialize(news_master);
            }
        }
    }
}