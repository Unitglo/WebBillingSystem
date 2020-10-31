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
using System.Data;
using Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;


namespace WebBillingSystem
{
    public partial class gstr2 : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList comp_master;
        public string json_obj;
        public System.Collections.ArrayList sheetthreemaster;
        public System.Collections.ArrayList sheettwomaster;
        public System.Collections.ArrayList sheetfourmaster;
        public System.Collections.ArrayList sheetfivemaster;
        public string json_inwardSupply_obj;
        public string json_Amendment_outward_supply_obj;
        public string json_crdrnote;
        public string json_sheet_five_obj;
        public System.Collections.ArrayList file_master;
        public string json_file_master;

        DateTime date;
       
        protected void Page_Load(object sender, EventArgs e)
        {

            //mysqlCommand.CommandText = "SELECT salemst.seller_name as suppliername, salemst.gstin as gstno, salemst.s_state as statename, salemst.Seller_address as pos, salemst.invoice_no no, salemst.invoice_date idate, 0 as invoice_value, saledtl.hsn_code as hsncode, stock.stock_nature_of_opration as goodservice, saledtl.tax_val taxval, saledtl.qty qauty, saledtl.uom unit, saledtl.igst_rate igstrate, saledtl.igst_amt igstamt, saledtl.cgst_rate cgstrate, saledtl.cgst_amt cgstamt, saledtl.sgst_rate sgstrate, saledtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, salemst.total_gst revcharge, salemst.company_name ecomoperator, 0 comp_gstin,0 exporttype, 0 shipbillno, 0 shipbilldate, 0 portcode, 0 regular, stock.stock_group itemtype FROM `pms_sale_invoice_mst` as salemst inner join pms_sale_invoice_dtl AS saledtl on saledtl.invoice_no = salemst.invoice_no and saledtl.seller_no = salemst.seller_name INNER JOIN pms_stock AS stock on stock.stock_product_name = saledtl.product_desc and stock.stock_hsn_sac_code = saledtl.hsn_code";
            baseHealpare = new DataBaseHealpare();
            Grid.Visible = false;
        }

        string FromDateId = "";
        string ToDateId = "";
        string date_id;
        protected void search_jv_details_event(object sender, EventArgs e)
        {
            Grid.Visible = true;
            if (rbtnMonthId.Checked == true)
            {
                FromDateId = hdnMonthFromDateId.Value;
                ToDateId = hdnMonthToDateId.Value;
            }
            else
            if (rbtnQuarterlyId.Checked == true)
            {
                FromDateId = hdnQuarterFromDateId.Value;
                ToDateId = hdnQuarterToDateId.Value;
            }

            int year = 2020;
            if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
            {
                FromDateId = (year - 1) + "-04-01";
            }
            else
            {
                FromDateId = year + "-04-01";
            }
             date_id = FromDateId + " TO " + ToDateId;



            MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT purchasemst.seller_name as suppliername, purchasemst.gstin as gstno, purchasemst.s_state as statename, '' as pos, purchasemst.invoice_no no, purchasemst.invoice_date idate, total_cost as invoice_value, purchasedtl.hsn_code as hsncode, purchasedtl.product_desc goodservice, purchasedtl.tax_val taxval, purchasedtl.qty qauty, purchasedtl.uom unit, purchasedtl.igst_rate igstrate, purchasedtl.igst_amt igstamt, purchasedtl.cgst_rate cgstrate, purchasedtl.cgst_amt cgstamt, purchasedtl.sgst_rate sgstrate, purchasedtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, purchasemst.`reverse_charge` revcharge, '' eligi_itc, total_igst total_tax_igst, total_cgst total_tax_cgst, total_sgst total_tax_sgst, 0 total_tax_cess, 0 portcode, '' regular, '' itemtype FROM `pms_purchase_invoice_mst` as purchasemst LEFT JOIN pms_purchase_invoice_dtl AS purchasedtl ON purchasemst.pur_mst_auto_id = purchasedtl.reference_id where purchasemst.invoice_date between '" + FromDateId + "' and '" + ToDateId + "'");
            sheettwomaster = new System.Collections.ArrayList();
            while (msq_reader != null && msq_reader.Read())
            {
                sheettwomaster.Add(new
                {
                    suppliername = msq_reader["suppliername"],
                    gstno = msq_reader["gstno"],
                    statename = msq_reader["statename"],
                    pos = msq_reader["pos"],
                    no = msq_reader["no"],
                    idate = Convert.ToDateTime(msq_reader["idate"]).ToString("dd.MM.yyyy"),
                    invoice_value = msq_reader["invoice_value"],
                    hsncode = msq_reader["hsncode"],
                    goodservice = msq_reader["goodservice"],
                    taxval = msq_reader["taxval"],
                    qauty = msq_reader["qauty"],
                    unit = msq_reader["unit"],
                    igstrate = msq_reader["igstrate"],
                    igstamt = msq_reader["igstamt"],
                    cgstrate = msq_reader["cgstrate"],
                    cgstamt = msq_reader["cgstamt"],
                    sgstrate = msq_reader["sgstrate"],
                    sgstamt = msq_reader["sgstamt"],
                    cessrate = msq_reader["cessrate"],
                    cessamt = msq_reader["cessamt"],
                    revcharge = msq_reader["revcharge"],
                    eligi_itc = msq_reader["eligi_itc"],
                    total_tax_igst = msq_reader["total_tax_igst"],
                    total_tax_cgst = msq_reader["total_tax_cgst"],
                    total_tax_sgst = msq_reader["total_tax_sgst"],
                    total_tax_cess = msq_reader["total_tax_cess"],
                    portcode = msq_reader["portcode"],
                    regular = msq_reader["regular"],
                    itemtype = msq_reader["itemtype"]

                });

            }

            if (msq_reader != null)
            {
                msq_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_inwardSupply_obj = serializer.Serialize(sheettwomaster);

            }


            //reader = baseHealpare.SelectManualQuery( "SELECT drcrmst.bill_party_name suppliername, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, 0 goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, drcrmst.total_gst revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst inner join pms_voucher_dr_cr_note_dtl drcrdtl on drcrdtl.document_no = drcrmst.document_no");
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT drcrmst.bill_party_name suppliername, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, drcrdtl.product_name goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, '' revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst RIGHT JOIN pms_voucher_dr_cr_note_dtl drcrdtl ON drcrdtl.refrance_id = drcrmst.dr_cr_Id WHERE drcrmst.note_type = 'debit' and drcrmst.status = 0 and drcrmst.date_of_issue between '" + FromDateId + "' and '" + ToDateId + "'");
            sheetfourmaster = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                sheetfourmaster.Add(new
                {
                    suppliername = reader["suppliername"],
                    gstno = reader["gstno"],
                    istate = reader["statename"],
                    pos = reader["pos"],
                    type = reader["type"],
                    drcrditno = ""+reader["drcrditno"],
                    drcrdate = Convert.ToDateTime(reader["drcrdate"]).ToString("dd.MM.yyyy"),
                    reason = reader["reason"],
                    hsn = reader["hsn"],
                    goodservice = reader["goodservice"],
                    qauty = reader["qauty"],
                    unit = reader["unit"],
                    origino = reader["origino"],
                    origidate = Convert.ToDateTime(reader["origidate"]).ToString("dd.MM.yyyy"),

                    diffvalue = reader["diffvalue"],
                    igstrate = reader["igstrate"],
                    igstamt = reader["igstamount"],
                    cgstrate = reader["cgstrate"],
                    cgstamt = reader["cgstamount"],
                    sgstrate = reader["sgstrate"],
                    sgstamt = reader["sgstamount"],
                    cessrate = reader["cessrate"],
                    cessamt = reader["cessamount"],
                    revcharge = reader["revcharge"],
                    pregst = reader["pregst"]
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_crdrnote = serializer.Serialize(sheetfourmaster);

            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            file_master = new System.Collections.ArrayList();
            if (FileUpload1.HasFile)
            {

                FileUpload1.SaveAs(@"G:\akash\Account Project\smita\WebBillingSystem\WebBillingSystem\Temp\" + FileUpload1.FileName);
                //Label1.Text = "File Uploaded: " + FileUpLoad1.FileName;
            }
            else
            {
                //Label1.Text = "No File Uploaded.";
            }

            Excel.Application xlApp;
            Excel.Workbook xlWorkBook;
            Excel.Worksheet xlWorkSheet;
            Excel.Range range;

            int rCnt;

            int rw = 0;
            int cl = 0;

            xlApp = new Excel.Application();
            xlWorkBook = xlApp.Workbooks.Open(@"G:\akash\Account Project\smita\WebBillingSystem\WebBillingSystem\Temp\" + FileUpload1.FileName, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
            xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

            range = xlWorkSheet.UsedRange;
            rw = range.Rows.Count;
            cl = range.Columns.Count;


            for (rCnt = 3; rCnt <= rw; rCnt++)
            {
                file_master.Add(new
                {
                  outwar_supply1 = "" + (range.Cells[rCnt, 1] as Excel.Range).Value2,
                  outwar_supply2 = "" + (range.Cells[rCnt, 2] as Excel.Range).Value2,
                  outwar_supply3 = "" + (range.Cells[rCnt, 3] as Excel.Range).Value2,
                  outwar_supply4 = "" + (range.Cells[rCnt, 4] as Excel.Range).Value2,
                  outwar_supply5 = "" + (range.Cells[rCnt, 5] as Excel.Range).Value2,
                  outwar_supply6 = "" + (range.Cells[rCnt, 6] as Excel.Range).Value2,
                  outwar_supply7 = "" + (range.Cells[rCnt, 7] as Excel.Range).Value2,
                  outwar_supply8 = "" + (range.Cells[rCnt, 8] as Excel.Range).Value2,
                  outwar_supply9 = "" + (range.Cells[rCnt, 9] as Excel.Range).Value2,
                  outwar_supply10 = "" + (range.Cells[rCnt, 10] as Excel.Range).Value2,
                  outwar_supply11 = "" + (range.Cells[rCnt, 11] as Excel.Range).Value2,
                  outwar_supply12 = "" + (range.Cells[rCnt, 12] as Excel.Range).Value2,
                  outwar_supply13 = "" + (range.Cells[rCnt, 13] as Excel.Range).Value2,
                  outwar_supply14 = "" + (range.Cells[rCnt, 14] as Excel.Range).Value2,
                  outwar_supply15 = "" + (range.Cells[rCnt, 15] as Excel.Range).Value2,
                  outwar_supply16 = "" + (range.Cells[rCnt, 16] as Excel.Range).Value2,
                  outwar_supply17 = "" + (range.Cells[rCnt, 17] as Excel.Range).Value2,
                  outwar_supply18 = "" + (range.Cells[rCnt, 18] as Excel.Range).Value2,
                  outwar_supply19 = "" + (range.Cells[rCnt, 19] as Excel.Range).Value2,
                  outwar_supply20 = "" + (range.Cells[rCnt, 20] as Excel.Range).Value2,
                  outwar_supply21 = "" + (range.Cells[rCnt, 21] as Excel.Range).Value2,
                  outwar_supply22 = "" + (range.Cells[rCnt, 22] as Excel.Range).Value2,
                  outwar_supply23 = "" + (range.Cells[rCnt, 23] as Excel.Range).Value2,
                  outwar_supply24 = "" + (range.Cells[rCnt, 24] as Excel.Range).Value2,
                  outwar_supply25 = "" + (range.Cells[rCnt, 25] as Excel.Range).Value2,
                  outwar_supply26 = "" + (range.Cells[rCnt, 26] as Excel.Range).Value2,
                  outwar_supply27 = "" + (range.Cells[rCnt, 27] as Excel.Range).Value2,
                  outwar_supply28 = "" + (range.Cells[rCnt, 28] as Excel.Range).Value2,
                  outwar_supply29 = "" + (range.Cells[rCnt, 29] as Excel.Range).Value2
                });
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            json_inwardSupply_obj = serializer.Serialize(file_master);
            txtoutwardSupplyId.Value = "append_inward_supply";


            xlWorkBook.Close(true, null, null);
            xlApp.Quit();

            Marshal.ReleaseComObject(xlWorkSheet);
            Marshal.ReleaseComObject(xlWorkBook);
            Marshal.ReleaseComObject(xlApp);

        }

    }
}