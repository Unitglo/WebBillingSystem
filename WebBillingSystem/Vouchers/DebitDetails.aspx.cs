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
    public partial class DebitDetails : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList debit_master;
        public string json_debit_obj;
        string notetype = "debit";
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
             
            if (Request.QueryString["purRetu"] != null)
            {
                breadcrumb_title.InnerHtml = Request.QueryString["purRetu"].ToString();
                header_id.InnerHtml = "Purchase Return Details";
                notetype = "purchaseReturn";
            }

            MySqlDataReader debit_reader = baseHealpare.SelectAllValues("*,date_format(date_of_issue,\"%d|%m|%Y\") as date_of_issue_format", baseHealpare.TableAddDebitCreditMst, " where note_type='"+ notetype + "'");
            debit_master = new System.Collections.ArrayList();

            while (debit_reader != null && debit_reader.Read())
            {
                string status_label = "";
                string edit_button = "";
                if (Request.QueryString["purRetu"] != null)
                {
                    edit_button = "<a href='/Vouchers/PurchaseReturn.aspx?value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>";
                    edit_button += " " + "<a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/PurchaseReturn.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                } else {
                    edit_button = "<a href='/Vouchers/debitnote.aspx?value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "' class='btn btn-sm btn-info fa fa-pencil' data-toggle='tooltip-dark' data-placement='top' title='Edit Record'></>";
                    edit_button += " " + "<a href='#' onclick='preparePopup(this)' data-modal-title='Cancel Record' data-message='Do You Want to Continue?' data-url='/Vouchers/debitnote.aspx?delete=delete&value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "' class='btn btn-sm btn-danger fa fa-close' data-toggle='tooltip-dark' data-placement='top' title='Cancel Record'></>";
                }
                if (debit_reader["status"] + "" == "2")
                {
                    edit_button = "Invoice Cancel";
                }

                //1. role check  2. status check 3. label set
                if (Session["role_code"].ToString() == "CA")
                {
                    if (debit_reader["ca_approved_status"].ToString() == "3")
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
                    if (debit_reader["ca_approved_status"].ToString() == "3" || debit_reader["ca_approved_status"].ToString() == "1")
                    {
                        edit_button = "";
                        status_label = "Freezed";
                    }
                    else
                    {
                        status_label = "Open";
                    }
                }

                edit_button += " " + "<a href='/Vouchers/DebitNote.aspx?value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "&view=true'  class='btn btn-sm btn-warning fa fa-eye' id='btnEdit' data-toggle='tooltip-dark' data-placement='top' title='View Record'></a>";
                if (Request.QueryString["purRetu"] != null)
                {
                    edit_button = "<a href='/Vouchers/PurchaseReturn.aspx?value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "&view=true' class='btn btn-sm btn-warning fa fa-eye' id='btnEdit' data-toggle='tooltip-dark' data-placement='top' title='View Record'></>  ";
                }
                else
                {
                    edit_button = "<a href='/Vouchers/DebitNote.aspx?value=" + baseHealpare.EncodeUrl(this, "" + debit_reader["dr_cr_Id"]) + "&view=true' class='btn btn-sm btn-warning fa fa-eye' id='btnEdit' data-toggle='tooltip-dark' data-placement='top' title='View Record'></>  ";

                }

                debit_master.Add(new
                {
                    status_label = status_label,
                    document_no = debit_reader["document_no"],
                    date_of_issue = Convert.ToDateTime(debit_reader["date_of_issue"].ToString()).ToString("dd/MM/yyyy"),
                    //debit_reader["date_of_issue_format"],
                    doc_state = debit_reader["doc_state"],
                    doc_state_code = debit_reader["doc_state_code"],
                    against_invoice = debit_reader["against_invoice"],
                    date_of_invoice = Convert.ToDateTime(debit_reader["date_of_invoice"].ToString()).ToString("dd/MM/yyyy"),
                    bill_party_name = debit_reader["bill_party_name"],
                    bill_party_address = debit_reader["bill_party_address"],
                    bill_party_gstin = debit_reader["bill_party_gstin"],
                    bill_party_state = debit_reader["bill_party_state"],
                    bill_party_state_code = debit_reader["bill_party_state_code"],
                    ship_party_name = debit_reader["ship_party_name"],
                    ship_party_address = debit_reader["ship_party_address"],
                    ship_party_gstin = debit_reader["ship_party_gstin"],
                    ship_party_state = debit_reader["ship_party_state"],
                    ship_party_code = debit_reader["ship_party_code"],
                    total_cost = debit_reader["total_cost"],
                    total_gst = debit_reader["total_gst"],
                    total_igst = debit_reader["total_igst"],
                    total_cgst = debit_reader["total_cgst"],
                    total_sgst = debit_reader["total_sgst"],
                    total_discount = debit_reader["total_discount"],
                    note_type = debit_reader["note_type"],
                    remarks = debit_reader["remarks"],
                    edit_button = edit_button,

                    });
            }
            if(debit_reader != null)
            {
               debit_reader.Close();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            json_debit_obj = serializer.Serialize(debit_master);

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
        //        string str1 = "";
        //        MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT count(*)+1 as debit_no FROM pms_voucher_dr_cr_note_mst");
        //        while (reader != null && reader.Read())
        //        {
        //            var str = ((range.Cells[rCnt, 1] as Excel.Range).Value2).Split('/');
        //            str1 = str[0] + "/" + str[1] + "/" + reader["debit_no"];
        //        }
        //        if (reader != null)
        //        {
        //            reader.Close();
        //        }

        //        baseHealpare.MessageBox(this, "Data Adding" + baseHealpare.InsertIntoTable(baseHealpare.TableAddDebitCreditMst,
        //                            new string[] { "document_no", "date_of_issue", "doc_state", "doc_state_code", "against_invoice", "date_of_invoice", "bill_party_name", "bill_party_address", "bill_party_gstin", "bill_party_state", "bill_party_state_code", "ship_party_name", "ship_party_address", "ship_party_gstin", "ship_party_state", "ship_party_code", "total_cost", "total_gst", "total_igst", "total_cgst", "total_sgst", "total_discount", "note_type", "remarks" },
        //                            new string[] { str1, "" + (range.Cells[rCnt, 2] as Excel.Range).Value2, "" + (range.Cells[rCnt, 3] as Excel.Range).Value2, "" + (range.Cells[rCnt, 4] as Excel.Range).Value2, "" + (range.Cells[rCnt, 5] as Excel.Range).Value2, "" + (range.Cells[rCnt, 6] as Excel.Range).Value2, "" + (range.Cells[rCnt, 7] as Excel.Range).Value2, "" + (range.Cells[rCnt, 8] as Excel.Range).Value2, "" + (range.Cells[rCnt, 9] as Excel.Range).Value2, "" + (range.Cells[rCnt, 10] as Excel.Range).Value2, "" + (range.Cells[rCnt, 11] as Excel.Range).Value2, "" + (range.Cells[rCnt, 12] as Excel.Range).Value2, "" + (range.Cells[rCnt, 13] as Excel.Range).Value2, "" + (range.Cells[rCnt, 14] as Excel.Range).Value2, "" + (range.Cells[rCnt, 15] as Excel.Range).Value2, "" + (range.Cells[rCnt, 16] as Excel.Range).Value2, "" + (range.Cells[rCnt, 17] as Excel.Range).Value2, "" + (range.Cells[rCnt, 18] as Excel.Range).Value2, "" + (range.Cells[rCnt, 19] as Excel.Range).Value2, "" + (range.Cells[rCnt, 20] as Excel.Range).Value2, "" + (range.Cells[rCnt, 21] as Excel.Range).Value2, "" + (range.Cells[rCnt, 22] as Excel.Range).Value2, "" + (range.Cells[rCnt, 23] as Excel.Range).Value2, "" + (range.Cells[rCnt, 24] as Excel.Range).Value2 }));
        //    }

        //    xlWorkBook.Close(true, null, null);
        //    xlApp.Quit();

        //    Marshal.ReleaseComObject(xlWorkSheet);
        //    Marshal.ReleaseComObject(xlWorkBook);
        //    Marshal.ReleaseComObject(xlApp);
        //    System.IO.File.Delete(savedFileName);
        //}

        protected void btnAddClick(object sender, EventArgs e)
        {
            if (Request.QueryString["purRetu"] != null)
            {
                Response.Redirect("~/Vouchers/PurchaseReturn.aspx");
               
            }
            else
            {
                Response.Redirect("~/Vouchers/debitnote.aspx");
            }
        }
    }
}