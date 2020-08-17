<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testPrint.aspx.cs" Inherits="WebBillingSystem.testPrint" %>

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
 <nav class="hk-breadcrumb" aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-light bg-transparent" style="list-style-type:none">
            <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title"></li>
        </ol>
    </nav>
    <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h1 class="hk-pg-title" style="text-align:center"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Stock Purchase</h1>
            </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
         <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35">
                    <div class="invoice-from-wrap">
                        <div class="row">
                            <div class="col-md-6 mb-20">
                                 <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Invoice NO  : </td>
                                                <td colspan="2" ><input runat="server" type="text" id="invoice_no" class="form-control invoice-no" placeholder="Invoice No" /></td>                                                
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Invoice Date  :</td>
                                                <td colspan="2">
                                                    <input type="date" runat="server" id="input_date" name="inputdate" class="form-control input-date" style="width: 95%" />
                                                
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Reverse Charge (Y/N)  :</td>
                                                <td colspan="2" class="">
                                                    <select class="form-control reve_charge" name="reversecharge" id="reverse_charge" style="width: 95% " runat="server">
                                                        <option value="NO">NO</option>
                                                        <option value="YES">YES</option>
                                                    </select>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" id="state_name" name="statename" class="state-class"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" id="state_code" name="statecode" class="state-code"></label>
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
                                                <td colspan="1" style="width: 25%;">Supplier Name </td>
                                                <td colspan="3">: <%--<label id="seller_name" class="" runat="server"></label>--%>
                                                    <select runat="server" class="form-control select2 select2-hidden-accessible seller_name"   id="sellername" name="seller_name" >
                                                    </select>
                                                </td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="window.location='/Master/AddAccount?redirect=purchase';"></i></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">Address </td>
                                                <td colspan="3">:
                                                    <label runat="server" style="width: 95%;" id="selleraddress" name="seller-address" class="seller_address" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">GSTIN   :</td>
                                                <td colspan="3">
                                                    <input runat="server" type="text" id="gst_in" name="gstin_name" class="form-control gstin" />
                                                    <%--<label runat="server" id="gst_in" name="gstin" class="gstin"></label>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" class="seller_state" id="sellerstate" name="sellstate"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" class="seller_state_code" id="sellerstate_code" name="sellerstate_code"></label>
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
                    
                    <div class="invoice-from-wrap" id="addValueinTable">
                        <div class="row">
                             <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Product Desc  :</td>                                                
								                <td colspan="2" ><input runat="server" type="text" id="txtproduct_name" class="product-name form-control" name="product-name" placeholder="Product Desc" /></td>
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
                                                <td colspan="2">:
                                                    <label runat="server" id="lbluom" name="lbluom" class="lbluom"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                            <tr id="batch_tr_id">
                                                <td colspan="2">Batch </td>
                                                <td colspan="2">:
                                                   <input runat="server" type="text" id="Batch_ID" class="Batch_class form-control" name="Batch_Name" placeholder="Add Batch" />
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
                                                <td>Amount   :</td>
                                                <td class="txtamount">  <input type="text" value="0" id="txtAmount" name="txtAmount" class="amount form-control" placeholder="Amount" onkeyup="CalculateTotal(this)" runat="server"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>Quantity</td>
                                                <td> : <input runat="server" type="text" value="1" id="txtQty" name="" class="txtqty form-control"  placeholder="Qty" onkeyup="CalculateTotal(this);"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr>
                                                <td colspan="1">Total Amount </td>
                                                <td colspan="3">:
                                                    <label id="lblTotal" name="lblTotal" class="total" runat="server" value="0"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>Discount   :</td>
                                                <td class="disc"> <input runat="server" type="text" id="txtdisc" name="discount" class="txtdisc form-control"  placeholder="Discount" value="0"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr id="expiry_tr_id">
                                                <td colspan="1">Expiry Date </td>
                                                <td colspan="3">:
                                                   <input runat="server" type="date" id="Expiry_Date_Id" class="Expiry_Date_class form-control" name="Expiry_Date_Name" style="width: 55%"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                            <tr>
                                            <td><input type="button" class="btn btn-primary" value="Add" onclick="addproduct()"></td>

                                                </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                    </div>


				<!-- #Product Add -->
             
                    <%--<div class="row">--%>
                    <div class="table-wrap mb-20">
                        <div class="table-responsive">
                  <table class="table table-light table-bordered mb-0" id="myTable" style="border: 1px solid; width: 100%;">
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
                            <th style="border: 2px solid;">MRP PER UNIT</th>
                            <th style="border: 2px solid;">Sale Price PER UNIT</th>
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
                            <th  colspan="9" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th  colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_tax" class="text-right font-weight-600" style="border: 2px solid"></th>
                            
                      </tr>
                     <tr>
                            <th colspan="9" class="text-center font-weight-600" ></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" class="text-right font-weight-600" style="border: 2px solid"></th>
                            
                      </tr>
                      <tr>
                            <th colspan="9" class="text-center font-weight-600"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                           
                      </tr>
                      <tr>
                            <th colspan="9" class="text-center font-weight-600"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                           
                      </tr>
                          <tr>
                            <th colspan="9" class="text-center font-weight-600"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_add_atr_tax" class="text-right font-weight-600" style="border: 2px solid"></th>
                           
                      </tr>

                      </tfoot>                            
					</table>
	      </div>
                        </div>
                    <div style="position:absolute">
                    <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
                    <input type="text" runat="server" id="sell_name" style="visibility:hidden" class="sellname" runat="server" />
                    <input type="text" id="sell_address" style="visibility:hidden" class="selladdress" runat="server" />
                    <input type="text" id="txtgstin" style="visibility:hidden"  class="txt_gstin" runat="server" />
                    <input type="text" id="txt_sell_state" style="visibility:hidden" class="txt_sellstate" runat="server" />
                    <input type="text" id="txt_sell_state_code" style="visibility:hidden" class="txt_sellstatecode" runat="server" />

                    <input type="text" name="total_cost" style="visibility:hidden" ID="total_cost" class="totalcost" runat="server" />
                    <input type="text" name="total_gst" style="visibility:hidden" ID="total_gst" class="totalgst" runat="server" />
                    <input type="text" name="total_igst" style="visibility:hidden" ID="total_igst" class="totaligst" runat="server" />
                    <input type="text" name="total_cgst" style="visibility:hidden" ID="total_cgst" class="totalcgst" runat="server" />
                    <input type="text" name="total_sgst" style="visibility:hidden" ID="total_sgst" class="totalsgst" runat="server" />
                    <input type="text" name="total_discount" style="visibility:hidden" ID="total_discount" class="totaldiscount" runat="server" />
                    <input type="text" name="payment_mode" style="visibility:hidden" ID="payment_mode" class="paymentmode" runat="server" />
                    <input type="text" name="payment_status" style="visibility:hidden" ID="payment_status" class="paymentstatus" runat="server" />
                   <input type="text" name="invoice_type" style="visibility:hidden" ID="invoice_type" class="invoicetype" runat="server" />
                    <input type="text" name="total_total_amt" style="visibility:hidden" ID="total_total_amt" class="total_totalamt" runat="server" />
                        </div>
                    
                    <div>
                        <label><b>JV :  </b></label>
                        <input type="checkbox" runat="server" id="chkJV_id" class="chkJV_class" readonly />
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
    <script language='javascript'>
       
        //Bind Supplier DDL
    function select2_options() {
        var keys1 = '<%=json_display_content%>';
        var p_key_obj = JSON.parse(keys1);
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        var table_Object = "";
        table_Object += "<option onclick='' value='0'>Select Supplier</option>";

        p_json_obj.forEach(function (elementObject, index) {
            table_Object += "<option data-index='" + index + "' value='" + elementObject.account_party_name + "'>" + elementObject.account_party_name + "</option>";
        });
        $(".seller_name").html(table_Object);
        $(".select2").select2();
    }
        //Supplier select2 action
    $('.seller_name').on('select2:select', function (e) {
        trclick($('option:selected',this).attr("data-index"));
    });

        // Set Value Supplier Onchange
    function trclick(id) {
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        
        $(".seller_address").html(p_json_obj[id]['account_add_on']);
        $(".gstin").val(p_json_obj[id]['account_gst_number']);
        if(p_json_obj[id]['account_state_code'] == "" || p_json_obj[id]['account_state_code'] == "0"){
            $(".seller_state_code").html($(".doc-code").html());
            $(".seller_state_code").hide();
        }else {
            $(".seller_state_code").html(p_json_obj[id]['account_state_code']);
        }
        
        
        $(".seller_state").html(p_json_obj[id]['account_state']);
        
        }
        

        var availableProductName = null;
        var prodcutObject = null;
// page Load
     window.onload = function () {
            
            select2_options();
            SETVALUE();
            updateval();
        
            settingsCheck();

       }

   // Setvalue Select tag action only update
       function SETVALUE() {
            
            var jsonSettings = '<%=json_pur_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
           
            $(".seller_name").val(p_json_obj[0]['sellername']).trigger('change');
            $("[id*=addValueinTable]").hide();
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
        var mrp_per_unit =  0;        
        var mrp_sell_price = 0;

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
            else{
                
                

                var disc = $("[id*=txtdisc]").val();
                var original_val = $(".total").text();
                tax_val = (original_val - disc);
            

                var gstRate = $(".gst_rate").text();
                var gstVal = parseFloat(gstRate) / 2;
                
                var gst_amount = ((tax_val*gstVal)/100);

                var tot =  (tax_val+(gst_amount*2));

                // mrp_per_unit =  (tot/$("[id*=txtQty]").val());                
                // mrp_sell_price = (tax_val/$("[id*=txtQty]").val());


                var igstrate = "0";
                var igstAmt ="0";
                var cgstrate = "0";
                var cgstAmt = "0";
                var sgstrate = "0";
                var sgstAmt ="0";
                
                if($(".state-code").text() == $(".seller_state_code").text())
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
                  '<td style="border:1px solid!important;" class="mrp-per-unit">' + mrp_per_unit + '</td>' +
                  '<td style="border:1px solid!important;" class="sale-price-per-unit">'+ mrp_sell_price +'</td>' +
                  '<td  style="border:1px solid!important;"><i class="fa fa-close" name="record" style="font-size:30px;color:red" aria-hidden="true"  onclick="removeRow(this)"></i>'
                  + '</tr>'               
                      ); 
                
                i++;
                settingsCheck();
                if($(".state-code").text() == $(".seller_state_code").text())
                {
                    $('td:nth-child(12),th:nth-child(12)').hide();
                    $('td:nth-child(13),th:nth-child(13)').hide();
                    $('td:nth-child(14),th:nth-child(14)').show();
                    $('td:nth-child(15),th:nth-child(15)').show();
                    $('td:nth-child(16),th:nth-child(16)').show();
                    $('td:nth-child(17),th:nth-child(17)').show();
                    $("#tot_Igst").hide();
                    document.getElementById("tot_Igst").colSpan = "0"; 

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
                    document.getElementById("tot_Cgst").colSpan = "0"; 
                    document.getElementById("tot_Sgst").colSpan = "0"; 
                    
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
            
            $('[id*=sell_name').val($(".seller_name option:selected").text());
            $('[id*=sell_address').val($(".seller_address").text());
            $('[id*=txtgstin').val($(".gstin").val());
            $('[id*=txt_sell_state').val($(".seller_state").text());
            $('[id*=txt_sell_state_code').val($(".seller_state_code").text());
            
        }

        function updateval(){
            
            jsonPurchase = '<%=json_purchase_obj %>';
            var p_json_obj = JSON.parse(jsonPurchase);
            var count = JSON.parse(jsonPurchase).length;
            for(var i = 0; i < count; i++){
                
                $(".product-name").val(p_json_obj[i]['product_desc']);
                $(".hsn-code").html(p_json_obj[i]['hsn_code']);
                $(".gst_rate").html(p_json_obj[i]['rate']);
                $(".lbluom").html(p_json_obj[i]['uom']);

                
                $(".amount").val(p_json_obj[i]['amount']);
                $(".txtqty").html(p_json_obj[i]['qty']);
                //$(".total").html(p_json_obj[i]['total']);
                $(".txtdisc").html(p_json_obj[i]['discount']);

                CalculateTotal();
                
                addproduct();
            
            }
            
        }
      //  var jsonSettings = null;
        function settingsCheck(){
            
            var jsonSettings = '<%=json_setting_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            for(var i = 0; i < count; i++){
               
                if(p_json_obj[i]['batch_wise_details'] == "1"){
                    $("[id*=batch_tr_id]").show();
                    $('td:nth-child(5),th:nth-child(5)').show();
                    $(".Batch_class").val(p_json_obj[i]['batch_wise_details_info']);
                } else{
                    $("[id*=batch_tr_id]").hide();
                    $('td:nth-child(5),th:nth-child(5)').hide();
                    $(".Batch_class").val(p_json_obj[i]['batch_wise_details_info']);
                    document.getElementById("foot_tot").colSpan = "4";
                    $("[id*=tot_Dis]").show();
                    $("[id*=tot_Taxval]").show();
                }

                if(p_json_obj[i]['expiry_monitoring_system'] == "1"){
                    $("[id*=expiry_tr_id]").show();
                    $('td:nth-child(6),th:nth-child(6)').show();
                    $(".Expiry_Date_class").val(p_json_obj[i]['expiry_monitoring_system_info']);
                } else{
                    $("[id*=expiry_tr_id]").hide();
                    $('td:nth-child(6),th:nth-child(6)').hide();
                    $(".Expiry_Date_class").val(p_json_obj[i]['expiry_monitoring_system_info']);
                    document.getElementById("foot_tot").colSpan = "4";
                    $("[id*=tot_Dis]").show();
                    $("[id*=tot_Taxval]").show();
                }
               
                if(p_json_obj[i]['mrp_details'] == "1"){
                    $('td:nth-child(19),th:nth-child(19)').show();
                    mrp_per_unit =  p_json_obj[i]['mrp_invoice_details'];
                    
                } else{
                    $('td:nth-child(19),th:nth-child(19)').hide();
                    mrp_per_unit = p_json_obj[i]['mrp_invoice_details'];
                }

                if(p_json_obj[i]['sale_price_details'] == "1"){
                    $('td:nth-child(20),th:nth-child(20)').show();
                    mrp_sell_price = p_json_obj[i]['sale_price_details_info']
                } else{
                    $('td:nth-child(20),th:nth-child(20)').hide();
                    mrp_sell_price =p_json_obj[i]['sale_price_details_info']
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

    </script>
    </div>
    </form>
</body>
</html>
