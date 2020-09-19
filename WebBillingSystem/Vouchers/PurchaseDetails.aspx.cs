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


namespace WebBillingSystem
{
    public partial class PurchaseDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList purchase_master;
        public System.Collections.ArrayList purchase_master_dtl;
        public string json_purchase_obj;
        public string json_purchase_dtl;

        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseMst, " where invoice_type='purchase'");
            purchase_master = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                string status_label = "";
                string edit_button = "<a href='/Vouchers/PurchaseInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["pur_mst_auto_id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>  ";

                //view button
                edit_button += " " + "<a href='/Vouchers/PurchaseInvoice.aspx?value=" + baseHealpare.EncodeUrl(this, "" + reader["pur_mst_auto_id"]) + "&view=true' class='btn btn-sm btn-warning fa fa-eye' id='btnEdit' data-toggle='tooltip-dark' data-placement='top' title='View Record'></a>";

                char[] MyChar = { '~' };
                   //if (!master_id.Equals("0"))
                    edit_button += " " + "  <a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/PurchaseInvoice.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + reader["pur_mst_auto_id"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                if (reader["status"] + "" == "2")
                {
                    edit_button = "Invoice Cancel";
                }
                //1. role check  2. status check 3. label set
                if (Session["role_code"].ToString() == "CA")
                {
                    if (reader["ca_approved_status"].ToString() == "3")
                    {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else
                    {
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
                purchase_master.Add(new
                {
                    status_label = status_label,
                    invoice_no = reader["invoice_no"],
                    invoice_date = Convert.ToDateTime(reader["invoice_date"].ToString()).ToString("dd/MM/yyyy"),  //reader["invoice_date"],
                    reverse_charge = reader["reverse_charge"],
                    i_state = reader["i_state"],
                    statecode = reader["statecode"],
                    seller_name = reader["seller_name"],
                    Seller_address = reader["Seller_address"],
                    gstin = reader["gstin"],
                    s_state = reader["s_state"],
                    state_code = reader["state_code"],
                    total_cost = reader["total_cost"],
                    total_gst = reader["total_gst"],
                    total_igst = reader["total_igst"],
                    total_cgst = reader["total_cgst"],
                    total_sgst = reader["total_sgst"],
                    total_discount = reader["total_discount"],
                    payment_mode = reader["payment_mode"],
                    payment_status = reader["payment_status"],
                    invoice_type = reader["invoice_type"],
                    remark = reader["remark"],
                    status = reader["status"],
                    edit_button = edit_button
                 });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_purchase_obj = serializer.Serialize(purchase_master);

            }


            MySqlDataReader dtl_reader = baseHealpare.SelectAllValues(baseHealpare.TableAddStockPuchaseDtl, " where invoice_type = 'purchase' AND status!=2");
            purchase_master_dtl = new System.Collections.ArrayList();

            while (dtl_reader != null && dtl_reader.Read())
            {
                purchase_master_dtl.Add(new
                {
                    invoice_no = dtl_reader["invoice_no"],
                    //seller_no = dtl_reader["seller_no"],
                    //statecode = dtl_reader["statecode"],
                    product_desc = dtl_reader["product_desc"],
                    hsn_code = dtl_reader["hsn_code"],
                    uom = dtl_reader["uom"],
                    batch = dtl_reader["batch"],
                    //expiry_date = dtl_reader["expiry_date"],
                    qty = dtl_reader["qty"],
                    //rate = dtl_reader["rate"],
                    amount = dtl_reader["amount"],
                    discount = dtl_reader["discount"],
                    tax_val = dtl_reader["tax_val"],
                    igst_rate = dtl_reader["igst_rate"],
                    igst_amt = dtl_reader["igst_amt"],
                    cgst_rate = dtl_reader["cgst_rate"],
                    cgst_amt = dtl_reader["cgst_amt"],
                    sgst_rate = dtl_reader["sgst_rate"],
                    sgst_amount = dtl_reader["sgst_amount"],
                    });
            }
            if (dtl_reader != null)
            {
                dtl_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_purchase_dtl = serializer.Serialize(purchase_master_dtl);

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

        //    int rCnt;

        //    int rw = 0;
        //    int cl = 0;

        //    xlApp = new Excel.Application();
        //    //xlWorkBook = xlApp.Workbooks.Open(@"C:\Temp\Purchase_Excel.xlsx", 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //    xlWorkBook = xlApp.Workbooks.Open(savedFileName, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //    xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

        //    range = xlWorkSheet.UsedRange;
        //    rw = range.Rows.Count;
        //    cl = range.Columns.Count;


        //    for (rCnt = 2; rCnt <= rw; rCnt++)
        //    {
        //        //for (cCnt = 1; cCnt <= cl; cCnt++)
        //        //{
        //        // str = "" + (range.Cells[rCnt, cCnt] as Excel.Range).Value2;
        //        // baseHealpare.MessageBox(this, str);
        //        baseHealpare.MessageBox(this, "Data Adding" + baseHealpare.InsertIntoTable(baseHealpare.TableAddStockPuchaseMst,
        //                            new string[] { "invoice_no", "invoice_date", "reverse_charge", "i_state", "statecode", "seller_name", "Seller_address", "gstin", "s_state", "state_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "payment_mode", "payment_status", "invoice_type", "remark", "status" },
        //                            new string[] { "" + (range.Cells[rCnt, 1] as Excel.Range).Value2, "" + (range.Cells[rCnt, 2] as Excel.Range).Value2, "" + (range.Cells[rCnt, 3] as Excel.Range).Value2, "" + (range.Cells[rCnt, 4] as Excel.Range).Value2, "" + (range.Cells[rCnt, 5] as Excel.Range).Value2, "" + (range.Cells[rCnt, 6] as Excel.Range).Value2, "" + (range.Cells[rCnt, 7] as Excel.Range).Value2, "" + (range.Cells[rCnt, 8] as Excel.Range).Value2, "" + (range.Cells[rCnt, 9] as Excel.Range).Value2, "" + (range.Cells[rCnt, 10] as Excel.Range).Value2, "" + (range.Cells[rCnt, 11] as Excel.Range).Value2, "" + (range.Cells[rCnt, 12] as Excel.Range).Value2, "" + (range.Cells[rCnt, 13] as Excel.Range).Value2, "" + (range.Cells[rCnt, 14] as Excel.Range).Value2, "" + (range.Cells[rCnt, 15] as Excel.Range).Value2, "" + (range.Cells[rCnt, 16] as Excel.Range).Value2, "" + (range.Cells[rCnt, 17] as Excel.Range).Value2, "" + (range.Cells[rCnt, 18] as Excel.Range).Value2, "" + (range.Cells[rCnt, 19] as Excel.Range).Value2, "" + (range.Cells[rCnt, 20] as Excel.Range).Value2, "" + (range.Cells[rCnt, 21] as Excel.Range).Value2 }));

        //        // }
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