<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="ExpensesVoucher.aspx.cs" Inherits="WebBillingSystem.ExpensesVoucher" %>

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
            <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Expenses</li>
        </ol>
    </nav>
    <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Add Expenses</h4>
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
                                            <tr style="display: none;">
                                                <td colspan="1">Voucher Number </td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"> <label id="voucher_number_id" class="voucher_number_class" runat="server"></label>
                                                </td>

                                            </tr>
                                            <br />
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1">Voucher Date</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2">
                                                    <input type="date" runat="server" id="Voucher_Date_id" name="Voucher_Date_name" class="form-control mt-10 Voucher_Date_class" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="1">Place of Supply</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="place_suppl_id" class="form-control mt-10 PlaceOfSupply_class" name="PlaceOfSupply_name" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr>
                                                <td colspan="1">Reverse Charge (Y/N)</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2">
                                                    <select class="form-control mt-10" name="reversecharge" id="reverse_charge" runat="server">
                                                        <option value="NO">NO</option>
                                                        <option value="YES">YES</option>
                                                    </select>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                                </td>
                                            </tr>
                                            <tr id="state_tr_id" style="display:none;">
                                                <td>State </td>
                                                <td> :
                                                    <label runat="server" id="state_name" name="statename" class="statename_class"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" id="state_code" name="statecode" class="state_code_class"></label>
                                                </td>
                                            </tr>
                                            <tr style="display:none;">
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </h6>
                            </div>

                            <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <thead>
                                            <tr>
                                                <td colspan="4" style="text-align: center; color: darkred"><b>Details Of Supplier </b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="1">Invoice No </td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"> <input type="text" runat="server" id="txtInvoiceNo_Id" class="form-control txtInvoiceNo_class" /></td> 
                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">Invoice IRN No </td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"> <input type="text" runat="server" id="txtInvoiceIRNNo_id" class="form-control txtInvoiceIRNNo_class" />
                                                </td> 
                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>

                                            <tr>
                                                <td colspan="1">Name </td>
                                                <td colspan="1">:</td>
                                                <td colspan="1"><input type="text" runat="server" class="form-control mt-10 Supplier_Name_class" id="Supplier_Name_Id" name="Supplier_Name" /></td>
                                                <td colspan="1"><i class="glyphicon glyphicon-plus" onclick="AccountBtnOnClick()"></i></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">Address </td>
                                                <td colspan="1">:</td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="addressid" name="address_name" class="form-control address_class" />
                                                    <%--<label runat="server" style="width: 95%;" id="address_id" name="address_name" class="address_class"></label>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">GSTIN  :</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="gstinid" name="gstin_name" class="form-control gstin_class" onchange="var gstin_str =''; if($('.gstin_class').val() != '') { gstin_str = ($('.gstin_class').val()).substring(0, 2); } else { gstin_str = $('.state_code_class').val(); }"/>
                                                    <%--<label runat="server" id="gstin_id" name="gstin_name" class="gstin_class"></label>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                <hr class="mt-0">
                                            </tr>
                                            <tr style="display:none;">
                                                <td>State </td>
                                                <td>:
                                                    <label runat="server" class="state_name_class" id="state_id" name="state_name"></label>
                                                </td>
                                                <td>Code </td>
                                                <td>:
                                                    <label runat="server" class="statecode_class" id="statecode_id" name="statecode_name"></label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                        <hr class="hr-dark mt-10">
                    </div>

                    <h6 class="mb-5">
                        <table style="width: 100%; text-align: left;">
                            <tbody>
                                <tr>
                                    <td>Expenses Head</td>
                                    <td colspan="1">:</td>
                                    <td>
                                        <input type="text" runat="server" id="expenses_id" class="form-control mt-10 expenses_class" /></td>
                                    <td><i class="glyphicon glyphicon-plus" onclick="window.location='/Master/AddAccount?redirect=expenses';"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </h6>
                    <hr class="hr-dark mt-10">


                    <div class="invoice-from-wrap">
                        <div class="row">
                            <div class="col-md-6 mb-20">
                                <h6 class="mb-5">
                                    <table style="width: 100%; text-align: left;">
                                        <tbody>
                                            <tr>
                                                <td colspan="1">Product Desc</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"> <input type="text" runat="server" id="txtproduct_name" name="product-name" class="form-control mt-10 product-name" placeholder="Product Desc"></td>
                                                <td><i class="glyphicon glyphicon-plus" onclick="StockBtnOnClick()"></i></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">HSN Code</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2">
                                                    <input type="text" runat="server" id="hsn_Code_Id" name="hsn_Code_name" class="form-control mt-10 hsn_Code_Class" placeholder="HSN code" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
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
                                                <td colspan="1">Amount </td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"> <input type="text" runat="server" id="txtAmount" value="0" name="txtAmount" class="form-control mt-10 amount" placeholder="Amount" onkeyup="checkgst();"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td colspan="1">GST Rate</td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"><input type="text" runat="server" id="gst_rate_id" name="gst_rate_name" class="form-control mt-10 gst_rate_Class" placeholder="GST Rate" value="0" onkeyup="checkgst();"/> </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr class="tr_gst_Id">
                                                <td colspan="1"><input type="checkbox" class="chkigst_class" id="chkigst_Id" onclick="chkigstcheck()"/><label>IGST  </label>&nbsp;<input type="checkbox" id="chkcgst_Id" class="chkcgst_class" onclick="chkcgstcheck()" checked/><label>CGST/SGST  </label></td>
                                                <td colspan="1">:</td>
                                                <td colspan="2"><input type="text" class="form-control txtIgst_class" id="txtIgst" value="0" placeholder="Igst amount"/><input type="text" class="form-control txtCgst_class" id="txtCgst" value="0" placeholder="Cgst amount"/><input type="text" id="txtSgst" value="0" class="form-control txtSgst_class" placeholder="Sgst amount"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="button" class="btn btn-primary" value="Add" onclick="addproduct()" data-toggle="tooltip-dark" data-placement="top" title="Add in Table"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            </div>
                        </div>
                    </div>
                    <!-- #Product Add -->

                    <table class="table table-light table-bordered" id="myTable" style="border: 1px solid;">
                        <thead class="thead-light">
                            <tr>
                                <th style="border: 2px solid;">Sr. No.</th>
                                <th style="border: 2px solid;">Description of Product/Service</th>
                                <th style="border: 2px solid;">HSN code</th>
                                <th style="border: 2px solid;">Taxable Value</th>
                                <th style="border: 2px solid; display:none;">Rate</th>
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
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid"><b>total</b></th>
                                <th id="tot_Taxval" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                                <th id="tot_Rate" colspan="1" class="text-right font-weight-600" style="border: 2px solid; display:none;">0.00</th>
                                <th id="tot_Igst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                                <th id="tot_Cgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                                <th id="tot_Sgst" colspan="2" class="text-right font-weight-600" style="border: 2px solid;">0.00</th>
                                <th id="tot_Amt_tax" colspan="1" class="text-right font-weight-600" style="border: 2px solid;">0.00</th>
                                <th colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                            </tr>
                            <tr style="height: 50px">
                                <th colspan="11" class="text-center font-weight-600" style="border: 2px solid; vertical-align: text-top;"><b>Total Amount paid (In words)</b></th>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-center font-weight-600" style="border: 2px solid; font-size: 12px;">Ceritified that the particulars given above are true and correct</th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                                <th colspan="1" id="tot_invoice_tax" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-center font-weight-600" style="border: 2px solid;">
                                    <label runat="server" id="lblCompName" style="color: darkgray; vertical-align: text-top; text-emphasis-color: darkblue">For MJL & Co</label></th>
                                <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                                <th colspan="1" id="tot_add_igst" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                                <th colspan="1" id="tot_add_cgst" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                            </tr>

                            <tr>
                                <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                                <th colspan="1" id="tot_add_sgst" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                            </tr>

                            <tr>
                                <td colspan="4" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;">
                                    <label runat="server" class="sign_class" id="auth_id" style="color: darkgray; vertical-align: text-top;"></label>
                                </td>
                                <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid">Total Tax Amount (GST)</th>
                                <th colspan="1" id="tot_gst_tax_amount" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                            </tr>


                            <tr>
                                <th colspan="4" class="text-center font-weight-600" style="border-left: 2px solid; border-bottom: 2px solid; vertical-align: bottom;">
                                    <%--<label runat="server" id="sign_Id" style="vertical-align: text-top;"></label><br />--%>
                               Authorised signatory
                                </th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">Common Seal</th>
                                <th colspan="3" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                                <th colspan="1" id="tot_amt_add_cgst" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                            </tr>

                        </tfoot>

                    </table>

                    <div>
                        <label><b>JV :  </b></label>
                        <input type="checkbox" runat="server" id="chkJV_id" class="chkJV_class" onclick="return false;"/>
                    </div>

                    <table style="width: 100%; text-align: left;">
                        <tbody>
                            <tr>
                                <td>
                                    <select id="selectPayMode" class="form-control custom-select  mt-10" runat="server" onchange="checkSupplier()">
                                        <option selected="" value="Cash">Cash Paid</option>
                                        <option value="Outstanding">Outstanding</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </section>
            </div>
        </div>

        <!-- end row -->
        <div class="row">
            <div class="col-sm">
                <asp:Button runat="server" class="btn btn-primary" type="submit" ID="submit_expenses_details" Text="Save" OnClick="submit_expenses_details_event" OnClientClick="saveValue();" data-toggle="tooltip-dark" data-placement="top" title="Save Data" />
            </div>
        </div>

        <input type="text" name="hdnJson" style="visibility: hidden" id="txthdnJson" class="txthdn_Json" runat="server" />

        <input type="text" id="suppname" style="visibility: hidden" class="sellname" runat="server" />
        <input type="text" id="suppAddr" style="visibility: hidden" class="selladdress" runat="server" />
        <input type="text" id="suppGstin" style="visibility: hidden" class="txt_gstin" runat="server" />
        <input type="text" id="suppstate" style="visibility: hidden" class="txt_sellstate" runat="server" />
        <input type="text" id="suppstatecode" style="visibility: hidden" class="txt_sellstatecode" runat="server" />

        <input type="text" style="visibility: hidden" id="total_cost" class="totalcost" runat="server" />
        <input type="text" style="visibility: hidden" id="total_gst" class="totalgst" runat="server" />
        <input type="text" style="visibility: hidden" id="total_igst" class="totaligst" runat="server" />
        <input type="text" style="visibility: hidden" id="total_cgst" class="totalcgst" runat="server" />
        <input type="text" style="visibility: hidden" id="total_sgst" class="totalsgst" runat="server" />
        <input type="text" name="payment_mode" style="visibility: hidden" id="payment_mode" class="paymentmode" runat="server" />

    </div>

    <script language='javascript'>

        document.onkeydown = function (event) {
            if (event.altKey && event.keyCode == 83) //ALT+S
            {
                $('#<%=submit_expenses_details.ClientID%>').click();
            }
        };
        var gstin_str = '';
        var availablePartyName = '';
        var partyObject = '';
        
        window.onload = function () {
           //$(".tr_gst_Id").hide();
            if ($('[id*=breadcrumb_title]').text() == "Update Expenses Voucher") {
                if($('.gstin_class').val() != '') { gstin_str = ($('.gstin_class').val()).substring(0, 2); } else { gstin_str = $('.state_code_class').val(); }
                updateval();
            }

            var availableProductName = JSON.parse('<%=json_product_name %>');

            $(".product-name").autocomplete({

                source: availableProductName,

                select: function (event, ui) {
                    var index = availableProductName.indexOf(ui.item.value);
                }
            });


             availablePartyName = JSON.parse('<%=json_Party_name %>');
             partyObject = JSON.parse('<%=json_obj%>');
            
            $(".Supplier_Name_class").autocomplete({
                source: availablePartyName,
                select: function (event, ui) {
                    var index = availablePartyName.indexOf(ui.item.value);
                    var currentObj = $(this).parent().parent();
                    $(".Bill_Party_index").val(index);

                    $(".address_class").val(partyObject[index].account_add_one);
                    $(".gstin_class").val(partyObject[index].account_gst_number);
                    $(".state_name_class").html(partyObject[index].account_state);
                    $(".statecode_class").html(Number(partyObject[index].account_state_code));

                   if($('.gstin_class').val() != '') { gstin_str = ($('.gstin_class').val()).substring(0, 2); } else { gstin_str = $('.state_code_class').val(); }
                    
                    if ($(".state_code_class").text() == gstin_str) {
                    
                    chkcgstcheck();
                        } else {
                    chkigstcheck();
                    }
                }
            //}).keyup(function () {
            //    if ($("[id*=selectPayMode]").val() == "Outstanding") {
            //        var isValid = false;
            //        for (i in availablePartyName) {
            //            if (availablePartyName[i].toLowerCase().match(this.value.toLowerCase())) {
            //                isValid = true;
            //            }
            //        }
            //        if (!isValid) {
            //            this.value = previousValue
            //        } else {
            //            previousValue = this.value;
            //        }
            //    }
            }).focusout(function () {
                
                if ($("[id*=selectPayMode]").val() == "Outstanding") { 
                    var error = 1;
                       for (i in availablePartyName) {
                           if (availablePartyName[i].toLowerCase().match(this.value.toLowerCase())) {
                               //this.value = availablePartyName[i]
                               error = 0;
                               break;
                           } 
                       }
                    if (error) {
                        $(".Supplier_Name_class").val("");
                        warning_message("Your Supplier is not in Master, Do You want TO Add?");
                    }                            
                }
            });
           
            var availablegstin = JSON.parse('<%=json_gstin_name%>');
            $(".gstin_class").autocomplete({
                source: availablegstin,
                select: function (event, ui) {
                    var index = availablegstin.indexOf(ui.item.value);
                    var currentObj = $(this).parent().parent();                    
                    $('.Supplier_Name_class').autocomplete('search', partyObject[index].account_party_name);
                    $(".ui-menu-item").eq(0).focus().click();
                }
            });

            var availableAccountHead = JSON.parse('<%=json_Account_head %>');

            $(".expenses_class").autocomplete({
                source: availableAccountHead,
                autoFocus: true,
            }).keyup(function () {
                var isValid = false;
                for (i in availableAccountHead) {
                    if (availableAccountHead[i].toLowerCase().match(this.value.toLowerCase())) {
                        isValid = true;
                    }
                }
                if (!isValid) {
                    this.value = previousValue
                } else {
                    previousValue = this.value;
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
            chkcgstcheck();
        }

        function updateval() {
            
            json_exp = '<%=json_exp_obj %>';
            if (json_exp != '') {
                var p_json_obj = JSON.parse(json_exp);
                var count = JSON.parse(json_exp).length;
                for (var i = 0; i < count; i++) {

                    $(".product-name").val(p_json_obj[i]['exp_product_name']);
                    $(".hsn_Code_Class").val(p_json_obj[i]['exp_hsn_code']);
                    $(".gst_rate_Class").val(p_json_obj[i]['rate']);
                    $(".amount").val(p_json_obj[i]['exp_tax_value']);
                    $(".txtIgst_class").val(p_json_obj[i]['exp_igst_amount']);
                    $(".txtCgst_class").val(p_json_obj[i]['exp_cgst_amount']);
                    $(".txtSgst_class").val(p_json_obj[i]['exp_sgst_amount']);
                    addproduct();
                }
            }
        }

        var tax_val = 0;
        var tot_Amount = 0;
        var tot_Rate = 0;
        var tot_Tax_Val = 0;
        var tot_igst_amt = 0;
        var tot_cgst_amt = 0;
        var tot_sgst_amt = 0;
        var tot_amount_tax = 0;
        
        var i = 0;

        function addproduct() {
            if ($("[id*=txtproduct_name]").val() == "" || $("[id*=txtproduct_name]").val() == null) {
                warning_message("Please Select Product...!!");
                return false;
            } else if ($("[id*=txtAmount]").val() == "0" || $("[id*=txtAmount]").val() == null || $("[id*=txtAmount]").val() == "") {
                warning_message("Please Enter Amount...!!");
                return false;
            }
            else {
                
                tax_val = parseFloat($("[id*=txtAmount]").val());
                var gstRate = parseFloat($(".gst_rate_Class").val());
                var gstVal = convert_number(gstRate) / 2;
                var gst_amount = convert_number((tax_val * gstVal) / 100);
                var tot = convert_number(tax_val + (gst_amount * 2));

                var igstrate = "0";
                var igstAmt = "0";
                var cgstrate = "0";
                var cgstAmt = "0";
                var sgstrate = "0";
                var sgstAmt = "0";

                if ($(".chkcgst_class").prop("checked") == true) {

                        igstrate = "0";
                        igstAmt = "0";
                        cgstrate = gstVal;
                        cgstAmt = convert_number($(".txtCgst_class").val());
                        sgstrate = gstVal;
                        sgstAmt = convert_number($(".txtSgst_class").val());
                    } else if ($(".chkigst_class").prop("checked") == true) {
                        igstrate = gstRate;
                    igstAmt = convert_number($(".txtIgst_class").val());
                    cgstrate = "0";
                    cgstAmt = "0";
                    sgstrate = "0";
                    sgstAmt = "0";
                   }
                
                $('#myTable> tbody:last').append('<tr>' +
                    '<td style="border:1px solid!important;">' + (i + 1) + '</td>' +
                    '<td style="border:1px solid!important;" class="product-discription">' + $("[id*=txtproduct_name]").val() + '</td>' +
                    '<td style="border:1px solid!important;" class="hsncode">' + $(".hsn_Code_Class").val() + '</td>' +
                    '<td style="border:1px solid!important;" class="tax-value">' + convert_number(tax_val) + '</td>' +
                    '<td style="border:1px solid!important; display:none;" class="gst-rate">' + gstRate + '</td>' +
                    '<td style="border:1px solid!important;" class="igst-rate">' + igstrate + '</td>' +
                    '<td style="border:1px solid!important;" class="igst-amount">' + igstAmt + '</td>' +
                    '<td style="border:1px solid!important;" class="cgst-rate">' + cgstrate + '</td>' +
                    '<td style="border:1px solid!important;" class="cgst-amount">' + cgstAmt + '</td>' +
                    '<td style="border:1px solid!important;" class="sgst-rate">' + sgstrate + '</td>' +
                    '<td style="border:1px solid!important;" class="sgst-amount">' + sgstAmt + '</td>' +
                    '<td style="border:1px solid!important;" class="tot_class">' + tot + '</td>' +
                    '<td  style="border:1px solid!important;"><i class="fa fa-close" name="record" style="font-size:30px;color:red" aria-hidden="true"  onclick="removeRow(this)"></i>'
                    + '</tr>'
                );
                i++;
                
                   if ($(".chkcgst_class").prop("checked") == true) {
                        $('td:nth-child(6),th:nth-child(6)').hide();
                        $('td:nth-child(7),th:nth-child(7)').hide();
                        $('td:nth-child(8),th:nth-child(8)').show();
                        $('td:nth-child(9),th:nth-child(9)').show();
                        $('td:nth-child(10),th:nth-child(10)').show();
                        $('td:nth-child(11),th:nth-child(11)').show();
                        $("#tot_Igst").hide();
                        $("#tot_Cgst").show();
                        $("#tot_Sgst").show();
                        $("#tot_Amt_tax").show();
                   } else if ($(".chkigst_class").prop("checked") == true) {
                        $('td:nth-child(6),th:nth-child(6)').show();
                        $('td:nth-child(7),th:nth-child(7)').show();
                        $('td:nth-child(8),th:nth-child(8)').hide();
                        $('td:nth-child(9),th:nth-child(9)').hide();
                        $('td:nth-child(10),th:nth-child(10)').hide();
                        $('td:nth-child(11),th:nth-child(11)').hide();
                        $('td:nth-child(12),th:nth-child(12)').show();
                        $("#tot_Cgst").hide();
                        $("#tot_Sgst").hide();
                        $("#tot_Igst").show();
                        $("#tot_Amt_tax").show();
                   }
                
                if($(".chkigst_class").prop("checked") == true) {
                    $('td:nth-child(6),th:nth-child(6)').show();
                    $('td:nth-child(7),th:nth-child(7)').show();
                    $('td:nth-child(8),th:nth-child(8)').hide();
                    $('td:nth-child(9),th:nth-child(9)').hide();
                    $('td:nth-child(10),th:nth-child(10)').hide();
                    $('td:nth-child(11),th:nth-child(11)').hide();
                    $('td:nth-child(12),th:nth-child(12)').show();
                    $("#tot_Cgst").hide();
                    $("#tot_Sgst").hide();
                    $("#tot_Igst").show();
                    $("#tot_Amt_tax").show();
                } else if ($(".chkcgst_class").prop("checked") == true) {
                    $('td:nth-child(6),th:nth-child(6)').hide();
                    $('td:nth-child(7),th:nth-child(7)').hide();
                    $('td:nth-child(8),th:nth-child(8)').show();
                    $('td:nth-child(9),th:nth-child(9)').show();
                    $('td:nth-child(10),th:nth-child(10)').show();
                    $('td:nth-child(11),th:nth-child(11)').show();
                    $("#tot_Igst").hide();
                    $("#tot_Cgst").show();
                    $("#tot_Sgst").show();
                    $("#tot_Amt_tax").show();
                }

                calculate()
                $("[id*=txtproduct_name]").val("");
                $(".hsn_Code_Class").val("");
                $(".gst_rate_Class").val("0");
                $(".txtIgst_class").val("0");
                $(".txtCgst_class").val("0");
                $(".txtSgst_class").val("0");
                $("[id*=txtAmount]").val("0");
            }

            $('[id*=suppname').val($(".Supplier_Name_class").text());
            $('[id*=suppAddr').val($(".address_class").val());
            $('[id*=suppGstin').val($(".gstin_class").val());
            $('[id*=suppstate').val($(".state_name_class").text());
            $('[id*=suppstatecode').val(Number($(".statecode_class").text()));

        }

        function calculate() {
            var sum_of = 0.0;
            $('#myTable tbody tr').each(function (row, tr) {
                var $input = $(this);
                var $row = $input.closest('tr');
                $row.find("td").eq(0).html(row + 1);
            });            
          
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
                sum_of = sum_of + parseFloat($(this).text());
            });
            $("[id*=tot_Cgst]").text("" + convert_number(sum_of));

           sum_of = 0.0;
            $(".sgst-amount").each(function (index) {
                sum_of = sum_of + parseFloat($(this).text());
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
            $("#tot_amt_add_cgst").text($("[id*=tot_Amt_tax]").text()); 
            
            if ($("[id*=tot_Igst]").text() == "0" || $("[id*=tot_Igst]").text() == "0.00") {
               $("#tot_gst_tax_amount").text(convert_number(parseFloat($("[id*=tot_Cgst]").text())+ parseFloat($("[id*=tot_Sgst]").text())));
            } else {
                 $("#tot_gst_tax_amount").text($("[id*=tot_Igst]").text());
            }            
        }

        function removeRow(row) {
            //    //for delete product 
           var tr = $(row).parents("tr");
            $(row).parents("tr").remove();
            calculate();
        }
        
        var jsonStr = "";
        function create_json_mst() {
            var JSONObject = new Array();
            var values = {};
            values.voucher_number = $(".voucher_number_class").text();
            values.Voucher_Date = $(".Voucher_Date_class").val();
            values.PlaceOfSupply = $(".PlaceOfSupply_class").val();
            values.revecharge = $("[id*=reverse_charge]").val();
            values.Supplier_Name = $(".Supplier_Name_class").val();
            values.gstin =     $(".gstin_class").val();
            values.address = $(".address_class").val();
            values.state_name = $(".state_name_class").text();
            values.statecode = $(".statecode_class").text();
            values.expenses = $(".expenses_class").val();
            values.selectPayMode = $(".selectPayMode").val();
            
            JSONObject.push(values);
            jsonStr = JSON.stringify(JSONObject); 
        }

        // Redirect Account Master
        function AccountBtnOnClick() {
            create_json_mst();
            saveValue();
            localStorage.setItem('items', $(".txthdn_Json").val());
            localStorage.setItem('items1', jsonStr);
            window.location.href = window.location='/Master/AddAccount?redirect=expenses';
        }

     // Redirect Inventory Master
        function StockBtnOnClick() {
            create_json_mst();
            saveValue();
            localStorage.setItem('items', $(".txthdn_Json").val());
            localStorage.setItem('items1', jsonStr);
            window.location.href = window.location='/Master/AddStock?redirect=expenses';
        }

        function updatevalLocal(data, data1) {
            
            json_expenses_dtl = data;
            jsonExpenses_mst = data1;
            var p_json_obj = JSON.parse(json_expenses_dtl);
            var p_json_obj_mst = JSON.parse(jsonExpenses_mst);
            
            var count = JSON.parse(json_expenses_dtl).length;
            var count_mst = JSON.parse(jsonExpenses_mst).length;

            for (var i = 0; i < count_mst; i++) {                
                $(".voucher_number_class").text(p_json_obj_mst[i]['voucher_number']);
                $(".Voucher_Date_class").val(p_json_obj_mst[i]['Voucher_Date']);
                $(".PlaceOfSupply_class").val(p_json_obj_mst[i]['PlaceOfSupply']);
                $("[id*=reverse_charge]").val(p_json_obj_mst[i]['revecharge']);
                $(".Supplier_Name_class").val(p_json_obj_mst[i]['Supplier_Name']);
                $(".gstin_class").val(p_json_obj_mst[i]['gstin']);
                $(".address_class").val(p_json_obj_mst[i]['address']);
                $(".state_name_class").text(p_json_obj_mst[i]['state_name']);
                $(".statecode_class").text(p_json_obj_mst[i]['statecode']);
                $(".expenses_class").val(p_json_obj_mst[i]['expenses']);
                $(".selectPayMode").val(p_json_obj_mst[i]['selectPayMode']);
            }
            for (var i = 0; i < count; i++) {                
                $(".product-name").val(p_json_obj[i]['PROD']);
                $(".hsn_Code_Class").val(p_json_obj[i]['HSN']);
                $(".gst_rate_Class").val(p_json_obj[i]['GSTRATE']);
                $(".amount").val(p_json_obj[i]['TAXVAL']);               
                addproduct();
            }
        }

    // onclick save(add controls value json in dtl table)
        function saveValue() {
            
                $(".totalcost").val($("#tot_amt_add_cgst").text());
                $(".totalgst").val($("#tot_gst_tax_amount").text());                
                $(".totaligst").val($("#tot_add_igst").text());
                $(".totalcgst").val($("#tot_add_cgst").text());
                $(".totalsgst").val($("#tot_add_sgst").text());
                $(".paymentmode").val($('[id*=selectPayMode').val());

                var JSONObject = new Array();

                $('#myTable tbody tr').each(function (row, tr) {
                    var values = {};
                    values.VOUCNO = $(".voucher_number_class").text();
                    values.EXPHEAD = $(".expenses_class").val();
                    values.PROD = $(tr).find('td:eq(1)').text();
                    values.HSN = $(tr).find('td:eq(2)').text();
                    values.TAXVAL = $(tr).find('td:eq(3)').text();
                    values.GSTRATE = $(tr).find('td:eq(4)').text();
                    values.IRATE = $(tr).find('td:eq(5)').text();
                    values.IAMT = $(tr).find('td:eq(6)').text();
                    values.CRATE = $(tr).find('td:eq(7)').text();
                    values.CAMT = $(tr).find('td:eq(8)').text();
                    values.SRATE = $(tr).find('td:eq(9)').text();
                    values.SAMT = $(tr).find('td:eq(10)').text();
                    values.TOT = $(tr).find('td:eq(11)').text();
                    JSONObject.push(values);
                });
                var json_str = JSON.stringify(JSONObject);
                $(".txthdn_Json").val(json_str);            
        }

    //Add Master Setting json 
        function settingsCheck() {
            var jsonSettings = '<%=json_setting_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            for (var i = 0; i < count; i++) {
                if (p_json_obj[i]['journal_accounting_entry'] == "1") {
                    $(".chkJV_class").prop('checked', true);
                } else {
                    $(".chkJV_class").prop('checked', false);
                }
            }
        }

  // Add I/C/S GST Value 
        function checkgst() {
            
                tax_val = $("[id*=txtAmount]").val();
                var gstRate = $(".gst_rate_Class").val();
                var gstVal = parseFloat(gstRate) / 2;
                var gst_amount = ((tax_val * gstVal) / 100);
                var tot = (parseFloat(tax_val)+(gst_amount*2));
                $(".txtCgst_class").val(gst_amount);
                $(".txtSgst_class").val(gst_amount);
                $(".txtIgst_class").val((tax_val * gstRate) / 100);
        }

  //Check SGST
        function chkigstcheck() {
                $(".chkcgst_class").prop('checked', false);
                $(".chksgst_class").prop('checked', false);
                $(".chkigst_class").prop('checked', true);
                $(".txtIgst_class").show();
                $(".txtCgst_class").hide();
                $(".txtSgst_class").hide();
            checkgst();
        }

  // Check CGST AND SGST
        function chkcgstcheck() {
            $(".chkcgst_class").prop('checked', true);
            $(".chksgst_class").prop('checked', true);
            $(".chkigst_class").prop('checked', false);
            $(".txtIgst_class").hide();
            $(".txtCgst_class").show();
            $(".txtSgst_class").show();
            checkgst();
        }

        function checkSupplier() {            
            if ($("[id*=selectPayMode]").val() == "Outstanding") {
                var error = 1;
                for(i in availablePartyName) {
                    if (availablePartyName[i].toLowerCase().match(($(".Supplier_Name_class").val()).toLowerCase())) {
                        //this.value = availablePartyName[i]
                        error = 0;
                        break;
                    }
                }
                if (error) {
                    $(".Supplier_Name_class").val("");
                    warning_message("Your Supplier is not in Master, Do You want TO Add?");
                }
            }
        }       
    </script>
</asp:Content>