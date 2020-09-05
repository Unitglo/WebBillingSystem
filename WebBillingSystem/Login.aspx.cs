using System;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace WebBillingSystem
{
    public partial class Login : System.Web.UI.Page
    {
        public string default_prefix = "";
        DataBaseHealpare baseHealpare;
        public string default_database = "";
        public string comp_logo = "";
        public string slider1 = "";
        public string slider2 = "";
        public string slider3 = "";
        public string header_msg1 = "";
        public string header_msg2 = "";
        public string header_msg3 = "";
        public string desc1 = "";
        public string desc2 = "";
        public string desc3 = "";
        public string pmslogo = "";
        public string company_name = "";
        string selectedRoleURLS = "";
        public Boolean IsDBFound = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack )
            {
                Session.RemoveAll();
            }
            load_files();
            baseHealpare = new DataBaseHealpare();
            if (baseHealpare.openConnection() == null)
                {
                    IsDBFound = false;
                }
        }
        void load_files()
        {
            string json = "";
            if (File.Exists("C:/PMS/Base/configuration.json"))
            {
                json = File.ReadAllText("C:/PMS/Base/configuration.json");
            }else {
                json = File.ReadAllText(Server.MapPath("~/Base/configuration.json"));
            }
            var myJObject = JObject.Parse(json);
            default_prefix = myJObject.SelectToken("default_prefix").Value<string>(); ;
            selectedRoleURLS = myJObject.SelectToken("installation_type").Value<string>();
            pmslogo = myJObject.SelectToken("pmslogo").Value<string>();
            //roleid.Items[0].Attributes.Add("hidden", "");
            //roleid.Items.FindByValue(myJObject.SelectToken("installation_type").Value<string>()).Selected = true;
            default_database = myJObject.SelectToken("default_database").Value<string>();
            company_name = myJObject.SelectToken("$.branding_data.login_page_name").Value<string>();
            comp_logo = myJObject.SelectToken("$.branding_data.login_page_logo").Value<string>();
            slider1 = myJObject.SelectToken("$.branding_data.login_page_slider1").Value<string>();
            slider2 = myJObject.SelectToken("$.branding_data.login_page_slider2").Value<string>();
            slider3 = myJObject.SelectToken("$.branding_data.login_page_slider3").Value<string>();
            header_msg1 = myJObject.SelectToken("$.branding_data.login_page_header_msg1").Value<string>();
            header_msg2 = myJObject.SelectToken("$.branding_data.login_page_header_msg2").Value<string>();
            header_msg3 = myJObject.SelectToken("$.branding_data.login_page_header_msg3").Value<string>();
            desc1 = myJObject.SelectToken("$.branding_data.login_page_description1").Value<string>();
            desc2 = myJObject.SelectToken("$.branding_data.login_page_description2").Value<string>();
            desc3 = myJObject.SelectToken("$.branding_data.login_page_description3").Value<string>();
            Session["installation_type"] = myJObject.SelectToken("installation_type").Value<string>();
            Session["pmslogo"] = myJObject.SelectToken("pmslogo").Value<string>();
            Session["default_database"] = myJObject.SelectToken("default_database").Value<string>();
            Session["default_prefix"] = default_prefix;

        }

        protected void submit_db_details_event(object sender, EventArgs e)
        {
            

            if (config_key_id.Value == "abc")
            {
                load_files();
                baseHealpare.con = new MySqlConnection("server=localhost;user id=root;Password=;persist security info=False");
                baseHealpare.CreateDataBase(SQLfile(), Session["default_database"].ToString());
                baseHealpare.MessageBox(this, " DB MESSAGE " );
                //baseHealpare.CreateDataBase(SQLfile_profile(), Session["default_database"].ToString());
                if (selectedRoleURLS == "CA") {
                    string text = File.ReadAllText(Server.MapPath("~/Base/ca_profile.txt"));
                    MySqlDataReader reader = baseHealpare.SelectManualQuery(text);
                } else if (selectedRoleURLS == "COMPANY")
                {
                    string text = File.ReadAllText(Server.MapPath("~/Base/company_profile.txt"));
                    MySqlDataReader reader = baseHealpare.SelectManualQuery(text);
                }
            }
        }

            protected void Button1_Click(object sender, EventArgs e)
        {

            string a = user_name_Id.Value.ToString();
           
            if (user_name_Id.Value.ToString() == "" || user_name_Id.Value.ToString() == null)
            {
                baseHealpare.MessageBox(this, "Please Enter User name...!!");
                return;
            } else if (passId.Value == "" || passId.Value == null)
            {
                baseHealpare.MessageBox(this, "Please Enter Password...!!");
                return;
            }
            else
            {
                //if(roleid.Value == "S")
                if(selectedRoleURLS == "S")
                {
                    Session["role_code"] = "superadmin";
                    Session["page_role"] = "SUPERADMIN";
                    Response.Redirect("~/Master/CompanyDetails.aspx");
                } else if (selectedRoleURLS == "CA")
                //} else if (roleid.Value == "CA")
                {

                    MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCA, "WHERE ca_code =" + "'" + user_name_Id.Value + "'" + " and ca_password ='" + passId.Value + "'");
                    if (sess_login_reader != null && sess_login_reader.Read())
                    {
                        //while (sess_login_reader != null && sess_login_reader.Read())
                        //{
                        Session["page_role"] = "CA";
                        Session["role_code"] = "CA"; 
                        Session["ca_id"] = sess_login_reader["ca_code"];
                        //if (!HttpContext.Current.Request.IsLocal)
                        //{
                        //    Session["pms_db"] = "pms_system";
                        //    Session["primary_db"] = "pms_system";
                        //}
                        //else
                        //{
                        //    Session["pms_db"] = "pms";
                        //    Session["primary_db"] = "pms";
                        //}
                        
                        sess_login_reader.Close();
                        baseHealpare.MessageBox(this, "Login SuccessFully...!!!");
                        Response.Redirect("~/Master/CompanyDetails.aspx");
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "Login Not SuccessFully...!!!");
                        Response.Redirect(Request.RawUrl);
                    }
                    
                } else if (selectedRoleURLS == "COMPANY")
                //} else if (roleid.Value == "COMPANY")
                {
                   // Session["pms_db"] = "pms";
                    MySqlDataReader sess_login_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, "WHERE username =" + "'" + user_name_Id.Value + "'" + " and password ='" + passId.Value + "'");
                    if (sess_login_reader != null && sess_login_reader.Read())
                    {
                        
                        Session["start_date"] = sess_login_reader["company_start_date"];
                        Session["end_date"] = sess_login_reader["company_end_date"];
                        Session["page_role"] = "COMPANY";
                        Session["ca_code"] = sess_login_reader["company_ca_ucid"];
                        Session["company_code"] = sess_login_reader["company_ucid"];
                        string company_name = sess_login_reader["company_first_name"] + " " + sess_login_reader["company_middle_name"] + " " + sess_login_reader["company_surname"];
                        baseHealpare.createSession(this, "COMPANY", ""+sess_login_reader["company_ucid"], company_name, ""+sess_login_reader["company_db"], "" + sess_login_reader["company_state"], "" + sess_login_reader["company_state_code"]);
                        Session["First_auth"] = sess_login_reader["company_primary_sign_name"];
                        Session["Second_auth"] = sess_login_reader["company_secondery_sign_name"];
                        Session["address"] = sess_login_reader["company_address_one"] + " " + sess_login_reader["company_address_two"] + "" + sess_login_reader["company_address_three"]; ;
                        Session["gstno"] = sess_login_reader["company_gst_number"];
                        sess_login_reader.Close();
                        baseHealpare.MessageBox(this, "Login SuccessFully...!!!");
                        Response.Redirect("~/home.aspx?value=" + baseHealpare.EncodeUrl(this, "" + Session["company"]));
                    }
                    else
                    {
                        baseHealpare.MessageBox(this, "Login Not SuccessFully...!!!");
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
            
            
            //string a = dbObject.LoginCheck(TextBox1.Text, TextBox2.Text);
            //dbObject.MessageBox(this,a);
            //if (!a.Equals("Faild"))
            //{
            //    HttpContext.Current.Session["UserSession"] = a;
            //    Response.Redirect("http://localhost:53130/home.aspx");
            //}
            //else 
            //{
            //    Response.Redirect(Request.RawUrl);
            //}

        }

        public string SQLfile()
        {
            string text = File.ReadAllText(Server.MapPath("~/Base/ca_db_table.txt"));
            Console.WriteLine(text);
            return text;
        }
      
        protected void Button2_Click(object sender, EventArgs e)
        {
            user_name_Id.Value = "";
            passId.Value = "";
        }
        //DataBaseHealpare dbObject;

    }
}