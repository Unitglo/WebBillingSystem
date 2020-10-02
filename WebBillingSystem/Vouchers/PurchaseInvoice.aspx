<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchaseInvoice.aspx.cs" Inherits="WebBillingSystem.PurchaseInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <style>
        @media print{
           * {
                all : unset;
            }
            html {
                visibility:hidden;
            }
            .print_screen {
                visibility:inherit;
            }
            .hk-breadcrumb {
            visibility:hidden;

            }
            table, tr, td {
            padding: 1 !important;
            }

        }
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
    <div class="container print_screen" >
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Stock Purchase</h4>
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
                                                <td colspan="2">Invoice Date  :</td>
                                                <td colspan="2">
                                                    <input type="date" runat="server" id="input_date" name="inputdate" class="form-control input-date"  />
                                                
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="2">Reverse Charge (Y/N)  :</td>
                                                <td colspan="2" class="">
                                                    <select class="form-control reve_charge" name="reversecharge" id="reverse_charge" runat="server">
                                                        <option value="NO">NO</option>
                                                        <option value="YES">YES</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr hidden="hidden">
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
                                                <td colspan="1" style="width: 25%;">Supplier Name </td>
                                                <td colspan="3" style="max-width:20px;">: <%--<label id="seller_name" class="" runat="server"></label>--%>
                                                    <select runat="server" class="form-control select2 select2-hidden-accessible seller_name"   id="sellername" name="seller_name" >
                                                    </select>
                                                </td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="AccountBtnOnClick()"></i></td>
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
                    <!-- #Product Add -->
                    <div class="invoice-from-wrap">
                        <div class="row">
                             <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Product Desc  :</td>                                                
								                <td colspan="2" ><input runat="server" type="text" id="txtproduct_name" class="product-name form-control" name="product-name" placeholder="Product Desc" /></td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="StockBtnOnClick()"></i></td>
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
                                                <td colspan="2">Batch :</td>
                                                <td colspan="2">
                                                   <input runat="server" type="text" id="Batch_ID" class="Batch_class form-control" name="Batch_Name" placeholder="Add Batch" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr id="expiry_tr_id">
                                                <td colspan="1">Expiry Date :</td>
                                                <td colspan="3"> 
                                                   <input runat="server" type="date" id="Expiry_Date_Id" class="Expiry_Date_class form-control" name="Expiry_Date_Name"/>
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
                                            <tr><td></td><td> <select class="form-control custom-select d-block w-100 unit_of_measure_class" runat="server" id="inv_unit_measurement"></select></td></tr>
                                            <tr>
                                                <td>Quantity :</td>
                                                <td>  <input runat="server" type="text" value="1" id="txtQty" name="" class="txtqty form-control"  placeholder="Qty" onkeyup="CalculateTotal(this);"></td>
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
                                                <td class="disc"> <input runat="server" type="text" id="txtdisc" name="discount" class="txtdisc_class form-control"  placeholder="Discount" value="0" onchange="checkgst()"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr class="tr_gst_Id">
                                                <td><input type="checkbox" class="chkigst_class" id="chkigst_Id" onclick="chkigstcheck()"/><label>IGST  </label>&nbsp;<input type="checkbox" id="chkcgst_Id" class="chkcgst_class" onclick="chkcgstcheck()"/><label>CGST/SGST  </label></td>
                                                <td><input type="text" class="form-control txtIgst_class" id="txtIgst" value="0" placeholder="Igst amount"/><input type="text" class="form-control txtCgst_class" id="txtCgst" value="0" placeholder="Cgst amount"/><input type="text" id="txtSgst" value="0" class="form-control txtSgst_class" placeholder="Sgst amount"/></td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            
                                            <tr>
                                            <td><input type="button" class="btn btn-primary" value="Add" onclick="addproduct()" data-toggle="tooltip-dark" data-placement="top" title="Add in table"></td>

                                                </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                    </div>


				
             
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
							<%--<th style="border: 2px solid;">Rate</th>--%>
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
                          <th id="tot_Quant" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <%--<th id="tot_Rate" class="text-right font-weight-600" style="border: 2px solid"></th>--%>
                          <th id="tot_Amt" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Dis" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Taxval" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Igst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Cgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Sgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th id="tot_Amt_tax" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          <th colspan="3" class="text-right font-weight-600" style="border: 2px solid"></th>
                        
                      </tr>
                         <tr>
                            <th  colspan="8" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th  colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_tax" class="text-right font-weight-600" style="border: 2px solid">0</th>
                           
                      </tr>
                     <tr>
                            <th colspan="8" class="text-center font-weight-600" ></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" class="text-right font-weight-600" style="border: 2px solid">0</th>
                           
                      </tr>
                      <tr>
                            <th colspan="8" class="text-center font-weight-600"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" class="text-right font-weight-600" style="border: 2px solid">0</th>
                          
                      </tr>
                      <tr>
                            <th colspan="8" class="text-center font-weight-600"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" class="text-right font-weight-600" style="border: 2px solid">0</th>
                         
                      </tr>
                          <tr>
                            <th colspan="8" class="text-center font-weight-600"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_add_atr_tax" class="text-right font-weight-600" style="border: 2px solid">0</th>
                         
                      </tr>

                      </tfoot>                            
					</table>
	      </div>
        </div>
                <div style="position:absolute;z-index: -1;">
                    <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
                    <input type="text" runat="server" id="sell_name" style="visibility:hidden" class="sellname" runat="server" />
                    <input type="text" id="sell_address" style="visibility:hidden" class="selladdress" runat="server" />
                    <input type="text" id="txtgstin" style="visibility:hidden"  class="txt_gstin" runat="server" />
                    <input type="text" id="txt_sell_state" style="visibility:hidden" class="txt_sellstate" runat="server" />
                    <input type="text" id="txt_sell_state_code" style="visibility:hidden" class="txt_sellstatecode" runat="server" />
                    <input type="text" id="hdn_invoice_id" style="visibility:hidden" class="hdn_invoice_class" runat="server" />
                    <input type="text" name="total_cost" style="visibility:hidden" ID="total_cost" class="totalcost" runat="server" />
                    <input type="text" name="total_without_tax" style="visibility:hidden" ID="total_without_tax" class="totalwithouttax" runat="server" />
                    <input type="text" name="total_gst" style="visibility:hidden" ID="total_gst" class="totalgst" runat="server" />
                    <input type="text" name="total_igst" style="visibility:hidden" ID="total_igst" class="totaligst" runat="server" />
                    <input type="text" name="total_cgst" style="visibility:hidden" ID="total_cgst" class="totalcgst" runat="server" />
                    <input type="text" name="total_sgst" style="visibility:hidden" ID="total_sgst" class="totalsgst" runat="server" />
                    <input type="text" name="total_discount" style="visibility:hidden" ID="total_discount" class="totaldiscount" runat="server" />
                    <input type="text" name="payment_mode" style="visibility:hidden" ID="payment_mode" class="paymentmode" runat="server" />
                    <input type="text" name="payment_status" style="visibility:hidden" ID="payment_status" class="paymentstatus" runat="server" />
                   <input type="text" name="invoice_type" style="visibility:hidden" ID="invoice_type" class="invoicetype" runat="server" />
                    <input type="text" style="visibility:hidden" ID="total_total_amt" class="total_totalamt" runat="server" />
                 </div>                    
                 <div>
                     <label><b>JV :  </b></label>
                     <input type="checkbox" runat="server" id="chkJV_id" class="chkJV_class" onclick="return false;" />
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
        <div class="row">
               <div class="col-sm">
                 <!-- Button trigger modal -->
                <button type="button" id="btnVerCentMod" class="btn btn-primary example-modal-center" onclick="btnClick()" data-toggle="modal" data-target="#exampleModalCenter" data-placement="top" title="Save Purchase Invoice">Save</button>
                <asp:Button runat="server" class="btn btn-info" type="" id="btnPrint" text="Print" OnClick="btnPrintClick" data-toggle="tooltip-dark" data-placement="top" title="Print data Purchase Invoice"/>
                <input type="button" class="btn btn-warning" id="btnReset" value="Reset" onclick="ResetChange();" data-toggle="tooltip-dark" data-placement="top" title="Clear all Form"/> 
                <asp:Button runat="server" class="btn btn-light" type="submit" id="btnCancel" text="Cancel" OnClick="cancel_event" data-toggle="tooltip-dark" data-placement="top" title="Leave Page"/> 
                <!-- Modal -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Purchase</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip-dark" data-placement="top" title="Clear">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body pareches-invoice-model">
                                <p>Do you want to Submit?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button runat="server" class="btn btn-primary" type="submit" id="submit_account_details" text="Save Changes" OnClick="submit_account_details_event" data-toggle="tooltip-dark" data-placement="top" title="Save the Data"/>
                                <%--<button type="button" runat="server" class="btn btn-primary" OnClick="submit_account_details_event">Save changes</button>--%>
                            </div>
                        </div>
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
                       <button type="button" class="btn btn-secondary btn_AddStock_No_Class" data-dismiss="modal" onclick="$('.product-name').val(''); ">NO</button>
                       <button type="button" class="btn btn-primary btn_AddStock_Yes_Class" id="btn_AddStock_Yes_Id" onclick="StockBtnOnClick()">YES</button>                                              
                   </div>
               </div>
           </div>
         </div>

                            <div class="row">
                                <div class="col-sm">
                                    <div class="modal fade" id="modalYesClick" tabindex="-1" role="dialog" aria-labelledby="modalYesClick" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <%--<div class="modal-header_yes">
                                                    <h5 class="modal-title_yes">Add Sale Invoice</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip-dark" data-placement="top" title="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>--%>
                                                <div class="modal-body pareches-invoice-model">
                                                    <p id="para_Header_Id">This Party Name not Available, Do You Want Add this Party Name?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary btn_No_Class" onclick="window.location.href = '/Vouchers/PurchaseDetails.aspx';">NO</button>
                                                    <button type="button" class="btn btn-primary btn_Yes_Class" id="btn_Yes_Id" onclick="yesClick(this)">YES</button>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              </div>
    </div>

    <script language='javascript'>
       
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
        //Bind Supplier DDL
      function select2_options() {
        var keys1 = '<%=json_display_content%>';
        var p_key_obj = JSON.parse(keys1);
        var json_obj = '<%=json_obj %>';
        var p_json_obj = JSON.parse(json_obj);
        var table_Object = "";
        table_Object += "<option onclick='' value='0'>Select Supplier</option>";

        p_json_obj.forEach(function(elementObject, index) {
            table_Object += "<option data-index='" + index + "' value='" + elementObject.account_party_name + "'>" + elementObject.account_party_name + "</option>";
        });
        $(".seller_name").html(table_Object);
        $(".select2").select2();
      }
        //Supplier select2 action
    $('.seller_name').on('select2:select', function (e)  {
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
       -     $(".seller_state_code").hide();
        }else {
            $(".seller_state_code").html(p_json_obj[id]['account_state_code']);
            $(".seller_state_code").show();
        }
        $(".seller_state").html(p_json_obj[id]['account_state']);
    }
        

        var availableProductName = null;
        var prodcutObject = null;
        // page Load
        window.onload = function () {
            //$(".invoice-no").attr("disabled", false);
            $(".invoice-no").show();
            $(".tr_gst_Id").hide();
             $(".hdn_invoice_class").val($(".invoice-no").val());
            select2_options();           

            if($('[id*=breadcrumb_title]').text() == "Update Purchase") {
                SETVALUE();
                updateval('<%=json_purchase_obj %>');
                //$(".invoice-no").attr("disabled", true);
                $(".invoice-no").hide();
                if ($('.seller_name option:selected').text() == "") {
                    $("#modalYesClick").modal('show');
                }
            }

                  availableProductName = JSON.parse('<%=json_product_name %>');
                  prodcutObject = JSON.parse('<%=json_product%>');
                  //availableProductName = JSON.parse(availableTags);
                  $(".product-name").autocomplete({ 
                  
                  source: availableProductName,
                  
                  select: function(event, ui) {
                      var index = availableProductName.indexOf(ui.item.value);
                      var currentObj = $(this).parent().parent();
                      $(".hsn-code").html(prodcutObject[index].stock_hsn_sac_code);
                  
                      if(prodcutObject[index].stock_gst_rate == "" || prodcutObject[index].stock_gst_rate == null) {
                          $(".gst_rate").html("0");
                      } else {
                          $(".gst_rate").html(prodcutObject[index].stock_gst_rate);
                      }
                      //$(".Batch_class").val(prodcutObject[index].stock_batch);
                      //if (prodcutObject[index].stock_expiry_date == "" || prodcutObject[index].stock_expiry_date == null) {
                      //    $(".Expiry_Date_class").val("0001-01-01");
                      //} else {
                      //    $(".Expiry_Date_class").val(prodcutObject[index].stock_expiry_date);
                      //}
                      if (prodcutObject[index].stock_mrp == "" || prodcutObject[index].stock_mrp == null) {
                          mrp_per_unit = 0.00;
                      } else {
                          mrp_per_unit = prodcutObject[index].stock_mrp;
                      }
                      if (prodcutObject[index].stock_sale_price_without_gst == "" || prodcutObject[index].stock_sale_price_without_gst == null) {
                          mrp_sell_price = 0.00;
                      } else {
                          mrp_sell_price = prodcutObject[index].stock_sale_price_without_gst;
                      }
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
                       uom_table_Object += "<option data-default='"+is_deff1+"' "+temp_pri+" data-conversion-factor='1' value='" + prodcutObject[index].stock_pri_unit_of_measurment + "'>" + prodcutObject[index].stock_pri_unit_of_measurment + " (Primary) </option>";
                       uom_table_Object += "<option data-default='"+is_deff2+"' "+temp_sec+"  data-conversion-factor='"+ prodcutObject[index].stock_conversion_factor +"' value='" + prodcutObject[index].stock_sec_unit_of_measurement + "'>" + prodcutObject[index].stock_sec_unit_of_measurement + " (Secondary) </option>";
                  
                      $(".unit_of_measure_class").html(uom_table_Object);
                       $(".select2").select2();
                  
                      $(".lbluom").html(prodcutObject[index].stock_unit_of_measurment);
                      $(".tr_gst_Id").show();
                      if($(".state-code").text() == $(".seller_state_code").text()) {
                          chkcgstcheck();
                      } else {
                          chkigstcheck();
                      }
                  }            
                  }).focusout(function () {
                
                        var inputValue = $(".product-name").val();
                             var idx = jQuery.inArray(inputValue, availableProductName);
                        if (idx == -1  && inputValue != "") {                         
                            $("#exampleModalCenterAutocomplete").modal('show');
                                 $(".modal-title").text("Add Product Name");                           
                                 $("#parag_Header_Id").html("This Product Not Available, Do You Want Add This Product Click YES?");
                                 $(".btn_AddStock_No_Class").show();
                                 $(".btn_AddStock_Yes_Class").show();  
                             }
                        });
                  
                  var availablegstin = JSON.parse('<%=json_gstin_name%>');
                  var partyObject = JSON.parse('<%=json_obj%>');
                  $(".gstin").autocomplete({
                      source: availablegstin,
                      select: function (event, ui) {
                          var index = availablegstin.indexOf(ui.item.value);
                          var currentObj = $(this).parent().parent();
                          $(".seller_name").val(partyObject[index].account_party_name).trigger('change.select2');
                          trclick($(".seller_name option:selected").attr("data-index"));
                          
                      }
                  });

                 settingsCheck();
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
        var seller_val = null;
   // Setvalue Select tag action only update
       function SETVALUE() {            
            var jsonSettings = '<%=json_pur_obj%>';
           var p_json_obj = JSON.parse(jsonSettings);
           seller_val = p_json_obj[0]['sellername'];
            $(".seller_name").val(p_json_obj[0]['sellername']).trigger('change');
        }

        function StatusChange(){
            if($(".pay_Status").val() == "Not Paid"){
                $(".pay_mode").hide();
                $(".pay_mode option:selected" ).val("");
            }else{
                $(".pay_mode").show();
            }
        }

        function btnClick() {
            $(".total_totalamt").val(parseFloat($("#tot_amt_add_atr_tax").text()));
            $(".totalcost").val($("[id*=tot_Amt_tax]").text());
            $(".totalwithouttax").val($("#tot_invoice_tax").text());
            if ($(".state-code").text() == $(".seller_state_code").text()) {
                $(".totalgst").val(parseFloat($("#tot_add_cgst").text()) + parseFloat($("#tot_add_sgst").text())); 
                
            } else {
                $(".totalgst").val($("#tot_add_igst").text());
            }
            
            $(".totaligst").val(parseFloat($("#tot_add_igst").text()));
            $(".totalcgst").val($("#tot_add_cgst").text());
            $(".totalsgst").val($("#tot_add_sgst").text());
            $(".totaldiscount").val($("#tot_Dis").text());
            $(".paymentmode").val($('[id*=selectPayMode').val());
            $(".paymentstatus").val($('[id*=selectPayStatus').val()); 
            $(".invoicetype").val("purchase");
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
        var tot = 0;

        var igstrate = "0";
        var igstAmt ="0";
        var cgstrate = "0";
        var cgstAmt = "0";
        var sgstrate = "0";
        var sgstAmt ="0";

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
            else {
                
                convert_qty();
                var disc = convert_number($("[id*=txtdisc]").val());
                var original_val = convert_number($(".total").text());
                tax_val = (original_val - disc);

                var gstRate = convert_number($(".gst_rate").text());
                var gstVal = convert_number(gstRate) / 2;
                var gst_amount = (convert_number(tax_val*gstVal)/100);
                tot =  convert_number(tax_val+(gst_amount*2));
                
                if ($(".state-code").text() == $(".seller_state_code").text())
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

                $('#myTable> tbody:last').append('<tr>'+
                    '<td style="border:1px solid!important;" class="product-discription">'+ (i + 1)  +'</td>'+ 
                    '<td style="border:1px solid!important;" class="product-discription">'+ $("[id*=txtproduct_name]").val()  +'</td>'+ 
                    '<td style="border:1px solid!important;" class="hsncode">'+ $(".hsn-code").text()+'</td>'+
                    '<td style="border:1px solid!important;" class="uom">'+ $(".lbluom").text()+'</td>'+
                    '<td style="border:1px solid!important;" class="batchClass">'+ $(".Batch_class").val()+'</td>'+
                    '<td style="border:1px solid!important;" class="expiryClass">'+ (Date.parse($(".Expiry_Date_class").val())?$(".Expiry_Date_class").val():"0001-01-01")+'</td>'+
                    '<td style="border:1px solid!important;" class="qty">'+ $("[id*=txtQty]").val()+'</td>'+
                    //'<td style="border:1px solid!important;" class="rate">'+ $(".gst_rate").text()+'</td>'+
                    '<td style="border:1px solid!important;" class="amount">'+ convert_number($(".total").text()) +'</td>' +
                    '<td style="border:1px solid!important;" class="discount">'+ $("[id*=txtdisc]").val() + '</td>'+
                    '<td style="border:1px solid!important;" class="tax-value">'+ tax_val + '</td>'+                    
                   '<td style="border:1px solid!important;" class="igst-rate">'+ igstrate +'</td>'+
                   '<td style="border:1px solid!important;" class="igst-amount">'+ igstAmt +'</td>' +               
                  '<td style="border:1px solid!important;" class="cgst-rate">'+ cgstrate +'</td>' +
                  '<td style="border:1px solid!important;" class="cgst-amount">'+ cgstAmt +'</td>' +
                  '<td style="border:1px solid!important;" class="sgst-rate">'+ sgstrate +'</td>'+
                  '<td style="border:1px solid!important;" class="sgst-amount">'+ sgstAmt +'</td>' +
                  '<td style="border:1px solid!important;" class="tot_class">'+ tot +'</td>' +
                  '<td style="border:1px solid!important;" class="mrp-per-unit">' + mrp_per_unit + '</td>' +
                  '<td style="border:1px solid!important;" class="sale-price-per-unit">'+ mrp_sell_price +'</td>' +
                  '<td  style="border:1px solid!important;"><i class="fa fa-pencil" style="font-size:25px;color:#17a2b8" aria-hidden="true" onclick="editRow(this), removeRow(this)"></i><i class="fa fa-close" name="record" style="font-size:30px;color:red" aria-hidden="true" onclick="removeRow(this)"></i>'
                  + '</tr>'               
                );
                
                i++;
                settingsCheck();
                if($(".state-code").text() == $(".seller_state_code").text())
                {
                    $('td:nth-child(11),th:nth-child(11)').hide();
                    $('td:nth-child(12),th:nth-child(12)').hide();
                    $('td:nth-child(13),th:nth-child(13)').show();
                    $('td:nth-child(14),th:nth-child(14)').show();
                    $('td:nth-child(15),th:nth-child(15)').show();
                    $('td:nth-child(16),th:nth-child(16)').show();
                    $("#tot_Igst").hide();
                    document.getElementById("tot_Igst").colSpan = "0"; 
                    
                } else {
                    $('td:nth-child(11),th:nth-child(11)').show();
                    $('td:nth-child(12),th:nth-child(12)').show();
                    $('td:nth-child(13),th:nth-child(13)').hide();
                    $('td:nth-child(14),th:nth-child(14)').hide();
                    $('td:nth-child(15),th:nth-child(15)').hide();
                    $('td:nth-child(16),th:nth-child(16)').hide();
                    $("#tot_Cgst").hide();
                    $("#tot_Sgst").hide();
                    document.getElementById("tot_Cgst").colSpan = "0"; 
                    document.getElementById("tot_Sgst").colSpan = "0"; 
                   }
               calculate();
                $("[id*=txtproduct_name]").val("");
                $(".hsn-code").text("");
                $(".gst_rate").text("");
                $(".lbluom").text("");
                $(".Batch_class").val("");
                $(".Expiry_Date_class").val("0001-01-01");
                $("[id*=txtAmount]").val("0");
                $(".total").text("");
                $("[id*=txtQty]").val("1");
                $("[id*=txtdisc]").val("0");
                $("[id*=txtIgst]").val("0");
                $("[id*=txtCgst]").val("0");
                $("[id*=txtSgst]").val("0");
            }
            
            $('[id*=sell_name').val($(".seller_name option:selected").text());
            $('[id*=sell_address').val($(".seller_address").text());
            $('[id*=txtgstin').val($(".gstin").val());
            $('[id*=txt_sell_state').val($(".seller_state").text());
            $('[id*=txt_sell_state_code').val($(".seller_state_code").text());
        }

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
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Sgst]").text("" + convert_number(sum_of));


           sum_of = 0.0;
            $(".tot_class").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $("[id*=tot_Amt_tax]").text("" + convert_number(sum_of));

            $("#tot_invoice_tax").text($("[id*=tot_Taxval]").text());
            $("#tot_add_igst").text($("[id*=tot_Igst]").text());
            $("#tot_add_cgst").text($("[id*=tot_Cgst]").text());
            $("#tot_add_sgst").text($("[id*=tot_Sgst]").text());
            $("#tot_amt_add_atr_tax").text($("[id*=tot_Amt_tax]").text());
            
          
        }

     //for remove product in table record
        function removeRow(row) {
        
            var tr = $(row).parents("tr");
            $(row).parents("tr").remove();
            calculate();
        }

        //Edit Table Record
        function editRow(row) {            
           var tr = $(row).parents("tr");
            $("[id*=txtproduct_name]").val($(tr).find('td:eq(1)').text());
            $('.product-name').autocomplete('search', $(tr).find('td:eq(1)').text());
            $(".ui-menu-item").eq(0).focus().click();
            $(".hsn-code").text($(tr).find('td:eq(2)').text());
            //$(".gst_rate").text($(tr).find('td:eq(7)').text());
            $(".lbluom").text($(tr).find('td:eq(3)').text());
            $(".Batch_class").val($(tr).find('td:eq(4)').text());            
            $(".Expiry_Date_class").val($(tr).find('td:eq(5)').text());

            var qty = edit_convert_qty(parseFloat($(tr).find('td:eq(6)').text()));
            var amt = parseFloat($(tr).find('td:eq(7)').text());             
            $(".total").text(""+amt);
            $("[id*=txtAmount]").val(""+(amt / qty));
            $("[id*=txtQty]").val(qty);
            $(".txtdisc_class").val($(tr).find('td:eq(8)').text());
            //$(".total").text($(tr).find('td:eq(10)').text());
            //$("[id*=txtQty]").val($(tr).find('td:eq(6)').text());
            //$("[id*=txtdisc]").val($(tr).find('td:eq(9)').text());
            $("[id*=txtIgst]").val($(tr).find('td:eq(11)').text());
            $("[id*=txtCgst]").val($(tr).find('td:eq(13)').text());
            $("[id*=txtSgst]").val($(tr).find('td:eq(15)').text());
           // removeRow($(row).parents("tr"));
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

        $("#btnVerCentMod").click(function() { 

            if($("[id*=invoice_no]").val() =="" || $("[id*=invoice_no]").val() == null){
                warning_message("Please Enter Invoice No...!!");
                return false;
            }             
            else {
                create_json();
            }
        });    
        
        function create_json() {
             var JSONObject = new Array();
           $('#myTable tbody tr').each(function(row, tr){
                    var values = {};
                    values.invoiceno =  $(".invoice-no").val();
                    //values.sellername = $(".seller_name option:selected").text();
                    values.inv_date = $(".input-date").val();
                    values.product_desc = $(tr).find('td:eq(1)').text();
                    values.hsn_code = $(tr).find('td:eq(2)').text();
                    values.uom = $(tr).find('td:eq(3)').text();
                    values.batch = $(tr).find('td:eq(4)').text();
                    values.EXPIRYDATE = $(tr).find('td:eq(5)').text();
                    values.qty = $(tr).find('td:eq(6)').text();
                    values.amount = $(tr).find('td:eq(7)').text();
                    values.discount= $(tr).find('td:eq(8)').text();
                    values.TAXVAL= $(tr).find('td:eq(9)').text();
                   
                    if($(".state-code").text() == $(".seller_state_code").text())
                    {
                        values.IRATE = $(tr).find('td:eq(10)').text();
                        values.IAMT = $(tr).find('td:eq(11)').text();
                        values.CRATE =$(tr).find('td:eq(12)').text();
                        values.CAMT = $(tr).find('td:eq(13)').text();
                        values.SRATE =$(tr).find('td:eq(14)').text();
                        values.SAMT = $(tr).find('td:eq(15)').text();
                    } else {                
                        values.IRATE = $(tr).find('td:eq(10)').text();
                        values.IAMT =  $(tr).find('td:eq(11)').text();
                        values.CRATE = $(tr).find('td:eq(12)').text();
                        values.CAMT =  $(tr).find('td:eq(13)').text();
                        values.SRATE = $(tr).find('td:eq(14)').text();
                        values.SAMT =  $(tr).find('td:eq(15)').text();
                    }                    
                    values.STATUS = "0";
                    values.INVOICETYPE = "purchase";
                    JSONObject.push(values);
                });
            
                var json_str = JSON.stringify(JSONObject); 
                $(".txthdn_Json").val(json_str);
                $(".sellname").val($(".seller_name option:selected").text());
                $('[id*=sell_name').val($(".seller_name option:selected").text());
                $('[id*=sell_address').val($(".seller_address").text());
                $('[id*=txtgstin').val($(".gstin").val());
                $('[id*=txt_sell_state').val($(".seller_state").text());
                $('[id*=txt_sell_state_code').val($(".seller_state_code").text());
        }
        function updateval(data) {
            
            jsonPurchase = data;
            var p_json_obj = JSON.parse(jsonPurchase);
            var count = JSON.parse(jsonPurchase).length;
            for(var i = 0; i < count; i++) {                
                $(".product-name").val(p_json_obj[i]['product_desc']);
                $(".hsn-code").html(p_json_obj[i]['hsn_code']);
                $(".gst_rate").html(p_json_obj[i]['igst_rate']+p_json_obj[i]['cgst_rate']+p_json_obj[i]['sgst_rate']);
                $(".lbluom").html(p_json_obj[i]['uom']);  
                $(".Batch_class").val(p_json_obj[i]['batch']); 
                $(".Expiry_Date_class").val(p_json_obj[i]['expiry_date']); 
                $(".amount").val(p_json_obj[i]['amount']);
                $(".txtqty").val(p_json_obj[i]['qty']);
                $(".total").html(p_json_obj[i]['tax_val'] + p_json_obj[i]['discount']);
                $(".txtdisc_class").val(p_json_obj[i]['discount']);
                

                $(".txtIgst_class").val(p_json_obj[i]['igst_amt']);
                $(".txtCgst_class").val(p_json_obj[i]['cgst_amt']);
                $(".txtSgst_class").val(p_json_obj[i]['sgst_amount']);                
                addproduct();            
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
                $(".input-date").val(p_json_obj_mst[i]['inputdate']);
                $(".reve_charge").val(p_json_obj_mst[i]['revecharge']);
                $(".seller_name").val(p_json_obj_mst[i]['sellername']).trigger('change');
                $(".gstin").val(p_json_obj_mst[i]['gstin']);
                $(".seller_address").html(p_json_obj_mst[i]['selleraddress']);
                $(".seller_state").html(p_json_obj_mst[i]['sellerstate']);
                $(".seller_state_code").html(p_json_obj_mst[i]['sellerstatecode']);
                $("[id*=txtremark]").val(p_json_obj_mst[i]['txtremark']);
                $(".pay_Status").val(p_json_obj_mst[i]['payStatus']);
                $(".pay_mode").val(p_json_obj_mst[i]['paymode']);
                StatusChange();
            }
            for(var i = 0; i < count; i++) {                
                $(".product-name").val(p_json_obj[i]['product_desc']);
                $(".hsn-code").html(p_json_obj[i]['hsn_code']);
                $(".gst_rate").html(p_json_obj[i]['igst_rate']+p_json_obj[i]['cgst_rate']+p_json_obj[i]['sgst_rate']);
                $(".lbluom").html(p_json_obj[i]['uom']);                
                $(".amount").val(p_json_obj[i]['amount']);
                $(".txtqty").html(p_json_obj[i]['qty']);
                $(".txtdisc_class").html(p_json_obj[i]['discount']);                
                CalculateTotal();
                addproduct();                              
            }            
        } 

      //  var jsonSettings = null;
        function settingsCheck() {            
            var jsonSettings = '<%=json_setting_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            for(var i = 0; i < count; i++){
               
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

                if(p_json_obj[i]['expiry_monitoring_system'] == "1"){
                    $("[id*=expiry_tr_id]").show();
                    //$('td:nth-child(6),th:nth-child(6)').show();
                    
                } else{
                    $("[id*=expiry_tr_id]").hide();
                    //$('td:nth-child(6),th:nth-child(6)').hide();
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

                if (p_json_obj[i]['expiry_details_tax_invoice'] == "1") {
                    $('td:nth-child(6),th:nth-child(6)').show();                   
                } else{
                    $('td:nth-child(6),th:nth-child(6)').hide();
                    document.getElementById("foot_tot").colSpan = "4";
                    $("[id*=tot_Dis]").show();
                    $("[id*=tot_Taxval]").show();
                }

               
                if(p_json_obj[i]['mrp_details'] == "1"){
                    $('td:nth-child(18),th:nth-child(18)').show();
                    //mrp_per_unit =  p_json_obj[i]['mrp_invoice_details'];
                    
                } else{
                    $('td:nth-child(18),th:nth-child(18)').hide();
                    //mrp_per_unit = p_json_obj[i]['mrp_invoice_details'];
                }

                if(p_json_obj[i]['sale_price_details'] == "1"){
                    $('td:nth-child(19),th:nth-child(19)').show();
                    //mrp_sell_price = p_json_obj[i]['sale_price_details_info']
                } else{
                    $('td:nth-child(19),th:nth-child(19)').hide();
                    //mrp_sell_price =p_json_obj[i]['sale_price_details_info']
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

        function ResetChange(){
            
            //$(".invoice-no").val("");
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
        }
       
        var jsonStr = "";
        function create_json_mst() {
            var JSONObject = new Array();
            var values = {};
            values.invoiceno = $(".invoice-no").val();
            values.inputdate = $(".input-date").val();
            values.revecharge = $(".reve_charge").val();
            values.sellername = $(".seller_name option:selected").val();
            values.gstin = $(".gstin").val();
            values.selleraddress = $(".seller_address").text();
            values.sellerstate = $(".seller_state").text();
            values.sellerstatecode = $(".seller_state_code").text();
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
            window.location.href = window.location='/Master/AddAccount?redirect=purchase';
         }

        function StockBtnOnClick() {
            create_json_mst();
            create_json();
            localStorage.setItem('items', $(".txthdn_Json").val());
            localStorage.setItem('items1', jsonStr);
            window.location.href = window.location='/Master/AddStock?redirect=purchase';
        }

        function checkgst() {
            if ($("[id*=txtproduct_name]").val() == "") {
                warning_message("Please Select Product...!!");
                return false;
            } else {
                
                var disc = parseFloat($("[id*=txtdisc]").val());
                var original_val = $(".total").text();
                tax_val = (original_val - disc);
                
                var gstRate = parseFloat($(".gst_rate").text());
                var gstVal = parseFloat(gstRate) / 2;
                var gst_amount = parseFloat((tax_val * gstVal) / 100);
                
               // if ($(".chkigst_class").prop('checked') != true) {
                 //   $(".txtIgst_class").val("0");
                    $(".txtCgst_class").val(convert_number(gst_amount));
                    $(".txtSgst_class").val(convert_number(gst_amount));
               // } else {

                    $(".txtIgst_class").val(convert_number((tax_val * gstRate) / 100));
                   // $(".txtCgst_class").val("0");
                    //$(".txtSgst_class").val("0");
                //}
            }
        }


        function chkigstcheck() {
                $(".chkcgst_class").prop('checked', false);
                $(".chksgst_class").prop('checked', false);
                $(".chkigst_class").prop('checked', true);
                $(".txtIgst_class").show();
                $(".txtCgst_class").hide();
                $(".txtSgst_class").hide();
            checkgst();
            }

        function chkcgstcheck() {
            $(".chkcgst_class").prop('checked', true);
            $(".chksgst_class").prop('checked', true);
            $(".chkigst_class").prop('checked', false);
            $(".txtIgst_class").hide();
            $(".txtCgst_class").show();
            $(".txtSgst_class").show();
            checkgst();
        }
       
        function yesClick() {
            var JSONObject = new Array();          
            var values = {};
            values.party_name = seller_val;
            values.address = $(".seller_address").text();
            values.state = $(".seller_state").text();     
            values.statecode = $(".seller_state_code").text();
            values.gstin = $(".gstin").val();                                         
            JSONObject.push(values);
                
            var json_str = JSON.stringify(JSONObject); 
            // $(".txthdnJsonAccount_class").val(json_str);
            window.location.href = window.location = '/Master/AddAccount?redirect=purchase&editId=<%=Request.QueryString["value"] %>&val=' + json_str;
        }
  <% if (Request.QueryString["view"] != null)
        { %>
        $(document).ready(function () {
            $(".ContentPlaceHolder1 input").prop("disabled", true);
            $(".ContentPlaceHolder1 select").prop("disabled", true);
            $(".ContentPlaceHolder1 button").prop("disabled", true);
            $("#ContentPlaceHolder1_btnPrint").prop("disabled", false);

            $(".ContentPlaceHolder1 i").prop("disabled", true);
            //$(".ContentPlaceHolder1 textarea").prop("disabled", true);
            setTimeout(function () {
                $(".ContentPlaceHolder1 .fa-pencil").hide();
                $(".ContentPlaceHolder1 .fa-close").hide();
            }, 500);
            $(".ContentPlaceHolder1 textarea").prop("disabled", true);
        });
        <% } %>


        
    </script>
</asp:Content>

