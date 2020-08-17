using MySql.Data.MySqlClient;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class CompanyDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList comp_master;
        public string json_obj;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["page_role"].ToString() == "CA") {
                Session["pms_db"] = Session["primary_db"];
                baseHealpare = new DataBaseHealpare();
                MySqlDataReader comp_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddCompany, " where company_ca_ucid=" + "'" + Session["ca_id"] + "'" + "and status=0");
                comp_master = new System.Collections.ArrayList();
                while (comp_reader != null && comp_reader.Read())
                {
                    comp_master.Add(new
                    {
                        company_id = comp_reader["company_id"],
                        company_ucid = comp_reader["company_ucid"],                        
                        company_db = comp_reader["company_db"],
                        company_person_type = comp_reader["company_person_type"],                       
                        surnamename = "<a href='/home.aspx?value="  + baseHealpare.EncodeUrl(this,""+comp_reader["company_ucid"]) + "'>"+ comp_reader["company_first_name"] + " " + comp_reader["company_middle_name"] + " "+ comp_reader["company_surname"] + "</a>",
                        company_surname = comp_reader["company_surname"],
                        company_middle_name = comp_reader["company_middle_name"],
                        company_first_name = comp_reader["company_first_name"],
                        company_address_one = comp_reader["company_address_one"],
                        company_address_two = comp_reader["company_address_two"],
                        company_address_three = comp_reader["company_address_three"],
                        company_district = comp_reader["company_district"],
                        company_state = comp_reader["company_state"],
                        company_state_code = comp_reader["company_state_code"],
                        company_country = comp_reader["company_country"],
                        company_pincode = comp_reader["company_pincode"],
                        company_email = comp_reader["company_email"],
                        company_phone_number = comp_reader["company_phone_number"],
                        company_gst_number = comp_reader["company_gst_number"],
                        company_pan_number = comp_reader["company_pan_number"],
                        company_cin_number = comp_reader["company_cin_number"],
                        company_trade_name = comp_reader["company_trade_name"],
                        company_gst_practitioner_ucid = comp_reader["company_gst_practitioner_ucid"],
                        company_ca_ucid = comp_reader["company_ca_ucid"],
                        company_financial_year_start = comp_reader["company_financial_year_start"],
                        company_gst_id = comp_reader["company_gst_id"],
                        company_gst_password = comp_reader["company_gst_password"],
                        company_bank_name = comp_reader["company_bank_name"],
                        company_bank_branch_name = comp_reader["company_bank_branch_name"],
                        company_bank_account_number = comp_reader["company_bank_account_number"],
                        company_bank_ifsc_code = comp_reader["company_bank_ifsc_code"],
                        company_primary_sign_name = comp_reader["company_primary_sign_name"],
                        company_primary_sign_designation = comp_reader["company_primary_sign_designation"],
                        company_primary_sign_address = comp_reader["company_primary_sign_address"],
                        company_primary_sign_email = comp_reader["company_primary_sign_email"],
                        company_primapry_sign_phone = comp_reader["company_primapry_sign_phone"],
                        company_secondery_sign_name = comp_reader["company_secondery_sign_name"],
                        company_secondery_sign_designation = comp_reader["company_secondery_sign_designation"],
                        company_secondery_sign_address = comp_reader["company_secondery_sign_address"],
                        company_secondery_sign_email = comp_reader["company_secondery_sign_email"],
                        company_secondery_sign_phone = comp_reader["company_secondery_sign_phone"],
                        username = comp_reader["username"],
                        password = comp_reader["password"],
                        edit_button = "<a href='/Master/AddCompany.aspx?value=" + baseHealpare.EncodeUrl(this, "" + comp_reader["company_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-primary' data-placement='top' title='Edit Record'></>"

                    });
                    //Session["company"] = comp_reader["company_ucid"];
                    //Session["company_name"] = comp_reader["company_surname"] + " " + comp_reader["company_middle_name"] + " " + comp_reader["company_first_name"];
                    //Session["pms_db"] = comp_reader["company_db"];
                }
                if(comp_reader != null)
                {
                    comp_reader.Close();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    json_obj = serializer.Serialize(comp_master);
                }

            } else {
                Response.Redirect("/Login.aspx");
            }
        }

        //public void comp_name_change()

        //{
        //    Session["company"] = (this).ToString();
        //    Session["company_name"] = comp_reader["company_surname"] + " " + comp_reader["company_middle_name"] + " " + comp_reader["company_first_name"];
        //    Session["pms_db"] = comp_reader["company_db"];
        //}
        public void loadModalDiv(object sender, EventArgs e)
        {
            Response.Redirect("~/Master/AddCompany.aspx");
        }
    }
}