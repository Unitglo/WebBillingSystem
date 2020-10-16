<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="MasterSettings.aspx.cs" Inherits="WebBillingSystem.MasterSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb -->
    <div>
        <nav class="hk-breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-light bg-transparent">
                <li class="breadcrumb-item"><a href="#">Forms</a></li>
                <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Master Settings</li>
            </ol>
        </nav>
        <!-- Container -->
        <div class="container">
            <!-- Title -->
            <div class="hk-pg-header">
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Master Settings</h4>
            </div>
            <!-- /Title -->

            <div class="row">
                <div class="col-xl-12">


                                        <textarea name="master_setting_id" runat="server" id="master_setting_id" visible="false"></textarea>
                    
                    <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border: groove;">
                        <table style="width: 100%; text-align: left;">

                            <tbody>
                                <tr>
                                    <td>
                                        <label id="">1) Terms and Conditions to be Printed in tax Invoice : </label>
                                    </td>
                                    <td>
                                        <textarea name="term_condition" runat="server" id="termandcondition" class="form-control mt-15" rows="3" placeholder=""></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label id="">2) Name of Autorised Signatory to be printed in tax Invoice : </label>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="chkPrimary" /> Primary Authorised Signatory /                                                     
                                        <input type="checkbox" id="chkSecondary" /> Secondery Authorised Signatory </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="text" class="form-control" name="autorised_signatory_tax_invoice" runat="server" id="autorised_signatory_tax_invoice"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label id="">3) Name Of Autorised Signatory to be printed in other Vouchers : </label>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="chkOtherPrimary" />
                                        Primary Authorised Signatory / 
                                                    
                                        <input type="checkbox" id="chkOtherSecondary" />
                                        Secondery Authorised Signatory </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="text" class="form-control" name="autorisedsignatory_voucher" runat="server" id="autorised_signatory_voucher"></td>
                                </tr>
           <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>

                                    <td>
                                        <label id="">4) MRP details Required</label></td>
                                    <td>:
                                        <input runat="server" id="rbtn_mrpdtlreq_yes_id" class="rbtn_mrp" type="radio" name="rbtnmrp" value="1" checked> Yes
                                        <input runat="server" id="btn_mrpdtlreq_no_id" class="rbtn_mrp" type="radio" name="rbtnmrp" value="0"> No
                                    </td>
                                </tr>
             <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">5) Sale Price details Required</label></td>
                                    <td>:
                                        <input runat="server" id="rbtnSalePriceDtlReqYes" type="radio" name="rbtSpdr" value="1" > Yes
                                        <input type="radio" runat="server" id="rbtn_SalePriceDtlReq_no_id" name="rbtSpdr" value="0" checked>No
                                    </td>
                                </tr>
             <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                           
                                <tr>
                                    <td>
                                        <label id="">6) Expiry Monitoring System required</label></td>
                                    <td>:
                                        <input runat="server" type="radio" id="ExpMonSysReq_yes_id" name="rbtnExpireManditory" value="1"> Yes
                                        <input type="radio" runat="server" id="ExpMonSysReq_no_id" name="rbtnExpireManditory" value="0" checked> No 
                                    </td>
                                </tr>
        <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">7) Expiry details required to printed in Tax Invoice</label></td>
                                    <td>:
                                        <input runat="server" type="radio" id="rbtnExpireTaxInvoice_yes_id" name="rbtnExpireTaxInvoice" value="1">
                                        Yes
                                        <input type="radio" runat="server" id="rbtnExpireTaxInvoice_no_id" name="rbtnExpireTaxInvoice" value="0" checked>
                                        No </td>
                                </tr>
       <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">8) Batch wise details required</label></td>
                                    <td>:
                                        <input runat="server" id="BatchDtlReq_yes_id" type="radio" name="rbtnBatchDtl_name" value="1" > Yes
                                        <input type="radio" runat="server" id="BatchDtlReq_no_id" name="rbtnBatchDtl_name" value="0" checked> No </td>
                                </tr>
        <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">9) Batch wise details required to printed in Tax Invoice</label></td>
                                    <td>:
                                        <input runat="server" id="rbtnBatchDtlTaxInvoice_yes_id" type="radio" name="rbtnBatchDtlTaxInvoice" value="1">
                                        Yes
                                        <input type="radio" id="rbtnBatchDtlTaxInvoice_no_id" runat="server" name="rbtnBatchDtlTaxInvoice" value="0" checked>
                                        No </td>
                                </tr>
        <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">10) Stock out Method : </label>
                                    </td>
                                    <td>
                                        <select class="form-control Stock_Out_Method" name="StockOutMethod" id="Stock_OutMethod" style="width: 95%" runat="server">
                                            <option value="FIFO">FIFO</option>
                                            <option value="LIFO">LIFO</option>
                                        </select>
                                    </td>
                                </tr>
       <%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">11) Stock Valuation Method : </label>
                                    </td>
                                    <td>
                                        <select class="form-control stockValuation_Method" name="stock_Valuation_Method" id="stockValuationMethod" style="width: 95%" runat="server">
                                            <option value="CMPL">Cost or Market Price whichever is lower</option>
                                            <option value="CP">Cost Price</option>
                                            <option value="MP">Market Price</option>
                                            <%--<option value="ACP">Average Cost Price</option>--%>
                                        </select>
                                    </td>
                                </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">12) Unit Convertion Method Required</label></td>
                                    <td>:
                                        <input runat="server" type="radio" id="rbtnUnitConvMethod_yes_id" name="rbtnUnitConvMethod" value="1">
                                        Yes
                                        <input type="radio" runat="server" id="rbtnUnitConvMethod_no_id" name="rbtnUnitConvMethod" value="0" checked>
                                        No </td>
                                </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr id="tr_prefix_id">
                                    <td>
                                        <label id="">13) All prefix here : </label>
                                    </td>
                                </tr>
                                <tr id="tr_invoice_id">
                                    <td>Computer Generated Invoices No.</td>
                                    <td>:
                                        <input runat="server" type="radio" class="rbtninvoice_no" id="rbtninvoice_yes_id" name="rbtninvoiceno" value="1" checked onclick="invoiceClick()">
                                        Yes
                                        <input type="radio" runat="server" class="rbtninvoice_no" id="rbtninvoice_no_id" name="rbtninvoiceno" value="0" onclick="invoiceClick()">
                                        No 
                                    </td>
                                    <td>
                                        <input type="number" runat="server" id="txtinvoiceno" class="form-control" value="0" min="0" max="11" style="width: 100px;" onchange="invoiceAddChange()" ></td>
                                       &nbsp;<td> <button type="button" id="btninvoiceno" class="btn btn-primary btn-sm" data-target="#invoiceModalCenter" data-toggle="modal" title="Add Invoice No One Or More">add</button></td>
                                    <div class="modal fade" id="invoiceModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                                       <div class="modal-dialog modal-dialog-centered" role="document">
                                                           <div class="modal-content">
                                                               <div class="modal-header">
                                                                   <h5 class="modal-title">Add Invoices No</h5>
                                                                   <button type="button" class="close" id="invoiceno_id" data-dismiss="modal" aria-label="Close" onclick="$('[id*=addtextbox_ID]').empty();">
                                                                       <span aria-hidden="true">×</span>
                                                                   </button>
                                                               </div>
                                                               <div id="addtextbox_ID" class="modal-body">
                                                                   <label id="lblinvMessage_Id" style="color:red; font-size: 15px;"></label>
                                                               </div>
                                                               <div class="modal-footer">
                                                                   <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
                                                                   
                                                                   <button type="button" runat="server" class="btn btn-primary" data-dismiss="modal" >Add</button>
                                                               </div>
                                                           </div>
                                                       </div>
                                                   </div>
                                </tr>
                                <tr id="tr_debit_id">
                                    <td>Computer Generated DR No.</td>
                                    <td>:
                                        <input runat="server" type="radio" id="rbtndebit_yes_id" class="rbtndebit_no" name="rbtnDebitno" value="1" checked onclick="DebitClick()"> Yes
                                        <input type="radio" runat="server" id="rbtndebit_no_id" class="rbtndebit_no" name="rbtnDebitno" value="0" onclick="DebitClick()"> No </td>
                                        <td><input type="number" runat="server" id="txtDebitno" class="form-control" name="txtDebitno" min="0" max="10" value="0" style="width: 100px;" onchange="addDebitnoChange();" ></td>
                                    &nbsp;<td> <button type="button" id="btnDebitno" class="btn btn-primary btn-sm" data-target="#DebitnoModalCenter" data-toggle="modal" title="Add Debit No One Or More">add</button></td>
                                </tr>
                                <div class="modal fade" id="DebitnoModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                                       <div class="modal-dialog modal-dialog-centered" role="document">
                                                           <div class="modal-content">
                                                               <div class="modal-header">
                                                                   <h5 class="modal-title">Add Debit No </h5>
                                                                   <button type="button" class="close" id="Debitno_id" data-dismiss="modal" aria-label="Close" onclick="$('[id*=addDebitnotextbox_ID]').empty();">
                                                                       <span aria-hidden="true">×</span>
                                                                   </button>
                                                               </div>
                                                               <div id="addDebitnotextbox_ID" class="modal-body">
                                                                   <label id="lblDebitMessage_Id" style="color:red; font-size: 15px;"></label>
                                                               </div>
                                                               <div class="modal-footer">
                                                                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                   
                                                                   <button type="button" runat="server" class="btn btn-primary" data-dismiss="modal" >Add</button>
                                                               </div>
                                                           </div>
                                                       </div>
                                                   </div>
                                <tr id="tr_credit_id">
                                    <td>Computer Generated Cr No.</td>
                                    <td>:
                                        <input runat="server" type="radio" id="rbtncredit_yes_id" class="rbtncredit_no" name="rbtnCreditno" value="1" checked onclick="creditClick()" /> Yes
                                        <input type="radio" runat="server" id="rbtncredit_no_id"  class="rbtncredit_no" name="rbtnCreditno" value="0" onclick="creditClick()"> No </td>
                                   <td><input type="number" runat="server" class="form-control" id="txtCreditno" name="txtCreditno" value="0" min="0" max="10" style="width: 100px;" onchange="addCreditnoChange();"></td>
                                    &nbsp;<td> <button type="button" id="btnCreditno" class="btn btn-primary btn-sm" data-target="#CreditnoModalCenter" data-toggle="modal" title="Add Credit No One Or More">add</button></td>
                                    
                                    <div class="modal fade" id="CreditnoModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                                       <div class="modal-dialog modal-dialog-centered" role="document">
                                                           <div class="modal-content">
                                                               <div class="modal-header">
                                                                   <h5 class="modal-title">Add Credit No</h5>
                                                                   <button type="button" class="close" id="Creditno_id" data-dismiss="modal" aria-label="Close" onclick="$('[id*=addCreditnotextbox_ID]').empty();">
                                                                       <span aria-hidden="true">×</span>
                                                                   </button>
                                                               </div>
                                                               <div id="addCreditnotextbox_ID" class="modal-body">
                                                                   <label id="lblCreditMessage_Id" style="color:red; font-size: 15px;">asd</label>
                                                               </div>
                                                               <div class="modal-footer">
                                                                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                   
                                                                   <button type="button" runat="server" class="btn btn-primary" data-dismiss="modal" >Add</button>
                                                               </div>
                                                           </div>
                                                       </div>
                                                   </div>

                                </tr>
                                
<%--------------------------------------------------------------------------------------------------------------------------------------%>

                                <tr>
                                    <td>
                                        <label id="">14) Do you want to simalteneiously Journalise the accounting entry</label></td>
                                    <td>:
                                        <input runat="server" type="radio" id="rbtnAccountEntry_yes_id" name="rbtnAccountEntry" value="1" checked>
                                        Yes
                                        <input type="radio" runat="server" id="rbtnAccountEntry_no_id" name="rbtnAccountEntry" value="0">
                                        No </td>
                                </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">15) Do you want Extra information to be printed in tax invoice</label></td>
                                    <td>:
                                        <input runat="server" class="rbtnExtra_Information" type="radio" id="rbtnExtraInformation_yes_id" name="rbtnExtraInformation" data-target="#exampleModalCenter" value="1" data-toggle="modal">
                                        Yes
                                
                                      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                          <div class="modal-dialog modal-dialog-centered" role="document">
                                              <div class="modal-content">
                                                  <div class="modal-header">
                                                      <h5 class="modal-title">Extra information to be printed in tax invoice</h5>
                                                      <button type="button" class="close" id="rbtn_Extra_InformationYes" data-dismiss="modal" aria-label="Close" onclick="closeClick()">
                                                          <span aria-hidden="true">×</span>
                                                      </button>
                                                  </div>
                                                  <div class="modal-body">
                                                      <label>Caption Name 1</label>
                                                      :
                                                      <input runat="server" type="text" id="txtId1" /><br />
                                                      <br />
                                                      <label>Caption Name 2</label>
                                                      :
                                                      <input type="text" id="txtId2" /><br />
                                                      <br />
                                                      <label>Caption Name 3</label>
                                                      :
                                                      <input type="text" id="txtId3" /><br />
                                                      <br />
                                                      <label>Caption Name 4</label>
                                                      :
                                                      <input type="text" id="txtId4" /><br />
                                                      <br />
                                                      <label>Caption Name 5</label>
                                                      :
                                                      <input type="text" id="txtId5" /><br />
                                                      <br />
                                                      <label>Caption Name 6</label>
                                                      :
                                                      <input type="text" id="txtId6" /><br />
                                                      <br />
                                                  </div>
                                                  <div class="modal-footer">
                                                      <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeClick()">Close</button>
                                                      <button type="button" runat="server" class="btn btn-primary" data-dismiss="modal" onclick="submit_details_event()">Add</button>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                        <input type="radio" runat="server" id="rbtn_Extra_Information" class="rbtnExtra_Information" name="rbtnExtraInformation" value="0" checked>
                                        No </td>
                                </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr>
                                    <td>
                                        <label id="">16)Put Currency Sign before Amount</label></td>
                                    <td>:
                                        <input runat="server" type="radio" id="rbtnCurrencySign_yes_id" name="rbtnCurrencySign" value="1">
                                        Yes
                                        <input type="radio" runat="server" id="rbtnCurrencySign_no_id" name="rbtnCurrencySign" value="0" checked>
                                        No </td>
                                </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            </tbody>
                        </table>
                        <input type="text" id="textVal1" style="visibility: hidden" class="textval3" runat="server" />
                        <input type="text" id="textVal2" style="visibility: hidden" class="texval" runat="server" />
                        <input type="text" id="sessionvalfirstauto" style="visibility: hidden" class="session_val_firstauto" runat="server" />
                        <input type="text" id="sessionvalsecauto" style="visibility: hidden" class="session_val_secauto" runat="server" />

                    </section>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-sm">
            <asp:Button type="button" runat="server" ID="master_sett_btn_id" class="btn btn-primary" OnClientClick="saveChange()" OnClick="submit_account_details_event" Style="margin-left: 30%" Text="Submit" data-toggle="tooltip-dark" data-placement="top" title="Save Master Setting"/>
        </div>
    </div>
    <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
    <script type="text/javascript">

        window.onload = function () {
            if ($('[id*=breadcrumb_title]').text() == "Update Master Settings") {
                $(".rbtninvoice_no").attr('disabled', true);
                $(".rbtninvoice_no").attr('disabled', true);
                $(".rbtndebit_no").attr('disabled', true);
                $(".rbtncredit_no").attr('disabled', true);
                $("#btninvoiceno").attr('disabled', true);
                $("#btnDebitno").attr('disabled', true);
                $("#btnCreditno").attr('disabled', true);
                $("[id*=txtinvoiceno]").attr('disabled', true);
                $("[id*=txtDebitno]").attr('disabled', true);
                $("[id*=txtCreditno]").attr('disabled', true);                
            }
        }
        
        document.onkeydown = function (event) {
            if (event.altKey && event.keyCode == 83) //ALT+S
            {
                $('#<%=master_sett_btn_id.ClientID%>').click();
            }
        };

        $('#chkPrimary').click(function () {
            
            $('#chkSecondary').prop('checked', false);
            $('[id*=autorised_signatory_tax_invoice]').val("");
            $('[id*=autorised_signatory_tax_invoice]').val($(".session_val_firstauto").val());
        });
        $('#chkSecondary').click(function () {
            
            $("#chkPrimary").prop('checked', false);
            $('[id*=autorised_signatory_tax_invoice]').val("");
            $('[id*=autorised_signatory_tax_invoice]').val($(".session_val_secauto").val());
        });

        $('#chkOtherPrimary').click(function () {
            
            $('#chkOtherSecondary').prop('checked', false);
            $('[id*=autorised_signatory_voucher]').val("");
            $('[id*=autorised_signatory_voucher]').val($(".session_val_firstauto").val());
        });
        $('#chkOtherSecondary').click(function () {
            
            $("#chkOtherPrimary").prop('checked', false);
            $('[id*=autorised_signatory_voucher]').val("");
            $('[id*=autorised_signatory_voucher]').val($(".session_val_secauto").val());
        });
        
        function closeClick() {
            
            $("[id*=rbtn_Extra_Information]").prop('checked', true);

        }
        function submit_details_event() {

            $("[id*=rbtn_Extra_Information]").focus();
            $("[id*=rbtn_Extra_InformationYes]").prop('checked', true);
            $("[id*=exampleModalCenter]").close();
        }

        function invoiceClick() {
            
            if ($('.rbtninvoice_no:checked').val() == 1) {
                $("[id*=txtinvoiceno]").show();
                $("[id*=btninvoiceno]").show();
            } else {
                $("[id*=txtinvoiceno]").hide();
                $("[id*=btninvoiceno]").hide();
            }

        }

        function DebitClick() {
            
            if ($('.rbtndebit_no:checked').val() == 1) {
                $("[id*=txtDebitno]").show();
                $("[id*=btnDebitno]").show();
            } else {
                $("[id*=txtDebitno]").hide();
                $("[id*=btnDebitno]").hide();
            }

        }

        function creditClick() {
            
            if ($('.rbtncredit_no:checked').val() == 1) {
                $("[id*=txtCreditno]").show();
                $("[id*=btnCreditno]").show();
            } else {
                $("[id*=txtCreditno]").hide();
                $("[id*=btnCreditno]").hide();
            }

        }
        function invoiceAddChange() {
            
            $("[id*=addtextbox_ID]").empty();
            
            var inv_Id = $("[id*=txtinvoiceno]").val();
            for (var i = 0; i < inv_Id; i++) {
               $('#addtextbox_ID').append(
               '<br/>'
                );
                var y = document.createElement("input");
                y.setAttribute("type", "text");
                y.setAttribute("maxlength","10");
                y.setAttribute("id", "invoiceno_id_" + i);
                y.setAttribute("class", "form-control");
                y.setAttribute("onkeyup", "myValFunction("+ i +")");                
                document.getElementById("addtextbox_ID").appendChild(y);
                y = document.createElement("input");
                y.setAttribute("type", "text");
                y.setAttribute("id", "invoice_id_" + i);
                y.setAttribute("class", "form-control");
                document.getElementById("addtextbox_ID").appendChild(y);
                $("[id*=invoice_id_" + i + "]").hide();
            }

            if ($('[id*=breadcrumb_title]').text() == "Update Master Settings") {
                var jsonSettings = '<%=json_obj_inv %>';
                var p_json_obj = JSON.parse(jsonSettings);
                var inv_Id = $("[id*=txtinvoiceno]").val();
                if ($('.rbtninvoice_no:checked').val() == 1) {
                    for (var i = 0; i < inv_Id; i++) {
                        $("[id*=invoiceno_id_" + i + "]").val(p_json_obj[i]['invoiceno']);
                        $("[id*=invoice_id_" + i + "]").val(p_json_obj[i]['id']);
                        $("[id*=invoice_id_" + i + "]").hide();
                    }
                }
            }
        }
        

        function addDebitnoChange() {
            $("[id*=addDebitnotextbox_ID]").empty();            
            var inv_Id = $("[id*=txtDebitno]").val();
            for (var i = 0; i < inv_Id; i++) {
                $('#addDebitnotextbox_ID').append(
                '<br/>'
              );
                var y = document.createElement("input"); y.setAttribute("type", "text");
                y.setAttribute("id", "Debitno_id_" + i);
                y.setAttribute("class", "form-control");
                y.setAttribute("maxlength","10");
                y.setAttribute("onkeyup", "myValDrFunction("+ i +")");                
                document.getElementById("addDebitnotextbox_ID").appendChild(y);
                y = document.createElement("input"); y.setAttribute("type", "text");
                y.setAttribute("id", "Debit_id_" + i);
                y.setAttribute("class", "form-control");
                document.getElementById("addDebitnotextbox_ID").appendChild(y);
                $("[id*=Debit_id_" + i + "]").hide();
            }

            if ($('[id*=breadcrumb_title]').text() == "Update Master Settings") {
                var jsonSettings = '<%=json_obj_dr %>';
                var p_json_obj = JSON.parse(jsonSettings);

                if ($('.rbtndebit_no:checked').val() == 1) {
                    for (var i = 0; i < inv_Id; i++) {
                        $("[id*=Debitno_id_" + i + "]").val(p_json_obj[i]['Debitno']);
                        $("[id*=Debit_id_" + i + "]").val(p_json_obj[i]['id']);
                        $("[id*=Debit_id_" + i + "]").hide();
                    }
                }
            }
            
        }
         function addCreditnoChange() {
            
            $("[id*=addCreditnotextbox_ID]").empty();
            
            var inv_Id = $("[id*=txtCreditno]").val();
            for (var i = 0; i < inv_Id; i++) {
                $('#addCreditnotextbox_ID').append(
                '<br/>'
                 //'<input type="text" runat="server" class="form-control" name="invoiceno_name" value="" maxlength="10"> <br/>'
               );
                var y = document.createElement("input"); y.setAttribute("type", "text");
                y.setAttribute("id", "Creditno_id_" + i);
                y.setAttribute("class", "form-control");
                 y.setAttribute("maxlength","10"); y.setAttribute("onkeyup", "myValCrFunction("+ i +")");
                document.getElementById("addCreditnotextbox_ID").appendChild(y);
                y = document.createElement("input"); y.setAttribute("type", "text");
                y.setAttribute("id", "Credit_id_" + i);
                y.setAttribute("class", "form-control");
                 y.setAttribute("maxlength","10"); y.setAttribute("onkeyup", "myValCrFunction("+ i +")");
                document.getElementById("addCreditnotextbox_ID").appendChild(y);
                $("[id*=Credit_id_" + i + "]").hide();
            }
            if ($('[id*=breadcrumb_title]').text() == "Update Master Settings") {
                var jsonSettings = '<%=json_obj_cr %>';
                var p_json_obj = JSON.parse(jsonSettings);

                if ($('.rbtncredit_no:checked').val() == 1) {
                    for (var i = 0; i < inv_Id; i++) {
                        $("[id*=Creditno_id_" + i + "]").val(p_json_obj[i]['Creditno']);
                        $("[id*=Credit_id_" + i + "]").val(p_json_obj[i]['id']);
                        $("[id*=Credit_id_" + i + "]").hide();
                    }
                }
            }
        }
        
        function myValFunction(value) {            
            if ($("[id*=invoiceno_id_" + value + "]").val().replace(/\s+/g, '').length >= "10") {
                $("#lblinvMessage_Id").html("Maximum Element Characters Not Allow....!!!");                
            } else {
                $("#lblinvMessage_Id").html("");
            }
        }
        function myValCrFunction(value) {  
            
            if ($("[id*=Creditno_id_" + value + "]").val().replace(/\s+/g, '').length >= "10") {
                $("#lblCreditMessage_Id").html("Maximum Element Characters Not Allow....!!!");
            } else {
                $("#lblCreditMessage_Id").html("");
            }
        }
        function myValDrFunction(value) {            
            if ($("[id*=Debitno_id_" + value + "]").val().replace(/\s+/g, '').length >= "10") {
                $("#lblDebitMessage_Id").html("Maximum Element Characters Not Allow....!!!");
            } else {
                $("#lblDebitMessage_Id").html("");
            }
        }

         function saveChange() {
             
             var inv_Id = $("[id*=txtinvoiceno]").val();
             var JSONObject = new Array();
             if ($('.rbtninvoice_no:checked').val() == 1) {
             for (var i = 0; i < inv_Id; i++) {
                 var values = {};
                 var series_id = $("[id*=invoiceno_id_" + i + "]").val();
                 var invoice_id = $("[id*=invoice_id_" + i + "]").val();
                 values.generated_no = "invoice"
                 values.series_no = series_id;
                 values.id = (invoice_id=="")?0:invoice_id;
                 JSONObject.push(values);
                 }
             }

             if ($('.rbtndebit_no:checked').val() == 1) {
                 var inv_Id = $("[id*=txtDebitno]").val();
                 for (var i = 0; i < inv_Id; i++) {
                     var values = {};
                     var series_id = $("[id*=Debitno_id_" + i + "]").val();
                     var debit_id = $("[id*=Debit_id_" + i + "]").val();
                     values.generated_no = "debit"
                     values.series_no = series_id;
                     values.id = (debit_id=="")?0:debit_id;                     
                     JSONObject.push(values);
                 }
             }                 

             if ($('.rbtncredit_no:checked').val() == 1) {
                 var inv_Id = $("[id*=txtCreditno]").val();
                 for (var i = 0; i < inv_Id; i++) {
                     var values = {};
                     var series_id = $("[id*=Creditno_id_" + i + "]").val();
                     var credit_id = $("[id*=Credit_id_" + i + "]").val();
                     values.generated_no = "credit"
                     values.series_no = series_id;
                     //values.count = "0";
                     values.id = (credit_id =="")?0:credit_id ;                     
                     JSONObject.push(values);
                 }
             }
             
             var json_str = JSON.stringify(JSONObject);
             $(".txthdn_Json").val(json_str);
             
             $('[id*=textVal1]').val($(".Stock_Out_Method option:selected").text());
             $('[id*=textVal2]').val($(".stockValuation_Method option:selected").text());
        }
        invoiceAddChange();
        addDebitnoChange();
        addCreditnoChange();

    </script>

</asp:Content>
