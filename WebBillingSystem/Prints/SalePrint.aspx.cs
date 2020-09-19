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
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            //  System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))  - invoice id 
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleMst, " where sale_mst_id =" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            while (reader != null && reader.Read())                
            {
                bill_to_party_name.InnerText = reader["seller_name"].ToString();
                bill_to_party_Seller_address.InnerText = reader["Seller_address"].ToString();
            }
            if(reader!=null)
            reader.Close();



            /// porduct details table pms_sale_invoice_dtl
            MySqlDataReader reader2 = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleDtl, " where reference_id =" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            string rows = "";
            int i = 0;
            while (reader2 != null && reader2.Read())
            {
                i++;
rows+= "<tr><td style='border: 1px solid!important; '>"+i+"</td>" +
                            "<td style = 'border: 1px solid!important; ' class='product - discription'>"+ reader2["product_desc"].ToString() + "</td>" +
                            "<td style = 'border: 1px solid!important; ' class='hsncode'>4802</td>" +
                            "<td style = 'border: 1px solid!important; ' class='uom'>KGS-KILOGRAMS</td>" +
                            "<td style = 'border: 1px solid!important; ' class='batchClass'>0</td>" +
                            "<td style = 'border: 1px solid!important; ' class='expiryClass'>2021-01-19</td>" +
                            "<td style = 'border: 1px solid!important; ' class='qty'>1198.00</td>" +
                            "<td style = 'border: 1px solid!important; display: none; ' class='rate'>64.69</td>" +
                            "<td style = 'border: 1px solid!important; ' class='amount'>" + reader2["amount"].ToString() + "</td>" +
                            "<td style = 'border: 1px solid!important; ' class='discount'>0.00</td>" +
                            "<td style = 'border: 1px solid!important; ' class='tax - value'>77500.00</td>" +
                            "<td style = 'border: 1px solid !important;' class='igst - rate'>0</td>" +
                            "<td style = 'border: 1px solid !important;' class='igst - amount'>0</td>" +
                            "<td style = 'border: 1px solid!important; ' class='cgst - rate'>6.00</td>" +
                            "<td style = 'border: 1px solid!important; ' class='cgst - amount'>4650</td>" +
                            "<td style = 'border: 1px solid!important; ' class='sgst - rate'>6.00</td>" +
                            "<td style = 'border: 1px solid!important; ' class='sgst - amount'>4650</td>" +
                             "<td style = 'border:1px solid!important;' class='tot_class'>86800.00</td></tr>";
                ;
            }

            item_holder_tbody.InnerHtml = rows;
            if (reader2 != null)
                reader2.Close();

        }
    }
}