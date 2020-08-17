using MySql.Data.MySqlClient;
using System;
using System.IO;

using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace WebBillingSystem
{
    public partial class Company : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare ;
        //MySqlDataReader reader;
        public System.Collections.ArrayList comp_master;
        public string json_obj;
        public System.Collections.ArrayList State_json;

        protected void Page_Load(object sender, EventArgs e)
        {
            password_field.Attributes["type"] = "password";
            baseHealpare = new DataBaseHealpare();
            baseHealpare.MessageBox(this,SQLfile());
            //==================== Code for field state==============
            MySqlDataReader company_state = baseHealpare.SelectAllValues(baseHealpare.TableAccountstate, "where status=0");
            while (company_state != null && company_state.Read())
            {
                Select_state.Items.Add(new ListItem(company_state["pms_account_state_name"].ToString(), company_state["pms_account_state_code"].ToString()));
            }
            if (company_state != null)
            {
                company_state.Close();
            }
            // =======================Code for field persontype==========
            MySqlDataReader company_person_type = baseHealpare.SelectAllValues(baseHealpare.TableCompanypersontype, "where status=0");
            while (company_person_type != null && company_person_type.Read())
            {
                person_type.Items.Add(new ListItem(company_person_type["person_type_name"].ToString(), company_person_type["person_type_name"].ToString()));
            }
            if (company_person_type != null)
            {
                company_person_type.Close();
            }

            company_state = baseHealpare.SelectAllValues(baseHealpare.TableAccountstate, "where status=0");
            comp_master = new System.Collections.ArrayList();
            while (company_state != null && company_state.Read())
            {
                comp_master.Add(new
                {
                    pms_account_state_name = company_state["pms_account_state_name"],
                    company_state_code = company_state["pms_account_state_code"]
                });
            }
            if (company_state != null)
            {
                company_state.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj = serializer.Serialize(comp_master);
            }


            //==============code for view data==========================
            if (Request.QueryString.Count == 0)
            {
                breadcrumb_title.InnerHtml = "Add Company";
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    breadcrumb_title.InnerHtml = "Update Company";

                    MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "where company_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    while (reader != null && reader.Read())
                    {
                        customerid.Value = reader["company_ucid"].ToString();
                        person_type.SelectedIndex = person_type.Items.IndexOf(person_type.Items.FindByText(reader["company_person_type"].ToString()));
                        surnamename.Value = reader["company_surname"].ToString();
                        middlename.Value = reader["company_middle_name"].ToString();
                        firstname.Value = reader["company_first_name"].ToString();
                        address1.Value = reader["company_address_one"].ToString();
                        address2.Value = reader["company_address_two"].ToString();
                        address3.Value = reader["company_address_three"].ToString();
                        district.Value = reader["company_district"].ToString();
                        string a = reader["company_state"].ToString();
                        Select_state.SelectedIndex = Select_state.Items.IndexOf(Select_state.Items.FindByValue(a.ToString()));
                        state_code.Value = reader["company_state_code"].ToString();
                        country.Value = reader["company_country"].ToString();
                        pincode.Value = reader["company_pincode"].ToString();
                        email.Value = reader["company_email"].ToString();
                        phone.Value = reader["company_phone_number"].ToString();
                        gst_no.Value = reader["company_gst_number"].ToString();
                        pan_no.Value = reader["company_pan_number"].ToString();
                        cin_no.Value = reader["company_cin_number"].ToString();
                        trade_name.Value = reader["company_trade_name"].ToString();
                        gst_practinoer_ucid.Value = reader["company_gst_practitioner_ucid"].ToString();
                        ca_ucid.Value = reader["company_ca_ucid"].ToString();
                        year_start_start.Value = reader["company_financial_year_start"].ToString();
                        gst_id.Value = reader["company_gst_id"].ToString();
                        password_field.Attributes["type"] = "text";
                        password_field.Value = reader["company_gst_password"].ToString();
                        password_field.Attributes["type"] = "password";
                        bank_name.Value = reader["company_bank_name"].ToString();
                        branch_name.Value = reader["company_bank_branch_name"].ToString();
                        acc_no.Value = reader["company_bank_account_number"].ToString();
                        ifsc_no.Value = reader["company_bank_ifsc_code"].ToString();
                        primary_name.Value = reader["company_primary_sign_name"].ToString();
                        designation.Value = reader["company_primary_sign_designation"].ToString();
                        address.Value = reader["company_primary_sign_address"].ToString();
                        email1.Value = reader["company_primary_sign_email"].ToString();
                        mobile_no.Value = reader["company_primapry_sign_phone"].ToString();
                        secondery_name.Value = reader["company_secondery_sign_name"].ToString();
                        secondery_designation.Value = reader["company_secondery_sign_designation"].ToString();
                        secondery_address.Value = reader["company_secondery_sign_address"].ToString();
                        email2.Value = reader["company_secondery_sign_email"].ToString();
                        mobile_no2.Value = reader["company_secondery_sign_phone"].ToString();
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                }
            }
        }
        protected void loginClick(object sender, EventArgs e)
        {
            //string url = "<a href='..//services.gst.gov.in/services/login?userid=" + baseHealpare.EncodeUrl(this, gst_id.Value) + "&password=" + baseHealpare.EncodeUrl(this, password.Value);
            string url = "<a target='_blank' href='..//services.gst.gov.in/services/login'></a>";
            //window.location = url;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open(" + url + ",'_newtab');", true);
            Response.Redirect(url);

        }

        protected void submit_company_details_even(object sender, EventArgs e)
        {

            
            {
                if (customerid.Value == "" || customerid.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Enter customer id");
                    return;
                }
                else
           if (person_type.Value == "0" || person_type.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please select Person Type");
                    return;
                }
                //else if (surnamename.Value == "" && middlename.Value == "" && firstname.Value == "")
                //{
                //    baseHealpare.MessageBox(this, "Please Enter Surname/Middle/First Name...!!");
                //    return;
                //}
                else if (Select_state.Value == "" || Select_state.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Select State...!!");
                    return;
                }
                else if (state_code.Value == "" || state_code.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Enter state code...!!");
                    return;
                }
                else if (year_start_start.Value == "" || year_start_start.Value == null)
                {
                    baseHealpare.MessageBox(this, "Please Select Start Year...!!");
                    return;
                }

                else
                {
                    string dbname = "";
                    if (firstname.Value != null)
                    {
                         dbname = Regex.Replace(firstname.Value, @"[^0-9a-zA-Z]+", "");
                    }
                    string db_name = "db_pms_" + "_" + dbname + "_" + financialYear.Value;
                 
                    if (breadcrumb_title.InnerText.ToString() == "Add Company")
                    {
                        baseHealpare.MessageBox(this, " DB MESSAGE" + baseHealpare.CreateDataBase(SQLfile(), db_name));

                        baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddCompany,
                                            new string[] { "company_ucid", "company_db", "company_person_type", "company_surname", "company_middle_name", "company_first_name", "company_address_one", "company_address_two", "company_address_three", "company_district", "company_state", "company_state_code", "company_country", "company_pincode", "company_cin_number", "company_email", "company_phone_number", "company_gst_number", "company_pan_number", "company_trade_name", "company_gst_practitioner_ucid", "company_ca_ucid", "company_financial_year_start", "company_gst_id", "company_gst_password", "company_bank_name", "company_bank_branch_name", "company_bank_account_number", "company_bank_ifsc_code", "company_primary_sign_name", "company_primary_sign_designation", "company_primary_sign_address", "company_primary_sign_email", "company_primapry_sign_phone", "company_secondery_sign_name", "company_secondery_sign_designation", "company_secondery_sign_address", "company_secondery_sign_email", "company_secondery_sign_phone", "username", "password" },
                                            new string[] { customerid.Value.ToUpper(), db_name, person_type.Value, surnamename.Value.ToUpper(), middlename.Value.ToUpper(), firstname.Value.ToUpper(), address1.Value.ToUpper(), address2.Value.ToUpper(), address3.Value.ToUpper(), district.Value.ToUpper(), Select_state.Value, state_code.Value, country.Value.ToUpper(), pincode.Value, cin_no.Value, email.Value, phone.Value, gst_no.Value.ToUpper(), pan_no.Value.ToUpper(), trade_name.Value.ToUpper(), gst_practinoer_ucid.Value.ToUpper(), ca_ucid.Value.ToUpper(), year_start_start.Value, gst_id.Value, password_field.Value, bank_name.Value.ToUpper(), branch_name.Value.ToUpper(), acc_no.Value, ifsc_no.Value.ToUpper(), primary_name.Value.ToUpper(), designation.Value.ToUpper(), address.Value.ToUpper(), email1.Value, mobile_no.Value, secondery_name.Value.ToUpper(), secondery_designation.Value.ToUpper(), secondery_address.Value, email2.Value, mobile_no2.Value, gst_id.Value, password_field.Value, })
                            );
                        Response.Redirect("~/Master/CompanyDetails.aspx");
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "Data Updated " + baseHealpare.UpdateValue(baseHealpare.TableAddCompany,
                                new string[] { "company_person_type", "company_surname", "company_middle_name", "company_first_name", "company_address_one", "company_address_two", "company_address_three", "company_district", "company_state", "company_state_code", "company_country", "company_pincode", "company_cin_number", "company_email", "company_phone_number", "company_gst_number", "company_pan_number", "company_trade_name", "company_gst_practitioner_ucid", "company_ca_ucid", "company_financial_year_start", "company_gst_id", "company_gst_password", "company_bank_name", "company_bank_branch_name", "company_bank_account_number", "company_bank_ifsc_code", "company_primary_sign_name", "company_primary_sign_designation", "company_primary_sign_address", "company_primary_sign_email", "company_primapry_sign_phone", "company_secondery_sign_name", "company_secondery_sign_designation", "company_secondery_sign_address", "company_secondery_sign_email", "company_secondery_sign_phone", "username", "password" },
                                new string[] { person_type.Value, surnamename.Value.ToUpper(), middlename.Value.ToUpper(), firstname.Value.ToUpper(), address1.Value.ToUpper(), address2.Value.ToUpper(), address3.Value.ToUpper(), district.Value.ToUpper(), Select_state.Value, state_code.Value, country.Value.ToUpper(), pincode.Value, cin_no.Value, email.Value, phone.Value, gst_no.Value.ToUpper(), pan_no.Value.ToUpper(), trade_name.Value.ToUpper(), gst_practinoer_ucid.Value.ToUpper(), ca_ucid.Value.ToUpper(), year_start_start.Value, gst_id.Value, password_field.Value, bank_name.Value.ToUpper(), branch_name.Value.ToUpper(), acc_no.Value, ifsc_no.Value.ToUpper(), primary_name.Value.ToUpper(), designation.Value, address.Value.ToUpper(), email1.Value, mobile_no.Value, secondery_name.Value.ToUpper(), secondery_designation.Value, secondery_address.Value.ToUpper(), email2.Value, mobile_no2.Value, gst_id.Value, password_field.Value, },
                                "company_id=" + "'" + baseHealpare.DecodeUrl(this, Request.QueryString["value"].ToString()) + "'"
                          ));
                        Response.Redirect("~/Master/CompanyDetails.aspx");
                    }
                }
            }
        }

        public string SQLfile()
        {
            string text = File.ReadAllText(Server.MapPath("~/Base/ca_db_table.txt"));
            Console.WriteLine(text);
            return text;
        }

        protected void cancel_event(object sender, EventArgs e)
        {
            Response.Redirect("~/Master/CompanyDetails.aspx");
        }
    }
}




  