<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="SaleInvoice.aspx.cs" Inherits="WebBillingSystem.SaleInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .select2-container {
            width: 96% !important;
        }

        .table td, .table th {
            padding: .1rem !important;
        }
    </style>

    <!-- Breadcrumb -->
    <nav class="hk-breadcrumb" aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-light bg-transparent">
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Invoice</li>
        </ol>
    </nav>
    <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Sale/Tax Invoice</h4>
               <br /><br />Company Name :- <b> <label id="lblcomp" runat="server"></label></b>
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
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Invoice No : </td>
                                                <td colspan="2">
                                                    <label id="invoice_no" class="invoice-no" runat="server" style="display:none"></label>
                                                     <select runat="server" class="form-control select2 inv_no_class"  id="inv_no_id" name="inv_no_name" >
                                                    </select>
                                            </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Invoice IRN No : </td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="Invoice_IRN_No_id" class="form-control mt-5 Invoice_IRN_No_class" placeholder="Enter Invoice IRN No" />
                                            </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Invoice Type: </td>
                                                <td colspan="2">
                                                 <select class="form-control Invoice_type_class"  runat="server" id="Invoice_type_id" >
                                                    <option value="Regular">Regular</option>
													<option value="SEZ Supplies With Payment">SEZ Supplies With Payment</option>
													<option value="SEZ Supplies Without Payment">SEZ Supplies Without Payment</option>
													<option value="Deemed Exp">Deemed Exp</option>
													<option value="Sale from Bonded WH">Sale from Bonded WH</option>
													<option value="WOPAY">WOPAY</option>
													<option value="WPAY">WPAY</option>
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
                                                    <input type="date" runat="server" id="input_date" name="inputdate" class="form-control mt-5 input-date" onchange="dateChange(this)"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Reverse Charge (Y/N)  : </td>
                                                <td colspan="2">
                                                    <select class="form-control mt-5 reve_charge" name="reversecharge" id="reverse_charge" runat="server">
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
                                            <tr style="display:none;">
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" id="state_name" name="statename" class="state-class"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" id="state_code" name="statecode" class="state-code"></label>
                                                </td>
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
                                            <th colspan="4" style="border-right: groove;">Bill to Party </th>
                                            
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
                                                <td><i class="glyphicon glyphicon-plus" onclick="AccountBtnOnClick()"></i></td>
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
                                                <td colspan="2"> <input runat="server" type="text" id="Bill_Party_gstin_id" name="Bill_Party_gstin_name" class="form-control Bill_Party_gstin_class"/>
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
                                                    <label runat="server" class="Bill_Party_stateCode_class" id="Bill_Party_stateCode_Id" name="Bill_Party_stateCode_Name" style="display: contents;"></label>
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
                                           <th colspan="1"> <input type="checkbox" onclick=' if($(this).prop("checked")){ $(".ship_party_class").val($(".Bill_Party_Name_class").val()).change();trclick($(".Bill_Party_index").val());}'></th>
                                            <th colspan="3" style="border-right: groove;">Ship to Party</th>
                                            <%--<input type="checkbox" onclick=' if($(this).prop("checked")){$(".ship_party_class").val($(".Bill_Party_index").val()).change();trclick($(".Bill_Party_index").val());}'>--%>
                                        </thead>
                                        <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Name  </td>
                                                <td colspan="2" style="max-width: 10px;">: 
                                                    <select runat="server" class="form-control select2 ship_party_class"  id="ship_party_id" name="ship_party_name"></select>
                                                </td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="AccountBtnOnClick()"></i></td>
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

                    <div class="invoice-from-wrap">
                        <div class="row">
                             <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Product Desc :</td>                                                
								                <td colspan="2" ><input type="text" runat="server" id="txtproduct_name" class="form-control product-name" name="product-name" placeholder="Product Desc"/></td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="StockBtnOnClick()"></i></td>
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
                                                    <select runat="server" id="Batch_ID" class="form-control select2 Batch_class" onselect="expiDate_details">
                                                        <option value="0">SELECT...</option>
                                                    </select>
                                                   <%--<input runat="server" type="text" id="Batch_ID" class="form-control Batch_class" name="Batch_Name" placeholder="Add Batch" />--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                            </tr>
                                            <tr style="color:blue; font-size:10px;"><td colspan="2"></td><td style="text-align:center;" >Balance Quantity :</td><td class="tot_batch_qty_tr_class"><label runat="server" style="color:blue;" class="lbl_batch_qty_class" id="lbl_batch_qty_id"></label></td></tr>

                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr id="expiry_tr_id">
                                                <td colspan="2">Expiry Date :</td>
                                                <td colspan="2"> 
                                                   <input runat="server" type="date" id="Expiry_Date_Id" class="form-control mt-5 Expiry_Date_class" name="Expiry_Date_Name"/>
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
                                                <td colspan="1"><input type="checkbox" id="chk_Reverse_Id" class="chk_Reverse_class"></td><td>  Reverse</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr style="color:blue; font-size:10px;"><td style="text-align:center;" class="mrp_tr_class">MRP :</td><td class="mrp_tr_class"><label runat="server" style="color:blue;" class="lbl_mrp_class" id="lbl_mrp_id"></label></td> <td style="text-align:center;"  class="sale_price_tr_class">Sale Price : </td><td  class="sale_price_tr_class"><label runat="server" style="color:blue" class="lbl_sale_price_class" id="lbl_sale_price_id"></label></td> </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr><td colspan="2"></td><td colspan="2"><select class="form-control custom-select d-block w-100 unit_of_measure_class" runat="server" id="inv_unit_measurement"></select></td></tr>
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
                                                    <label id="lblTotal" name="lblTotal" class="total" runat="server">0</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Discount :</td>
                                                <td class="disc" colspan="2"> <input type="text" runat="server" id="txtdisc" name="discount" class="form-control txtdisc"  placeholder="Discount" value="0" onchange="checkgst()"></td>
                                            </tr>
                                           
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                             <tr class="tr_gst_Id">
                                                <td colspan="2"><input type="checkbox" class="chkigst_class" id="chkigst_Id" onclick="chkigstcheck()"/><label>IGST  </label>&nbsp;<input type="checkbox" id="chkcgst_Id" class="chkcgst_class" onclick="chkcgstcheck()"/><label>CGST/SGST  </label></td>
                                                <td colspan="2"><input type="text" class="form-control txtIgst_class" id="txtIgst" value="0" placeholder="Igst amount"/><input type="text" class="form-control txtCgst_class" id="txtCgst" value="0" placeholder="Cgst amount"/><input type="text" id="txtSgst" value="0" class="form-control txtSgst_class" placeholder="Sgst amount"/></td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                            <td><input type="button" class="btn btn-primary" value="Add" onclick="addDetails()" data-toggle="tooltip-dark" data-placement="top" title="Add Record in Table"></td>

                                                </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                    </div>


				<!-- #Product Add -->
                <div class="row">
                  <table class="table table-light table-bordered mb-0 table-responsive" id="myTable"
						style="border: 1px solid; width: 100%;">
                    <%--<table id="myTable" class="table table-hover table-bordered mb-0" style="font: initial;">--%>
                        <thead class="thead-light">
						<tr>
                            <th style="border: 2px solid;"> Sr. No.</th>
							<th style="border: 2px solid;"> Product Description</th>
							<th style="border: 2px solid;"> HSN code</th>
							<th style="border: 2px solid;"> Unit Of Measurement</th>
							<th style="border: 2px solid;"> Batch</th>
                            <th style="border: 2px solid;"> Expiry Date</th>
							<th style="border: 2px solid;"> Qty</th>
							<th style="border: 2px solid;  display:none;">Rate</th>
							<th style="border: 2px solid;"> Amount</th>
							<th style="border: 2px solid;"> Discount</th>
							<th style="border: 2px solid;"> Taxable Value</th>
                            <th style="border: 2px solid;"> IGST Rate</th>
                            <th style="border: 2px solid;"> IGST Amount</th>
                            <th style="border: 2px solid;"> CGST Rate</th>
                            <th style="border: 2px solid;"> CGST Amount</th>
                            <th style="border: 2px solid;"> SGST Rate</th>
                            <th style="border: 2px solid;"> SGST Amount</th>
                            <th style="border: 2px solid;"> TOTAL</th>
                            <th style="border: 2px solid;"> Action</th>
						</tr>
                            </thead>
						<tbody id="item-holder-tbody" style="border: 1px solid;">

						</tbody>
                      <tfoot class="border: 1px solid;">
                      <tr>
                          <th colspan="6" id="foot_tot" class="text-center font-weight-600" style="border: 2px solid"><b>total</b></th>
                          <th id="tot_Quant" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Rate" colspan="1" class="text-right font-weight-600" style="border: 2px solid; display:none;">0</th>
                          <th id="tot_Amt" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Dis" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Taxval" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Igst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Cgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Sgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Amt_tax" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>
                         <tr>
                            <th  colspan="11" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th  colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_tax" class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>
                     <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>
                      <tr>
                            <th colspan="11" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_add_cgst" class="text-right font-weight-600" style="border: 2px solid">0</th>
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
                           <th colspan="5" id="" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
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
                        <input type="checkbox" runat="server" id="chkJV_id" class="chkJV_class" onclick="return false;" />
                    </div>


                    <div>
                    <label id="lblRemark"><h6>Remarks : </h6></label>
                    <textarea id="txtremark" runat="server" class="form-control mt-15 txt_remark_class" rows="3" placeholder="Enter text Remark..."></textarea>
                
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
        <div class="row">
          <div class="col-sm">
              <!-- Button trigger modal -->
              <button type="button" id="btnVerCentMod" class="btn btn-primary example-modal-center" onclick="btnClick(this);" title="Save Sale Invoice">Save </button>
              <asp:Button runat="server" class="btn btn-info" id="btnPrint" text="Print" OnClick="btnPrintClick" data-toggle="tooltip-dark" data-placement="top" title="Print Data Sale"/>
              <input type="button" class="btn btn-warning" id="btnReset" value="Reset" onclick="ResetChange();" data-toggle="tooltip-dark" data-placement="top" title="Clear all Form"/>
              <%--<asp:Button runat="server" class="btn btn-warning" id="btnReset" text="Reset" OnClick="javascript: return ResetChange(this);"/>--%>
              <asp:Button runat="server" class="btn btn-danger" id="btnCancel" text="Cancel" OnClick="cancel_event" data-toggle="tooltip-dark" data-placement="top" title="leave Page"/>
              <!-- Modal -->
              <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title">Add Sale Invoice</h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip-dark" data-placement="top" title="Close">
                           <span aria-hidden="true">×</span>
                       </button>
                   </div>
                   <div class="modal-body pareches-invoice-model">
                       <p id="para_Header_Id">Do you want to Submit? </p>
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary btn_No_Class" style="display:none;" onclick="window.location.href = '/Vouchers/SaleDetails.aspx';">NO</button>
                       <button type="button" class="btn btn-primary btn_Yes_Class" id="btn_Yes_Id" style="display:none;" onclick="yesClick(this)">YES</button>
                       <%--<asp:Button runat="server" class="btn btn-primary btn_Yes_Class" type="submit" id="btn_Yes_Id" OnClick="yesClick(this)" text="YES" style="display:none;"/>--%>
                       <button type="button" class="btn btn-secondary btn_Close_Class" data-dismiss="modal">Close</button>
                       <asp:Button runat="server" class="btn btn-primary btn_Submit_Class" type="submit" id="submit_sale_details" text="Save Changes" OnClick="submit_sale_details_event" data-toggle="tooltip-dark" data-placement="top" title="Save Data"/>
                       
                   </div>
               </div>
           </div>
         </div>
                           
              <div class="modal fade" id="exampleModalCenterAutocomplete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterAutocomplete" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title"></h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip-dark" data-placement="top" title="Close">
                           <span aria-hidden="true">×</span>
                       </button>
                   </div>
                   <div class="modal-body pareches-invoice-model">
                       <p id="parag_Header_Id"></p>
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary btn_AddAcc_No_Class" data-dismiss="modal" onclick="$('.Bill_Party_Name_class').val(''); ">NO</button>
                       <button type="button" class="btn btn-primary btn_AddAcc_Yes_Class" id="btn_AddAcc_Yes_Id" onclick="AccountBtnOnClick()">YES</button> 
                       <button type="button" class="btn btn-secondary btn_AddStock_No_Class" data-dismiss="modal" onclick="$('.product-name').val(''); ">NO</button>
                       <button type="button" class="btn btn-primary btn_AddStock_Yes_Class" id="btn_AddStock_Yes_Id" onclick="StockBtnOnClick()">YES</button>                                              
                   </div>
               </div>
           </div>
         </div>
       </div>
    </div>
        
       <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
       <input type="text" style="visibility:hidden" ID="txthdnJsonAccount_id" class="txthdnJsonAccount_class" runat="server" />
       <input type="text" id="sell_name" style="visibility:hidden" class="sellname" runat="server" />
       <input type="text" id="sell_address" style="visibility:hidden" class="selladdress" runat="server" />
       <input type="text" id="txtgstin" style="visibility:hidden"  class="txt_gstin" runat="server" />
       <input type="text" id="txt_sell_state" style="visibility:hidden" class="txt_sellstate" runat="server" />
       <input type="text" id="txt_sell_state_code" style="visibility:hidden" class="txt_sellstatecode" runat="server" />
       <input type="text" id="series_id" style="visibility:hidden" class="series_class" runat="server" />
       <input type="text" id="hdn_invoice_id" style="visibility:hidden" class="hdn_invoice_class" runat="server" />
       <input type="text" id="billname" style="visibility:hidden" class="sellname" runat="server" />
       <input type="text" id="billaddr" style="visibility:hidden" class="selladdress" runat="server" />
       <input type="text" id="billgstin" style="visibility:hidden"  class="txt_gstin" runat="server" />
       <input type="text" id="billstate" style="visibility:hidden" class="txt_sellstate" runat="server" />
       <input type="text" id="billcode" style="visibility:hidden" class="txt_sellstatecode" runat="server" />
       <input type="text" name="total_cost" style="visibility:hidden" ID="total_cost" class="totalcost" runat="server" />
       <input type="text" name="total_gst" style="visibility:hidden" ID="total_gst" class="totalgst" runat="server" />
       <input type="text" name="total_igst" style="visibility:hidden" ID="total_igst" class="totaligst" runat="server" />
       <input type="text" name="total_cgst" style="visibility:hidden" ID="total_cgst" class="totalcgst" runat="server" />
       <input type="text" name="total_sgst" style="visibility:hidden" ID="total_sgst" class="totalsgst" runat="server" />
       <input type="text" name="total_discount" style="visibility:hidden" ID="total_discount" class="totaldiscount" runat="server" />
       <input type="text" name="payment_mode" style="visibility:hidden" ID="payment_mode" class="paymentmode" runat="server" />
       <input type="text" name="payment_status" style="visibility:hidden" ID="payment_status" class="paymentstatus" runat="server" />
       <input type="text" name="Bill_Party_index" style="visibility:hidden" ID="Bill_Party_index" class="Bill_Party_index" runat="server" />
       <input type="text" name="hdn_print_name" style="visibility:hidden" ID="hdn_print_id" class="hdn_print_class" runat="server" />
       <input type="text" name="hdn_company_name" style="visibility:hidden" ID="hdn_company_id" class="hdn_company_class" runat="server" />
       <input type="text" name="hdn_terms_and_condition_name" style="visibility:hidden" ID="terms_and_condition_id" class="terms_and_condition_class" runat="server" />
       <input type="text" name="hdn_auth_name" style="visibility:hidden" ID="hdn_auth_name_id" class="hdn_auth_name_class" runat="server" />
       <input type="text" style="visibility:hidden" ID="total_total_amt" class="total_totalamt" runat="server" />

    </div>
    
    <script >
       // Keyboard Key Action save and Print Button
         document.onkeydown = function(event) {
            if (event.altKey && event.keyCode == 83) //ALT+S
            {
                $('#btnVerCentMod').click();
            }
             if (event.altKey && event.keyCode == 80) //ALT+P
            {
                $('#<%=btnPrint.ClientID%>').click();
            }

         };

        //Bind DDL in Ship Party Name
        function select2_options() {
            //var keys1 = '<%=json_display_content%>';
            //var p_key_obj = JSON.parse(keys1);
            var json_obj = '<%=json_obj %>';
            
            if (json_obj != "") {
                var p_json_obj = JSON.parse(json_obj);
                var table_Object = "";
                table_Object += "<option onclick='' value='0'>Select Supplier</option>";

                p_json_obj.forEach(function (elementObject, index) {
                    table_Object += "<option data-index='" + index + "' value='" + elementObject.account_party_name + "'>" + elementObject.account_party_name + "</option>";
                });
                $(".ship_party_class").html(table_Object);
                $(".select2").select2();
            }
        }

        $('.ship_party_class').on('select2:select', function (e) {
            trclick($('option:selected',this).attr("data-index"));
        });

 // Ship Party Name Onclick Set Value in Controls (address, GSTIN, state and statecode)
    function trclick(id) {        
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        
        $(".ship_party_address_class").html(p_json_obj[id]['account_add_one']);
        $(".ship_party_gstin_class").val(p_json_obj[id]['account_gst_number']);
        $(".ship_party_state_class").html(p_json_obj[id]['account_state']);
        if(p_json_obj[id]['account_state_code'] == "" || p_json_obj[id]['account_state_code'] == "0"){
            $(".ship_party_statecode_class").html(Number($(".doc-code").html()));
            $(".ship_party_statecode_class").hide();
        }else {
            $(".ship_party_statecode_class").html(Number(p_json_obj[id]['account_state_code']));
        }     
    }

    //Bind DDL Invoice No(Get Values Master Setting)
        function select_options() {            
            var json_obj = '<%=json_obj_mst_series %>';
            if(json_obj != ""){
                var p_json_obj = JSON.parse(json_obj);
                var table_Object = "";
                //table_Object += "<option onclick='' value='0'>--Select--</option>";
                p_json_obj.forEach(function (elementObject, index) {
                    table_Object += "<option value='" + index + "' "+ ((p_json_obj[index]['count']== -1)?'selected':'') +" >" + p_json_obj[index]['series_no'] + "</option>";
                });
                $(".inv_no_class").html(table_Object);
                $(".select2").select2();
               
            }
        }

        function batch_details() {
            
            var batch_json = '<%=json_branch_obj%>';            
            if (batch_json != "") {
                var table_Object = "";
                var batchjson = JSON.parse(batch_json);
                
                table_Object += "<option onclick='' value='0'>SELECT...</option>";
                batchjson.forEach(function (elementObject, index) {
                    if (elementObject.product_desc == $(".product-name").val()) {
                        if (elementObject.invoice_date <= $(".input-date").val()) {
                            table_Object += "<option value='" + elementObject.batch + "'>" + elementObject.batch + "</option>";
                        }
                    }
                 });                
                $(".Batch_class").html(table_Object);
                $(".select2").select2();                
            }
        }

        $('.Batch_class').on('select2:select', function (e) {
            expiDate_details($('option:selected',this).val());
        });
        
        function expiDate_details(id) {
            var purchase_qty_tot = "0";
            var sale_tot_qty = "0";
            
            var expiDate_json = '<%=json_branch_obj%>';
             if (expiDate_json != "") {
                 var expiDatejson = JSON.parse(expiDate_json);  
                 expiDatejson.forEach(function (elementObject, index) {
                     //if (elementObject.product_desc == $(".product-name").val()) {
                     if (elementObject.batch == $(".Batch_class option:selected").val()) {
                         $(".Expiry_Date_class").val(elementObject.expiry_date);
                         if (elementObject.invoice_date <= $(".input-date").val()) {
                             purchase_qty_tot = parseFloat(purchase_qty_tot) + parseFloat(elementObject.qty);
                         }
                     }
                 });
             }

             $(".lbl_batch_qty_class").html("");
            
                 var sale_tot_qty_json = '<%=json_sale_tot_qty_obj%>';
                    if (sale_tot_qty_json != "") {
                         var sale_tot_qtyjson = JSON.parse(sale_tot_qty_json);
                         sale_tot_qtyjson.forEach(function (elementObject, index) {
                         //if (elementObject.product_desc == $(".product-name").val()) {
                             if (elementObject.batch == $(".Batch_class option:selected").val()) {
                                 if (elementObject.invoice_date <= $(".input-date").val()) {
                                     sale_tot_qty = parseFloat(sale_tot_qty) + parseFloat(elementObject.qty);
                                 }
                             }
                         });                
                    }             
             $(".lbl_batch_qty_class").html(convert_number(purchase_qty_tot-sale_tot_qty));
        }

        var availablePartyName = null;
        var partyObject = null;
    // Main Load Function
        window.onload = function () {
            debugger
            $(".inv_no_class").attr("disabled", false);
            select2_options();
            select_options();
            var availableProductName = null;
            var prodcutObject = null;
            availablePartyName = JSON.parse('<%=json_Party_name %>');
            partyObject = JSON.parse('<%=json_obj%>');            
            $(".Bill_Party_Name_class").autocomplete({
                source: availablePartyName,
                select: function (event, ui) {
                    var index = availablePartyName.indexOf(ui.item.value);
                    var currentObj = $(this).parent().parent();
                    $(".Bill_Party_index").val(index);
                    var address = '';
                    if (index >= 0) {
                        $(".Bill_Party_address_class").html(partyObject[index]['account_add_one']);
                        $(".Bill_Party_gstin_class").val(partyObject[index].account_gst_number);
                        $(".Bill_Party_state_class").html(partyObject[index].account_state);
                        if (partyObject[index]['account_state_code'] == "" || partyObject[index]['account_state_code'] == "0") {
                            $(".Bill_Party_stateCode_class").html($(".doc-code").html());
                            $(".Bill_Party_stateCode_class").hide();
                        } else {
                            $(".Bill_Party_stateCode_class").html(partyObject[index].account_state_code);
                        }
                    }
                }
            }).focusout(function () {                
                var inputValue = $(".Bill_Party_Name_class").val();
                     var idx = jQuery.inArray(inputValue, availablePartyName);
                     if (idx == -1 && inputValue != "") {
                         $("#exampleModalCenterAutocomplete").modal('show');
                         $(".modal-title").text("Add Party Name");                           
                         $("#parag_Header_Id").html("This Party Name not Available, Do You Want Add this Party Name Click YES?");
                         $(".modal-title").show();
                         $(".close").show();                        
                         $(".btn_AddAcc_Yes_Class").show();                        
                         $(".btn_AddAcc_No_Class").show();                        
                         $(".btn_AddStock_No_Class").hide();                        
                         $(".btn_AddStock_Yes_Class").hide();                        
                         
                     }
           });


            if ($('[id*=breadcrumb_title]').text() == "Update Sale") {
                SETVALUE();
                
                updateval('<%=json_purchase_obj %>');
                $(".inv_no_class").attr("disabled", true);
                $('.Bill_Party_Name_class').autocomplete('search',$(".Bill_Party_Name_class").val() );
                if ($(".ui-menu-item").length == 0) {

                    $("#exampleModalCenter").modal('show');
                    $(".modal-title").hide();
                    $(".close").hide();
                    $(".btn_Close_Class").hide();
                    $(".btn_Submit_Class").hide();
                    $(".btn_Yes_Class").show();
                    $(".btn_No_Class").show();
                    $("#para_Header_Id").html("This Party Name not Available, Do You Want Add this Party Name?");
                }
                else {
                    $(".ui-menu-item").eq(0).focus().click();
                }
            }

            settingsCheck();

            if (ser_id == "1") {
                $(".hdn_invoice_class").val($(".inv_no_class option:selected").text());
            } else {
                $(".hdn_invoice_class").val($(".invoice-no").text());
            }

            availableProductName = JSON.parse('<%=json_product_name %>');
            prodcutObject = JSON.parse('<%=json_product%>');

            $(".product-name").autocomplete({
                
                source: availableProductName,

                select: function (event, ui) {
                    var index = availableProductName.indexOf(ui.item.value);
                    var currentObj = $(this).parent().parent();
                    $(".hsn-code").html(prodcutObject[index].stock_hsn_sac_code);
                    if (prodcutObject[index].stock_gst_rate == "" || prodcutObject[index].stock_gst_rate == null) {
                        $(".gst_rate").html("0");
                    } else {
                        $(".gst_rate").html(prodcutObject[index].stock_gst_rate);
                    }
                                        
                    $(".lbl_mrp_class").html(prodcutObject[index].stock_mrp);
                    $(".lbl_sale_price_class").html(prodcutObject[index].stock_sale_price_without_gst);
                    //$(".Batch_class").val(prodcutObject[index].stock_batch);
                    //if (prodcutObject[index].stock_expiry_date == "" || prodcutObject[index].stock_expiry_date == null) {
                    //    $(".Expiry_Date_class").val("0001-01-01");
                    //} else {
                    //    $(".Expiry_Date_class").val(prodcutObject[index].stock_expiry_date);
                    //}
                    var uom_table_Object = "";
                        uom_table_Object += "<option onclick='' value='0'>Select Supplier</option>";

                    var temp_pri = "";
                    var temp_sec = "";
                    var is_deff1 = "0";
                    var is_deff2 = "0";
                    if (prodcutObject[index].stock_unit_of_measurment == prodcutObject[index].stock_pri_unit_of_measurment) {
                        temp_pri = "selected";
                        is_deff1 = "1";
                    } else {
                        temp_sec = "selected";
                        is_deff2 = "1";
                    }
                    uom_table_Object += "<option data-default='" + is_deff1 + "' " + temp_pri + " data-conversion-factor='1' value='" + prodcutObject[index].stock_pri_unit_of_measurment + "'>" + prodcutObject[index].stock_pri_unit_of_measurment + " (Primary) </option>";
                    uom_table_Object += "<option data-default='" + is_deff2 + "' " + temp_sec + "  data-conversion-factor='" + prodcutObject[index].stock_conversion_factor + "' value='" + prodcutObject[index].stock_sec_unit_of_measurement + "'>" + prodcutObject[index].stock_sec_unit_of_measurement + " (Secondary) </option>";
                    
                    $(".unit_of_measure_class").html(uom_table_Object);
                    $(".select2").select2();

                    $(".lbluom").html(prodcutObject[index].stock_unit_of_measurment);
                    
                   // $(".tr_gst_Id").show();
                    if ($(".state-code").text() == $(".Bill_Party_stateCode_class").text()) {
                        chkcgstcheck();
                    } else {
                        chkigstcheck();
                    }
                }
               
            }).focusout(function () {
                
                var inputValue = $(".product-name").val();
                     var idx = jQuery.inArray(inputValue, availableProductName);
                if (idx == -1 && inputValue != "") {                         
                    $("#exampleModalCenterAutocomplete").modal('show');
                         $(".modal-title").text("Add Product Name");                           
                         $("#parag_Header_Id").html("This Product not Available, Do You Want Add this Product Click YES?");
                         $(".btn_AddAcc_Yes_Class").hide();
                         $(".btn_AddAcc_No_Class").hide();
                         $(".btn_AddStock_No_Class").show();
                         $(".btn_AddStock_Yes_Class").show();  
                }
                 batch_details();
           });

            
           var availablegstin = JSON.parse('<%=json_gstin_name%>');
            $(".Bill_Party_gstin_class").autocomplete({
                source: availablegstin,
                select: function (event, ui) {
                    var index = availablegstin.indexOf(ui.item.value);
                    var currentObj = $(this).parent().parent();                    
                    $('.Bill_Party_Name_class').autocomplete('search', partyObject[index].account_party_name);
                    $(".ui-menu-item").eq(0).focus().click();
                }
            });

            $(".ship_party_gstin_class").autocomplete({
                source: availablegstin,
                select: function (event, ui) {
                    var index = availablegstin.indexOf(ui.item.value);
                    var currentObj = $(this).parent().parent();
                    $(".ship_party_class").val(partyObject[index].account_party_name).trigger('change.select2');
                    trclick($(".ship_party_class option:selected").attr("data-index"));
                }
            });

            var data = localStorage.getItem('items');
            var data1 = localStorage.getItem('items1');
            if (data != "null" || data1 != "null") {
                localStorage.setItem('items', null);
                localStorage.setItem('items1', null);
                updatevalLocal(data, data1);
            }
            
        }

        
        function convert_qty() {
           var uom = $(".unit_of_measure_class").val();
           var data_cover_fact_selected = parseFloat($(".unit_of_measure_class option:selected").attr('data-conversion-factor'));
           var uom_pri = $(".unit_of_measure_class option").eq(1).val();
           var qunty = parseFloat($("[id*=txtQty]").val()); 
            if (uom_pri != uom) {
                qunty = qunty / data_cover_fact_selected;
            }
            $("[id*=txtQty]").val(qunty);
        }

        function SETVALUE() {
            
            var jsonSettings = '<%=json_sale_obj%>';
            if (jsonSettings != '') {
                var p_json_obj = JSON.parse(jsonSettings);
                $(".ship_party_class").val(p_json_obj[0]['ship_party_id']).trigger('change');
            }
        }
        
        function StatusChange() {          
            if($(".pay_Status").val() == "Not Paid"){
                $(".pay_mode").hide();
                $(".pay_mode option:selected" ).val("");
            } else {
                $(".pay_mode").show();
            }
        }


        function btnClick() {
                $(".total_totalamt").val(parseFloat($("#tot_amt_add_cgst").text()));
                $(".btn_Close_Class").show();
                $(".btn_Submit_Class").show();
                $(".btn_Yes_Class").hide();
                $(".btn_No_Class").hide();
                $(".modal-title").show();
                $(".close").show();
                $("#para_Header_Id").html("Do you want to Submit?");
            
                $(".totalcost").val($("[id*=tot_Amt_tax]").text());
                $(".totalgst").val($("#tot_add_igst").text());
                $(".totaligst").val($("#tot_add_igst").text());
                $(".totalcgst").val($("#tot_add_cgst").text());
            
                $(".totalsgst").val($("#tot_add_sgst").text());
                $(".totaldiscount").val($("#tot_Dis").text());
                $(".paymentmode").val($('[id*=selectPayMode').val());
                $(".paymentstatus").val($('[id*=selectPayStatus').val());
                $(".hdn_company_class").val($(".comp_name_class").text());
                $(".terms_and_condition_class").val($(".termCond_class").text());
                $(".hdn_auth_name_class").val($(".sign_class").text());

                if ($(".pay_Status").val() == "Not Paid") {
                    //if(availablePartyName[$(".Bill_Party_index").val()] == $(".Bill_Party_Name_class").val()) ? alert("TRUE") : alert("FALSE");
                    if (availablePartyName[$(".Bill_Party_index").val()] != $(".Bill_Party_Name_class").val()) {
                        $("#exampleModalCenter").modal('hide');
                        warning_message("Your Party Name is not present in account List...!!");
                        $("#exampleModalCenter").modal('hide');
                    } else {
                        $("#exampleModalCenter").modal('show');
                    }                 
                } else {
                    $("#exampleModalCenter").modal('show');
            }
        }
        
        function dateChange(){            
            $(".DateOfSupply_class").val($(".input-date").val());
        }

        function CalculateTotal() {
            
            var amount = $("[id*=txtAmount]").val();
            var qty =  $("[id*=txtQty]").val(); 
            var Total = (parseFloat(amount)*parseFloat(qty));
            if(Total) {
                $(".total").text(Total);
            } else
            {
                $(".total").text(0);
            }            
            checkgst();
        }

       function addDetails() {
           
           if ($(".chk_Reverse_class").prop("checked") == true) {
               var gstRate = $(".gst_rate").text() ? convert_number($(".gst_rate").text()) : "1";
               /*$("[id*=txtAmount]").val(
                   convert_number(parseFloat( convert_number(
                       (
                       convert_number($("[id*=txtAmount]").val()) - convert_number($("[id*=txtdisc]").val())
                       ) / convert_number(((gstRate / 100) + 1))))
                   + parseFloat($("[id*=txtdisc]").val()))
               );
               */
               
               $("[id*=txtAmount]").val(
                   convert_number(parseFloat(
                       convert_number($("[id*=txtAmount]").val())
                        / convert_number(((gstRate / 100) + 1))))
                   + parseFloat($("[id*=txtdisc]").val())
               );

               $(".chk_Reverse_class").prop('checked', false);
               CalculateTotal();
               addproduct();                      
               $(".chk_Reverse_class").prop('checked', true);
           } else {
               addproduct();              
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
             
            else {

                debugger

                var original_val = parseFloat($("[id*=txtAmount]").val() ? $("[id*=txtAmount]").val() : "0");
                original_val = original_val * parseFloat($("[id*=txtQty]").val());
                convert_qty();
                
                var disc = parseFloat($("[id*=txtdisc]").val()? convert_number($("[id*=txtdisc]").val()): "0");
                tax_val = (original_val - disc);
                var gstRate = $(".gst_rate").text()?convert_number($(".gst_rate").text()): "0";
                var gstVal = convert_number(gstRate/2);                
                var gst_amount  = (convert_number(tax_val*gstVal) / 100);
                var tot = convert_number(tax_val + (gst_amount * 2));
                
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
                    cgstAmt = $(".txtCgst_class").val();
                    sgstrate = gstVal;
                    sgstAmt = $(".txtSgst_class").val();                    
                } else {
                    igstrate = gstRate;
                    igstAmt = $(".txtIgst_class").val();                    
                    cgstrate = "0";
                    cgstAmt = "0";
                    sgstrate = "0";
                    sgstAmt ="0";
                }

                if ($(".Batch_class option:selected").val() == undefined) {
                    $(".Batch_class").val("0");
                } else {
                    $(".Batch_class option:selected").val();
                }

                $('#myTable> tbody:last').append('<tr>'+
                    '<td style="border:1px solid!important;">'+ (i + 1)  +'</td>'+ 
                    '<td style="border:1px solid!important;" class="product-discription">'+ $("[id*=txtproduct_name]").val()  +'</td>'+ 
                    '<td style="border:1px solid!important;" class="hsncode">'+ $(".hsn-code").text()+'</td>'+
                    '<td style="border:1px solid!important;" class="uom">'+ $(".lbluom").text()+'</td>'+
                    '<td style="border:1px solid!important;" class="batchClass">'+ $(".Batch_class option:selected").val()+'</td>'+
                    '<td style="border:1px solid!important;" class="expiryClass">'+ (Date.parse($(".Expiry_Date_class").val())?$(".Expiry_Date_class").val():"0001-01-01")+'</td>'+
                    '<td style="border:1px solid!important;" class="qty">'+ convert_number($("[id*=txtQty]").val())+'</td>'+
                    '<td style="border:1px solid!important; display:none;" class="rate">'+convert_number($(".amount").val())+'</td>'+
                    '<td style="border:1px solid!important;" class="amount">'+   convert_number($(".total").text()) +'</td>' +
                    '<td style="border:1px solid!important;" class="discount">'+ convert_number($("[id*=txtdisc]").val()) + '</td>'+
                    '<td style="border:1px solid!important;" class="tax-value">'+ convert_number(tax_val) + '</td>'+                    
                   '<td style="border:1px solid!important;" class="igst-rate">'+ igstrate+'' +'</td>'+
                   '<td style="border:1px solid!important;" class="igst-amount">'+ igstAmt +'</td>' +               
                  '<td style="border:1px solid!important;" class="cgst-rate">'+ cgstrate+'' +'</td>' +
                  '<td style="border:1px solid!important;" class="cgst-amount">'+ cgstAmt +'</td>' +
                  '<td style="border:1px solid!important;" class="sgst-rate">'+ sgstrate +''+'</td>'+
                  '<td style="border:1px solid!important;" class="sgst-amount">'+ sgstAmt +'</td>' +
                  '<td style="border:1px solid!important;" class="tot_class">'+ tot +'</td>' +
                  '<td  style="border:1px solid!important;"><i class="fa fa-pencil" style="font-size:25px;color:#17a2b8" aria-hidden="true" onclick="editRow(this), removeRow(this)"></i><i class="fa fa-close" name="record" style="font-size:30px;color:red" aria-hidden="true" onclick="removeRow(this)"></i>'
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
                    
                } else {
                    $('td:nth-child(12),th:nth-child(12)').show();
                    $('td:nth-child(13),th:nth-child(13)').show();
                    $('td:nth-child(14),th:nth-child(14)').hide();
                    $('td:nth-child(15),th:nth-child(15)').hide();
                    $('td:nth-child(16),th:nth-child(16)').hide();
                    $('td:nth-child(17),th:nth-child(17)').hide();
                     $("#tot_Cgst").hide();
                    $("#tot_Sgst").hide();
                    }
                calculate();
                $("[id*=txtproduct_name]").val("");
                $(".hsn-code").text("");
                $(".gst_rate").text("");
                $(".lbluom").text("");
                $("[id*=txtAmount]").val("0");
                $(".total").text("");
                $("[id*=txtQty]").val("1");
                $("[id*=txtdisc]").val("0");
                 $("[id*=txtIgst]").val("0");
                $("[id*=txtCgst]").val("0");
                $("[id*=txtSgst]").val("0");
               // $(".tr_gst_Id").hide();
            }
            
            $('[id*=billname').val($(".Bill_Party_Name_class").val());
            $('[id*=billaddr').val($(".Bill_Party_address_class").text());
            $('[id*=billgstin').val($(".Bill_Party_gstin_class").val());
            $('[id*=billstate').val($(".Bill_Party_state_class").text());
            $('[id*=billcode').val($(".Bill_Party_stateCode_class").text());

            if ($(".ship_party_class option:selected").text() != "Select Supplier") { $('[id*=sell_name').val($(".ship_party_class option:selected").text()); } else { $('[id*=sell_name').val("0"); }
    $('[id*=sell_address').val($(".ship_party_address_class").text());
    $('[id*=txtgstin').val($(".ship_party_gstin_class").val());
    $('[id*=txt_sell_state').val($(".ship_party_state_class").text());
    $('[id*=txt_sell_state_code').val(Number($(".ship_party_statecode_class").text()));
            
   }

   //Edit Convert Of Quantity in unit off measurment
        function edit_convert_qty(qty) {
           var uom = $(".unit_of_measure_class").val();
           var data_cover_fact_selected = parseFloat($(".unit_of_measure_class option:selected").attr('data-conversion-factor'));
           var uom_pri = $(".unit_of_measure_class option").eq(1).val();
           var qunty = parseFloat(qty); 
            if (uom_pri != uom) {
                qunty = qunty * data_cover_fact_selected;
            }
            return qunty;
        }

    //Edit Table Record
        function editRow(row) {
            
            var tr = $(row).parents("tr");
            $("[id*=txtproduct_name]").val($(tr).find('td:eq(1)').text());
            $('.product-name').autocomplete('search', $(tr).find('td:eq(1)').text());
            $(".ui-menu-item").eq(1).focus().click();
            $(".hsn-code").text($(tr).find('td:eq(2)').text());
            $(".lbluom").text($(tr).find('td:eq(3)').text());
            batch_details();
            expiDate_details();
            $(".Batch_class").val($(tr).find('td:eq(4)').text());            
            $(".Expiry_Date_class").val($(tr).find('td:eq(5)').text());
            var qty = edit_convert_qty(parseFloat($(tr).find('td:eq(6)').text()));
            var amt = parseFloat($(tr).find('td:eq(8)').text());             
            $(".total").text(""+amt);
            $("[id*=txtAmount]").val(""+(amt / qty));
            $("[id*=txtQty]").val(qty);
            $("[id*=txtdisc]").val($(tr).find('td:eq(9)').text());
            $("[id*=txtIgst]").val($(tr).find('td:eq(12)').text());
            $("[id*=txtCgst]").val($(tr).find('td:eq(14)').text());
            $("[id*=txtSgst]").val($(tr).find('td:eq(16)').text());

        }

        function removeRow(row) {
        //for delete product 
           var tr = $(row).parents("tr");
            $(row).parents("tr").remove();
            
            calculate();
           
        } 

        $("#btnVerCentMod").click(function () {
            if (ser_id == "1") {                
                if ($(".inv_no_class").val() == "" || $(".inv_no_class").val() == null) {
                    warning_message("Please Select Invoice No...!!");
                    return false;
                } else  if ($(".Bill_Party_Name_class ").val() == "" || $(".Bill_Party_Name_class ").val() == null) {
                warning_message("Please Select Party Name...!!");
                 return false;
                 $("#exampleModalCenter").modal('hide');
              } else {
                create_json();
            }
            } else {
                
                if ($(".invoice-no").text() == "" || $(".invoice-no").text() == "0") {
                    warning_message("Please Select Invoice No...!!");
                    return false;
                } else  if ($(".Bill_Party_Name_class ").val() == "" || $(".Bill_Party_Name_class ").val() == null) {
                warning_message("Please Select Party Name...!!");
                 return false;
                 $("#exampleModalCenter").modal('hide');
              } else {
                create_json();
            }
            }
        });    

        function calculate() {
            var sum_of = 0.0;

            $('#myTable tbody tr').each(function (row, tr) {
                var $input = $(this);
                var $row = $input.closest('tr');
                $row.find("td").eq(0).html(row + 1);
            });

            $(".qty").each(function (index) {
                sum_of= sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Quant]").text("" + convert_number(sum_of));
            sum_of = 0.0;
            $("td.amount").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Amt]").text("" + convert_number(sum_of));

           sum_of = 0.0;
            $(".discount").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Dis]").text("" + convert_number(sum_of));
           sum_of = 0.0;
            $(".tax-value").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Taxval]").text("" + convert_number(sum_of));
               
           sum_of = 0.0;
            $(".igst-amount").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Igst]").text("" + convert_number(sum_of));


           sum_of = 0.0;
            $(".cgst-amount").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Cgst]").text("" + convert_number(sum_of));

           sum_of = 0.0;
            $(".sgst-amount").each(function (index) {
                sum_of = sum_of + parseFloat($(this).text());
            });
            $("[id*=tot_Sgst]").text("" + convert_number(sum_of));


           sum_of = 0.00;
            $(".tot_class").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Amt_tax]").text("" + convert_number(sum_of));

            $("#tot_invoice_tax").text($("[id*=tot_Taxval]").text());
            $("#tot_add_igst").text($("[id*=tot_Igst]").text());
            $("#tot_add_cgst").text($("[id*=tot_Cgst]").text());
            $("#tot_add_sgst").text($("[id*=tot_Sgst]").text());
            $("#tot_amt_add_cgst").text($("[id*=tot_Amt_tax]").text()); 

            if ($("[id*=tot_Igst]").text() == "0" || $("[id*=tot_Igst]").text() == "0.00") {
               $("#tot_gst_tax_amount").text(convert_number(parseFloat($("[id*=tot_Cgst]").text())+ parseFloat($("[id*=tot_Sgst]").text())));
            } else {
                 $("#tot_gst_tax_amount").text($("[id*=tot_Igst]").text());
            }
        }

       

        var ser_id ="";
        function settingsCheck() {
            
            var jsonSettings = '<%=json_setting_obj %>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            for(var i = 0; i < count; i++){
                ser_id = p_json_obj[i]['prefix_generate_invoice_no'];
                
                if(p_json_obj[i]['batch_wise_details'] == "1"){
                    $("[id*=batch_tr_id]").show();
                    //$('td:nth-child(5),th:nth-child(5)').show();
                   
                } else {
                    $("[id*=batch_tr_id]").hide();
                    //$('td:nth-child(5),th:nth-child(5)').hide();
                    //document.getElementById("foot_tot").colSpan = "4";
                    //$("[id*=tot_Dis]").show();
                    //$("[id*=tot_Taxval]").show();
                }

                if(p_json_obj[i]['batch_wise_details_tax_invoice'] == "1"){
                    $('td:nth-child(5),th:nth-child(5)').show();
                   
                } else {
                    $('td:nth-child(5),th:nth-child(5)').hide();
                    document.getElementById("foot_tot").colSpan = "4";
                    $("[id*=tot_Dis]").show();
                    $("[id*=tot_Taxval]").show();
                }

                if(p_json_obj[i]['expiry_monitoring_system'] == "1") {
                    $("[id*=expiry_tr_id]").show();
                    //$('td:nth-child(6),th:nth-child(6)').show();
                   
                } else{
                    $("[id*=expiry_tr_id]").hide();
                    ////$('td:nth-child(6),th:nth-child(6)').hide();
                    ////document.getElementById("foot_tot").colSpan = "4";  
                    ////$("[id*=tot_Dis]").show();
                    ////$("[id*=tot_Taxval]").show();
                }

                if (p_json_obj[i]['expiry_details_tax_invoice'] == "1") {
                    //$("[id*=expiry_tr_id]").show();
                    $('td:nth-child(6),th:nth-child(6)').show();
                   
                } else{
                    //$("[id*=expiry_tr_id]").hide();
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
                
                if (p_json_obj[i]['mrp_details'] == "1") {
                    $(".mrp_tr_class").show();
                } else {
                    $(".mrp_tr_class").hide();
                }

                if (p_json_obj[i]['sale_price_details'] == "1") {
                    $(".sale_price_tr_class").show();
                } else {
                    $(".sale_price_tr_class").hide();
                }
            }
        }

        function ResetChange(){            
            $(".invoice-no").val("");
            $(".input-date").val("");
            $(".reve_charge").val("");
            $(".state-class").val("");
            $(".state-code").val("");
            $(".TransportMode_class").val("");
            $(".VehicleNumber_class").val("");
            $(".DateOfSupply_class").val("");
            $(".PlaceOfSupply_class").val("");
            $(".Bill_Party_Name_class").val("");
            $(".Bill_Party_address_class").val("");
            $(".Bill_Party_gstin_class").val("");
            $(".Bill_Party_state_class").val("");
            $(".Bill_Party_stateCode_class").val("");
            $(".ship_party_class").html("0");
            $(".ship_party_address_class").val("");
            $(".ship_party_gstin_class").val("");
            $(".ship_party_state_class").val("");
            $(".ship_party_statecode_class").val("");

            $("[id*=txtproduct_name]").val("");
            $(".hsn-code").text("");
            $(".gst_rate").text("");
            $(".lbluom").text("");
            $("[id*=txtAmount]").val("0");
            $(".total").text("");
            $("[id*=txtQty]").val("1");
            $("[id*=txtdisc]").val("0");
            $("[id*=txtIgst]").val("0");
            $("[id*=txtCgst]").val("0");
            $("[id*=txtSgst]").val("0");
            $("[id*=txtremark]").val("");
        }

         function create_json() {
             var JSONObject = new Array();
             debugger
                $('#myTable tbody tr').each(function(row, tr) {      
                    var values = {};
                    //for (var i = 0; i < $('#myTable tbody tr').length; i++) {
                    if(ser_id == "1") {
                        values.INVOICENO =  $(".inv_no_class option:selected").text();
                    } else {
                        values.INVOICENO =  $(".invoice-no").text();
                    }                    
                    values.PROD = $(tr).find('td:eq(1)').text();
                    values.HSN =  $(tr).find('td:eq(2)').text();
                    values.UOM =  $(tr).find('td:eq(3)').text();
                    values.BATCH = $(tr).find('td:eq(4)').text();
                    values.EXPIRYDATE = $(tr).find('td:eq(5)').text();
                    values.QTY = $(tr).find('td:eq(6)').text();
                    values.RATE = $(tr).find('td:eq(7)').text();
                    values.AMT = $(tr).find('td:eq(8)').text();
                    values.DISCOUNT = $(tr).find('td:eq(9)').text();
                    values.TAXVAL = $(tr).find('td:eq(10)').text();                
                    //if($(".state-code").text() == $(".Bill_Party_stateCode_class").text())
                    //{           
                    values.IRATE = $(tr).find('td:eq(11)').text();
                    values.IAMT =  $(tr).find('td:eq(12)').text();
                    values.CRATE = $(tr).find('td:eq(13)').text();
                    values.CAMT =  $(tr).find('td:eq(14)').text();
                    values.SRATE = $(tr).find('td:eq(15)').text();
                    values.SAMT =  $(tr).find('td:eq(16)').text();
                    //} else {         
                        //values.IRATE = $(tr).find('td:eq(11)').text();
                        //values.IAMT =  $(tr).find('td:eq(12)').text();
                        //values.CRATE = $(tr).find('td:eq(13)').text();
                        //values.CAMT =  $(tr).find('td:eq(14)').text();
                        //values.SRATE = $(tr).find('td:eq(15)').text();
                        //values.SAMT =  $(tr).find('td:eq(16)').text();
                    //}                    
                    JSONObject.push(values);
                });
            
                var json_str = JSON.stringify(JSONObject); 
                $(".txthdn_Json").val(json_str);
            
                if(ser_id == "1"){
                    var str = $(".inv_no_class option:selected").text();
                    var rest = str.substring(0, str.lastIndexOf("/") + 1);
                    $('[id*=series_id').val(rest);
                }
                else {
                    $('[id*=series_id').val($(".invoice-no").text());
                }
               
                $('[id*=billname').val($(".Bill_Party_Name_class").val());
                $('[id*=billaddr').val($(".Bill_Party_address_class").text());
                $('[id*=billgstin').val($(".Bill_Party_gstin_class").val());
                $('[id*=billstate').val($(".Bill_Party_state_class").text());
                $('[id*=billcode').val($(".Bill_Party_stateCode_class").text());

             if ($(".ship_party_class option:selected").text() != "Select Supplier") { $('[id*=sell_name').val($(".ship_party_class option:selected").text()); } else { $('[id*=sell_name').val("0"); }
                //$('[id*=sell_name').val($(".ship_party_class option:selected").text());
                $('[id*=sell_address').val($(".ship_party_address_class").text());
                $('[id*=txtgstin').val($(".ship_party_gstin_class").val());
                $('[id*=txt_sell_state').val($(".ship_party_state_class").text());
                $('[id*=txt_sell_state_code').val(Number($(".ship_party_statecode_class").text()));
        }

         function updateval(data) {
            
            jsonPurchase = data;
            var p_json_obj = JSON.parse(jsonPurchase);
            var count = JSON.parse(jsonPurchase).length;
            for(var i = 0; i < count; i++) {                
                $(".product-name").val(p_json_obj[i]['product_desc']);
                batch_details();
                expiDate_details();
                $(".hsn-code").html(p_json_obj[i]['hsn_code']);
                $(".gst_rate").html(p_json_obj[i]['igst_rate']+p_json_obj[i]['cgst_rate']+p_json_obj[i]['sgst_rate']);
                $(".lbluom").html(p_json_obj[i]['uom']);       
                $(".Batch_class").val(p_json_obj[i]['batch']);            
                $(".Expiry_Date_class").val(p_json_obj[i]['expiry_date']);

                var qty = edit_convert_qty(parseFloat(p_json_obj[i]['qty']));
                var amt = parseFloat(p_json_obj[i]['amount']);             
                $(".total").text(""+amt);
                $(".amount").val(""+(amt / qty));
                $(".txtqty").val(qty);

                //$(".amount").val(p_json_obj[i]['rate']);
                //$(".txtqty").val(p_json_obj[i]['qty']);
                //$(".total").html(p_json_obj[i]['tax_val'] + p_json_obj[i]['discount']);
                $(".txtdisc").val(p_json_obj[i]['discount']);
                
                //if (p_json_obj[i]['igst_rate'] == "0" && p_json_obj[i]['cgst_rate'] != "0") {
                //    $(".chkcgst_class").prop('checked', true);
                //    $(".chkigst_class").prop('checked', false);
                //} else {
                //    $(".chkcgst_class").prop('checked', false);
                //    $(".chkigst_class").prop('checked', true);
                //}
                $(".txtIgst_class").val(p_json_obj[i]['igst_amt']);
                $(".txtCgst_class").val(p_json_obj[i]['cgst_amt']);
                $(".txtSgst_class").val(p_json_obj[i]['sgst_amount']);

                addDetails();           
            }            
        }
        
        function updatevalLocal(data, data1) {
            
            jsonPurchase_dtl = data;
            jsonPurchase_mst = data1;
            var p_json_obj = JSON.parse(jsonPurchase_dtl);
            var p_json_obj_mst = JSON.parse(jsonPurchase_mst);
            
            var count = JSON.parse(jsonPurchase_dtl).length;
            var count_mst = JSON.parse(jsonPurchase_mst).length;

            for (var i = 0; i < count_mst; i++) {
                $(".invoice-no").val(p_json_obj_mst[i]['invoiceno']);
                $(".invoice-no").val(p_json_obj_mst[i]['invoiceno']);
                $(".inv_no_class").val();
                $(".input-date").val(p_json_obj_mst[i]['inputdate']);
                $(".reve_charge").val(p_json_obj_mst[i]['reve_charge']);
                $(".state-class").val(p_json_obj_mst[i]['state_class']);
                $(".state-code").val(p_json_obj_mst[i]['state_code']);
                $(".TransportMode_class").val(p_json_obj_mst[i]['TransportMode']);
                $(".VehicleNumber_class").val(p_json_obj_mst[i]['VehicleNumber']);
                $(".DateOfSupply_class").val(p_json_obj_mst[i]['DateOfSupply']);
                $(".PlaceOfSupply_class").val(p_json_obj_mst[i]['PlaceOfSupply']);
                $(".Bill_Party_Name_class").val(p_json_obj_mst[i]['Bill_Party_Name']);
                $(".Bill_Party_address_class").text(p_json_obj_mst[i]['Bill_Party_address']);
                $(".Bill_Party_state_class").text(p_json_obj_mst[i]['Bill_Party_state']);
                $(".Bill_Party_stateCode_class").text(p_json_obj_mst[i]['Bill_Party_stateCode']);
                $(".ship_party_class option:selected").val(p_json_obj_mst[i]['ship_party_name']);
                $(".ship_party_address_class").text(p_json_obj_mst[i]['ship_party_address']);
                $(".ship_party_gstin_class").val(p_json_obj_mst[i]['ship_party_gstin']);
                $(".ship_party_state_class").text(p_json_obj_mst[i]['ship_party_state']);
                $(".ship_party_statecode_class").text(p_json_obj_mst[i]['ship_party_statecode']);
                $("[id*=txtremark]").val(p_json_obj_mst[i]['txtremark']);
                $(".pay_Status").val(p_json_obj_mst[i]['payStatus']);
                $(".pay_mode").val(p_json_obj_mst[i]['paymode']);
                StatusChange();
            }
            for(var i = 0; i < count; i++) {                
                $(".product-name").val(p_json_obj[i]['PROD']);
                batch_details();
                expiDate_details();
                $(".hsn-code").html(p_json_obj[i]['HSN']);
                $(".gst_rate").html(p_json_obj[i]['igst_rate']+p_json_obj[i]['cgst_rate']+p_json_obj[i]['sgst_rate']);
                $(".lbluom").html(p_json_obj[i]['UOM']);                
                $(".Batch_class").val(p_json_obj[i]['BATCH']);                
                $(".Expiry_Date_class").val(p_json_obj[i]['EXPIRYDATE']);                
                $(".amount").val(p_json_obj[i]['AMT']);
                $(".txtqty").val(p_json_obj[i]['QTY']);
                $(".txtdisc").val(p_json_obj[i]['DISCOUNT']);
                
                CalculateTotal();
                addproduct();
            }            
        } 

     
        function ResetChange(){
            $(".input-date").val("0001-01-01");
            $(".reve_charge").val("NO");
            $(".state-class").val("");
            $(".state-code").val("");
            $(".seller_name").val("0");
            $(".seller_address").val("");
            $(".gstin").val("");
            $(".seller_state").val("");
            $(".seller_state_code").val("");
           
            $("[id*=txtproduct_name]").val("");
            $(".hsn-code").text("");
            $(".gst_rate").text("");
            $(".lbluom").text("");
            $("[id*=txtAmount]").val("0");
            $(".total").text("");
            $("[id*=txtQty]").val("1");
            $("[id*=txtdisc]").val("0");
            $("[id*=txtremark]").val("");
            $("[id*=txtIgst]").val("0");
            $("[id*=txtCgst]").val("0");
            $("[id*=txtSgst]").val("0");
        }
       
        var jsonStr = "";
        function create_json_mst() {
            var JSONObject = new Array();
            var values = {};
            values.invoiceno = $(".invoice-no").val();
            values.invoice_no = $(".inv_no_class").val();
            values.input_date = $(".input-date").val();
            values.reve_charge = $(".reve_charge").val();
            values.state_class = $(".state-class").val();
            values.state_code = $(".state-code").val();
            values.TransportMode = $(".TransportMode_class").val();
            values.VehicleNumber = $(".VehicleNumber_class").val();
            values.DateOfSupply = $(".DateOfSupply_class").val();
            values.PlaceOfSupply = $(".PlaceOfSupply_class").val();
            values.Bill_Party_Name = $(".Bill_Party_Name_class").val();
            values.Bill_Party_address = $(".Bill_Party_address_class").text();
            values.Bill_Party_state = $(".Bill_Party_state_class").text();
            values.Bill_Party_stateCode = $(".Bill_Party_stateCode_class").text();
            values.ship_party_name = $(".ship_party_class option:selected").val();
            values.ship_party_address = $(".ship_party_address_class").text();
            values.ship_party_gstin = $(".ship_party_gstin_class").val();
            values.ship_party_state = $(".ship_party_state_class").text();
            values.ship_party_statecode = $(".ship_party_statecode_class").text();
            values.txtremark = $("[id*=txtremark]").val();
            values.payStatus = $(".pay_Status").val();
            values.paymode = $(".pay_mode").val();
            JSONObject.push(values);
            jsonStr = JSON.stringify(JSONObject); 
        }
            
         function AccountBtnOnClick() {
            create_json_mst();
            create_json();
             localStorage.setItem('items', $(".txthdn_Json").val());
             localStorage.setItem('items1', jsonStr);
            window.location.href = window.location='/Master/AddAccount?redirect=sales';
         }

        function StockBtnOnClick() {
            create_json_mst();
            create_json();
            localStorage.setItem('items', $(".txthdn_Json").val());
            localStorage.setItem('items1', jsonStr);
            window.location.href = window.location = '/Master/AddStock?redirect=sales';
            //$("#myTable tbody").html("");
            //$("#myTable tfoot tr:eq(0)").html("");
        }

        function checkgst() {

            if ($("[id*=txtproduct_name]").val() == "") {
                warning_message("Please Select Product...!!");
                return false;
            } else {
                
                var qunty = (parseFloat($("[id*=txtQty]").val()))?parseFloat($("[id*=txtQty]").val()) : 0; 
                 var disc = (parseFloat($("[id*=txtdisc]").val()))?parseFloat($("[id*=txtdisc]").val()) : 0;
                var original_val = (parseFloat($("[id*=txtAmount]").val()))?parseFloat($("[id*=txtAmount]").val()) : 0;
                var gstRate = (parseFloat($(".gst_rate").text()))?parseFloat($(".gst_rate").text()) : 0;

                if ($(".chk_Reverse_class").prop("checked") == true) {               
                     //tax_val = (original_val - disc);
                     tax_val = (original_val);
                     var gstVal = parseFloat(gstRate) / 2;
                     tax_val = convert_number(tax_val / ((gstRate / 100) + 1));
                     var gst_amount = parseFloat((tax_val * gstVal) / 100);
//                     tax_val = convert_number(tax_val - parseFloat((disc * gstVal) / 100));
                     $(".txtCgst_class").val(convert_number(gst_amount*qunty));
                    $(".txtSgst_class").val(convert_number(gst_amount * qunty));
                    $(".txtIgst_class").val(convert_number(((gst_amount * 2) - (disc * gstRate / 100)) * qunty));
                     $(".total").text((convert_number(original_val - (gst_amount * 2))-disc)*qunty);
                     $(".total").text(convert_number(original_val - (gst_amount * 2))*qunty);
                     
                } else {
                       
                       tax_val = (original_val - disc);                       
                       var gstVal = parseFloat(gstRate) / 2;
                       var gst_amount = parseFloat((tax_val*gstVal) / 100);
                       
                       $(".txtCgst_class").val(convert_number(gst_amount*qunty));
                       $(".txtSgst_class").val(convert_number(gst_amount*qunty));
                       $(".txtIgst_class").val(convert_number(((gst_amount * 2)-(disc * gstRate / 100))*qunty));
                       //$(".total").text((convert_number(original_val-disc)*qunty));
                       $(".total").text((convert_number(original_val*qunty)));
                      
                }

                
            }
        }


        function chkigstcheck() {
                $(".chkcgst_class").prop('checked', false);
               // $(".chksgst_class").prop('checked', false);
                $(".chkigst_class").prop('checked', true);
                $(".txtIgst_class").show();
                $(".txtCgst_class").hide();
                $(".txtSgst_class").hide();
            checkgst();
            }

        function chkcgstcheck() {
            $(".chkcgst_class").prop('checked', true);
           // $(".chksgst_class").prop('checked', true);
            $(".chkigst_class").prop('checked', false);
            $(".txtIgst_class").hide();
            $(".txtCgst_class").show();
            $(".txtSgst_class").show();
            checkgst();
        }

        function yesClick() {
            var JSONObject = new Array();
          
                    var values = {};
                    values.party_name = $(".Bill_Party_Name_class").val();
                    values.address = $(".Bill_Party_address_class").text();
                    values.state = $(".Bill_Party_state_class").text()
                    values.statecode = $(".Bill_Party_stateCode_class").text();
                    values.gstin = $(".Bill_Party_gstin_class").val();                                        
                    JSONObject.push(values);
                
                var json_str = JSON.stringify(JSONObject); 
            // $(".txthdnJsonAccount_class").val(json_str);
            window.location.href = window.location = '/Master/AddAccount?redirect=sales&editId=<%=Request.QueryString["value"] %>&val=' + json_str;
        }

        

    </script>
</asp:Content>