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
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;
using System.Text.RegularExpressions;

namespace WebBillingSystem
{
    public partial class News_And_Updates_Details : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList news_master;
        public string json_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.news_and_update_table, " where status = 0");
            news_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                string edit_button = "<a href='/News/News_And_Updates.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["auto_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></a> ";
                edit_button += " " + "<a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/News/News_And_Updates.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["auto_id"]) + "' class='btn btn-danger icon-trash' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                news_master.Add(new
                {
                    pms_news_title = reader["pms_news_title"],
                    pms_news_description = Regex.Replace(reader["pms_news_description"].ToString(), @"[^0-9a-zA-Z]+", " "),
                    pms_news_validate_from_date = Convert.ToDateTime(reader["pms_news_validate_from_date"].ToString()).ToString("dd/MM/yyyy"),                    
                    pms_news_validate_to_date = Convert.ToDateTime(reader["pms_news_validate_to_date"].ToString()).ToString("dd/MM/yyyy"),
                    pms_news_in_out_app = reader["pms_news_in_out_app"],
                    pms_news_outapp_link = reader["pms_news_outapp_link"],
                    edit_button = edit_button
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj = serializer.Serialize(news_master);
            }
        }
    }
}