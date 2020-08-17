<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="debitPrint.aspx.cs" Inherits="WebBillingSystem.debitPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
    select{
    -webkit-appearance: none;
    appearance: none;
    }
        input,select,textarea {
            border-width: 0 !important;
            
        }
       
        select::-ms-expand {
            display: none;
         }
        .row {
            width:100%;
            display: inline-flex;
        }
        .col-md-6.mb-20 {
            width:50%;
        }
        </style>
    <form id="form1" runat="server">
    <div>
 
    <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h2 class="hk-pg-title" runat="server" id="Header_ID" style="text-align:center"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Debit Note</h2>
                <br />Company Name :- <b> <label id="lblcomp" runat="server"></label></b>
            </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
    <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">


                    
                   
                    <div class="invoice-from-wrap">
                        <div class="row">
                            <div class="col-md-6 mb-20">
                                <%--                                       <img class="img-fluid invoice-brand-img d-block mb-20" src="" alt="company logo"> --%>
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Document No</td>
                                                <td colspan="2">:<label id="doc_no" class="doc-no" runat="server"></label>
                                                    <select runat="server" class="form-control select2 select2-hidden-accessible dr_no_class"  id="dr_no_id" name="dr_no_name" >
                                                    </select>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Date of Issue</td>
                                                <td colspan="2">:
                                                    <input type="date" runat="server" id="dateIssue" name="dateIssue" class="date_Issue" style="width: 95%" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                             <tr>
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" id="doc_state" name="doc_state" class="docState"></label></td>
                                                <td>Code </td>
                                                <td>:
                                                
                                                    <label runat="server" id="doc_code" name="doc_code" class="doc-code"></label>
                                                </td>

                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                            <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                             <tr>                                              
                                               <td colspan="2" style="width: 20%;">Against invoice <i onclick="show_invoice()"></i> : </td>
                                                <td colspan="2"> 
                                                    <select runat="server" class="form-control select2  against_invoice" id="againstinvoice" name="againstinvoice">
                                                    </select>
                                                </td>
                                             </tr>

                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                           
                                            <tr>
                                                <td colspan="2">Date of Invoice</td>
                                                <td colspan="2">:
                                                    <input type="date" runat="server" id="dateInvoice" name="dateInvoice" class="date_Invoice" style="width: 95%" />
                                                </td>

                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                    </div>
                   


                    
                    <div class="invoice-from-wrap">

                        <div class="row">
                            <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <thead  style="text-align:center; border:groove;">
                                            <th colspan="4">Bill to Party</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-1">
                                            </tr>
                                        
                                            <tr>
                                                <td colspan="1" style="width: 25%;">Name  : </td>
                                                <td colspan="2"> 
                                                    <select runat="server" class="form-control select2 bill_party_name"   id="billPartyName" name="bill_Party_Name" >
                                                    </select>
                                                </td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="window.location='/Master/AddAccount?redirect=debit';"></i></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">Address </td>
                                                <td colspan="3">:
                                                    <label runat="server" style="width: 95%;" id="billPartyAddress" name="bill_party_address" class="billParty_address" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">GSTIN  :</td>
                                                <td colspan="3">
                                                 <input runat="server" type="text" id="billPartygstin" name="billPartygstin" class="form-control  billParty_gstin" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                             <tr>
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" id="billparty_statename" name="billpartystatename" class="bill_party_state"></label>
                                                </td>
                                                <td>Code  : 
                                                    <label runat="server" id="bill_statecode" name="billstatecode" class="bill_state_code"></label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                            <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <thead  style="text-align:center; border:groove;">
                                            <%--<th><input type="checkbox" id="chk_Id" onclick=' if($(this).prop("checked")){$(".seller_name").val($(".bill_party_name").val()).change();trclick($(".bill_party_name").val(),"seller_name");}'></th>--%>
                                            <th colspan="4">Ship to Party</th>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td colspan="4"></td>
                                                    
                                            </tr>
                                        
                                            <tr>
                                                <td colspan="1" style="width: 25%;">Name  :</td>
                                                <td colspan="3">
                                                    <select runat="server" class="form-control select2 seller_name" id="shipPartyName" name="shipPartyName" >
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">Address </td>
                                                <td colspan="3">:
                                                    <label runat="server" style="width: 95%;" id="shipPartyAddress" name="shipPartyAddress" class="ship_Party_Address" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">GSTIN :</td>
                                                <td colspan="3"> 
                                                    <input runat="server" type="text" id="shipPartygst_in" name="shipPartygstin" class="form-control  shipPartygstin" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" class="ship_Party_state" id="shipPartystate" name="shipPartystate"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" class="ship_Party_state_code" id="shipPartystatecode" name="shipParty_StateCode"></label>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td colspan="8">
                                                    <hr class="mt-0">
                                            </tr>

                                        </tbody>
                                        <%--<hr class="hr-dark mt-10">--%>
                                    </table>
                                </h6>
                            </div>
                            
                        </div>
                    </div>
                   
                    <div class="invoice-from-wrap" id="addValueinTable">
                        <div class="row">
                             <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="1">Product Name   :</td>                                                
								                <td colspan="3"><input type="text" runat="server" id="txtproduct_name" name="product-name" class="form-control mt-15 product-name" placeholder="Product Name" ></td>
									        </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">HSN Code </td>
                                                <td colspan="2" >:
                                                    <label runat="server" id="lblhsncode" name="hsncode" class="hsn-code"></label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">GST Rate</td>
                                                <td colspan="2" >: <label runat="server" class="gst_rate" id="lblgst_rate" name="lblgst_rate" ></label>
                                                    
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Unit Of Measurement </td>
                                                <td colspan="2">:<label runat="server" id="lbluom" name="lbluom" class="lbluom"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            
                                            <tr id="batch_tr_id">
                                                <td colspan="2">Batch </td>
                                                <td colspan="2">:
                                                   <input runat="server" type="text" id="Batch_ID" class="Batch_class" name="Batch_Name" placeholder="Add Batch" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                            
                                            <tr id="expiry_tr_id">
                                                <td colspan="1">Expiry Date </td>
                                                <td colspan="3">:
                                                   <input runat="server" type="date" id="Expiry_Date_Id" class="Expiry_Date_class" name="Expiry_Date_Name" style="width: 65%"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                           
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                            <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td>Amount :</td>
                                                <td><input type="text" runat="server" id="txtAmount" value="0" name="txtAmount" class="form-control mt-15 amount" placeholder="Amount" onkeyup="CalculateTotal()"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>Quantity  :  </td>
                                                <td> <input type="text" runat="server" id="txtQty" value="1" name="txtQty" class="form-control mt-5 txtqty" placeholder="Qty" onkeyup="CalculateTotal()"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr>
                                                <td colspan="1">Total Amount </td>
                                                <td colspan="3">:
                                                    <label id="lblTotal" name="lblTotal" class="total" runat="server" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>Discount :</td>
                                                <td class="disc"> <input type="text" runat="server" id="txtdisc" value="0" name="discount" class="form-control mt-15 txtdisc" placeholder="Discount"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            

                                             <tr>
                                            <td><input type="button" class="btn btn-primary" value="Add"
									           onclick="addproduct()"></td>

                                                </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                    </div>
                    

				<!-- #Product Add -->
                   <div class="row"> 
                  <table class="table table-light table-bordered mb-0" id="myTable"
						style="border: 1px solid;">
                    <%--<table id="myTable" class="table table-hover table-bordered mb-0" style="font: initial;">--%>
                        <thead class="thead-light">
						<tr>
                            <th style="border: 2px solid;">Sr. No.</th>
							<th style="border: 2px solid;">Product Description</th>
							<th style="border: 2px solid;">HSN code</th>
							<th style="border: 2px solid;">Unit Of Measurement</th>
                            <th style="border: 2px solid;">Batch</th>
                            <th style="border: 2px solid;">Expiry Date</th>
							<th style="border: 2px solid;">Qty</th>
							<th style="border: 2px solid;">Rate</th>
							<th style="border: 2px solid;">Amount</th>
							<th style="border: 2px solid;">Discount</th>
							<th style="border: 2px solid;">Taxable Value</th>
                            <th style="border: 2px solid;">IGST Rate</th>
                            <th style="border: 2px solid;">IGST Amount</th>
                            <th style="border: 2px solid;">CGST Rate</th>
                            <th style="border: 2px solid;">CGST Amount</th>
                            <th style="border: 2px solid;">SGST Rate</th>
                            <th style="border: 2px solid;">SGST Amount</th>
                            <th style="border: 2px solid;">TOTAL</th>
							<th style="border: 2px solid;">Action</th>
						</tr>
                            </thead>
						<tbody id="item-holder-tbody" style="border: 1px solid;">

						</tbody>
                      <tfoot class="border: 1px solid;">
                      <tr>
                          <th colspan="6" id="foot_tot" class="text-center font-weight-600" style="border: 2px solid"><b>total</b></th>
                          <th id="tot_Quant" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Rate" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Amt" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Dis" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Taxval" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Igst" colspan="2" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Cgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Sgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Amt_tax" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                         <tr>
                            <th  colspan="11" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th  colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_tax" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                     <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-left: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-left: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-left: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                          <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-left: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_add_cgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                       <tr>
                            <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Bank Details</th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border-right: 2px solid"></th>
                      </tr>

                          <tr>
                            <th colspan="6" class="text-left font-weight-600" style="border: 2px solid">Bank Name :  <input runat="server" type="text" id="bank_name"/> <br /> Bank A/C   : <input runat="server" type="text" id="bankAc_Id"/> </th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border-right: 2px solid; font-size:12px;" >Ceritified that the particulars given above are true and correct</th>
                      </tr>

                          <tr>
                            <th colspan="6" class="text-left font-weight-600" style="border: 2px solid">Bank IFSC :  <input runat="server" type="text" id="bankIFSC_id"/></th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" id="" class="text-center font-weight-600" style="border-right: 2px solid;"><label runat="server" id="lblCompName" style="vertical-align: text-top; text-emphasis-color:darkblue"></label><br /></th>
                      </tr>

                      <tr style="height:100px">
                            <th colspan="6" class="text-center font-weight-600" style="border: 2px solid; vertical-align: text-top;">Terms and Conditions 
                               <br /> <label runat="server" id="termcond_Id" class="termCond_class"></label>
                            </th>
                              <th colspan="3" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">Common Seal</th>
                              <th colspan="2" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">
                               <label runat="server" id="sign_Id" style="vertical-align: text-top;"></label><br />
                               Authorised signatory
                           </th>
                      </tr>
                      </tfoot>
                            
					</table>
	      </div>

                    <div>
                    <label id="lblRemark"><h6>Remarks : </h6></label>
                    <textarea id="txtremark" runat="server" class="form-control mt-15" rows="3" placeholder="Enter text Remark..."></textarea>
                
                    </div>
                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                  <td><select id="selectPayStatus" runat="server" class="form-control custom-select  mt-5 pay_Status" onchange="StatusChange(this)">
                                                <option selected="" value="Paid">Paid</option>
                                                <option value="Not Paid">Not Paid</option>
                                            </select> </td>
                                                
                    <td><select id="selectPayMode" class="form-control custom-select  mt-5 pay_mode" runat="server">
                                                <option selected="" value="Cash">Cash</option>
                                                <option value="cheque">Cheque</option>
                                                <option value="Online">Online</option>
                                            </select></td>
                                                
                    
                </tr>
                                            </tbody>
                        </table>
    
                </section>
            </div>
        </div>
        
        <!-- end row -->
    </div>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script language='javascript'>
       
    function select2_options() {
        var keys1 = '<%=json_display_content%>';
        var p_key_obj = JSON.parse(keys1);
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        var table_Object = "";
        table_Object += "<option onclick='' value='0'>--Select--</option>";

        p_json_obj.forEach(function (elementObject, index) {
            table_Object += "<option data-index='" + index + "' value='" + elementObject.account_party_name + "'>" + elementObject.account_party_name + "</option>";
        });

        $(".seller_name").html(table_Object);
       // $(".seller_name").select2();
        $(".bill_party_name").html(table_Object);
        //$(".bill_party_name").select2();
    }
    $('.seller_name').on('select2:select', function (e) {
        trclick($('option:selected',this).attr("data-index"),"seller_name");
    });

    $('.bill_party_name').on('select2:select', function (e) {
        trclick($('option:selected',this).attr("data-index"),"bill_party_name");
    });
    function changeGSTType(){
        // cgst to igst 
        $(".bill_state_code").html(Number($(".doc-code").html())+1);
            $(".bill_state_code").hide();
        
    }
    function trclick(id,name) {

        if(name == "bill_party_name"){
            var json_obj = '<%=json_obj %>';
            var p_json_obj = JSON.parse(json_obj);  
                $(".billParty_address").html(p_json_obj[id]['account_add_one']);
            $(".billParty_gstin").val(p_json_obj[id]['account_gst_number']);
            $(".bill_party_state").html(p_json_obj[id]['account_state']);
            if(p_json_obj[id]['account_state_code'] == "" || p_json_obj[id]['account_state_code'] == "0"){
                $(".bill_state_code").html($(".doc-code").html());
                $(".bill_state_code").hide();
            }else {
                $(".bill_state_code").html(p_json_obj[id]['account_state_code']);
            }
        } else if(name == "seller_name"){
            var json_obj = '<%=json_obj %>';
            var p_json_obj = JSON.parse(json_obj);        
         
            if(p_json_obj[id]['account_add_one'] != ""){
                $(".ship_Party_Address").html(p_json_obj[id]['account_add_one']);
            } else {
                $(".ship_Party_Address").html("");
            }
            
            $(".shipPartygstin").val(p_json_obj[id]['account_gst_number']);
            $(".ship_Party_state").html(p_json_obj[id]['account_state']);

            if(p_json_obj[id]['account_state_code'] == "" || p_json_obj[id]['account_state_code'] == "0"){
                $(".ship_Party_state_code").html($(".doc-code").html());
                $(".ship_Party_state_code").hide();
            }else {
                $(".ship_Party_state_code").html(p_json_obj[id]['account_state_code']);
            }
            
        }        
    }

    function select_options() {
            
        var jsonobj = '<%=json_purchase_sale_obj %>';
      var p_jsonobj = JSON.parse(jsonobj);
        var table_Object = "";
        table_Object += "<option onclick='' value='0'>--Select--</option>";

        p_jsonobj.forEach(function (elementObject, index) {
            table_Object += "<option value='" + elementObject.invoice_no + "'>" + elementObject.invoice_no + "</option>";
        });

      $(".against_invoice").html(table_Object);
        //$(".select2").select2();

    }
        function select1_options() {
            
            var jsonobj = '<%=json_obj_mst_series %>';
            if(jsonobj != ""){
                
                var p_jsonobj = JSON.parse(jsonobj);
                var table_Object = "";
                table_Object += "<option onclick='' value='0'>--Select--</option>";

                p_jsonobj.forEach(function (elementObject, index) {
                    table_Object += "<option value='" + index + "' "+ ((p_jsonobj[index]['count']== -1)?'selected':'') +" >" + p_jsonobj[index]['series_no'] + "</option>";
                });

                $(".dr_no_class").html(table_Object);
                //$(".select2").select2();
            }
    }



        var availableProductName = null;
        var prodcutObject = null;

    window.onload = function () {
        select2_options();

        
        select_options();
        select1_options();
            SETVALUE();
            updateval();
            settingsCheck();

            $("[id*=addValueinTable]").hide();
    }
        //edit setvalue
        function SETVALUE() {
            
            var jsonSettings = '<%=json_debit_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var agaInv = p_json_obj[0]['againstinvoice'];
            
            $(".against_invoice").val(agaInv).trigger('change');
            $(".bill_party_name").val(p_json_obj[0]['bill_party_name']).trigger('change');
            $(".seller_name").val(p_json_obj[0]['ship_party_name']).trigger('change');
        }
        var ser_id ="";
        function settingsCheck(){
            
            var jsonSettings = '<%=json_setting_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            for(var i = 0; i < count; i++){
                ser_id = p_json_obj[i]['prefix_generate_invoice_no'];
                if(p_json_obj[i]['batch_wise_details'] == "1"){
                    $("[id*=batch_tr_id]").show();
                    $('td:nth-child(5),th:nth-child(5)').show();
                   
                } else{
                    $("[id*=batch_tr_id]").hide();
                    $('td:nth-child(5),th:nth-child(5)').hide();
                    document.getElementById("foot_tot").colSpan = "4";
                    $("[id*=tot_Dis]").show();
                    $("[id*=tot_Taxval]").show();
                }

                if(p_json_obj[i]['expiry_monitoring_system'] == "1"){
                    $("[id*=expiry_tr_id]").show();
                    $('td:nth-child(6),th:nth-child(6)').show();
                   
                } else{
                    $("[id*=expiry_tr_id]").hide();
                    $('td:nth-child(6),th:nth-child(6)').hide();
                    document.getElementById("foot_tot").colSpan = "4";
                    $("[id*=tot_Dis]").show();
                    $("[id*=tot_Taxval]").show();
                }
                if(p_json_obj[i]['journal_accounting_entry'] == "1"){
                 
                    $(".chkJV_class").prop('checked',true);
                    // $(".chkJV_class").attr("disabled", true);
                } else {
                    $(".chkJV_class").prop('checked',false);
                    //$(".chkJV_class").attr("disabled", true);
                }

            }
        }

         function updateval(){
            
            jsonPurchase = '<%=json_dr_obj %>';
            var p_json_obj = JSON.parse(jsonPurchase);
            var count = JSON.parse(jsonPurchase).length;
            for(var i = 0; i < count; i++){
                
                $(".product-name").val(p_json_obj[i]['product_name']);
                $(".hsn-code").html(p_json_obj[i]['hsn_code']);
                $(".gst_rate").html(p_json_obj[i]['rate']);
                $(".lbluom").html(p_json_obj[i]['uom']);

                
                $(".amount").val(p_json_obj[i]['amount']);
                $(".txtqty").html(p_json_obj[i]['quantity']);
                $(".txtdisc").html(p_json_obj[i]['discount']);

                CalculateTotal();
                
                addproduct();
            
            }
            
        }

        function CalculateTotal(){
            
            var amount = $("[id*=txtAmount]").val();
            var qty =  $("[id*=txtQty]").val(); 
            var Total = (parseFloat(amount)*parseFloat(qty));
            if(Total){
                $(".total").text(Total);
            }else
            {
                $(".total").text(0);
            }
            
        }


        var tax_val = 0;
        var tot_quantity = 0;
        var tot_Amount = 0;
        var tot_Rate  = 0;
        var tot_Discount = 0;
        var tot_Tax_Val = 0;
        var tot_igst_amt = 0;
        var tot_cgst_amt = 0;
        var tot_sgst_amt = 0;
        var tot_amount_tax = 0;
        var tot_qty = 0;

        var i = 0;
        
        function addproduct() {
            
            if ($("[id*=txtproduct_name]").val() == ""){
                warning_message("Please Select Product...!!");
                return false;
            }else if($("[id*=txtAmount]").val() =="0"){
                warning_message("Please Enter Amount...!!");
                return false;
            }else if($("[id*=txtQty]").val() =="0"){
                warning_message("Please Enter Quantity...!!");
                return false;
            }
            //else if($(".bill_state_code").text() == "" || $(".docState").text() == ""){
            //    warning_message("Please Select State Code...!!");
            //    return false;
            //}
             
            else{
                
                

                var disc = $("[id*=txtdisc]").val();
                var original_val = $(".total").text();
                tax_val = (original_val - disc);
            

                var gstRate = $(".gst_rate").text();
                var gstVal = parseFloat(gstRate) / 2;
                
                var gst_amount = ((tax_val*gstVal)/100);

                var tot =  (tax_val+(gst_amount*2));

               
                var igstrate = "0";
                var igstAmt ="0";
                var cgstrate = "0";
                var cgstAmt = "0";
                var sgstrate = "0";
                var sgstAmt ="0";
                
                if($(".doc-code").text() == $(".bill_state_code").text())
                {
                    igstrate = "0";
                    igstAmt ="0";
                    cgstrate = gstVal;
                    cgstAmt = gst_amount
                    sgstrate = gstVal;
                    sgstAmt =gst_amount;

                }else {
                    igstrate = gstRate;
                    igstAmt = ((tax_val*gstRate)/100);
                    cgstrate = "0";
                    cgstAmt = "0";
                    sgstrate = "0";
                    sgstAmt ="0";

                }

                $('#myTable> tbody:last').append('<tr>'+
                  '<td style="border:1px solid!important;" class="product-discription">'+ (i + 1)  +'</td>'+ 
                  '<td style="border:1px solid!important;" class="product-discription">'+ $("[id*=txtproduct_name]").val()  +'</td>'+ 
                  '<td style="border:1px solid!important;" class="hsncode">'+ $(".hsn-code").text()+'</td>'+
                  '<td style="border:1px solid!important;" class="uom">'+ $(".lbluom").text()+'</td>'+
                  '<td style="border:1px solid!important;" class="batchClass">'+ $(".Batch_class").val()+'</td>'+
                  '<td style="border:1px solid!important;" class="expiryClass">'+ $(".Expiry_Date_class").val()+'</td>'+
                  '<td style="border:1px solid!important;" class="qty">'+ $("[id*=txtQty]").val()+'</td>'+
                  '<td style="border:1px solid!important;" class="rate">'+ $(".gst_rate").text()+'</td>'+
                  '<td style="border:1px solid!important;" class="amount">'+ $("[id*=txtAmount]").val() +'</td>' +
                  '<td style="border:1px solid!important;" class="discount">'+ $("[id*=txtdisc]").val() + '</td>'+
                  '<td style="border:1px solid!important;" class="tax-value">'+ tax_val + '</td>'+                    
                  '<td style="border:1px solid!important;" class="igst-rate">'+ igstrate+'%' +'</td>'+
                  '<td style="border:1px solid!important;" class="igst-amount">'+ igstAmt +'</td>' +               
                  '<td style="border:1px solid!important;" class="cgst-rate">'+ cgstrate+'%' +'</td>' +
                  '<td style="border:1px solid!important;" class="cgst-amount">'+ cgstAmt +'</td>' +
                  '<td style="border:1px solid!important;" class="sgst-amount">'+ sgstrate +'%'+'</td>'+
                  '<td style="border:1px solid!important;" class="tot_class">'+ sgstAmt +'</td>' +
                  '<td style="border:1px solid!important;" class="tot_class">'+ tot +'</td>' +
                  '<td  style="border:1px solid!important;"><i class="fa fa-close" name="record" style="font-size:30px;color:red" aria-hidden="true"  onclick="removeRow(this)"></i>'
                  + '</tr>'               
                      ); 
                
                i++;
                settingsCheck();
                if($(".doc-code").text() == $(".bill_state_code").text())
                {
                    $('td:nth-child(12),th:nth-child(12)').hide();
                    $('td:nth-child(13),th:nth-child(13)').hide();
                    $('td:nth-child(14),th:nth-child(14)').show();
                    $('td:nth-child(15),th:nth-child(15)').show();
                    $('td:nth-child(16),th:nth-child(16)').show();
                    $('td:nth-child(17),th:nth-child(17)').show();
                    $("#tot_Igst").hide();

                    tot_quantity = (parseFloat(tot_quantity) + parseFloat($("[id*=txtQty]").val()));
                    $("#tot_Quant").text(tot_quantity);
                    tot_Amount  =   (parseFloat(tot_Amount)  + parseFloat($("[id*=txtAmount]").val()));
                    $("#tot_Amt").text(tot_Amount);
                    //tot_Rate    =   (parseFloat(tot_Rate)  + parseFloat($(".gst_rate").text()));
                    //$("#tot_Rate").text(tot_Rate);
                    tot_Discount  =  (parseFloat(tot_Discount)  + parseFloat($("[id*=txtdisc]").val()));
                    $("#tot_Dis").text(tot_Discount);
                    tot_Tax_Val  =  (parseFloat(tot_Tax_Val)  + parseFloat(tax_val));
                    $("#tot_Taxval").text(tot_Tax_Val);
                    tot_cgst_amt   =   (tot_cgst_amt +cgstAmt);
                    $("#tot_Cgst").text(tot_cgst_amt);
                    tot_sgst_amt    =   (tot_sgst_amt + sgstAmt);
                    $("#tot_Sgst").text(tot_sgst_amt);
                    tot_amount_tax  =  (tot_amount_tax + tot);
                    $("#tot_Amt_tax").text(tot_amount_tax);    
                    $("#tot_invoice_tax").text(tot_Tax_Val);
                    $("#tot_add_igst").text(0);
                    $("#tot_add_cgst").text(tot_cgst_amt);
                    $("#tot_add_sgst").text(tot_sgst_amt);
                    $("#tot_amt_add_cgst").text(tot_amount_tax);


                }else{
                    $('td:nth-child(12),th:nth-child(12)').show();
                    $('td:nth-child(13),th:nth-child(13)').show();
                    $('td:nth-child(14),th:nth-child(14)').hide();
                    $('td:nth-child(15),th:nth-child(15)').hide();
                    $('td:nth-child(16),th:nth-child(16)').hide();
                    $('td:nth-child(17),th:nth-child(17)').hide();
                    $("#tot_Cgst").hide();
                    $("#tot_Sgst").hide();
                  
                    
                    tot_quantity = (parseFloat(tot_quantity) + parseFloat($("[id*=txtQty]").val()));
                    $("#tot_Quant").text(tot_quantity);
                    tot_Amount  =   (parseFloat(tot_Amount)  + parseFloat($("[id*=txtAmount]").val()));
                    $("#tot_Amt").text(tot_Amount);
                    //tot_Rate    =   (parseFloat(tot_Rate)  + parseFloat($(".gst_rate").text()));
                    //$("#tot_Rate").text(tot_Rate);
                    tot_Discount  =  (parseFloat(tot_Discount)  + parseFloat($("[id*=txtdisc]").val()));
                    $("#tot_Dis").text(tot_Discount);
                    tot_Tax_Val  =  (parseFloat(tot_Tax_Val)  + parseFloat(tax_val));
                    $("#tot_Taxval").text(tot_Tax_Val);
                    tot_igst_amt    =   (tot_igst_amt)  + (igstAmt);
                    $("#tot_Igst").text(tot_igst_amt);
                    tot_cgst_amt   =   (tot_cgst_amt + cgstAmt);
                    $("#tot_Cgst").text(tot_cgst_amt);
                    
                    tot_amount_tax  =  (parseFloat(tot_amount_tax) + parseFloat(tot));
                    $("#tot_Amt_tax").text(tot_amount_tax);    
                    $("#tot_invoice_tax").text(tot_Tax_Val);
                    $("#tot_add_igst").text(tot_igst_amt);
                    $("#tot_add_cgst").text(0);
                    $("#tot_add_sgst").text(0);
                    $("#tot_amt_add_cgst").text(tot_amount_tax);

                }

               
                $("[id*=txtproduct_name]").val("");
                $(".hsn-code").text("");
                $(".gst_rate").text("");
                $(".lbluom").text("");
                $("[id*=txtAmount]").val("0");
                $(".total").text("");
                $("[id*=txtQty]").val("1");
                $("[id*=txtdisc]").val("0");
            }
            
            $('[id*=sell_name').val($(".bill_party_name option:selected").text());
            $('[id*=sell_address').val($(".billParty_address").text());
            $('[id*=txtgstin').val($(".billParty_gstin").val());
            $('[id*=txt_sell_state').val($(".bill_party_state").text());
            $('[id*=txt_sell_state_code').val($(".bill_state_code").text());

            $('[id*=shipname').val($(".seller_name option:selected").text());
            $('[id*=shipaddr').val($(".ship_Party_Address").text());
            $('[id*=shipgstin').val($(".shipPartygstin").val());
            $('[id*=shipstate').val($(".ship_Party_state").text());
            $('[id*=shipcode').val($(".ship_Party_state_code").text());
        }


        function removeRow(row){
               //for delete product 
            $(row).parents("tr").remove();
           
            if($(".doc-code").text() == $(".bill_state_code").text())
            {
                $('td:nth-child(12),th:nth-child(12)').hide();
                $('td:nth-child(13),th:nth-child(13)').hide();
                $('td:nth-child(14),th:nth-child(14)').show();
                $('td:nth-child(15),th:nth-child(15)').show();
                $('td:nth-child(16),th:nth-child(16)').show();
                $('td:nth-child(17),th:nth-child(17)').show();
                $("#tot_Igst").hide();

                tot_quantity = (parseFloat(tot_quantity) + parseFloat($("[id*=txtQty]").val()));
                $("#tot_Quant").text(tot_quantity);
                tot_Amount  =   (parseFloat(tot_Amount)  + parseFloat($("[id*=txtAmount]").val()));
                $("#tot_Amt").text(tot_Amount);
                //tot_Rate    =   (parseFloat(tot_Rate)  + parseFloat($(".gst_rate").text()));
                //$("#tot_Rate").text(tot_Rate);
                tot_Discount  =  (parseFloat(tot_Discount)  + parseFloat($("[id*=txtdisc]").val()));
                $("#tot_Dis").text(tot_Discount);
                tot_Tax_Val  =  (parseFloat(tot_Tax_Val)  + parseFloat(tax_val));
                $("#tot_Taxval").text(tot_Tax_Val);
                tot_cgst_amt   =   (parseFloat(tot_cgst_amt)  + parseFloat(cgstAmt));
                $("#tot_Cgst").text(tot_cgst_amt);
                tot_sgst_amt    =   (parseFloat(tot_sgst_amt)  + parseFloat(sgstAmt));
                $("#tot_Sgst").text(tot_sgst_amt);
                tot_amount_tax  =  (parseFloat(tot_amount_tax) + parseFloat(tot));
                $("#tot_Amt_tax").text(tot_amount_tax);    
                $("#tot_invoice_tax").text(tot_Tax_Val);
                $("#tot_add_igst").text(0);
                $("#tot_add_cgst").text(tot_cgst_amt);
                $("#tot_add_sgst").text(tot_sgst_amt);
                $("#tot_amt_add_cgst").text(tot_amount_tax);


            }else{
                $('td:nth-child(12),th:nth-child(12)').show();
                $('td:nth-child(13),th:nth-child(13)').show();
                $('td:nth-child(14),th:nth-child(14)').show();
                $('td:nth-child(15),th:nth-child(15)').show();
                $('td:nth-child(16),th:nth-child(16)').hide();
                $('td:nth-child(17),th:nth-child(17)').hide();
                $("#tot_Cgst").hide();
                $("#tot_Sgst").hide();
                  

                tot_quantity = (parseFloat(tot_quantity) + parseFloat($("[id*=txtQty]").val()));
                $("#tot_Quant").text(tot_quantity);
                tot_Amount  =   (parseFloat(tot_Amount)  + parseFloat($("[id*=txtAmount]").val()));
                $("#tot_Amt").text(tot_Amount);
                //tot_Rate    =   (parseFloat(tot_Rate)  + parseFloat($(".gst_rate").text()));
                //$("#tot_Rate").text(tot_Rate);
                tot_Discount  =  (parseFloat(tot_Discount)  + parseFloat($("[id*=txtdisc]").val()));
                $("#tot_Dis").text(tot_Discount);
                tot_Tax_Val  =  (parseFloat(tot_Tax_Val)  + parseFloat(tax_val));
                $("#tot_Taxval").text(tot_Tax_Val);
                tot_igst_amt    =   (parseFloat(tot_igst_amt)  + parseFloat(igstAmt));
                $("#tot_Igst").text(tot_igst_amt);
                tot_cgst_amt   =   (parseFloat(tot_cgst_amt)  + parseFloat(cgstAmt));
                $("#tot_Cgst").text(tot_cgst_amt);
               
                tot_amount_tax  =  (parseFloat(tot_amount_tax) + parseFloat(tot));
                $("#tot_Amt_tax").text(tot_amount_tax);    
                $("#tot_invoice_tax").text(tot_Tax_Val);
                $("#tot_add_igst").text(tot_igst_amt);
                $("#tot_add_cgst").text(0);
                $("#tot_add_sgst").text(0);
                $("#tot_amt_add_cgst").text(tot_amount_tax);

            }
        }
 
        
    </script>
    </div>
    </form>
</body>
</html>
