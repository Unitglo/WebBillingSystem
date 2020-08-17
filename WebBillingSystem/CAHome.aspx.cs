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
    public partial class CAHome : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public string ca_name;
        public string address_name;
        public string gst_no;
        public string json_obj_expenses_count;
        public string json_obj;
        public string json_company_obj;
        public System.Collections.ArrayList news_master;
        public System.Collections.ArrayList company_master;
        public System.Collections.ArrayList exp_obj_count;
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

            if (Session["page_role"] == null || Session["page_role"]+"" != "CA")
                Response.Redirect("~/Login");

            MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCA, "WHERE ca_code= '" + Session["ca_code"].ToString() + "'");
            if (sess_login_reader != null)
            {
                if (sess_login_reader != null && sess_login_reader.Read())
                {
                    ca_name = ""+sess_login_reader["ca_name"];
                   // address_name = sess_login_reader["company_address_one"] + " " + sess_login_reader["company_address_two"] + "" + sess_login_reader["company_address_three"]; ;
                   // gst_no = "" + sess_login_reader["company_gst_number"];
                }
            }
            string gstdetailsrecieved = null;
            string gstfile = null;
            string companystatus = null;

            company_master = new System.Collections.ArrayList();
            //MySqlDataReader company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "WHERE company_ca_ucid='" + Session["ca_code"].ToString() + "'");
            MySqlDataReader company_reader = baseHealpare.SelectManualQuery("SELECT CONCAT(company_first_name,' ',company_middle_name, ' ' ,company_surname) AS companyname, company_state AS companystate, company_gst_number AS gstno, notif_gst_status AS gstfile, notif_data_load_status AS gstdetailsrecieved, status AS companystatus FROM `pms_company` AS pmscomp LEFT JOIN pms_notification_table AS notif ON notif.company_ucid = pmscomp.company_ucid WHERE company_ca_ucid = '" + Session["ca_code"].ToString() +"'");

            while (company_reader != null && company_reader.Read())
                {
                    if (""+company_reader["gstdetailsrecieved"] == "")
                    {
                     gstdetailsrecieved = "<span data-toggle='tooltip-dark' data-placement='top' title='Data Not Loaded'><i data-feather='download-cloud'></i></span>";
                    } else if (company_reader["gstdetailsrecieved"].ToString() == "1")
                    {
                    gstdetailsrecieved = "<span data-toggle='tooltip-dark' data-placement='top' title='Company Deatails Load'><i data-feather='upload-cloud'></i>";
                    } else if (company_reader["gstdetailsrecieved"].ToString() == "2")
                    {
                    gstdetailsrecieved = "<span data-toggle='tooltip-dark' data-placement='top' title='Send To company'><i data-feather='cloud'></i></span>";
                    }

                if (company_reader["gstfile"].ToString() == "")
                {
                    gstfile = "Do Not Created";
                }
                else if (company_reader["gstfile"].ToString() == "1")
                {
                    gstfile = "GST Created";
                }
                else if (company_reader["gstfile"].ToString() == "2")
                {
                    gstfile = "GST Filed";
                }

                
                if (company_reader["companystatus"].ToString() == "0")
                {
                    companystatus = "Active";
                }
                else if (company_reader["companystatus"].ToString() == "2")
                {
                    companystatus = "Removed";
                }

                company_master.Add(new
                    {
                        companyname = company_reader["companyname"],
                        companystate = company_reader["companystate"],
                        gstno = company_reader["gstno"],
                        gstdetailsrecieved = gstdetailsrecieved,
                        gstfile = gstfile,
                        companystatus = companystatus
                    });
                }
                if (company_reader != null)
                {
                    company_reader.Close();
                    JavaScriptSerializer serializerObj = new JavaScriptSerializer();
                    json_company_obj = serializerObj.Serialize(company_master);
                }
            

            MySqlDataReader graph_count = baseHealpare.SelectAllValues(
                "IFNULL(sum(pms_purchase_invoice_mst.total_cost),0) as purchase_tot," +
                "IFNULL(sum(pms_sale_invoice_mst.total_cost), 0) as sale_tot," +
                "IFNULL(sum(if (note_type = 'credit',   pms_voucher_dr_cr_note_mst.total_cost,   0)    ),0) as credit_tot," +
                "IFNULL(sum(if (pms_voucher_dr_cr_note_mst.note_type = 'credit',0,pms_voucher_dr_cr_note_mst.total_cost)),0) as debit_tot," +
                "meses.month",
                "  (" +
                "     SELECT 1 AS MONTH " +
                      "   UNION SELECT 2 AS MONTH " +
                       "  UNION SELECT 3 AS MONTH " +
                       "  UNION SELECT 4 AS MONTH " +
                       "  UNION SELECT 5 AS MONTH " +
                       "  UNION SELECT 6 AS MONTH " +
                       "  UNION SELECT 7 AS MONTH " +
                       "  UNION SELECT 8 AS MONTH " +
                       "  UNION SELECT 9 AS MONTH " +
                       "  UNION SELECT 10 AS MONTH " +
                       "  UNION SELECT 11 AS MONTH " +
                       "  UNION SELECT 12 AS MONTH " +
            "  ) as meses " +
                "LEFT JOIN pms_sale_invoice_mst ON meses.month = MONTH(pms_sale_invoice_mst.invoice_date)" +
                "LEFT JOIN pms_purchase_invoice_mst ON meses.month = MONTH(pms_purchase_invoice_mst.invoice_date)" +
                "LEFT JOIN pms_voucher_dr_cr_note_mst ON meses.month = MONTH(pms_voucher_dr_cr_note_mst.date_of_invoice)"
                , "GROUP BY meses.month");
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

            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.news_and_update_table, " where status = 0 and pms_news_validate_from_date <= '" + dateTime.ToString("yyyy-MM-dd") + "' and pms_news_validate_to_date >= '" + dateTime.ToString("yyyy-MM-dd") + "'");
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