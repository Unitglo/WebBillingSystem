using MySql.Data.MySqlClient;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;
using System.Collections;

namespace WebBillingSystem
{
    public partial class StockDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList stock_master;
        public string json_obj;
        ArrayList maxSubGroupList = new ArrayList();
        ArrayList nameMainGroupList = new ArrayList();
        ArrayList idMainGroupList = new ArrayList();
        ArrayList idSubGroupList = new ArrayList();
        ArrayList nameSubGroupList = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
           
            MySqlDataReader reader = baseHealpare.SelectAllValues("*, " + "(SELECT nature_of_opration_name FROM pms_stock_nature_of_opration WHERE stock_nature_of_opration_id = stock_nature_of_opration) AS nature_op_name, (SELECT stock_group_name FROM pms_stock_addgroup WHERE stock_nature_of_opration_id = stock_nature_of_opration and stock_group_id = stock_group) AS group_name ", baseHealpare.TableAddStock, " where status=0");
                    stock_master = new System.Collections.ArrayList();

                    while (reader != null && reader.Read())
                    {
                        string edit_button = "<a href='/Master/AddStock.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["pms_stock_id"]) + "' class='btn btn-xs btn-info fa fa-pencil' style='margin: 4px;' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></> ";
                        edit_button  += "" + "  <a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Master/AddStock.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["pms_stock_id"]) + "' class='btn btn-xs btn-danger fa fa-close' style='margin: 4px;'  data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";

                      stock_master.Add(new 
                        {
                        inv_stock_id = reader["pms_stock_id"].ToString(),
                        stock_nature_of_opration_id = reader["stock_nature_of_opration"].ToString(),
                        stock_nature_of_opration = reader["nature_op_name"].ToString(),
                        stock_group_id = reader["stock_group"].ToString(),
                        stock_group = reader["group_name"].ToString(),
                        inv_product_name = reader["stock_product_name"].ToString(),
                        stock_unit_of_measurment = reader["stock_unit_of_measurment"].ToString(),
                        stock_pri_unit_of_measurment = reader["stock_pri_unit_of_measurment"].ToString(),
                        stock_sec_unit_of_measurement = reader["stock_sec_unit_of_measurement"].ToString(),
                        stock_conversion_factor = reader["stock_conversion_factor"].ToString(),
                        inv_hsn_sac_code = reader["stock_hsn_sac_code"].ToString(),
                        inv_gst_rate = reader["stock_gst_rate"].ToString(),
                        stock_mrp = reader["stock_mrp"].ToString(),
                        stock_sale_price_without_gst = reader["stock_sale_price_without_gst"].ToString(),
                        //stock_expiry_date = Convert.ToDateTime(reader["stock_expiry_date"].ToString()).ToString("yyyy-MM-dd"),
                        //stock_batch = reader["stock_batch"].ToString(),
                        stock_opening_qty = reader["stock_opening_qty"].ToString(),
                        stock_purc_price_per_unit = reader["stock_purc_price_per_unit"].ToString(),
                        stock_opening_amt = reader["stock_opening_amt"].ToString(),
                        inv_recorder_level = reader["stock_reorder_level"].ToString(),
                        inv_recorder_quantity = reader["stock_reorder_quantity"].ToString(),
                        inv_minimum_stock_reminder = reader["stock_minimum_stock_reminder"].ToString(),
                        edit_button = edit_button
                      });

                }
                    if (reader != null)
                        {
                            reader.Close();
                            JavaScriptSerializer serializer = new JavaScriptSerializer();
                            json_obj = serializer.Serialize(stock_master);
                    }

             reader = baseHealpare.SelectManualQuery("SELECT (select max(stock_group_id) from `pms_stock_addgroup` t2 where t1.`stock_nature_of_opration_id`=t2.`stock_nature_of_opration_id`) as add_group, `stock_nature_of_opration_id` as id, `nature_of_opration_name` as name FROM `pms_stock_nature_of_opration` t1 WHERE `status` = 0");
             while (reader != null && reader.Read())
             {
                //nameMainGroupList.Add(Convert.ToInt32(reader[0].ToString()));
                idMainGroupList.Add(Convert.ToInt32(reader["id"].ToString()));
                nameMainGroupList.Add(reader["name"].ToString());
                maxSubGroupList.Add(reader["add_group"].ToString());
             }
            if (reader != null)
            {
                reader.Close();
            }

            reader = baseHealpare.SelectManualQuery("SELECT `stock_group_id` as id, `stock_group_name` as text FROM `pms_stock_addgroup` WHERE `status` = 0");
            while (reader != null && reader.Read())
            {
                idSubGroupList.Add(Convert.ToInt32(reader["id"].ToString()));
                nameSubGroupList.Add(reader["text"].ToString());
            }
            if (reader != null)
            {
                reader.Close();
            }

            reader = baseHealpare.SelectManualQuery("SELECT sum(stock_opening_amt) openi_amt_cnt FROM pms_stock WHERE status = 0");
            while (reader != null && reader.Read())
            {
                lbl_open_amt_count_id.InnerHtml = reader["openi_amt_cnt"].ToString();
            }
            if (reader != null)
            {
                reader.Close();
            }
        }

        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {

        //        FileUpload1.SaveAs(@"C:\temp\" + FileUpload1.FileName);
        //        //Label1.Text = "File Uploaded: " + FileUpLoad1.FileName;
        //    }
        //    else
        //    {
        //        //Label1.Text = "No File Uploaded.";
        //    }
        //}


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUploader.Value == "")
            {
                baseHealpare.MessageBox(this, "Please Upload File");
                return;
            }
            else
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
                        int mainGroupValue = nameMainGroupList.IndexOf(dict[i]["Nature of opration"]);
                        if (mainGroupValue != -1)
                        {
                            sub_group_id = Int32.Parse(maxSubGroupList[mainGroupValue].ToString());
                        }
                        else
                        {
                            sub_group_id = 0;
                        }
                        string mainGroupindex = (mainGroupValue > 0) ? "" + idMainGroupList[mainGroupValue] : "";
                        dict[i]["Nature of opration"] = mainGroupindex;

                        //add group
                        if (mainGroupindex != "")
                        {
                            int SubGroupValue = nameSubGroupList.IndexOf(dict[i]["Group"]);

                            string subGroupindex = (SubGroupValue > 0) ? "" + idSubGroupList[SubGroupValue] : "-1";
                            if (subGroupindex.Equals("-1"))
                            {
                                baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableStockGroup,
                                                        new string[] { "stock_nature_of_opration_id", "stock_group_id", "stock_group_name" },
                                                        new string[] { mainGroupindex, sub_group_id + 1 + "", "" + dict[i]["Group"] }));
                                //   Insert into database;
                                //  subGroupindex = inseted id
                                dict[i]["Group"] = sub_group_id + 1;
                            }
                            else
                            {
                                dict[i]["Group"] = subGroupindex;
                            }
                        }
                        else
                        {
                            dict[i]["Group"] = "";
                        }

                        string[] result = dict[i].Select(kv => kv.Value.ToString()).ToArray();
                        //baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStock,
                        //                       new string[] { "stock_nature_of_opration", "stock_group", "stock_product_name", "stock_unit_of_measurment", "stock_hsn_sac_code", "stock_gst_rate", "stock_mrp", "stock_sale_price_without_gst", "stock_expiry_date", "stock_batch", "stock_reorder_level", "stock_reorder_quantity", "stock_minimum_stock_reminder" },
                        baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStock,
                                        new string[] { "stock_nature_of_opration", "stock_group", "stock_product_name", "stock_pri_unit_of_measurment", "stock_sec_unit_of_measurement", "stock_conversion_factor", "stock_hsn_sac_code", "stock_gst_rate", "stock_mrp", "stock_sale_price_without_gst", "stock_opening_qty", "stock_purc_price_per_unit", "stock_opening_amt", "stock_reorder_level", "stock_reorder_quantity", "stock_minimum_stock_reminder" },
                                        result));
                    }
                    Response.Redirect("~/Master/StockDetails.aspx");
                }
            }
        }
        //Response.Redirect("~/Master/StockDetails.aspx");

        //            //baseHealpare.MessageBox(this, "Firstly check file Format (download data)");
        //            string savedFileName = "";
        //            if (FileUpload1.HasFile)
        //            {
        //                //Server.MapPath("~/Images/Logos/" + uploadedFileName);
        //                savedFileName = Server.MapPath("//upload//" +Session["company"] +"_" + FileUpload1.FileName);
        //                FileUpload1.SaveAs(savedFileName);

        ////                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/upload/" + FileUpload1.FileName));
        ////                FileUpload1.SaveAs(System.Web.HttpContext.Current.Server.MapPath("~") + "/upload/" + FileUpload1.FileName);
        //                //Label1.Text = "File Uploaded: " + FileUpLoad1.FileName;
        //            }
        //            else
        //            {
        //                //Label1.Text = "No File Uploaded.";
        //            }

        //            Excel.Application xlApp;
        //            Excel.Workbook xlWorkBook;
        //            Excel.Worksheet xlWorkSheet;
        //            Excel.Range range;

        //            int rCnt;

        //            int rw = 0;
        //            int cl = 0;

        //            xlApp = new Excel.Application();
        //            xlWorkBook = xlApp.Workbooks.Open(savedFileName, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //            xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

        //            range = xlWorkSheet.UsedRange;
        //            rw = range.Rows.Count;
        //            cl = range.Columns.Count;


        //            for (rCnt = 2; rCnt <= rw; rCnt++)
        //            {
        //                //for (cCnt = 1; cCnt <= cl; cCnt++)
        //                //{
        //                // str = "" + (range.Cells[rCnt, cCnt] as Excel.Range).Value2;
        //                // baseHealpare.MessageBox(this, str);
        //                baseHealpare.MessageBox(this, "Data Adding " + baseHealpare.InsertIntoTable(baseHealpare.TableAddStock,
        //                                       new string[] { "stock_nature_of_opration", "stock_group", "stock_product_name", "stock_unit_of_measurment", "stock_hsn_sac_code", "stock_gst_rate", "stock_mrp", "stock_sale_price_without_gst", "stock_expiry_date", "stock_batch", "stock_reorder_level", "stock_reorder_quantity", "stock_minimum_stock_reminder" },
        //                                       new string[] { "" + (range.Cells[rCnt, 1] as Excel.Range).Value2, "" + (range.Cells[rCnt, 2] as Excel.Range).Value2, "" + (range.Cells[rCnt, 3] as Excel.Range).Value2, "" + (range.Cells[rCnt, 4] as Excel.Range).Value2, "" + (range.Cells[rCnt, 5] as Excel.Range).Value2, "" + (range.Cells[rCnt, 6] as Excel.Range).Value2, "" + (range.Cells[rCnt, 7] as Excel.Range).Value2, "" + (range.Cells[rCnt, 8] as Excel.Range).Value2, "" + (range.Cells[rCnt, 9] as Excel.Range).Value2, "" + (range.Cells[rCnt, 10] as Excel.Range).Value2, "" + (range.Cells[rCnt, 11] as Excel.Range).Value2, "" + (range.Cells[rCnt, 12] as Excel.Range).Value2, "" + (range.Cells[rCnt, 13] as Excel.Range).Value2, }));
        //                // }
        //            }

        //            xlWorkBook.Close(true, null, null);
        //            xlApp.Quit();

        //            Marshal.ReleaseComObject(xlWorkSheet);
        //            Marshal.ReleaseComObject(xlWorkBook);
        //            Marshal.ReleaseComObject(xlApp);
        //            System.IO.File.Delete(savedFileName);

   // }

        }
}