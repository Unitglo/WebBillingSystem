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
    public partial class gstr1 : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList comp_master;
        public string json_obj;
        public System.Collections.ArrayList sheetthreemaster;
        public System.Collections.ArrayList sheettwomaster;
        public System.Collections.ArrayList sheetfourmaster;
        public System.Collections.ArrayList sheetfivemaster;
        public string json_outwardSupply_obj;
        public string json_Amendment_outward_supply_obj;
        public string json_sheet_four_obj;
        public string json_sheet_five_obj;
        public System.Collections.ArrayList file_master;
        public string json_file_master;
        DateTime date;       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Grid.Visible = false;
            //mysqlCommand.CommandText = "SELECT salemst.seller_name as recename, salemst.gstin as gstno, salemst.s_state as statename, salemst.Seller_address as pos, salemst.invoice_no no, salemst.invoice_date idate, 0 as invoice_value, saledtl.hsn_code as hsncode, stock.stock_nature_of_opration as goodservice, saledtl.tax_val taxval, saledtl.qty qauty, saledtl.uom unit, saledtl.igst_rate igstrate, saledtl.igst_amt igstamt, saledtl.cgst_rate cgstrate, saledtl.cgst_amt cgstamt, saledtl.sgst_rate sgstrate, saledtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, salemst.total_gst revcharge, salemst.company_name ecomoperator, 0 comp_gstin,0 exporttype, 0 shipbillno, 0 shipbilldate, 0 portcode, 0 regular, stock.stock_group itemtype FROM `pms_sale_invoice_mst` as salemst inner join pms_sale_invoice_dtl AS saledtl on saledtl.invoice_no = salemst.invoice_no and saledtl.seller_no = salemst.seller_name INNER JOIN pms_stock AS stock on stock.stock_product_name = saledtl.product_desc and stock.stock_hsn_sac_code = saledtl.hsn_code";
            baseHealpare = new DataBaseHealpare();
            //MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT salemst.seller_name as recename, salemst.gstin as gstno, salemst.s_state as statename, `place_of_supply` as pos, salemst.invoice_no no, salemst.invoice_date idate, `total_cost` as invoice_value, saledtl.hsn_code as hsncode, saledtl.product_desc goodservice, saledtl.tax_val taxval, saledtl.qty qauty, saledtl.uom unit, saledtl.igst_rate igstrate, saledtl.igst_amt igstamt, saledtl.cgst_rate cgstrate, saledtl.cgst_amt cgstamt, saledtl.sgst_rate sgstrate, saledtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, salemst.`reverse_charge` revcharge, '' ecomoperator, 0 comp_gstin, 0 exporttype, 0 shipbillno, 0 shipbilldate, 0 portcode, `sale_invoice_type` regular, '' itemtype FROM `pms_sale_invoice_mst` as salemst LEFT JOIN pms_sale_invoice_dtl AS saledtl ON salemst.sale_mst_id = saledtl.reference_id  where salemst.invoice_date between '"+ txtFromDateId .Value + "' and '" + ToDateId + "'");
            //sheettwomaster = new System.Collections.ArrayList();
            //while (msq_reader != null && msq_reader.Read())
            //{
            //    sheettwomaster.Add(new
            //    {
            //    recename = msq_reader["recename"],
            //        gstno = msq_reader["gstno"],
            //        statename = msq_reader["statename"],
            //        pos = msq_reader["pos"],
            //        no = msq_reader["no"],
            //        idate = Convert.ToDateTime(msq_reader["idate"]).ToString("dd.MM.yyyy"),
            //        invoice_value = msq_reader["invoice_value"],
            //        hsncode = msq_reader["hsncode"],
            //        goodservice = msq_reader["goodservice"],
            //        taxval = msq_reader["taxval"],
            //        qauty = msq_reader["qauty"],
            //        unit = msq_reader["unit"],
            //        igstrate = msq_reader["igstrate"],
            //        igstamt = msq_reader["igstamt"],
            //        cgstrate = msq_reader["cgstrate"],
            //        cgstamt = msq_reader["cgstamt"],
            //        sgstrate = msq_reader["sgstrate"],
            //        sgstamt = msq_reader["sgstamt"],
            //        cessrate = msq_reader["cessrate"],
            //        cessamt = msq_reader["cessamt"],
            //        revcharge = msq_reader["revcharge"],
            //        ecomoperator = msq_reader["ecomoperator"],
            //        comp_gstin = msq_reader["comp_gstin"],
            //        exporttype = msq_reader["exporttype"],
            //        shipbillno = msq_reader["shipbillno"],
            //        shipbilldate = msq_reader["shipbilldate"],
            //        portcode = msq_reader["portcode"],
            //        regular = msq_reader["regular"],
            //        itemtype = msq_reader["itemtype"],
            //        //outSupp_lbl1.InnerHtml  = "" + msq_reader["recename"];
            //        //outSupp_lbl2.InnerHtml  = "" + msq_reader["gstno"];
            //        //outSupp_lbl3.InnerHtml  = "" + msq_reader["statename"];
            //        //outSupp_lbl4.InnerHtml  = "" + msq_reader["pos"];
            //        //outSupp_lbl5.InnerHtml  = "" + msq_reader["no"];
            //        //outSupp_lbl6.InnerHtml  = "" + msq_reader["idate"];
            //        //outSupp_lbl7.InnerHtml  = "" + msq_reader["invoice_value"];
            //        //outSupp_lbl8.InnerHtml  = "" + msq_reader["hsncode"];
            //        //outSupp_lbl9.InnerHtml  = "" + msq_reader["goodservice"];
            //        //outSupp_lbl10.InnerHtml = "" + msq_reader["taxval"];
            //        //outSupp_lbl11.InnerHtml = "" + msq_reader["qauty"];
            //        //outSupp_lbl12.InnerHtml = "" + msq_reader["unit"];
            //        //outSupp_lbl13.InnerHtml = "" + msq_reader["igstrate"];
            //        //outSupp_lbl14.InnerHtml = "" + msq_reader["igstamt"];
            //        //outSupp_lbl15.InnerHtml = "" + msq_reader["cgstrate"];
            //        //outSupp_lbl16.InnerHtml = "" + msq_reader["cgstamt"];
            //        //outSupp_lbl17.InnerHtml = "" + msq_reader["sgstrate"];
            //        //outSupp_lbl18.InnerHtml = "" + msq_reader["sgstamt"];
            //        //outSupp_lbl19.InnerHtml = "" + msq_reader["cessrate"];
            //        //outSupp_lbl20.InnerHtml = "" + msq_reader["cessamt"];
            //        //outSupp_lbl21.InnerHtml = "" + msq_reader["revcharge"];
            //        //outSupp_lbl22.InnerHtml = "" + msq_reader["ecomoperator"];
            //        //outSupp_lbl23.InnerHtml = "" + msq_reader["comp_gstin"];
            //        //outSupp_lbl24.InnerHtml = "" + msq_reader["exporttype"];
            //        //outSupp_lbl25.InnerHtml = "" + msq_reader["shipbillno"];
            //        //outSupp_lbl26.InnerHtml = "" + msq_reader["shipbilldate"];
            //        //outSupp_lbl27.InnerHtml = "" + msq_reader["portcode"];
            //        //outSupp_lbl28.InnerHtml = "" + msq_reader["regular"];
            //        //outSupp_lbl29.InnerHtml = "" + msq_reader["itemtype"];
            //    });

            //}

            //    if (msq_reader != null)
            //    {
            //        msq_reader.Close();
            //        JavaScriptSerializer serializer = new JavaScriptSerializer();
            //            json_outwardSupply_obj = serializer.Serialize(sheettwomaster);

            //    }

            ////MySqlConnection con = null;
            ////con = new MySqlConnection("server=localhost;user id=root;Password=;database=pms;persist security info=False");


            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT salemst.seller_name as recename, salemst.gstin gstno, salemst.s_state istate, salemst.place_of_supply pos, salemst.invoice_no orinvno, salemst.invoice_date orivdate, saledtl.invoice_no revinvno, salemst.invoice_date revivdate, salemst.total_cost invoicevalue, saledtl.hsn_code hsn, saledtl.product_desc goodservice, saledtl.tax_val taxval, saledtl.qty qauty, saledtl.uom unit, saledtl.igst_rate igstrate, saledtl.igst_amt igstamt, saledtl.cgst_rate cgstrate, saledtl.cgst_amt cgstamt, saledtl.sgst_rate sgstrate, saledtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, salemst.reverse_charge revcharge, '' tax_invoice_prov_asses, '' prov_asses_no, '' prov_asses_date, '' ecomoperator, 0 comp_gstin, 0 exporttype, 0 shipbillno, 0 shipbilldate, 0 portcode, `sale_invoice_type` regular, '' itemtype FROM `pms_sale_invoice_mst` as salemst LEFT JOIN pms_sale_invoice_dtl AS saledtl ON salemst.sale_mst_id = saledtl.reference_id where salemst.invoice_date between '" + FromDateId + "' and '" + ToDateId + "'");
            //sheetthreemaster = new System.Collections.ArrayList();
            //while (reader != null && reader.Read())
            //{
            //    sheetthreemaster.Add(new
            //    {
            //        recename = reader["recename"],
            //        gstno = reader["gstno"],
            //        istate = reader["istate"],
            //        pos = reader["pos"],
            //        orinvno = reader["orinvno"],
            //        orivdate = Convert.ToDateTime(reader["orivdate"]).ToString("dd.MM.yyyy"),
            //        revinvno = reader["revinvno"],
            //        revivdate = Convert.ToDateTime(reader["revivdate"]).ToString("dd.MM.yyyy"),
            //        invoicevalue = reader["invoicevalue"],
            //        hsn = reader["hsn"],
            //        goodservice = reader["goodservice"],
            //        taxval = reader["taxval"],
            //        qauty = reader["qauty"],
            //        unit = reader["unit"],
            //        igstrate = reader["igstrate"],
            //        igstamt = reader["igstamt"],
            //        cgstrate = reader["cgstrate"],
            //        cgstamt = reader["cgstamt"],
            //        sgstrate = reader["sgstrate"],
            //        sgstamt = reader["sgstamt"],
            //        cessrate = reader["cessrate"],
            //        cessamt = reader["cessamt"],
            //        revcharge = reader["revcharge"],
            //        taxprovasse = reader["tax_invoice_prov_asses"],
            //        provasseordno = reader["prov_asses_no"],
            //        provasseordate = reader["prov_asses_date"],
            //        ecomoperator = reader["ecomoperator"],
            //        comp_gstin = reader["comp_gstin"],
            //        exporttype = reader["exporttype"],
            //        shipbillno = reader["shipbillno"],
            //        shipbilldate = reader["shipbilldate"],
            //        portcode = reader["portcode"],
            //        regular = reader["regular"],
            //        itemtype = reader["itemtype"],
            //    });
            //}
            //if (reader != null)
            //{
            //    reader.Close();
            //   JavaScriptSerializer serializer = new JavaScriptSerializer();
            //    json_Amendment_outward_supply_obj = serializer.Serialize(sheetthreemaster);

            //}
            ////reader = baseHealpare.SelectManualQuery( "SELECT drcrmst.bill_party_name recename, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, 0 goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, drcrmst.total_gst revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst inner join pms_voucher_dr_cr_note_dtl drcrdtl on drcrdtl.document_no = drcrmst.document_no");
            //reader = baseHealpare.SelectManualQuery("SELECT drcrmst.bill_party_name recename, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, drcrdtl.product_name goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, '' revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst RIGHT JOIN pms_voucher_dr_cr_note_dtl drcrdtl ON drcrdtl.refrance_id = drcrmst.dr_cr_Id WHERE drcrmst.note_type = 'credit' and drcrmst.status = 0 and drcrmst.date_of_issue between '" + FromDateId + "' and '" + ToDateId + "'");
            //sheetfourmaster = new System.Collections.ArrayList();

            //while (reader != null && reader.Read())
            //{
            //    sheetfourmaster.Add(new
            //    {
            //        recename = reader["recename"],
            //        gstno = reader["gstno"],
            //        istate = reader["statename"],
            //        pos = reader["pos"],
            //        type = reader["type"],
            //        drcrditno = reader["drcrditno"],
            //        drcrdate = reader["drcrdate"],
            //        reason = reader["reason"],
            //        hsn = reader["hsn"],
            //        goodservice = reader["goodservice"],
            //        qauty = reader["qauty"],
            //        unit = reader["unit"],
            //        origino = reader["origino"],
            //        origidate = reader["origidate"],
            //        diffvalue = reader["diffvalue"],
            //        igstrate = reader["igstrate"],
            //        igstamt = reader["igstamount"],
            //        cgstrate = reader["cgstrate"],
            //        cgstamt = reader["cgstamount"],
            //        sgstrate = reader["sgstrate"],
            //        sgstamt = reader["sgstamount"],
            //        cessrate = reader["cessrate"],
            //        cessamt = reader["cessamount"],
            //        revcharge = reader["revcharge"],
            //        pregst = reader["pregst"],
            //    });
            //}
            //if (reader != null)
            //{
            //    reader.Close();
            //    JavaScriptSerializer serializer = new JavaScriptSerializer();
            //    json_sheet_four_obj = serializer.Serialize(sheetfourmaster);

            //}

            //reader = baseHealpare.SelectManualQuery( "SELECT drcrmst.bill_party_name recename, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, 0 revdrcrno, 0 revdrcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, 0 goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, drcrmst.total_gst revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst inner join pms_voucher_dr_cr_note_dtl drcrdtl on drcrdtl.document_no = drcrmst.document_no");

            ////MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditDtl, " where document_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            //sheetfivemaster = new System.Collections.ArrayList();

            //while (reader != null && reader.Read())
            //{
            //    sheetfivemaster.Add(new
            //    {
            //        recename = reader["recename"],
            //        gstno = reader["gstno"],
            //        istate = reader["statename"],
            //        pos = reader["pos"],
            //        type = reader["type"],
            //        drcrditno = reader["drcrditno"],
            //        drcrdate = reader["drcrdate"],
            //        revdrcrno = reader["revdrcrno"],
            //        revdrcrdate = reader["revdrcrdate"],
            //        reason = reader["reason"],
            //        hsn = reader["hsn"],
            //        goodservice = reader["goodservice"],
            //        qauty = reader["qauty"],
            //        unit = reader["unit"],
            //        origino = reader["origino"],
            //        origidate = reader["origidate"],
            //        diffvalue = reader["diffvalue"],
            //        igstrate = reader["igstrate"],
            //        igstamt = reader["igstamount"],
            //        cgstrate = reader["cgstrate"],
            //        cgstamt = reader["cgstamount"],
            //        sgstrate = reader["sgstrate"],
            //        sgstamt = reader["sgstamount"],
            //        cessrate = reader["cessrate"],
            //        cessamt = reader["cessamount"],
            //        revcharge = reader["revcharge"],
            //        pregst = reader["pregst"],
            //    });
            //}
            //if (reader != null)
            //{
            //    reader.Close();
            //    JavaScriptSerializer serializer = new JavaScriptSerializer();
            //    json_sheet_five_obj = serializer.Serialize(sheetfivemaster);

            //}
        }
        string FromDateId = "";
        string ToDateId = "";
        protected void search_jv_details_event(object sender, EventArgs e)
        {
            Grid.Visible = true;
            if (rbtnMonthId.Checked == true)
            {
                FromDateId = hdnMonthFromDateId.Value;
                ToDateId = hdnMonthToDateId.Value;
            } else
            if (rbtnQuarterlyId.Checked == true)
            {
                FromDateId = hdnQuarterFromDateId.Value;
                ToDateId = hdnQuarterToDateId.Value;
            }

            MySqlDataReader msq_reader = baseHealpare.SelectManualQuery("SELECT salemst.seller_name as recename, salemst.gstin as gstno, salemst.s_state as statename, `place_of_supply` as pos, salemst.invoice_no no, salemst.invoice_date idate, `total_cost` as invoice_value, saledtl.hsn_code as hsncode, saledtl.product_desc goodservice, saledtl.tax_val taxval, saledtl.qty qauty, saledtl.uom unit, saledtl.igst_rate igstrate, saledtl.igst_amt igstamt, saledtl.cgst_rate cgstrate, saledtl.cgst_amt cgstamt, saledtl.sgst_rate sgstrate, saledtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, salemst.`reverse_charge` revcharge, '' ecomoperator, 0 comp_gstin, 0 exporttype, 0 shipbillno, 0 shipbilldate, 0 portcode, `sale_invoice_type` regular, '' itemtype FROM `pms_sale_invoice_mst` as salemst LEFT JOIN pms_sale_invoice_dtl AS saledtl ON salemst.sale_mst_id = saledtl.reference_id  where salemst.invoice_date between '" + FromDateId + "' and '" + ToDateId + "'");
            sheettwomaster = new System.Collections.ArrayList();
            while (msq_reader != null && msq_reader.Read())
            {
                sheettwomaster.Add(new
                {
                    recename = msq_reader["recename"],
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
                    ecomoperator = msq_reader["ecomoperator"],
                    comp_gstin = msq_reader["comp_gstin"],
                    exporttype = msq_reader["exporttype"],
                    shipbillno = msq_reader["shipbillno"],
                    shipbilldate = msq_reader["shipbilldate"],
                    portcode = msq_reader["portcode"],
                    regular = msq_reader["regular"],
                    itemtype = msq_reader["itemtype"],
                  });

            }

            if (msq_reader != null)
            {
                msq_reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_outwardSupply_obj = serializer.Serialize(sheettwomaster);

            }

            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT salemst.seller_name as recename, salemst.gstin gstno, salemst.s_state istate, salemst.place_of_supply pos, salemst.invoice_no orinvno, salemst.invoice_date orivdate, saledtl.invoice_no revinvno, salemst.invoice_date revivdate, salemst.total_cost invoicevalue, saledtl.hsn_code hsn, saledtl.product_desc goodservice, saledtl.tax_val taxval, saledtl.qty qauty, saledtl.uom unit, saledtl.igst_rate igstrate, saledtl.igst_amt igstamt, saledtl.cgst_rate cgstrate, saledtl.cgst_amt cgstamt, saledtl.sgst_rate sgstrate, saledtl.sgst_amount sgstamt, 0 cessrate, 0 cessamt, salemst.reverse_charge revcharge, '' tax_invoice_prov_asses, '' prov_asses_no, '' prov_asses_date, '' ecomoperator, 0 comp_gstin, 0 exporttype, 0 shipbillno, 0 shipbilldate, 0 portcode, `sale_invoice_type` regular, '' itemtype FROM `pms_sale_invoice_mst` as salemst LEFT JOIN pms_sale_invoice_dtl AS saledtl ON salemst.sale_mst_id = saledtl.reference_id where salemst.invoice_date between '" + FromDateId + "' and '" + ToDateId + "'");
            sheetthreemaster = new System.Collections.ArrayList();
            while (reader != null && reader.Read())
            {
                sheetthreemaster.Add(new
                {
                    recename = reader["recename"],
                    gstno = reader["gstno"],
                    istate = reader["istate"],
                    pos = reader["pos"],
                    orinvno = reader["orinvno"],
                    orivdate = Convert.ToDateTime(reader["orivdate"]).ToString("dd.MM.yyyy"),
                    revinvno = reader["revinvno"],
                    revivdate = Convert.ToDateTime(reader["revivdate"]).ToString("dd.MM.yyyy"),
                    invoicevalue = reader["invoicevalue"],
                    hsn = reader["hsn"],
                    goodservice = reader["goodservice"],
                    taxval = reader["taxval"],
                    qauty = reader["qauty"],
                    unit = reader["unit"],
                    igstrate = reader["igstrate"],
                    igstamt = reader["igstamt"],
                    cgstrate = reader["cgstrate"],
                    cgstamt = reader["cgstamt"],
                    sgstrate = reader["sgstrate"],
                    sgstamt = reader["sgstamt"],
                    cessrate = reader["cessrate"],
                    cessamt = reader["cessamt"],
                    revcharge = reader["revcharge"],
                    taxprovasse = reader["tax_invoice_prov_asses"],
                    provasseordno = reader["prov_asses_no"],
                    provasseordate = reader["prov_asses_date"],
                    ecomoperator = reader["ecomoperator"],
                    comp_gstin = reader["comp_gstin"],
                    exporttype = reader["exporttype"],
                    shipbillno = reader["shipbillno"],
                    shipbilldate = reader["shipbilldate"],
                    portcode = reader["portcode"],
                    regular = reader["regular"],
                    itemtype = reader["itemtype"],
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_Amendment_outward_supply_obj = serializer.Serialize(sheetthreemaster);

            }
            
            reader = baseHealpare.SelectManualQuery("SELECT drcrmst.bill_party_name recename, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, drcrdtl.product_name goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, '' revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst RIGHT JOIN pms_voucher_dr_cr_note_dtl drcrdtl ON drcrdtl.refrance_id = drcrmst.dr_cr_Id WHERE drcrmst.note_type = 'credit' and drcrmst.status = 0 and drcrmst.date_of_issue between '" + FromDateId + "' and '" + ToDateId + "'");
            sheetfourmaster = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                sheetfourmaster.Add(new
                {
                    recename = reader["recename"],
                    gstno = reader["gstno"],
                    istate = reader["statename"],
                    pos = reader["pos"],
                    type = reader["type"],
                    drcrditno = reader["drcrditno"],
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
                    pregst = reader["pregst"],
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_sheet_four_obj = serializer.Serialize(sheetfourmaster);

            }

            reader = baseHealpare.SelectManualQuery("SELECT drcrmst.bill_party_name recename, drcrmst.bill_party_gstin gstno, drcrmst.bill_party_state statename, drcrmst.bill_party_address pos, drcrmst.note_type type, drcrmst.document_no as drcrditno, drcrmst.date_of_issue drcrdate, 0 revdrcrno, 0 revdrcrdate, drcrmst.remarks reason, drcrdtl.hsn_code hsn, 0 goodservice, drcrdtl.quantity qauty, drcrdtl.uom unit, drcrmst.against_invoice origino, drcrmst.date_of_invoice origidate, 0 diffvalue, drcrdtl.igst_rate igstrate, drcrdtl.igst_amount igstamount, drcrdtl.cgst_rate cgstrate, drcrdtl.cgst_amount cgstamount, drcrdtl.sgst_rate sgstrate, drcrdtl.sgst_amount sgstamount, 0 cessrate, 0 cessamount, drcrmst.total_gst revcharge, 0 pregst FROM pms_voucher_dr_cr_note_mst drcrmst inner join pms_voucher_dr_cr_note_dtl drcrdtl on drcrdtl.document_no = drcrmst.document_no");

            //MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAddDebitCreditDtl, " where document_no=" + "'" + System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(Server.UrlDecode(Request.QueryString["value"].ToString()))) + "'");
            sheetfivemaster = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                sheetfivemaster.Add(new
                {
                    recename = reader["recename"],
                    gstno = reader["gstno"],
                    istate = reader["statename"],
                    pos = reader["pos"],
                    type = reader["type"],
                    drcrditno = reader["drcrditno"],
                    drcrdate = reader["drcrdate"],                    
                    revdrcrno = reader["revdrcrno"],                    
                    revdrcrdate = reader["revdrcrdate"],                    
                    reason = reader["reason"],
                    hsn = reader["hsn"],
                    goodservice = reader["goodservice"],
                    qauty = reader["qauty"],
                    unit = reader["unit"],
                    origino = reader["origino"],
                    origidate = reader["origidate"],
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
                    pregst = reader["pregst"],
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_sheet_five_obj = serializer.Serialize(sheetfivemaster);

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
            json_outwardSupply_obj = serializer.Serialize(file_master);
            txtoutwardSupplyId.Value = "append_outwar_supply";


            xlWorkBook.Close(true, null, null);
            xlApp.Quit();

            Marshal.ReleaseComObject(xlWorkSheet);
            Marshal.ReleaseComObject(xlWorkBook);
            Marshal.ReleaseComObject(xlApp);

        }

    }
}