<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalePrint.aspx.cs" Inherits="WebBillingSystem.SalePrint" %>

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
                <h1 class="hk-pg-title" style="text-align:center"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Sale/Tax Invoice</h1>
                <br />Company Name :- <b> <label id="lblcomp" runat="server"></label></b>
            </div>
        </div>
        <!-- /Title -->
        
        <!-- start row -->
        <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-50">
                    <div class="invoice-from-wrap">
                        <div class="row">
                            <div class="col-md-6 mb-20">
                                <%--                                       <img class="img-fluid invoice-brand-img d-block mb-20" src="" alt="company logo"> --%>
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Invoice NO : </td>
                                                <td colspan="2">
                                                    <label id="invoice_no" class="invoice-no" runat="server"></label>
                                                     <select runat="server" class="form-control select2 select2-hidden-accessible inv_no_class"  id="inv_no_id" name="inv_no_name" >
                                                    </select>
                                            </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Invoice Date  :</td>
                                                <td colspan="2">
                                                    <input type="date" runat="server" id="input_date" name="inputdate" class="form-control mt-5 input-date" style="width: 95%" onchange="dateChange(this)"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Reverse Charge (Y/N)  : </td>
                                                <td colspan="2">
                                                    <select class="form-control mt-5 reve_charge" name="reversecharge" id="reverse_charge" style="width: 95%" runat="server">
                                                        <option value="NO">NO</option>
                                                        <option value="YES">YES</option>
                                                    </select>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <br />
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
                                                <td colspan="2">Transport Mode: </td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="txtTransportMode" class="form-control mt-5 TransportMode_class" name="TransportMode_name" placeholder="Transport Mode" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Vehicle number: </td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="VehicleNumber_Id" class="form-control mt-5 VehicleNumber_class" name="VehicleNumber_name" placeholder="Vehicle Number" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Date of Supply:</td>
                                                <td colspan="2">
                                                    <input type="date" runat="server" id="DateOfSupply_Id" class="form-control mt-5 DateOfSupply_class" name="DateOfSupply_name" placeholder="Date Of Supply"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                 <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Place of Supply: </td>
                                                <td colspan="2">
                                                     <input type="text" runat="server" id="PlaceOfSupply_Id" class="form-control mt-5 PlaceOfSupply_class" name="PlaceOfSupply_name" />
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
                                            <th colspan="4">Bill to Party </th>
                                            
                                        </thead>  
                                        
                                        <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Name  :</td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" class="form-control mt-5 Bill_Party_Name_class" id="Bill_Party_Name_Id" name="Bill_Party_Name"/> 

                                                </td><td></td>
                                                <td>
                                                    <i class="glyphicon glyphicon-plus" onclick="window.location='/Master/AddAccount?redirect=sales';"></i>
                                                </td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Address </td>
                                                <td colspan="2">:
                                                    <label runat="server" style="width: 95%;" id="Bill_Party_address_id" name="Bill_Party_address_name" class="Bill_Party_address_class" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">GSTIN  :</td>
                                                <td colspan="2"> <input runat="server" type="text" id="Bill_Party_gstin_id" name="Bill_Party_gstin_name" onchange="bill_party_gstinChange()" class="form-control Bill_Party_gstin_class"/>
                                                    <%--<label runat="server" id="Bill_Party_gstin_id" name="Bill_Party_gstin_name" class="Bill_Party_gstin_class"></label>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" class="Bill_Party_state_class" id="Bill_Party_state_id" name="Bill_Party_state_name"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" class="Bill_Party_stateCode_class" id="Bill_Party_stateCode_Id" name="Bill_Party_stateCode_Name"></label>
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
                                        <thead style="text-align:center; border:groove;">
                                           <th colspan="1"> <%--<input type="checkbox" onclick=' if($(this).prop("checked")){$(".ship_party_class").val($(".Bill_Party_index").val()).change();trclick($(".Bill_Party_index").val());}'></th>--%>
                                            <th colspan="3" >Ship to Party</th>
                                            <%--<input type="checkbox" onclick=' if($(this).prop("checked")){$(".ship_party_class").val($(".Bill_Party_index").val()).change();trclick($(".Bill_Party_index").val());}'>--%>
                                        </thead>
                                        <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Name  </td>
                                                <td colspan="2">: 
                                                    <select runat="server" class="form-control select2 select2-hidden-accessible ship_party_class"  id="ship_party_id" name="ship_party_name" >
                                                    </select>
                                                </td>
                                                <td>
                                                    <i class="glyphicon glyphicon-plus" onclick="window.location='/Master/AddAccount?redirect=sales';"></i>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Address </td>
                                                <td colspan="2">:
                                                    <label runat="server" style="width: 95%;" id="ship_party_address_id" name="ship_party_address_name" class="ship_party_address_class" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">GSTIN  :</td>
                                                <td colspan="2"> 
                                                    <%--<label runat="server" id="ship_party_gstin_id" name="ship_party_gstin_name" class="ship_party_gstin_class"></label>--%>
                                                    <input runat="server" type="text" id="ship_party_gstin_id" name="ship_party_gstin_name" class="form-control  ship_party_gstin_class" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>State </td>
                                                <td colspan="2">:
                                                    <label runat="server" class="ship_party_state_class" id="ship_party_state_id" name="ship_party_state_name"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" class="ship_party_statecode_class" id="ship_party_statecode_id" name="ship_party_statecode_name"></label>
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
                                                <td colspan="2">Product Desc :</td>                                                
								                <td colspan="2" ><input type="text" runat="server" id="txtproduct_name" class="form-control product-name" name="product-name" placeholder="Product Desc" /></td>
									        </tr>
                                            <tr>
                                                <td colspan="4">
                                                <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">HSN Code :</td>
                                                <td colspan="2" >
                                                    <label runat="server" id="lblhsncode" name="hsncode" class="hsn-code"></label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">GST Rate :</td>
                                                <td colspan="2" > <label runat="server" class="gst_rate" id="lblgst_rate" name="lblgst_rate" value="0"></label>
                                                    
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Unit Of Measurement :</td>
                                                <td colspan="2"> 
                                                    <label runat="server" id="lbluom" name="lbluom" class="lbluom"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr id="batch_tr_id">
                                                <td colspan="2">Batch :</td>
                                                <td colspan="2">
                                                   <input runat="server" type="text" id="Batch_ID" class="form-control Batch_class" name="Batch_Name" placeholder="Add Batch" />
                                                </td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr id="expiry_tr_id">
                                                <td colspan="2">Expiry Date :</td>
                                                <td colspan="2"> 
                                                   <input runat="server" type="date" id="Expiry_Date_Id" class="form-control mt-5 Expiry_Date_class" name="Expiry_Date_Name" />
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
                                                <td colspan="2">Amount :</td>
                                                <td colspan="2"> <input type="text" runat="server" value="0" id="txtAmount" name="txtAmount" class="form-control amount" placeholder="Amount" onkeyup="CalculateTotal()"></td>
                                                <%--<td colspan="1"><input type="checkbox" id="chk_Reverse_Id" class="chk_Reverse_class">  Reverse</td>--%>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Quantity :</td>
                                                <td colspan="2"> <input type="text"  runat="server" value="1" id="txtQty" name="" class="form-control txtqty"  placeholder="Qty" onkeyup="CalculateTotal()"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr>
                                                <td colspan="2">Total Amount :</td>
                                                <td colspan="2">
                                                    <label id="lblTotal" name="lblTotal" class="total" runat="server" ></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Discount :</td>
                                                <td class="disc" colspan="2"> <input type="text" runat="server" id="txtdisc" name="discount" class="form-control txtdisc"  placeholder="Discount" value="0"></td>
                                            </tr>
                                           
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr>
                                            <td><input type="button" class="btn btn-primary" value="Add" onclick="addDetails()"></td>

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
						style="border: 1px solid; width: 100%;">
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
                          <th id="tot_Quant" colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Rate"colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Amt" colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Dis" colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Taxval" colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Igst" colspan="2" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Cgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Sgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid"></th>
                          <th id="tot_Amt_tax" colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                         <tr>
                            <th  colspan="11" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th  colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_tax" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                     <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_add_cgst" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>

                          <tr>
                            <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Bank Details</th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">GST on Reverse Charge</th>
                          <th id="" class="text-right font-weight-600" style="border: 2px solid">0</th>
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
                           <th colspan="5" id="" class="text-center font-weight-600" style="border-right: 2px solid;"><label runat="server" id="lblCompName" class="comp_name_class" style="vertical-align: text-top; text-emphasis-color:darkblue"></label><br /></th>
                      </tr>

                      <tr style="height:100px">
                            <th colspan="6" class="text-center font-weight-600" style="border: 2px solid; vertical-align: text-top;">Terms and Conditions 
                                <br /><label runat="server" id="termcond_Id" class="termCond_class"></label>
                            </th>
                              <th colspan="3" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">Common Seal</th>
                              <th colspan="2" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">
                               <label runat="server" class="sign_class" id="sign_Id" style="vertical-align: text-top;"></label><br />
                               Authorised signatory
                           </th>
                      </tr>


                      </tfoot>
                            
					</table>
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
                                                <option value="cheque">cheque</option>
                                                <option value="Online">Online</option>
                                                <option value="Online">Outstanding</option>
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
        //var keys1 = '<%=json_display_content%>';
        //var p_key_obj = JSON.parse(keys1);
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        var table_Object = "";
        table_Object += "<option onclick='' value='0'>Select Supplier</option>";

        p_json_obj.forEach(function (elementObject, index) {
            table_Object += "<option data-index='" + index + "' value='" + elementObject.account_party_name + "'>" + elementObject.account_party_name + "</option>";
        });
        $(".ship_party_class").html(table_Object);
        //$(".select2").select2();
    }

    $('.ship_party_class').on('select2:select', function (e) {
        trclick($('option:selected',this).attr("data-index"));
    });
        function trclick(id) {
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        
        $(".ship_party_address_class").html(p_json_obj[id]['account_add_one']);
        $(".ship_party_gstin_class").val(p_json_obj[id]['account_gst_number']);
        $(".ship_party_state_class").html(p_json_obj[id]['account_state']);
        if(p_json_obj[id]['account_state_code'] == "" || p_json_obj[id]['account_state_code'] == "0"){
            $(".ship_party_statecode_class").html($(".doc-code").html());
            $(".ship_party_statecode_class").hide();
        }else {
            $(".ship_party_statecode_class").html(p_json_obj[id]['account_state_code']);
        }     
        
    }
    
        function select_options() {
            
            var json_obj = '<%=json_obj_mst_series %>';
            if(json_obj != ""){
                var p_json_obj = JSON.parse(json_obj);
                var table_Object = "";
                table_Object += "<option onclick='' value='0'>--Select--</option>";

                p_json_obj.forEach(function (elementObject, index) {
                    table_Object += "<option value='" + index + "' "+ ((p_json_obj[index]['count']== -1)?'selected':'') +" >" + p_json_obj[index]['series_no'] + "</option>";
                });
                $(".inv_no_class").html(table_Object);
                //$(".select2").select2();
               
            }
        }
   
        var availableProductName = null;
        var prodcutObject = null;
        

        window.onload = function () {
            select2_options();
            select_options();
            SETVALUE();
            updateval();
            settingsCheck();
            
            $("[id*=addValueinTable]").hide();
        }
        function SETVALUE() {
            
            var jsonSettings = '<%=json_sale_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
           
            $(".ship_party_class").val(p_json_obj[0]['ship_party_id']).trigger('change');
           
        }
        
         var ser_id ="";
        function settingsCheck(){
            
            var jsonSettings = '<%=json_setting_obj %>';
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

                if(p_json_obj[i]['expiry_monitoring_system'] == "1") {
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

        var ser_id ="";
        function settingsCheck(){
            
            var jsonSettings = '<%=json_setting_obj %>';
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

                if(p_json_obj[i]['expiry_monitoring_system'] == "1") {
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
        function dateChange(){
            
            $(".DateOfSupply_class").val($(".input-date").val());
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
        //Add Column One by One
        function addproduct() {
            if($("[id*=txtproduct_name]").val() == "" || $("[id*=txtproduct_name]").val() == null){
                warning_message("Please Select Product...!!");
                return false;
            }else if($("[id*=txtAmount]").val() =="0" || $("[id*=txtAmount]").val() == null || $("[id*=txtAmount]").val() == ""){
                warning_message("Please Enter Amount...!!");
                return false;
            }else if($("[id*=txtQty]").val() =="0" || $("[id*=txtQty]").val() == null || $("[id*=txtQty]").val() ==""){
                warning_message("Please Enter Quantity...!!");
                return false;
            }
                //else if($(".state-code").text() == "" || $(".Bill_Party_stateCode_class").text() == ""){
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
                
                if($(".state-code").text() == $(".Bill_Party_stateCode_class").text())
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
                //if($("#chk_Reverse_Id").prop("checked") == "true"){
                

                //} else {

                //}

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
                if($(".state-code").text() == $(".Bill_Party_stateCode_class").text())
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
            
            $('[id*=billname').val($(".Bill_Party_Name_class").val());
            $('[id*=billaddr').val($(".Bill_Party_address_class").text());
            $('[id*=billgstin').val($(".Bill_Party_gstin_class").val());
            $('[id*=billstate').val($(".Bill_Party_state_class").text());
            $('[id*=billcode').val($(".Bill_Party_stateCode_class").text());

            $('[id*=sell_name').val($(".ship_party_class option:selected").text());
            $('[id*=sell_address').val($(".ship_party_address_class").text());
            $('[id*=txtgstin').val($(".ship_party_gstin_class").val());
            $('[id*=txt_sell_state').val($(".ship_party_state_class").text());
            $('[id*=txt_sell_state_code').val($(".ship_party_statecode_class").text());
            
        }

        function CalculateTotal() {

            var amount = $("[id*=txtAmount]").val();
            var qty = $("[id*=txtQty]").val();
            var Total = (parseFloat(amount) * parseFloat(qty));
            if (Total) {
                $(".total").text(Total);
            } else {
                $(".total").text(0);
            }
        }

    </script>
    </div>
    </form>
</body>
</html>