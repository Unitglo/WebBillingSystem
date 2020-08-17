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
    public partial class SubGroupDetails : System.Web.UI.Page
    {
        DateTime dateTime = DateTime.UtcNow.Date;
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList comp_master;
        public string json_SubGroup_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader comp_reader = baseHealpare.SelectAllValues(baseHealpare.TableAccountsubGroup, " where status=0");
            comp_master = new System.Collections.ArrayList();

            while (comp_reader != null && comp_reader.Read())
            {
                comp_master.Add(new
                {
                    account_master_main_group_id = comp_reader["account_master_main_group_id"],
                    account_master_sub_group_id = comp_reader["account_master_sub_group_id"],
                    account_master_sub_group_name = comp_reader["account_master_sub_group_name"],
                    edit_button = "<a href='/Master/SubGroupDetails.aspx?val=" + baseHealpare.EncodeUrl(this, "" + comp_reader["account_master_main_group_id"]) + "&value=" + baseHealpare.EncodeUrl(this, "" + comp_reader["account_master_sub_group_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>"

                });
            }
            if (comp_reader != null)
            {
                comp_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_SubGroup_obj = serializer.Serialize(comp_master);

            }


            if (Request.QueryString.Count == 0)
            {
                breadcrumb_title.InnerHtml = "sub group";
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    breadcrumb_title.InnerHtml = "Update sub group";

                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableAccountsubGroup, " where account_master_main_group_id =" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["val"].ToString()))) + " and account_master_sub_group_id =" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    comp_master = new System.Collections.ArrayList();

                    while (update_reader != null && update_reader.Read())
                    {
                        subGr_Name.Value = update_reader["account_master_sub_group_name"].ToString();

                    }


                    update_reader.Close();

                }
            }
        }
        protected void submit_account_details_event(object sender, EventArgs e)
        {


            if (Request.QueryString.Count != 0)
            {
                baseHealpare.MessageBox(this, "Data Updated " + baseHealpare.UpdateValue(baseHealpare.TableAccountsubGroup,
                                    new string[] {"account_master_sub_group_name", "default_date" },
                                    new string[] { subGr_Name.Value, dateTime.ToString("yyyy-MM-dd") },
                                    "account_master_main_group_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["val"].ToString()))) + " and account_master_sub_group_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))
                  ));
                Response.Redirect("~/Master/SubGroupDetails.aspx");
            }
        }
    }
}
              