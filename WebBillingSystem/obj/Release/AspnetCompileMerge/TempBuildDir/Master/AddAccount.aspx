<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="WebBillingSystem.AddAccount" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">

    <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add account</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container" id="contain">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Add Account</h4>
                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-xl-12">
                        <section class="bg-light hk-sec-wrapper">
                          <!--  <h5 class="hk-sec-title">Default Layout</h5>
                            <p class="mb-25">More complex forms can be built using the grid classes. Use these for form layouts that require multiple columns, varied widths, and additional alignment options.</p>-->
                            <div class="row">
                                <div class="col-sm">
                                        <div class="row">   
                                            <div class="col-md-12 form-group">
                                                <label for="account_head">Account Head : *</label>
                                                <input class="form-control" name="account_head" runat="server" id="account_head" placeholder="" value="" type="text" onkeydown="upperCaseF(this)" onchange='if ($(".chkpartyname").prop("checked") == true) { $(".accounPartyName").val($("[id*=account_head]").val()); } else { $(".accounPartyName").val("");}'>
                                            </div>											
                                        </div>
										
										<div class="row">
										<div class="col-md-6 mb-10">
                                                <label 	for="account_main_group">Under Main Group: *</label>
                                                <select class="form-control custom-select d-block w-100"  runat="server" id="account_main_group" name="account_main_group" onclick="event.preventDefault();" onserverchange="mainGroup_Changed" >
                                                    <option value="0">Select...</option>
                                                  <%--<option value="Share Holder Fund">Share Holder Fund</option>
													<option value="Non Current Liab">Non Current Liab</option>
													<option value="Current Liab">Current Liab</option>
													<option value="Non Current Assets">Non Current Assets</option>
													<option value="Current Assets">Current Assets</option>
													<option value="Revenue">Revenue</option>
													<option value="Expenses">Expenses</option>--%>
												</select>
                                            </div>
											
										<div class="col-md-6 mb-10">
                                                <label for="account_sub_group">Under Sub Group : *</label>
                                                <select class="form-control custom-select d-block w-100 sub_group"  runat="server" id="account_sub_group" name="account_sub_group" >
                                                    <option data-group="SHOW" value="0">Select...</option>
                                                    <option data-group="SHOW" value="add">Add New </option>
                                      <%--              <option data-group="Share Holder Fund" value="Share Capital">Share Capital</option>
													<option data-group="Share Holder Fund" value="Reserves and surplus">Reserves and surplus</option>
													<option data-group="Share Holder Fund" value="Money received against share warrants">Money received against share warrants</option>
													<option data-group="Share Holder Fund" value="Share Application Money pending allotment">Share Application Money pending allotment</option>
													<option data-group="Non Current Liab" value="Long term borrowings">Long term borrowings</option>
													<option data-group="Non Current Liab" value="Deferred tax liabilities (Net)">Deferred tax liabilities (Net)</option>
													<option data-group="Non Current Liab" value="Other long term liabilities">Other long term liabilities</option>
													<option data-group="Non Current Liab" value="Long-term provisions">Long-term provisions</option>
													<option data-group="Current Liab" value="Short-term borrowings">Short-term borrowings</option>
													<option data-group="Current Liab" value="Trade payables or Sundry Creditors">Trade payables / Sundry Creditors</option>
													<option data-group="Current Liab" value="Other current liabilities">Other current liabilities</option>
													<option data-group="Current Liab" value="Short-term provisions">Short-term provisions</option>
													<option data-group="Non Current Assets" value="Tangible assets">Tangible assets</option>
													<option data-group="Non Current Assets" value="Intangible assets">Intangible assets</option>
													<option data-group="Non Current Assets" value="Capital work in Progress">Capital work in Progress</option>
													<option data-group="Non Current Assets" value="Intangible assets under development">Intangible assets under development</option>
													<option data-group="Non Current Assets" value="Non current investments">Non current investments</option>
													<option data-group="Non Current Assets" value="Deferred tax assets (net)">Deferred tax assets (net)</option>
													<option data-group="Non Current Assets" value="Long-term loans and advances">Long-term loans and advances</option>
													<option data-group="Non Current Assets" value="Other non current assets">Other non current assets</option>
													<option data-group="Current Assets" value="Current investments">Current investments</option>
													<option data-group="Current Assets" value="Inventories">Inventories</option>
													<option data-group="Current Assets" value="Trade receivables">Trade receivables</option>
													<option data-group="Current Assets" value="Cash and cash equivalents">Cash and cash equivalents</option>
													<option data-group="Current Assets" value="Short term loans and advances">Short term loans and advances</option>
													<option data-group="Current Assets" value="Other current assets">Other current assets</option>
													<option data-group="Revenue" value="Revenue from operations">Revenue from operations</option>
													<option data-group="Revenue" value="Other income">Other income</option>
													<option data-group="Expenses" value="Cost of material Consumed">Cost of material Consumed</option>
													<option data-group="Expenses" value="Purchase of stock in trade">Purchase of stock-in-trade</option>
													<option data-group="Expenses" value="Employee benefit expenses">Employee benefit expenses</option>
													<option data-group="Expenses" value="Depreciation and amortization expenses">Depreciation and amortization expenses</option>
													<option data-group="Expenses" value="Other expenses">Other expenses</option>
													<option data-group="Expenses" value="Direct expenses">Direct expenses</option>--%>
                                                </select>
                                            </div>
										</div>										
										<div class="row">
                                            <div class="col-md-6 form-group">
                                                <label for="account_party_name">Party Name :</label> &nbsp;&nbsp;
                                                 <input type="checkbox" runat="server" class="chkpartyname" checked onclick='if ($(".chkpartyname").prop("checked") == true) { $(".accounPartyName").val($("[id*=account_head]").val()); } else { $(".accounPartyName").val("");}'/>&nbsp;<small>Copy From Account Head</small>
                                                <input class="form-control accounPartyName" name="account_party_name"  runat="server" id="account_party_name" placeholder="" value="" type="text" onkeydown="upperCaseF(this)">
                                            </div>
											<div class="col-md-6 mb-10">
                                                <label for="account_invenory_value">Inventory Value Effected</label>
                                                <select class="form-control custom-select d-block w-100"  runat="server" id="account_invenory_value">
                                                    <%--<option value="">Select...</option>--%>
                                                    <option value="Yes">Yes</option>
                                                    <option value="No">No</option>
                                                </select>
                                            </div>
											
										</div>	
										
										<div class="row">
                                        
											<div class="col-md-6 form-group">
                                                <label for="account_add_one">Address Line 1</label>
                                                <input class="form-control" name="account_add_one"  runat="server" id="account_add_one" placeholder="" value="" type="text" onkeydown="upperCaseF(this)">
                                            </div>
											
											<div class="col-md-6 form-group">
                                                <label for="account_add_two">Address Line 2</label>
                                                <input class="form-control" name="account_add_two"  runat="server" id="account_add_two" placeholder="" value="" type="text" onkeydown="upperCaseF(this)">
                                            </div>
											
											<div class="col-md-4 form-group">
                                                <label for="account_district">District</label>
                                                <input class="form-control" name="account_district"  runat="server" id="account_district" placeholder="" value="" type="text" onkeydown="upperCaseF(this)">
                                            </div>
											
											<div class="col-md-4 mb-10">
                                                <label 	for="account_state">State</label>
                                                <select class="form-control custom-select d-block w-100 select2  state_name"  runat="server" id="account_state">
                                                    <option value="0">Select...</option>
                                                    <%--<option data-statecode="01" value="Jammu & Kashmir">Jammu & Kashmir</option>
													<option data-statecode="02" value="Himachal Pradesh">Himachal Pradesh</option>
													<option data-statecode="03" value="Punjab">Punjab</option>
													<option data-statecode="04" value="Chandigarh">Chandigarh</option>
													<option data-statecode="05" value="Uttarakhand">Uttarakhand</option>
													<option data-statecode="06" value="Haryana">Haryana</option>
													<option data-statecode="07" value="Delhi">Delhi</option>
													<option data-statecode="08" value="Rajasthan">Rajasthan</option>
													<option data-statecode="09" value="Uttar Pradesh">Uttar Pradesh</option>
													<option data-statecode="10" value="Bihar">Bihar</option>
													<option data-statecode="11" value="Sikkim">Sikkim</option>
													<option data-statecode="12" value="Arunachal Pradesh">Arunachal Pradesh</option>
													<option data-statecode="13" value="Nagaland">Nagaland</option>
													<option data-statecode="14" value="Manipur">Manipur</option>
													<option data-statecode="15" value="Mizoram">Mizoram</option>
													<option data-statecode="16" value="Tripura">Tripura</option>
													<option data-statecode="17" value="Meghalaya">Meghalaya</option>
													<option data-statecode="18" value="Assam">Assam</option>
													<option data-statecode="19" value="West Bengal">West Bengal</option>
													<option data-statecode="20" value="Jharkhand">Jharkhand</option>
													<option data-statecode="21" value="Odisha">Odisha</option>
													<option data-statecode="22" value="Chhattisgarh">Chhattisgarh</option>
													<option data-statecode="23" value="Madhya Pradesh">Madhya Pradesh</option>
													<option data-statecode="24" value="Gujarat">Gujarat</option>
													<option data-statecode="25" value="Daman & Diu">Daman & Diu</option>
													<option data-statecode="26" value="Dadra & Nagar Haveli">Dadra & Nagar Haveli</option>
													<option data-statecode="27" value="Maharashtra">Maharashtra</option>
													<option data-statecode="29" value="Karnataka">Karnataka</option>
													<option data-statecode="30" value="Goa">Goa</option>
													<option data-statecode="31" value="Lakshdweep">Lakshdweep</option>
													<option data-statecode="32" value="Kerala">Kerala</option>
													<option data-statecode="33" value="Tamil Nadu">Tamil Nadu</option>
													<option data-statecode="34" value="Puducherry">Puducherry</option>
													<option data-statecode="35" value="Andaman & Nicobar Islands">Andaman & Nicobar Islands</option>
													<option data-statecode="36" value="Telangana">Telangana</option>
													<option data-statecode="37" value="Andhra Pradesh">Andhra Pradesh</option>
													<option data-statecode="97" value="Other Territory">Other Territory</option>
													--%>
                                                </select>
                                            </div>
											<div class="col-md-4 form-group">
                                                <label for="account_state_code">State Code</label>
                                                <input class="form-control stateCode" name="account_state_code"  runat="server" id="account_state_code" placeholder="" value="" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                            </div>
											
											
											
											<div class="col-md-6 form-group">
                                                <label for="account_country">Country</label>
                                                <input class="form-control" name="account_country"  runat="server" id="account_country" placeholder="" value="" type="text" onkeydown="upperCaseF(this)">
                                            </div>
											
											<div class="col-md-6 form-group">
                                                <label for="account_pincode">Pin Code</label>
                                                <input class="form-control" name="account_pincode"  runat="server" id="account_pincode" placeholder="" value="" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                            </div>
                                        
										
										   <div class="col-md-6 form-group">
                                                <label for="account_gst_number">GST Number</label>
                                                <input onchange="gstTOpan()" class="form-control" name="account_gst_number" onkeydown="upperCaseF(this)" runat="server" id="account_gst_number" placeholder="" value="" type="text">
												<a target="_blank" href="https://services.gst.gov.in/services/searchtp" style="float: right;">Verify GST</a>
                                            </div>
											
											<div class="col-md-6 form-group">
                                                <label for="account_pan_number">PAN Number</label>
                                                <input class="form-control" name="account_pan_number" onkeydown="upperCaseF(this)" runat="server" id="account_pan_number" placeholder="" value="" type="text">
                                            </div>
										   
										   <div class="col-md-6 form-group">
                                                <label for="account_cin_number">CIN Number</label>
                                                <input class="form-control" name="account_cin_number" onkeydown="upperCaseF(this)" runat="server" id="account_cin_number" placeholder="" value="" type="text">
                                            </div>
										   
										   <div class="col-md-6 form-group">
                                                <label for="account_phone_number">Phone Number</label>
                                                <input class="form-control" name="account_phone_number"  runat="server" id="account_phone_number" placeholder="" value="" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="10"/>
                                            </div>
											
											<div class="col-md-6 form-group">
                                                <label for="account_email">Email</label>
                                                <input class="form-control" name="account_email"  runat="server" id="account_email" placeholder="" value="" type="text" onblur="validateEmail(this.value);">
                                            </div>
											
											<div class="col-md-4 form-group">
                                                <label for="account_opening_balance">Opening Balance (As on 01/04/20XX)</label>
                                                <input class="form-control account_opening_balance_class" name="account_opening_balance"  runat="server" id="account_opening_balance" placeholder="" value="0" type="text" onchange="drcr_calculate()">
                                            </div>
										   <div class="col-md-2 mb-10">
                                                <label for="account_opening_balance_type">Type</label>
                                                <select class="form-control custom-select d-block w-100 opening_balance_type_class"  runat="server" id="account_opening_balance_type" onchange="drcr_calculate()">
                                                    <%--<option value="0">Select...</option>--%>
                                                    <option value="Debit">Debit</option>
                                                    <option value="Credit">Credit</option>													
                                                </select>
                                            </div>
										   
                                            <hr>
										<div class="col-md-4 form-group">
                                                <label for="tot_Dr">Dr : </label>
                                               <label runat="server" id="total_dr" class="totDr"> 0.00 </label>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label for="tot_Cr">Cr : </label>
                                                 <label runat="server" id="total_cr" class="totCr">0.00</label>
                                            </div>
											
                                            <div class="col-md-4 form-group">
                                                <label for="tot_diff">Difference : </label>
                                                 <label runat="server" id="total_diff" class="totDiff"> 0.00</label>
                                            </div>
											
                                    
                                        </div>  
										  
                                        <hr>

                                    <button type="button" id="btnVerCentMod" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" onclick="showAddUpdateModal();" data-placement="top" title="Save Account">Submit</button>
                                    <asp:Button runat="server" class="btn btn-light" type="submit" id="btnCancel" text="Cancel" OnClick="cancel_event" data-toggle="tooltip-dark" data-placement="top" title="Leave Page"/>

                                     <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title"></h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip-dark" data-placement="top" title="Cancel">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p id="p_id"></p>
                                                    <input type="checkbox" runat="server" id="chkConfirm" style="width: 15px; height: 15px;" checked/>
                                                </div>
                                                <div class="modal-footer">
                                                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                       <asp:Button runat="server" class="btn btn-primary" type="submit" id="submit_account_details" text="Submit" OnClick="submit_account_details_event" data-toggle="tooltip-dark" data-placement="top" title="Save Account" UseSubmitBehavior="false" />
                                                    </div>
                                                </div>
                                              </div>
                                           </div>
                                    </div>
                            </div>
                        </section>
     				   
                       
                    </div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->
     <!-- Modal -->
                                    <div class="modal fade new_sub_group_modal" id="" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Add Sub Group</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                            <div class="col-md-6 form-group">
                                                <label for="new_sub_group_name">Sub Group Add</label>
                                                <input class="form-control" runat="server"  placeholder="" value="" type="text" id="new_sub_group_name" name="new_sub_group_name">
                                            </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" class="btn btn-primary" type="submit" id="new_sub_group" text="Save" OnClick="add_new_sub_group" />
                                                    <%--<button type="button" runat="server" class="btn btn-primary" OnClick="submit_account_details_event">Save changes</button>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
<script>

    document.onkeydown = function(event){
    if (event.altKey && event.keyCode == 83) //ALT+S
    {
        $('#btnVerCentMod').click();
    }
};

    window.onload = function () {
        
        
    $(".select2").select2();
    $('.sub_group').on('change', function (e) {
        if ($(this).val() == "add") {
            $(".new_sub_group_modal").modal();
        }
    });

    $('.state_name').on('select2:select', function (e) {
        $(".stateCode").val($(this).val());
        });
        if ($('[id*=breadcrumb_title]').text() == "Update account") {
            SETVALUE();
        }
    }

    function SETVALUE() {
        $('[id*=chkConfirm]').show();
        
        $(".modal-title").html("Update Account");
        var str = "Purchase, Sale, Debit Note, Credit Note, Expenses, Journal Entry";
        $("#p_id").html("Do you want to Changes All Vouchers(<b style=\"font-weight: bold;\">" + str  + "</b>)?");
        
        var jsonSettings = '<%=json_acc_obj %>';
        if (jsonSettings != '') {
            var p_json_obj = JSON.parse(jsonSettings);
            $(".sub_group").val(p_json_obj[0]['account_sub_group']).trigger('change');
        }
    }


    function gstTOpan() {
        var gstno = $("[id*=account_gst_number]").val();
            var newStr = gstno.substring(2);
            var str = newStr.substring(0, newStr.length - 3);
            $("[id*=account_pan_number]").val(str);
     }

    function upperCaseF(a) {
        setTimeout(function () {
            a.value = a.value.toUpperCase();
        }, 1);
    }

    function validateEmail(sEmail) {
        var reEmail = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/;

        if (!sEmail.match(reEmail)) {
            warning_message("Invalid email address");
            return false;
        }
        return true;
    }
    var crtot = parseFloat($(".totCr").text());
    var drtot = parseFloat($(".totDr").text());
    function drcr_calculate() {
        
        var cr_tot = parseFloat($(".totCr").text());
        var dr_tot = parseFloat($(".totDr").text());
        var diff_tot = "";
        
        if ($(".opening_balance_type_class").val() == "Debit") {
            if($(".account_opening_balance_class").val() != null && $(".account_opening_balance_class").val() != ""){
                var debit_tot = $(".account_opening_balance_class").val();
                
                dr_tot = dr_tot + parseFloat(debit_tot);
                $(".totDr").text(parseFloat(dr_tot).toFixed(2));
                $(".totCr").text(parseFloat(crtot).toFixed(2));
            }
        } else if ($(".opening_balance_type_class").val() == "Credit") {
            if ($(".account_opening_balance_class").val() != null && $(".account_opening_balance_class").val() != "") {
                var credit_tot = $(".account_opening_balance_class").val();
                
                cr_tot = cr_tot + parseFloat(credit_tot);
                $(".totCr").text(parseFloat(cr_tot).toFixed(2));
                $(".totDr").text(parseFloat(drtot).toFixed(2));
            }
        }
        if (parseFloat($(".totCr").text()) > parseFloat($(".totDr").text())) {
            diff_tot = (parseFloat($(".totCr").text()) - parseFloat($(".totDr").text()));
                $(".totDiff").text(parseFloat(diff_tot).toFixed(2)); 
            }
        else if (parseFloat($(".totCr").text()) < parseFloat($(".totDr").text())) {
                {
                    diff_tot = (parseFloat($(".totDr").text()) - parseFloat($(".totCr").text()));
                    $(".totDiff").text(parseFloat(diff_tot).toFixed(2));
            }
        }
    }

    function showModal() {
        $('[id*=chkConfirm]').hide();
        $(".modal-title").html("Warning");
        $(".modal-footer").hide();
        $("#p_id").html("Account Already Exist..!!!");
            $("#exampleModalCenter").modal('show');
    }
    function showAddUpdateModal() {
        if ($('[id*=breadcrumb_title]').text() != "Update account") {
            $('[id*=chkConfirm]').hide();
            $('.modal-title').html('Add Account');
            $('#p_id').html('Do you want to Add?');
            $('.modal-footer').show();
        } else {
            $('[id*=chkConfirm]').show();
            $(".modal-title").html("Update Account");
            var str = "Purchase, Sale, Debit Note, Credit Note, Expenses, Journal Entry";
            $("#p_id").html("Do you want to Changes All Vouchers(<b style=\"font-weight: bold;\">" + str + "</b>)?");
        }
    }
</script>

</asp:Content>
