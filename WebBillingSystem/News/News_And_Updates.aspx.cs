using MySql.Data.MySqlClient;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.IO;
using Newtonsoft.Json.Linq;

namespace WebBillingSystem
{
    public partial class News_And_Updates : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["value"] != null && Request.QueryString["delete"] != null)
                {
                    baseHealpare.DeleteValue(baseHealpare.news_and_update_table, "auto_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    Response.Redirect("/News/News_And_Updates_Details.aspx");
                }
                    DateTime dateTime = DateTime.UtcNow.Date;
            from_date_id.Value = dateTime.ToString("yyyy-MM-dd");
            to_date_id.Value = dateTime.ToString("yyyy-MM-dd");

            if (Request.QueryString["value"] == null)
            {
                breadcrumb_title.InnerText = "Add News";
            }
            else
            {
                
                    breadcrumb_title.InnerText = "Update News";
                    MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.news_and_update_table, " where auto_id=" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    while (reader != null && reader.Read())
                    {
                        title_id.Value = reader["pms_news_title"].ToString();
                        description_id.Value = reader["pms_news_description"].ToString();
                        from_date_id.Value = Convert.ToDateTime(reader["pms_news_validate_from_date"].ToString()).ToString("yyyy-MM-dd");
                        to_date_id.Value = Convert.ToDateTime(reader["pms_news_validate_to_date"].ToString()).ToString("yyyy-MM-dd");
                        if (reader["pms_news_in_out_app"].ToString() == "0")
                        {
                            rbtnOutApp_Id.Checked = true;
                            txtLink_id.Value = reader["pms_news_outapp_link"].ToString();
                        }
                        else
                        {
                            rbtnInApp_Id.Checked = true;
                            txtLink_id.Value = "";
                        }
                    }

                    if (reader != null)
                    {
                        reader.Close();
                    }
                }
            }
        }
            string rbtn_val = "0";
        protected void submit_new(object sender, EventArgs e)
        {
            if(rbtnInApp_Id.Checked == true)
            {
                rbtn_val ="1";
            } 
            
                if (Request.QueryString.Count == 0)
            {
                baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.news_and_update_table,
                                       new string[] { "pms_news_title", "pms_news_description", "pms_news_validate_from_date", "pms_news_validate_to_date", "pms_news_in_out_app", "pms_news_outapp_link" },
                                       new string[] { title_id.Value, description_id.Value, from_date_id.Value, to_date_id.Value, rbtn_val, txtLink_id.Value }
                ));
            } else
            {

                baseHealpare.MessageBox(this, "Data Updating" + baseHealpare.UpdateValue(baseHealpare.news_and_update_table,
                                      new string[] { "pms_news_title", "pms_news_description", "pms_news_validate_from_date", "pms_news_validate_to_date", "pms_news_in_out_app", "pms_news_outapp_link" },
                                      new string[] { title_id.Value.ToString(), description_id.Value.ToString(), from_date_id.Value.ToString(), to_date_id.Value.ToString(), rbtn_val, txtLink_id.Value.ToString() },
                                       "auto_id = " + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'"
               ));
            }
            Response.Redirect("/News/News_And_Updates_Details.aspx");
        }
    }
}