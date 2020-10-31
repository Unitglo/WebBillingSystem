using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class home : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (Request.QueryString.Count != 0)
            {
                if (Request.QueryString["value"] != null)
                {
                    string company_name = "";
                    MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "WHERE company_ucid='" + baseHealpare.DecodeUrl(this, Request.QueryString["value"]) + "'");

                    if (sess_login_reader != null && sess_login_reader.Read())
                    {
                        Session["First_auth"] = sess_login_reader["company_primary_sign_name"];
                        company_name = sess_login_reader["company_first_name"] + " " + sess_login_reader["company_middle_name"] + " " + sess_login_reader["company_surname"];
                        Session["Second_auth"] = sess_login_reader["company_secondery_sign_name"];
                        baseHealpare.createSession(this, "company", "" + sess_login_reader["company_ucid"], company_name, "" + sess_login_reader["company_db"], "" + sess_login_reader["company_state"], "" + sess_login_reader["company_state_code"]);
                        Session["start_date"] = sess_login_reader["company_start_date"].ToString();
                        Session["end_date"] = sess_login_reader["company_end_date"].ToString();
                        Session["company_code"] = sess_login_reader["company_ucid"];
                        Session["ca_code"] = sess_login_reader["company_ca_ucid"];
                        Session["role_code"] = "COMPANY";
                    }
                    if (sess_login_reader != null)
                        sess_login_reader.Close();
                    String alter_OBJ = File.ReadAllText(Server.MapPath("~/Base/alter_query.txt"));
                   ;
                    foreach (String alter_query in alter_OBJ.Split(';'))
                    {
                        baseHealpare.SelectManualQuery(alter_query);
                    }


                    if (Session["role_code"] != null)
                        if (Session["role_code"] + "" == "SUPERADMIN")
                            Response.Redirect("~/SuperadminHome.aspx");
                        else if (Session["role_code"] + "" == "CA")
                            Response.Redirect("~/CAHome.aspx");
                        else if (Session["role_code"] + "" == "COMPANY")
                            Response.Redirect("~/CompanyHome.aspx");
                }
                else
                {
                    baseHealpare.MessageBox(this, "Error on message");
                    Response.Redirect("~/Master/CompanyDetails.aspx");
                }
            }
            else
            {
                if (Session["role_code"] == null)
                    Response.Redirect("~/Login.aspx");
            }

        }
    }
}