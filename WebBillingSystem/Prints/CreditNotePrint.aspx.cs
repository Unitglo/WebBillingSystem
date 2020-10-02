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
    public partial class CreditNotePrint : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            //  System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))  - invoice id 
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditMst, " where dr_cr_Id =" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            while (reader != null && reader.Read())                
            {
                bill_party_name.InnerText = reader["bill_party_name"].ToString();
                bill_to_party_Seller_address.InnerText = reader["bill_party_address"].ToString();
                bill_to_party_gstin.InnerText = reader["bill_party_gstin"].ToString();
                bill_to_party_s_state.InnerText = reader["bill_party_state"].ToString();
                bill_to_party_state_code.InnerText = reader["bill_party_state_code"].ToString();
                ship_to_party_ship_party_name.InnerText = reader["ship_party_name"].ToString();
                ship_to_party_ship_party_address.InnerText = reader["ship_party_address"].ToString();
                ship_to_party_ship_party_gstin.InnerText = reader["ship_party_gstin"].ToString();
                ship_to_party_ship_party_state.InnerText = reader["ship_party_state"].ToString();
                ship_to_party_ship_party_state_code.InnerText = reader["ship_party_code"].ToString();
              
                bill_to_party_invoice_date.InnerText = reader["date_of_invoice"].ToString();

                document_no.InnerText = reader["document_no"].ToString();
                date_of_issue.InnerText = reader["date_of_issue"].ToString();
                against_invoice.InnerText = reader["against_invoice"].ToString();
                date_of_invoice.InnerText = reader["date_of_invoice"].ToString();
                doc_state_code.InnerText = reader["doc_state_code"].ToString();
                doc_state.InnerText = reader["doc_state"].ToString();

                tot_amt_aftertax.InnerHtml = reader["total_cost"].ToString();
                tot_row_Amt_tax.InnerHtml = reader["total_cost"].ToString();
                tot_invoice_beforetax.InnerHtml = ((double.Parse(reader["total_cost"].ToString())) - (double.Parse(reader["total_sgst"].ToString())) - (double.Parse(reader["total_cgst"].ToString())) - (double.Parse(reader["total_igst"].ToString()))).ToString();
                double totalbeforetax = ((double.Parse(reader["total_cost"].ToString())) - (double.Parse(reader["total_sgst"].ToString())) - (double.Parse(reader["total_cgst"].ToString())) - (double.Parse(reader["total_igst"].ToString())));
            }
            if (reader!=null)
            reader.Close();

            double row_qty = 0.0;
            double row_amt = 0.0;
            double row_taxvalue = 0.0;
            double row_discount = 0.0;
            double row_cgstamount = 0.0;
            double row_sgstamount = 0.0;
            double row_igstamount = 0.0;

            /// porduct details table pms_sale_invoice_dtl
            MySqlDataReader reader2 = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditDtl, " where refrance_id =" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            string rows = "";
            int i = 0;
            while (reader2 != null && reader2.Read())
            {
                i++;
                row_qty = row_qty + double.Parse(reader2["quantity"].ToString());
                row_amt = row_amt + double.Parse(reader2["amount"].ToString());
                row_taxvalue = row_taxvalue + double.Parse(reader2["tax_value"].ToString());
                row_discount = row_discount + double.Parse(reader2["discount"].ToString());
                row_cgstamount = row_cgstamount + double.Parse(reader2["cgst_amount"].ToString());
                row_sgstamount = row_sgstamount + double.Parse(reader2["sgst_amount"].ToString());
                row_igstamount = row_igstamount + double.Parse(reader2["igst_amount"].ToString());

                rows += "<tr><td style='border: 1px solid!important; '>"+i+"</td>" +
                            "<td style = 'border: 1px solid!important; ' class='product - discription'>" + reader2["product_name"].ToString() + "</td>" +
                            "<td style = 'border: 1px solid!important; ' class='hsncode'>" + reader2["hsn_code"].ToString() + " </td>" +
                                            "<td style = 'border: 1px solid!important; ' class='uom'>" + reader2["uom"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; ' class='batchClass'>" + reader2["batch"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; ' class='expiryClass'>" + reader2["expiry_date"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; ' class='qty'>" + reader2["quantity"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; display: none; ' class='rate'>" + reader2["rate"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; ' class='amount'>" + reader2["amount"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; ' class='discount'>" + reader2["discount"].ToString() + "</td>" +
                                            "<td style = 'border: 1px solid!important; ' class='tax - value'>" + reader2["tax_value"].ToString() + "</td>" +

                                 "<td style = 'border: 1px solid!important; ' class='igst - rate'>" + reader2["igst_rate"].ToString() + "</td>" +
                                 "<td style = 'border: 1px solid!important; ' class='igst - amount'>" + reader2["igst_amount"].ToString() + "</td>" +
                                    "<td style = 'border: 1px solid!important; ' class='cgst - rate'>" + reader2["cgst_rate"].ToString() + "</td>" +
                                   "<td style = 'border: 1px solid!important; ' class='cgst - amount'>" + reader2["cgst_amount"].ToString() + "</td>" +
                                  "<td style = 'border: 1px solid!important; ' class='sgst - rate'>" + reader2["sgst_rate"].ToString() + "</td>" +
                                  "<td style = 'border: 1px solid!important; ' class='sgst - amount'>" + reader2["sgst_amount"].ToString() + "</td>" +
                                 "<td style = 'border:1px solid!important;' class='tot_class'>" + reader2["total"].ToString() + "</td></tr>";
                ;
            }

            item_holder_tbody.InnerHtml = rows;
            tot_row_Quant.InnerHtml = "" + row_qty;
            tot_row_Amt.InnerHtml = "" + row_amt;
            tot_row_Taxval.InnerHtml = "" + row_taxvalue;
            tot_row_Dis.InnerHtml = "" + row_discount;
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