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
    public partial class InventoryGroupDetails : System.Web.UI.Page
    {
        DateTime dateTime = DateTime.UtcNow.Date;
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList comp_master;
        public string json_Group_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader comp_reader = baseHealpare.SelectAllValues(baseHealpare.TableStockGroup, " where status=0");
            comp_master = new System.Collections.ArrayList();

            while (comp_reader != null && comp_reader.Read())
            {
                comp_master.Add(new
                {
                    stock_nature_of_opration_id = comp_reader["stock_nature_of_opration_id"],
                    stock_group_id = comp_reader["stock_group_id"],
                    stock_group_name = comp_reader["stock_group_name"],
                    edit_button = "<a href='/Master/InventoryGroupDetails.aspx?val=" + baseHealpare.EncodeUrl(this, "" + comp_reader["stock_nature_of_opration_id"]) + "&value=" + baseHealpare.EncodeUrl(this, "" + comp_reader["stock_group_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>",
                    //delete_button = "<a href='/Master/InventoryGroupDetails.aspx?val=" + baseHealpare.EncodeUrl(this, "" + comp_reader["stock_nature_of_opration_id"]) + "&value=" + baseHealpare.EncodeUrl(this, "" + comp_reader["stock_group_id"]) + "' class='btn btn-danger' runat='server' onclick='deleteClick' >Delete</>"
                });
            }
            if (comp_reader != null)
            {
                comp_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_Group_obj = serializer.Serialize(comp_master);

            }


            if (Request.QueryString.Count == 0)
            {
                breadcrumb_title.InnerHtml = "Add sub group";
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    breadcrumb_title.InnerHtml = "Update sub group";

                    MySqlDataReader update_reader = baseHealpare.SelectAllValues(baseHealpare.TableStockGroup, " where stock_nature_of_opration_id =" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["val"].ToString()))) + " and stock_group_id =" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))));
                    comp_master = new System.Collections.ArrayList();

                    while (update_reader != null && update_reader.Read())
                    {
                        Gr_Name.Value = update_reader["stock_group_name"].ToString();

                    }


                    update_reader.Close();

                }
            }
        }

        
    //protected void deleteClick(object sender, EventArgs e)
    //    {
    //        baseHealpare.MessageBox(this, "Data Updated " + baseHealpare.UpdateValue(baseHealpare.TableStockGroup,
    //                                new string[] { "status", "default_date" },
    //                                new string[] { "1", dateTime.ToString("yyyy-MM-dd") },
    //                                "stock_nature_of_opration_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["val"].ToString()))) + " and stock_group_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))
    //              ));
    //        Response.Redirect("~/Master/InventoryGroupDetails.aspx");
    //    }

        protected void submit_account_details_event(object sender, EventArgs e)
        {


            if (Request.QueryString.Count != 0)
            {
                baseHealpare.MessageBox(this, "Data Updated " + baseHealpare.UpdateValue(baseHealpare.TableStockGroup,
                                    new string[] {"stock_group_name", "status", "default_date" },
                                    new string[] { Gr_Name.Value,"0", dateTime.ToString("yyyy-MM-dd") },
                                    "stock_nature_of_opration_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["val"].ToString()))) + " and stock_group_id = " + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString())))
                  ));
                Response.Redirect("~/Master/InventoryGroupDetails.aspx");
            }
        }
    }
}
              