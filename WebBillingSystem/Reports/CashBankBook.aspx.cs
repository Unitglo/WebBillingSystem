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
    public partial class CashBankBook : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList acc_head_arrylist;
        public string json_acc_head_obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            //MySqlDataReader acc_head_drop = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, "  WHERE account_main_group = '5' AND account_sub_group = '4' AND status != 2");
            //while (acc_head_drop != null && acc_head_drop.Read())
            //{
            //    account_head_id.Items.Add(new ListItem(acc_head_drop["account_head"].ToString(), acc_head_drop["account_head"].ToString()));
            //}
            //if (acc_head_drop != null)
            //{
            //    acc_head_drop.Close();
            //}

            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, "  WHERE account_main_group = '5' AND account_sub_group = '4' AND status != 2");

            acc_head_arrylist = new System.Collections.ArrayList();
            while (reader != null && reader.Read())
            {
                string edit_button = "<a href='/Reports/AccountLedger.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["account_head"]) + "' class='btn btn-xs btn-light details-control-accHead fa fa-share' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";
                
                acc_head_arrylist.Add(new
                {
                    edit_button_acc = edit_button,
                    perticulars_acc = reader["account_head"],                    
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_acc_head_obj = serializer.Serialize(acc_head_arrylist);
            }
        }
    }
}