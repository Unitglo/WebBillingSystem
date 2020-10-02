using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBillingSystem.Prints
{
    public partial class ExpensePrint : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.expenses_voucher_mst, " where exp_voucher_no =" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            while (reader != null && reader.Read())
            {

                exp_invoice_no.InnerText = reader["exp_invoice_no"].ToString();
                exp_voucher_date.InnerText = reader["exp_voucher_date"].ToString();
                exp_reverse_charge.InnerText = reader["exp_reverse_charge"].ToString();
                exp_supplier_name.InnerText = reader["exp_supplier_name"].ToString();
                exp_supplier_addr.InnerText = reader["exp_supplier_addr"].ToString();
                exp_supplier_gstin.InnerText = reader["exp_supplier_gstin"].ToString();
                expenses_head.InnerText = reader["expenses_head"].ToString();
                company_name.InnerText = reader["company_name"].ToString();
               // invoice_date1.InnerText = reader["exp_voucher_date"].ToString();
                exp_state_code.InnerText = reader["exp_state_code"].ToString();
                exp_state.InnerText = reader["exp_state"].ToString();
                exexp_invoice_no.InnerText = reader["exp_invoice_no"].ToString();

                tot_tax.InnerHtml= ((double.Parse(reader["total_cgst"].ToString())) + double.Parse(reader["total_sgst"].ToString()) + (double.Parse(reader["total_igst"].ToString()))).ToString();
                double tot_tax1 = ((double.Parse(reader["total_cgst"].ToString())) + double.Parse(reader["total_sgst"].ToString()) + (double.Parse(reader["total_igst"].ToString())));
                
                tot_amt_aftertax.InnerHtml = reader["total_cost"].ToString();
                tot_row_Amt_tax.InnerHtml = reader["total_cost"].ToString();
                tot_invoice_beforetax.InnerHtml = ((double.Parse(reader["total_cost"].ToString())) - (double.Parse(reader["total_sgst"].ToString())) - (double.Parse(reader["total_cgst"].ToString())) - (double.Parse(reader["total_igst"].ToString()))).ToString();
                double totalbeforetax = ((double.Parse(reader["total_cost"].ToString())) - (double.Parse(reader["total_sgst"].ToString())) - (double.Parse(reader["total_cgst"].ToString())) - (double.Parse(reader["total_igst"].ToString())));
            }
            if (reader != null)
                reader.Close();
            double row_taxvalue = 0.0;
            double row_cgstamount = 0.0;
            double row_sgstamount = 0.0;
            double row_igstamount = 0.0;

            /// porduct details table pms_expenses_invoice_dtl
            MySqlDataReader reader2 = baseHealpare.SelectAllValues(baseHealpare.expenses_voucher_dtl, " where exp_voucherno=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            string rows = "";
            int i = 0;
            while (reader2 != null && reader2.Read())
            {
                i++;
                row_taxvalue = row_taxvalue + double.Parse(reader2["exp_tax_value"].ToString());
               
                row_cgstamount = row_cgstamount + double.Parse(reader2["exp_cgst_amount"].ToString());
                row_sgstamount = row_sgstamount + double.Parse(reader2["exp_sgst_amount"].ToString());
                row_igstamount = row_igstamount + double.Parse(reader2["exp_igst_amount"].ToString());

                rows += "<tr><td style='border: 1px solid!important; '>" + i + "</td>" +
                           "<td style = 'border: 1px solid!important; ' class='product - discription'>" + reader2["exp_product_name"].ToString() + "</td>" +
                            "<td style = 'border: 1px solid!important; ' class='hsncode'>" + reader2["exp_hsn_code"].ToString() + "</td>" +
                           "<td style = 'border: 1px solid!important; ' class='tax - value'>" + reader2["exp_tax_value"].ToString() + "</td>" +
                            "<td style = 'border: 1px solid!important; ' class='igst - rate'>" + reader2["exp_igst_rate"].ToString() + "</td>" +
                           "<td style = 'border: 1px solid!important; ' class='igst - amount'>" + reader2["exp_igst_amount"].ToString() + "</td>" +

                           "<td style = 'border: 1px solid!important; ' class='cgst - rate'>" + reader2["exp_cgst_rate"].ToString() + "</td>" +
                            "<td style = 'border: 1px solid!important; ' class='cgst - amount'>" + reader2["exp_cgst_amount"].ToString() + "</td>" +
                            "<td colspan='2' style = 'border: 1px solid!important; ' class='sgst - rate'>" + reader2["exp_sgst_rate"].ToString() + "</td>" +
                            "<td colspan='2' style = 'border: 1px solid!important; ' class='sgst - amount'>" + reader2["exp_sgst_amount"].ToString() + "</td>" +
                             "<td  style = 'border:1px solid!important;' class='tot_class'>" + reader2["exp_total_amount"].ToString() + "</td></tr>";
                ;
            }

            item_holder_tbody.InnerHtml = rows;

            tot_row_Taxval.InnerHtml = "" + row_taxvalue;
            tot_row_cgst.InnerHtml = "" + row_cgstamount;
            tot_add_cgst.InnerHtml = "" + row_cgstamount;
            tot_row_sgst.InnerHtml = "" + row_sgstamount;
            tot_add_sgst.InnerHtml = "" + row_sgstamount;
            tot_row_igst.InnerHtml = "" + row_igstamount;
            tot_add_igst.InnerHtml = "" + row_igstamount;
            if (reader2 != null)
                reader2.Close();

        }
    }
}
    


     