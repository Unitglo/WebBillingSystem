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
using System.IO;
using System.Collections;

namespace WebBillingSystem
{
    public partial class AccountDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList account_master;
        public string json_obj;
        
        ArrayList maxSubGroupList = new ArrayList();
        ArrayList nameMainGroupList = new ArrayList();
        ArrayList idMainGroupList = new ArrayList();
        ArrayList idSubGroupList = new ArrayList();
        ArrayList nameSubGroupList = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader company_reader = baseHealpare.SelectAllValues("*, " +
                "(select main_group_name from pms_account_master_main_group where account_master_main_group_id = account_main_group) as main_group_name, " +
                "(select account_master_sub_group_name from pms_account_master_sub_group where account_master_sub_group_id = account_sub_group and account_master_main_group_id = account_main_group) as sub_group_name",
                baseHealpare.TableAddAccount, " where status=0  ORDER BY `account_head` ASC");
            // MySqlDataReader company_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddAccount, " where status=0");
            account_master = new System.Collections.ArrayList();

            while (company_reader != null && company_reader.Read())
            {
                string edit_button = "<a href='/Master/AddAccount.aspx?value=" + baseHealpare.EncodeUrl(this, "" + company_reader["account_id"]) + "&party_name=" + baseHealpare.EncodeUrl(this, "" + company_reader["account_party_name"]) + "&account_head_name=" + baseHealpare.EncodeUrl(this, "" + company_reader["account_head"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></a> ";
                edit_button += " " + "<a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Master/AddAccount.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + company_reader["account_id"]) + "&party_name="+ baseHealpare.EncodeUrl(this, "" + company_reader["account_party_name"]) + "&account_head_name=" + baseHealpare.EncodeUrl(this, "" + company_reader["account_head"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                account_master.Add(new
                {
                    account_id = company_reader["account_id"],
                    account_head = company_reader["account_head"],
                    main_group_name = company_reader["main_group_name"],
                    sub_group_name = company_reader["sub_group_name"],
                    //account_main_group = company_reader["account_main_group"],
                    //account_sub_group = company_reader["account_sub_group"],
                    account_party_name = company_reader["account_party_name"],
                    account_inventory_value_affected = company_reader["account_inventory_value_affected"],
                    account_add_one = company_reader["account_add_one"],
                    account_add_two = company_reader["account_add_two"],
                    account_district = company_reader["account_district"],
                    account_state = company_reader["account_state"],
                    account_state_code = company_reader["account_state_code"],
                    account_country = company_reader["account_country"],
                    account_pin_code = company_reader["account_pin_code"],
                    account_gst_number = company_reader["account_gst_number"],
                    account_pan_number = company_reader["account_pan_number"],
                    account_cin_number = company_reader["account_cin_number"],
                    account_phone_number = company_reader["account_phone_number"],
                    account_email = company_reader["account_email"],
                    account_opening_balance = company_reader["account_opening_balance"],
                    account_opening_balance_type = company_reader["account_opening_balance_type"],
                    edit_button = edit_button

                });
            }
            if (company_reader != null)
            {
                company_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_obj = serializer.Serialize(account_master);
            }
            
            
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT  (select max(account_master_sub_group_id) from `pms_account_master_sub_group` t2 where t1.`account_master_main_group_id`=t2.`account_master_main_group_id`) as sub_group  , `account_master_main_group_id` as id, `main_group_name` as name FROM `pms_account_master_main_group` t1 WHERE `status` = 0");
            while (reader != null && reader.Read())
            {
                //nameMainGroupList.Add(Convert.ToInt32(reader[0].ToString()));
                idMainGroupList.Add(Convert.ToInt32(reader["id"].ToString()));
                nameMainGroupList.Add(reader["name"].ToString());
                maxSubGroupList.Add(reader["sub_group"].ToString());
            }
            if (reader != null)
            {
                reader.Close();
            }

            reader = baseHealpare.SelectManualQuery("SELECT `account_master_sub_group_id` as id, `account_master_sub_group_name` as text FROM `pms_account_master_sub_group` t1 WHERE `status` = 0");
            while (reader != null && reader.Read())
            {
                idSubGroupList.Add(Convert.ToInt32(reader["id"].ToString()));
                nameSubGroupList.Add(reader["text"].ToString());
            }
            if (reader != null)
            {
                reader.Close();
            }
        } 

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if(fileUploader.Value == "")
            {
                baseHealpare.MessageBox(this, "Please Upload File");
                return;
            } else
            {

                int sub_group_id = 0;
                string jsonString = txthdnJson.Value.ToString();
                var dict = new JavaScriptSerializer().Deserialize<List<Dictionary<string, object>>>(jsonString);
                if (dict.Count == 0)
                {
                    baseHealpare.MessageBox(this, "File Empty");
                    return;
                }
                else
                {
                    for (int i = 0; i < dict.Count; i++)
                    {
                        //Main Group
                        int mainGroupValue = nameMainGroupList.IndexOf(dict[i]["Main Group"]);
                        if (mainGroupValue != -1)
                        {
                            sub_group_id = Int32.Parse(maxSubGroupList[mainGroupValue].ToString());
                        }
                        else
                        {
                            sub_group_id = 0;
                        }
                        string mainGroupindex = (mainGroupValue > 0) ? "" + idMainGroupList[mainGroupValue] : "";
                        dict[i]["Main Group"] = mainGroupindex;

                        //Sub Group
                        if (mainGroupindex != "")
                        {
                            int SubGroupValue = nameSubGroupList.IndexOf(dict[i]["Sub Group"]);

                            string subGroupindex = (SubGroupValue > 0) ? "" + idSubGroupList[SubGroupValue] : "-1";
                            if (subGroupindex.Equals("-1"))
                            {
                                baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAccountsubGroup,
                                new string[] { "account_master_main_group_id", "account_master_sub_group_id", "account_master_sub_group_name" },
                                new string[] { mainGroupindex, sub_group_id + 1 + "", "" + dict[i]["Sub Group"] }));
                                //   Insert into database;
                                //  subGroupindex = inseted id
                                dict[i]["Sub Group"] = sub_group_id + 1;
                            }
                            else
                            {
                                dict[i]["Sub Group"] = subGroupindex;
                            }
                        }
                        else
                        {
                            dict[i]["Sub Group"] = "";
                        }

                        string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                        //string a1 = dict[i].ContainsKey("Account Head") ? dict[i]["Account Head"].ToString() : "";
                        baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddAccount,
                                                 new string[] { "account_head", "account_main_group", "account_sub_group", "account_party_name", "account_inventory_value_affected", "account_add_one", "account_add_two", "account_district", "account_state", "account_state_code", "account_country", "account_pin_code", "account_gst_number", "account_pan_number", "account_cin_number", "account_phone_number", "account_email", "account_opening_balance", "account_opening_balance_type" },
                                                 result));
                    }
                    Response.Redirect("~/Master/AccountDetails.aspx");
                }
            }
        }
           
        }
}