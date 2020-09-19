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
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;


namespace WebBillingSystem
{
    public partial class SaleDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList purchase_master;
        public string json_sale_obj;

        //protected void UploadBtn_Click(object sender, EventArgs e)
        //{
        //    if (FileUpLoad1.HasFile)
        //    {

        //        FileUpLoad1.SaveAs(@"C:\temp\" + FileUpLoad1.FileName);
        //        //Label1.Text = "File Uploaded: " + FileUpLoad1.FileName;
        //    }
        //    else
        //    {
        //        //Label1.Text = "No File Uploaded.";
        //    }
        //}
        //public static class ConfigurationManager


        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddSaleMst, "");
            purchase_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                string status_label = "";
                string edit_button = "<a href='/Vouchers/SaleInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["sale_mst_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' id='btnEdit' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></a>  ";
                edit_button += " " + "<a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/SaleInvoice.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["sale_mst_id"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                
                if (reader["status"]+"" == "2") {
                    edit_button = "Invoice Cancel";
                }
                //1. role check  2. status check 3. label set
                if (Session["role_code"].ToString() == "CA")
                {
                    if (reader["ca_approved_status"].ToString() =="3" ) {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else{
                        status_label = "Open";
                    }
                }
                else if (Session["role_code"].ToString() == "COMPANY")
                {
                    if (reader["ca_approved_status"].ToString() == "3" || reader["ca_approved_status"].ToString() == "1")
                    {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else
                    {
                        status_label = "Open";
                    }
                }
                //for view button
                edit_button += " " + "<a href='/Vouchers/SaleInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["sale_mst_id"]) + "&view=true' class='btn btn-sm btn-warning fa fa-eye' id='btnEdit' data-toggle='tooltip-dark' data-placement='top' title='View Record'></a>";

                purchase_master.Add(new
                {
                    status_label = status_label,
                    invoice_no = reader["invoice_no"],
                    invoice_date = Convert.ToDateTime(reader["invoice_date"].ToString()).ToString("yyyy-MM-dd"),
                    //reader["invoice_date"],
                    reverse_charge = reader["reverse_charge"],
                    i_state = reader["i_state"],
                    statecode = reader["statecode"],
                    transport_mode = reader["transport_mode"],
                    vehicle_no = reader["vehicle_no"],
                    date_of_supply = Convert.ToDateTime(reader["date_of_supply"].ToString()).ToString("yyyy-MM-dd"),
                     //reader["date_of_supply"],
                    place_of_supply = reader["place_of_supply"],
                    seller_name = reader["seller_name"],
                    Seller_address = reader["Seller_address"],
                    gstin = reader["gstin"],
                    s_state = reader["s_state"],
                    state_code = reader["state_code"],
                    ship_party_name = reader["ship_party_name"],
                    ship_party_address = reader["ship_party_address"],
                    ship_party_gstin = reader["ship_party_gstin"],
                    ship_party_state = reader["ship_party_state"],
                    ship_party_state_code = reader["ship_party_state_code"],
                    total_cost = reader["total_cost"],
                    total_gst = reader["total_gst"],
                    total_igst = reader["total_igst"],
                    total_cgst = reader["total_cgst"],
                    total_sgst = reader["total_sgst"],
                    total_discount = reader["total_discount"],
                    bank_name = reader["bank_name"],
                    bank_ac_no = reader["bank_ac_no"],
                    bank_ifsc_code = reader["bank_ifsc_code"],
                    company_name = reader["company_name"],
                    terms_and_condition = reader["terms_and_condition"],
                    auth_name = reader["auth_name"],
                    payment_mode = reader["payment_mode"],
                    payment_status = reader["payment_status"],
                    remark = reader["remark"],
                    status = reader["status"],
                    edit_button = edit_button,
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_sale_obj = serializer.Serialize(purchase_master);

            }
        }


        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    string savedFileName = "";
        //    if (FileUpload1.HasFile)
        //    {
        //        savedFileName = Server.MapPath("//upload//" + Session["company"] + "_" + FileUpload1.FileName);
        //        FileUpload1.SaveAs(savedFileName);

        //    }

        //    Excel.Application xlApp;
        //    Excel.Workbook xlWorkBook;
        //    Excel.Worksheet xlWorkSheet;
        //    Excel.Range range;

        //    string str;
        //    int rCnt;
        //    int cCnt;
        //    int rw = 0;
        //    int cl = 0;

        //    xlApp = new Excel.Application();

        //    if (xlApp == null)
        //    {
        //       baseHealpare.MessageBox(this,"Excel is not properly installed!!");
        //        return;
        //    }
        //    else
        //    {

        //        //xlWorkBook = xlApp.Workbooks.Open(@"C:\Temp\Sale_Excel.xlsx", 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //        xlWorkBook = xlApp.Workbooks.Open(savedFileName, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //        xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

        //        range = xlWorkSheet.UsedRange;
        //        rw = range.Rows.Count;
        //        cl = range.Columns.Count;


        //        for (rCnt = 2; rCnt <= rw; rCnt++)
        //        {
        //            //for (cCnt = 1; cCnt <= cl; cCnt++)
        //            //{
        //            // str = "" + (range.Cells[rCnt, cCnt] as Excel.Range).Value2;
        //            // baseHealpare.MessageBox(this, str);
        //            baseHealpare.MessageBox(this, "Data Adding" + baseHealpare.InsertIntoTable(baseHealpare.TableAddSaleMst,
        //                                new string[] { "invoice_no", "invoice_date", "reverse_charge", "i_state", "statecode", "transport_mode", "vehicle_no", "date_of_supply", "place_of_supply", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "bank_name", "bank_ac_no", "bank_ifsc_code", "company_name", "terms_and_condition", "auth_name", "payment_mode", "payment_status", "remark", "status" },
        //                                new string[] { "" + (range.Cells[rCnt, 1] as Excel.Range).Value2, "" + (range.Cells[rCnt, 2] as Excel.Range).Value2, "" + (range.Cells[rCnt, 3] as Excel.Range).Value2, "" + (range.Cells[rCnt, 4] as Excel.Range).Value2, "" + (range.Cells[rCnt, 5] as Excel.Range).Value2, "" + (range.Cells[rCnt, 6] as Excel.Range).Value2, "" + (range.Cells[rCnt, 7] as Excel.Range).Value2, "" + (range.Cells[rCnt, 8] as Excel.Range).Value2, "" + (range.Cells[rCnt, 9] as Excel.Range).Value2, "" + (range.Cells[rCnt, 10] as Excel.Range).Value2, "" + (range.Cells[rCnt, 11] as Excel.Range).Value2, "" + (range.Cells[rCnt, 12] as Excel.Range).Value2, "" + (range.Cells[rCnt, 13] as Excel.Range).Value2, "" + (range.Cells[rCnt, 14] as Excel.Range).Value2, "" + (range.Cells[rCnt, 15] as Excel.Range).Value2, "" + (range.Cells[rCnt, 16] as Excel.Range).Value2, "" + (range.Cells[rCnt, 17] as Excel.Range).Value2, "" + (range.Cells[rCnt, 18] as Excel.Range).Value2, "" + (range.Cells[rCnt, 19] as Excel.Range).Value2, "" + (range.Cells[rCnt, 20] as Excel.Range).Value2, "" + (range.Cells[rCnt, 21] as Excel.Range).Value2, "" + (range.Cells[rCnt, 22] as Excel.Range).Value2, "" + (range.Cells[rCnt, 23] as Excel.Range).Value2, "" + (range.Cells[rCnt, 24] as Excel.Range).Value2, "" + (range.Cells[rCnt, 25] as Excel.Range).Value2, "" + (range.Cells[rCnt, 26] as Excel.Range).Value2, "" + (range.Cells[rCnt, 27] as Excel.Range).Value2, "" + (range.Cells[rCnt, 28] as Excel.Range).Value2, "" + (range.Cells[rCnt, 29] as Excel.Range).Value2, "" + (range.Cells[rCnt, 30] as Excel.Range).Value2, "" + (range.Cells[rCnt, 31] as Excel.Range).Value2, "" + (range.Cells[rCnt, 32] as Excel.Range).Value2, "" + (range.Cells[rCnt, 33] as Excel.Range).Value2, "" + (range.Cells[rCnt, 34] as Excel.Range).Value2, "" + (range.Cells[rCnt, 35] as Excel.Range).Value2 }));

        //            // }
        //        }
        //    }

        //    xlWorkBook.Close(true, null, null);
        //    xlApp.Quit();

        //    Marshal.ReleaseComObject(xlWorkSheet);
        //    Marshal.ReleaseComObject(xlWorkBook);
        //    Marshal.ReleaseComObject(xlApp);
        //    System.IO.File.Delete(savedFileName);
        //}
    }
}