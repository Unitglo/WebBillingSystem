<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="JournalEntry.aspx.cs" Inherits="WebBillingSystem.JournalEntry" %>

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
            <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Journal Entry</li>
        </ol>
    </nav>
    <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div style="width: 100%;">
                
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Add Journal Entry</h4>
                <br /><br /> Company Name  : <label id="lblcomp" class="comp_class" runat="server"></label>
                <span  style="float: right;">
                <input type="button" id="btnAddAccount" value="Add New Account" class="btn btn-primary" data-placement="top" title="Add New Account" data-toggle="tooltip-dark" onclick="AccountBtnOnClick();"/></span>
                           <script language ="javascript" >
                               function AccountBtnOnClick() {
                                   create_json();
                                   localStorage.setItem('items', $(".txthdn_Json").val());
                                   window.location.href = "/Master/AddAccount.aspx?redirect=journalVouchers";
                               }
                             </script>
                        </div>
                   </div>
        <!-- /Title -->
        
        <!-- start row -->
        <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-50">
                     <h6 class="mb-5">
                         <table style="width: 100%; text-align: left;">
                                <tbody>
                                        <tr>
                                                <%--<td style="visibility:hidden">Journal Voucher Number  : <label id="journal_number_id" class="journal_number_class" runat="server" style="color:firebrick;"></label></td>--%>
                                            <td></td>
                                                <td colspan="2">Date  :</td>
                                                <td colspan="2">
                                                    <input type="date" runat="server" id="Voucher_Date_id" name="Voucher_Date_name" class="form-control mt-5 Voucher_Date_class" style="width: 300px;" />
                                                </td>

                                            </tr>
                                             <tr>
                                                <td colspan="8">
                                                    <hr class="hr-dark mt-10"">
                                                    </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </h6>
                            <label id="lblError" style="color: red; font-size: 12px;"></label>
				<!-- #Product Add -->
                  <table class="table table-bordered" id="myTable" style="border: 1px solid;">
                       <thead>
						<tr>
                            <th style="border: 2px solid;">Sr. No.</th>
							<th style="border: 2px solid;">Account Head</th>
							<th style="border: 2px solid;">Dr</th>
							<th style="border: 2px solid;">Cr</th>
                            <th style="border: 2px solid;">Action</th>
						</tr>
                            </thead>
						<tbody id="item-holder-tbody" style="border: 1px solid;">
                            
						</tbody>
                      <tfoot class="border: 1px solid;">
                      <tr>
                          <th colspan="2" class="text-right font-weight-600" style="border: 2px solid"><b>Total : </b></th>     
                          <th colspan="1" id="tot_Amt_dr" runat="server" class="text-center font-weight-600 tot_Amt_dr_class" style="border: 2px solid"></th>                          
                          <th colspan="1" id="tot_Amt_cr" runat="server" class="text-center font-weight-600 tot_Amt_cr_class" style="border: 2px solid"></th>
                          <th colspan="1" class="text-right font-weight-600" style="border: 2px solid"></th>
                      </tr>
                      
               </table>
                    <!-- /Product Add -->
                   <div style="position:absolute;z-index: -1;">
                     <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />                     
                     <input type="text" name="totAmt_Cr" style="visibility:hidden" ID="tot_AmtCr" class="totAmtCr" runat="server" />
                     <input type="text" name="totAmt_dr" style="visibility:hidden" id="tot_AmtDr" class="totAmountdr" runat="server" />
                     <input type="text" name="ndn_Voucher_Date_name" style="visibility:hidden" id="hdn_Voucher_Date_id" class="hdn_Voucher_Date_class" runat="server" />
                   </div>
                    <div>
                    <label id="lblRemark"><h6>Note : </h6></label>
                    <textarea id="note_id" runat="server" class="form-control mt-15 note_class" rows="2" placeholder="Enter text Note..."></textarea>                
                    </div>
                    <br />
                    <br />
                          <div class="row">
                                <div class="col-sm">
                                    <!-- Button trigger modal -->                                   
                                    <button type="button" id="btnVerCentMod" class="btn btn-primary example-modal-center"  data-target="#exampleModalCenter" data-placement="top" title="Save Journal Voucher">Save</button>
                                    <button type="button" id="btnPrint" class="btn btn-info example-modal-center" data-toggle="tooltip-dark" data-placement="top" title="Print Data in Journal Voucher">Print</button>
                                    <input type="button" class="btn btn-warning" id="btnReset" value="Reset" onclick="ResetChange();" data-toggle="tooltip-dark" data-placement="top" title="Clear Data in all controls"/>
                                    <asp:Button runat="server" class="btn btn-light" id="btnCancel" text="Cancel" OnClick="cancel_event" data-toggle="tooltip-dark" data-placement="top" title="Leave Page"/>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Add JV</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body pareches-invoice-model">
                                                    <p>Do you want to Submit?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" class="btn btn-primary" text="Save Changes" OnClick="jv_submit_account_details_event" /></div>
                                            </div>
                                        </div>
                                    </div>
                                     <!-- /Modal -->
                                </div>
                            </div>
                     </section>                            
                </div>
           </div>
     </div>

    <script>

        document.onkeydown = function(event) {
            if (event.altKey && event.keyCode == 83) //ALT+S
            {
                $('#btnVerCentMod').click();
            }
        };   

        window.onload = function () {
            $("[id*=btnVerCentMod]").attr("disabled", true);
            addTable();            
            bind();
            if($('[id*=breadcrumb_title]').text() == "Update Journal Entry"){
                updateval('<%=json_dtl_obj %>');
            }
            //parches_jv();
            session_to_JV();
            var data = localStorage.getItem('items');
            if (data != "null" ) {
                localStorage.setItem('items', null);        
                updatevalLocal(data);
            }

        }

        function updateval(data) {            
            json_dtl = data;
            var p_json_obj = JSON.parse(json_dtl);
            var count = JSON.parse(json_dtl).length;

            for(var i = 0; i < count; i++) {                
                $(".Supplier_Name_class").eq(i).val(p_json_obj[i]['name']); 
                $(".debit_Entry").eq(i).focus().val(p_json_obj[i]['debit_amount']); 
                $(".credit_Entry").eq(i).focus().val(p_json_obj[i]['credit_amount']);
                if((count-1) > i){
                    addTable(); 
                } else {
                    $("[id*=btnVerCentMod]").attr("disabled", false);
                }                
            }
        }
        function updatevalLocal(data) {            
            json_dtl = data;
            var p_json_obj = JSON.parse(json_dtl);
            var count = JSON.parse(json_dtl).length;

            for(var i = 0; i < count; i++) {                
                $(".Supplier_Name_class").eq(i).val(p_json_obj[i]['ACCOUNT_HEAD']); 
                $(".debit_Entry").eq(i).focus().val(p_json_obj[i]['DEBIT_AMOUNT']); 
                $(".credit_Entry").eq(i).focus().val(p_json_obj[i]['CREDIT_AMOUNT']);
                if((count-1) > i){
                    addTable(); 
                } else {
                    $("[id*=btnVerCentMod]").attr("disabled", false);
                }                
            }
             calculate();
        }

        function addTable() {
            
            $('#myTable> tbody:last').append('<tr>' +
                    '<td style="border:1px solid!important;">'+($('#myTable tbody tr').length+1)+'</td>' +
                    '<td style="border:1px solid!important;"><input type="text" runat="server" class="form-control mt-5 Supplier_Name_class" id="Account_head_Id" name="Supplier_Name" /></td>' +
                    '<td style="border:1px solid!important;"><input type="text" runat="server" class="form-control mt-5 debit_Entry" id="debitAmt" name="debitEntry" value="0.00" onchange="addproduct(this);" /></td>' +
                    '<td style="border:1px solid!important;"><input type="text" runat="server" class="form-control mt-5 credit_Entry" id="creditAmt" name="creditEntry" value="0.00" onchange="addproduct(this);" /></td>' +
                    '<td  style="border:1px solid!important;"><i class="fa fa-close" name="record" style="font-size:30px;color:red" aria-hidden="true"  onclick="removeRow(this)"></i></tr>'
             );
            bind();
        }
        //<i name="record" style="font-size:30px;color:black" aria-hidden="true" onclick="addTable(this)"><h3>+<h3></i>

        function displayBal(){
            var sum = 0;
            $('#myTable tbody tr').each(function(row, tr){
                var $input = $(this);
                var $row = $input.closest('tr');                   
                    
                var dr = $row.find(".debit_Entry").val();
                var cr = $row.find(".credit_Entry").val();
                sum = parseFloat(dr)-parseFloat(cr);
                     
                $row.find(".credit_Entry").val(sum);  
            });
                
        }

        function bind() {
            var availablePartyName = JSON.parse('<%=json_head_name %>');
           // var partyObject  = '<%=json_obj%>';
            if (availablePartyName != "") {
                $(".Supplier_Name_class").autocomplete({
                    source: availablePartyName,
                    autoFocus: true,
                }).keyup(function () {
                    var isValid = false;
                    for (i in availablePartyName) {
                        if (availablePartyName[i].toLowerCase().match(this.value.toLowerCase())) {
                            isValid = true;
                        }
                    }
                    if (!isValid) {
                        this.value = previousValue
                    } else {
                        previousValue = this.value;
                    }
                })//.focusout(function(){

                //for (i in availablePartyName) {

                //    if (availablePartyName[i].toLowerCase().match(this.value.toLowerCase())) {

                //        this.value = availablePartyName[i]
                //    } else {
                //        this.value = $(".Supplier_Name_class").val()
                //    }
                // }
                //});
            }
        }
        var dr_total = 0;
        var cr_total = 0;
        function addproduct(obj) {

            if ($(obj).parent().find("[id*=Account_head_Id]").val() == "") {
                warning_message("Please Select Account head...!!");
                return false;
            } else 
                if ($(obj).parent().find("[id*=debitAmt]").val() == "") {
                    warning_message("Please Enter Debit Amount...!!");
                    return false;
                } else if ($(obj).parent().find("[id*=creditAmt]").val() == "") {
                    warning_message("Please Enter Credit Amount...!!");
                    return false;
                }
                else {
                    $(obj).parent().find("[id*=debitAmt]").val(convert_number($(obj).parent().find("[id*=debitAmt]").val()));
                    $(obj).parent().find("[id*=creditAmt]").val(convert_number($(obj).parent().find("[id*=creditAmt]").val()));
                        calculate();
                       if($(".tot_Amt_dr_class").text() != $(".tot_Amt_cr_class").text()) {
                           $("[id*=btnVerCentMod]").attr("disabled", true);

                                if ($(obj).parent().find(".Supplier_Name_class").val() != '' ||  $(obj).parent().find(".debit_Entry").val() != '0.00' ||  $(obj).parent().find(".credit_Entry").val() != '0.00') {
                                    addTable();
                                }
                       } else {
                                $("[id*=btnVerCentMod]").attr("disabled", false);
                              }
                       }

        }
        function calculate() {
        
                    var dr_total = 0.00;
                    var cr_total = 0.00;
        
                    $('#myTable tbody tr').each(function(row, tr){
                        var $input = $(this);
                        var $row = $input.closest('tr');
                        
                        $row.find("td").eq(0).html(row+1);
                    
                         if($row.find(".credit_Entry").val() == "0.00" || $row.find(".credit_Entry").val() =="0") {
                            $row.find(".credit_Entry").prop("disabled", true);
                            $row.find(".debit_Entry").prop("disabled", false);
                         } else if($row.find(".debit_Entry").val() == "0.00" || $row.find(".debit_Entry").val() == "0"){
                            $row.find(".debit_Entry").prop("disabled", true);
                            $row.find(".credit_Entry").prop("disabled", false);
                         }
                        
                        $row.find(".debit_Entry").each(function () {
                             dr_total += parseFloat(this.value) || 0.00;
                        });

                        $row.find(".credit_Entry").each(function () {
                            cr_total += parseFloat(this.value) || 0.00;
                        });                    
                    });
                    $(".tot_Amt_dr_class").text(dr_total.toFixed(2));
                    $(".tot_Amt_cr_class").text(cr_total.toFixed(2));
        }

        function removeRow(row) {
         //for delete product 
            if($('#myTable tbody tr').length > 1){
                $(row).parents("tr").remove();
            }
            addproduct();
        }
        function create_json() {
        
            $("[id*=tot_AmtDr]").val($(".tot_Amt_dr_class").text());
            
            $(".totAmtCr").val($(".tot_Amt_cr_class").text());

            var JSONObject = new Array();
            
            $('#myTable tbody tr').each(function(row, tr){
                var values = {};
                values.COMP_NAME = ($(".comp_class").text()).split("-")[0];
                values.ACCOUNT_HEAD = $(tr).find('.Supplier_Name_class').val();
                values.DEBIT_AMOUNT = $(tr).find(".debit_Entry").val();
                values.CREDIT_AMOUNT =$(tr).find('.credit_Entry').val();
                values.status ="0";
                JSONObject.push(values);
            });
            var json_str = JSON.stringify(JSONObject); 
            $(".txthdn_Json").val(json_str);
            
            $(".hdn_Voucher_Date_class").val($(".Voucher_Date_class").val());
        }
       
        $("#btnVerCentMod").click(function () {
            create_json();  
            $("#lblError").html("");

            var availablePartyName = '<%=json_obj %>';
            if (availablePartyName != "") {
                var p_json_obj = JSON.parse(availablePartyName);
                var count = JSON.parse(availablePartyName).length;
                var a = false;
                $('#myTable tbody tr').each(function (row, tr) {
                    a = false;
                    $(tr).find("td").eq(0).css("color", "red");

                        p_json_obj.forEach(function (elementObject, index) {
                            
                            if ($(tr).find('.Supplier_Name_class').val() == p_json_obj[index]['account_head']) {
                                a = true;
                                $(tr).find("td").eq(0).css("color", "black");
                                return;
                            } 
                    });
                    if (!a) {
                        $("#lblError").html("Account Head Does Not Exist...!!!");
                    }                    
                });  
                if ($("#lblError").html()!="") {
                 $("#exampleModalCenter").modal('hide');
                        
                    } else {
                        $("#exampleModalCenter").modal('show');                        
                    }
            }
        });
        

        function session_to_JV() {
            var jvDetails1 = '<%=json_session_jv %>';
            
            if (jvDetails1 != "") {
                var jvDetails = JSON.parse(jvDetails1);
                var row = 0;
                for (var i = 0; i < jvDetails.length; i++) {
                    
                    if (jvDetails[i].debit_entry != "0" || jvDetails[i].credit_entry != "0") {
                        $(".Supplier_Name_class").eq(row).val("" + jvDetails[i].account_head);
                        $(".debit_Entry").eq(row).focus().val("" + jvDetails[i].debit_entry);
                        $(".credit_Entry").eq(row).focus().val("" + jvDetails[i].credit_entry);
                        $(".debit_Entry").eq(row).change();
                     row++;
                    }
                }
            }
        }

        function ResetChange(){
         
            $(".Supplier_Name_class").val("");           
            $(".debit_Entry").val("0");           
            $(".credit_Entry").val("0");           
            $(".tot_Amt_dr_class").text("0");           
            $(".tot_Amt_cr_class").text("0");
            $(".note_class").val("");
        }  
       
    </script>
    
</asp:Content>

