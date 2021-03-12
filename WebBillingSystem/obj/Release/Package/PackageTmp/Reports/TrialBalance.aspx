<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="TrialBalance.aspx.cs" Inherits="WebBillingSystem.TrialBalance" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">

    <style>
         table, th, td {
            border: 1px solid black;
         }
         .card.card-sm .card-body {
            padding: 1px !important;
         }
         tbody th, thead th, table.dataTable tbody td {
            padding: 1px !important;
         }
         .TrialBalanceGroupTable_class {
            background-color: lightgrey;
         }
         /*table thead  {
            background-color: darkgrey;
         }*/
         .rotate_angle {
            transform: rotate(90deg);
        }
         
         
     </style>
<div>
   <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Trial Balance</li>
                </ol>
            </nav>
  <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Trial Balance</h4>
            </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
        <div class="row">
           <div class="col-xl-12">
            <section class="bg-light hk-sec-wrapper">
                <div class="row">
                   <div class="col-sm">
                       <div class="row">
                           <div class="col-md-4 form-group">
                               <input type="radio" id="rbtn_GroupWise_Id" class="rbtn_GroupWise_class" name="rbtn_wise_report_name" value="GroupWise" checked>
                               <label for="GroupWise">Group Wise</label>
                            </div>
                            <div class="col-md-4 form-group">
                               <input type="radio" id="rbtn_LedgerWise_Id" class="rbtn_LedgerWise_class" name="rbtn_wise_report_name" value="LedgerWise">
                               <label for="LedgerWise">Ledger Wise</label>
                           </div>  
                           <div class="col-md-4 form-group">
                           <button id="btnExport" value="Excel" class="btn btn-xs btn-light" data-toggle="tooltip-dark" data-placement="top" title="Export to Excel"><i class="fa fa-file-excel-o" style="font-size:20px;color:forestgreen"></i></button>
                           &nbsp;<button id="btnWordDoc" class="btn btn-xs btn-light" value="Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc();"><i class="fa fa-file-word-o" style="font-size: 20px;color:blue"></i></button>
                               &nbsp;<button id="btnPDF" class="btn btn-xs btn-light" onclick="ExportPdf()" data-toggle="tooltip-dark" data-placement="top" title="Export to PDF"><i class="fa fa-file-pdf-o" style="font-size:20px;color:red"></i></button>
                        </div>
                          </div>
                     </div>
                </div>

                <div id="editor"></div>
                <div id="div_export_head_id">                
                     <div style="text-align:center;" class="row">                         
                         <div class="col-lg-12" style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">
                                    <div class="card card-sm">
										<div class="card-body bg-light" style="text-align: -webkit-center;">
                                            <h4 id="comp_name_id" runat="server"></h4>
                                            <label id="comp_trade_name_id" runat="server"></label>
                                            <label id="from_date_id" runat="server"></label> to <label id="to_date_id" runat="server"></label>
                                        </div>
									</div>                            
							   </div>
                             <hr class="mt-10" style="display:none"/>
                           </div>
                     </div>
                 </div>
                 <div id="div_export_group_id">   
                  <div class="row">
                    <div class="col-sm-12">    
                        <!-- start Table -->                        
                      <table id="TrialBalanceGroupTable" class="table table-secondary table-hover w-100 pb-30 dataTable dtr-inline table-bordered TrialBalanceGroupTable_class" role="grid">
                            <thead class="thead-secondary">
						        <tr>
                                    <th>Action</th>
                                    <th>Particulars</th>
							        <th colspan="2">Opening Balance </th>
							        <th colspan="2">Transactions </th>
							        <th colspan="2">Closing Balance</th>
							    </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th colspan="1">Debit</th>
                                    <th colspan="1">Credit</th>
                                    <th colspan="1">Debit</th>
                                    <th colspan="1">Credit</th>
                                    <th colspan="1">Debit</th>
                                    <th colspan="1">Credit</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                           <tfoot style="border-top:solid">                               
                              <tr>
                                    <th class="border border-dark" colspan="2">Grand Total</th>
                                    <th class="border border-dark" runat="server" id="total_dr_open_bal"></th>
                                    <th class="border border-dark" runat="server" id="total_cr_open_bal"></th>
                                    <th class="border border-dark" runat="server" id="total_dr_tran"></th>
                                    <th class="border border-dark" runat="server" id="total_cr_tran"></th>
                                    <th class="border border-dark" runat="server" id="total_dr_cl_bal"></th>
                                    <th class="border border-dark" runat="server" id="total_cr_cl_bal"></th>
                           
                                   </tr>
                               
                          </tfoot>
                      
					   </table>
                      
                        <!-- /start Table -->
	              </div> 
                </div>
             </div>
              
            <div id="div_export_ledger_id"> 
             <div class="row">
             <div class="col-sm-12">    
                        <!-- start Table -->                        
                      <table id="TrialBalanceLedgerTable" class="table table-secondary table-hover w-100 pb-30 dataTable dtr-inline table-bordered TrialBalanceLedgerTable_class" role="grid">
                            <thead  class="thead-secondary">
						        <tr>
                                    <th>Action</th>
                                    <th>Particulars</th>
							        <th colspan="2">Opening Balance </th>
							        <th colspan="2">Transactions </th>
							        <th colspan="2">Closing Balance</th>
							    </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th colspan="1">Debit</th>
                                    <th colspan="1">Credit</th>
                                    <th colspan="1">Debit</th>
                                    <th colspan="1">Credit</th>
                                    <th colspan="1">Debit</th>
                                    <th colspan="1">Credit</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                         <tfoot style="border-top: solid;">
                              <tr>
                                    <th class="border border-dark" colspan="2">Grand Total</th>
                                
                                    <th class="border border-dark" runat="server" id="total_dr_open_bal_ledger"></th>
                                    <th class="border border-dark" runat="server" id="total_cr_open_bal_ledger"></th>
                                    <th class="border border-dark" runat="server" id="total_dr_tran_ledger"></th>
                                    <th class="border border-dark" runat="server" id="total_cr_tran_ledger"></th>
                                    <th class="border border-dark" runat="server" id="total_dr_cl_bal_ledger"></th>
                                    <th class="border border-dark" runat="server" id="total_cr_cl_bal_ledger"></th>
                         
                                    </tr>
                            
                          </tfoot>
                            
					   </table>
                        <!-- /start Table -->
                

               <table style="margin:auto">
                     <tr>
                    <td  style="width:300px;visibility:hidden"></td>
                     <td style="margin: 10px; padding: 5px;width:38px;" class="difference"></td>  
                      <td  style="width:150px;visibility:hidden"></td>
                     

                         <td style="margin: 10px; padding: 5px;width:38px;" class="transaction"></td>
                          <td style="width:150px;visibility:hidden"></td>
                         <td style="margin: 10px; padding: 5px;" class="closingbal" colspan="2"></td>
                     </tr>

               </table>
                    
	              </div> 
                </div>
              </div>
            </section>
          </div>
        </div>
        <!-- end row -->
    </div>
  </div>
    <script>
        window.onload = function () {  
            trial_Balance_group_display();
            trial_Balance_ledger_display();

            if ($('.rbtn_GroupWise_class:checked').val() == 'GroupWise') {
                $(".TrialBalanceLedgerTable_class").hide();
                $(".TrialBalanceGroupTable_class").show();
            } else if ($('.rbtn_LedgerWise_class:checked').val() == 'LedgerWise') {
               $(".TrialBalanceLedgerTable_class").show();
                $(".TrialBalanceGroupTable_class").hide();
            }
        };

        $("input[name='rbtn_wise_report_name']").change(function () {            
            if ($('.rbtn_GroupWise_class:checked').val() == 'GroupWise') {
                $(".TrialBalanceLedgerTable_class").hide();
                $(".TrialBalanceGroupTable_class").show();
            } else if ($('.rbtn_LedgerWise_class:checked').val() == 'LedgerWise') {
                $(".TrialBalanceLedgerTable_class").show();
                $(".TrialBalanceGroupTable_class").hide();
            }
        });
   
        function trial_Balance_ledger_display() {
            
            var jsonString = '<%=json_acc_head_obj %>'; //for testing
            if (jsonString != '') {
                jsonString = JSON.parse(jsonString); //for testing
                var table = $('#TrialBalanceLedgerTable').DataTable({
                    data: jsonString,
                    autoWidth: false,
                    paging: false,
                    bSortable: false,
                    bInfo: false,
                    bFilter: false,
                    
                    columns: [
                        { "data": "edit_button_acc" },
                        { "data": "perticulars_acc" },
                        { "data": "open_Bal_debit_acc" },
                        { "data": "open_Bal_credit_acc" },
                        { "data": "transaction_debit_acc" },
                        { "data": "transaction_credit_acc" },
                        { "data": "close_Bal_debit_acc" },
                        { "data": "close_Bal_credit_acc" }
                    ],

                    "footerCallback": function ( row, data, start, end, display ) {
                     var api = this.api(), data;
                 
                     // converting to interger to find total
                     var intVal = function ( i ) {
                         return typeof i === 'string' ?
                             i.replace(/[\$,]/g, '')*1 :
                             typeof i === 'number' ?
                                 i : 0;
                     };
                 
                     // computing column Total of the complete result 
                     var opebaldrTotal = api
                         .column( 2 )
                         .data()
                         .reduce( function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0 );
		         		
	             var opebalcrTotal = api
                         .column( 3 )
                         .data()
                         .reduce( function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0 );
		         		
                     var trandrTotal = api
                         .column( 4 )
                         .data()
                         .reduce( function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0 );
		         		
	              var trancrTotal = api
                         .column( 5 )
                         .data()
                         .reduce( function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0 );
		         		
	              var clbaldrTotal = api
                         .column( 6 )
                         .data()
                         .reduce( function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0 );
                 
                  var clbalcrTotal = api
                         .column( 7 )
                         .data()
                         .reduce( function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0 );
                 
                 
                         // Update footer by showing the total with the reference of the column index
	                          $("[id*=total_dr_open_bal_ledger]").html(convert_number(opebaldrTotal));
                              $("[id*=total_cr_open_bal_ledger]").html(convert_number(opebalcrTotal));
                              $("[id*=total_dr_tran_ledger]").html(convert_number(trandrTotal));
                              $("[id*=total_cr_tran_ledger]").html(convert_number(trancrTotal));
                              $("[id*=total_dr_cl_bal_ledger]").html(convert_number(clbaldrTotal));
                              $("[id*=total_cr_cl_bal_ledger]").html(convert_number(clbalcrTotal));

                            
                         },
                   
                });
            }

            $('#TrialBalanceGroupTable tbody tr').find("td:eq(0)").css("width", "80px");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(1)").css("width", "265px");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(2)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(3)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(4)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(5)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(6)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(7)").css("text-align", "right");

     }
   

        function trial_Balance_group_display() {
            var jsonString =main_group_cl_bal(); //for testing
                var table = $('#TrialBalanceGroupTable').DataTable({
                    data: jsonString,
                    autoWidth: false,
                    paging: false,
                    bSortable: false,
                    bInfo: false,
                    bFilter: false,
                    
                    columns: [
                        { "data": "edit_button_main" },
                        { "data": "perticulars_main" },
                        { "data": "open_Bal_debit_main" },
                        { "data": "open_Bal_credit_main" },
                        { "data": "transaction_debit_main" },
                        { "data": "transaction_credit_main" },
                        { "data": "close_Bal_debit_main" },
                        { "data": "close_Bal_credit_main" }
                    ],

            "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // converting to interger to find total
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // computing column Total of the complete result 
            var opebaldrTotal = api
                .column( 2 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
				
	    var opebalcrTotal = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
				
            var trandrTotal = api
                .column( 4 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
				
	     var trancrTotal = api
                .column( 5 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
				
	     var clbaldrTotal = api
                .column( 6 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

         var clbalcrTotal = api
                .column( 7 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

          
                // Update footer by showing the total with the reference of the column index
	                 $("[id*=total_dr_open_bal]").html(convert_number(opebaldrTotal));
                     $("[id*=total_cr_open_bal]").html(convert_number(opebalcrTotal));
                     $("[id*=total_dr_tran]").html(convert_number(trandrTotal));
                     $("[id*=total_cr_tran]").html(convert_number(trancrTotal));
                     $("[id*=total_dr_cl_bal]").html(convert_number(clbaldrTotal));
                     $("[id*=total_cr_cl_bal]").html(convert_number(clbalcrTotal));
                },
         
                });
            
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(0)").css("width", "80px");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(1)").css("width", "265px");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(2)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(3)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(4)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(5)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(6)").css("text-align", "right");
            $('#TrialBalanceGroupTable tbody tr').find("td:eq(7)").css("text-align", "right");
            diff();
            //Format Second Table(call to this table)
     $('#TrialBalanceGroupTable tbody').on('click', '.details-control', function() {
        var tr = $(this).closest('tr');
         var row = table.row(tr);
         
         if (row.child.isShown()) {            
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
            $(tr).find(".fa-angle-right").css("transform", "rotate(0deg)");
        }
        else {            
            // Open this row
            row.child(subGroupDetails(row.data()) ).show();
            tr.addClass('shown');
             $(tr).find(".fa-angle-right").css("transform", "rotate(90deg)");
         }
       
        });
 
        }
        function diff()
        {
            
            var amtdifference = 0;
            var amttransaction = 0;
            var closingbal = 0;
            amtdifference = (($("#ContentPlaceHolder1_total_dr_open_bal").html()) - ($("#ContentPlaceHolder1_total_cr_open_bal").html())).toFixed(2);

            amttransaction = (($("#ContentPlaceHolder1_total_dr_tran").html()) - ($("#ContentPlaceHolder1_total_cr_tran").html())).toFixed(2);

            closingbal = (($("#ContentPlaceHolder1_total_dr_cl_bal").html()) - ($("#ContentPlaceHolder1_total_cr_cl_bal").html())).toFixed(2);

            console.log(amtdifference);
            console.log(amttransaction);
            console.log(closingbal);
            $(".difference").html(amtdifference);
            $(".transaction").html(amttransaction);
            $(".closingbal").html(closingbal);
        }

        function main_group_cl_bal() {
             var jsonString = '<%=json_main_group_obj %>'; //for testing
            if (jsonString != '') 
                jsonString = JSON.parse(jsonString); 

            var jsonStringSubGroup = '<%=json_sub_group_obj %>';
            if (jsonStringSubGroup != '') 
                jsonStringSubGroup = JSON.parse(jsonStringSubGroup);               

                var jsonStringAccntDtl = '<%=json_acc_head_obj %>';
                if (jsonStringAccntDtl != '')
                 jsonStringAccntDtl = JSON.parse(jsonStringAccntDtl);         
            //maingroup details
            jsonString.forEach(function (key2, index2) {
                var mainGrp_cr_close = 0.00;
                var mainGrp_dr_close = 0.00;
            // Subgroup Details
                jsonStringSubGroup.forEach(function (key, index) {
                        var suGrp_cr_close = 0.00;
                        var suGrp_dr_close = 0.00;
                        if (key.main_group_name_sub == key2.perticulars_main) {
                    // closing balance total dr, cr
                            jsonStringAccntDtl.forEach(function (key1, index1) {
                                if (key.perticulars_sub == key1.sub_group_name_acc) {
                                   suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                    suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                    delete jsonStringAccntDtl[index1];                             
                                }
                            }); 
                            mainGrp_cr_close += suGrp_cr_close;
                            mainGrp_dr_close += suGrp_dr_close;
                     //delete jsonStringSubGroup[index];       
                    }                    
                });   
                jsonString[index2]["close_Bal_debit_main"] = mainGrp_dr_close;
                jsonString[index2]["close_Bal_credit_main"] = mainGrp_cr_close;
            });
            return jsonString;
        }

        function subGroupDetails(obj) {
            
            var jsonStringSubGroup = '<%=json_sub_group_obj %>';
            if (jsonStringSubGroup != '') {
                jsonStringSubGroup = JSON.parse(jsonStringSubGroup);               

                var jsonStringAccntDtl = '<%=json_acc_head_obj %>';
                if (jsonStringAccntDtl != '')
                 jsonStringAccntDtl = JSON.parse(jsonStringAccntDtl);         


                
                 var subGroup_details = '<table class="table table-hover w-100 pb-30 dataTable dtr-inline table-bordered subGroup_Table_class" style="background-color: whitesmoke;" id="subGroup_Table_id"><tbody>';
               // Subgropu Details
                jsonStringSubGroup.forEach(function (key, index) {
                        var suGrp_cr_close = 0.00;
                        var suGrp_dr_close = 0.00;
                        if (key.main_group_name_sub == obj.perticulars_main) {
                    // closing balance total dr, cr
                            jsonStringAccntDtl.forEach(function (key1, index1) {
                                if (key.perticulars_sub == key1.sub_group_name_acc) {
                                   suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                    suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                    delete jsonStringAccntDtl[index1];                             
                                }
                            }); 

                            var temp_date = key.perticulars_sub;
                            temp_date = temp_date.replace(" / ", "");
                            temp_date = temp_date.replace(/[- )(]/g, '_');
                            
                        subGroup_details += '<tr>' +
                            '<td colspan="1" style="width: 80px; text-align: center;">' + key.edit_button_sub + '</td>' +
                            '<td colspan="1" style="width: 264px;">' + key.perticulars_sub + '</td>' +
                            '<td colspan="1" style="text-align: right;">' + key.open_Bal_debit_sub + '</td>' +
                            '<td colspan="1" style="text-align: right;">' + key.open_Bal_credit_sub + '</td>' +
                            '<td colspan="1" style="text-align: right;">' + key.transaction_debit_sub + '</td>' +
                            '<td colspan="1" style="text-align: right;">' + key.transaction_credit_sub + '</td>' +
                            '<td colspan="1" style="text-align: right;">' + suGrp_dr_close + '</td>' +
                            '<td colspan="1" style="text-align: right;">' + suGrp_cr_close + '</td>' +
                            '</tr>';
                        subGroup_details += "<tr><td colspan='8' class='"+ temp_date +"'></td></tr>";
                    }
                }); 
                return subGroup_details + '</tbody></table></div>';  
            }
        }

        function accntHead_details(obj) {
            $(obj).toggleClass("rotate_angle");
            
             var subGroup = $(obj).attr("sub_group_name");
            var data_obj = subGroup.replace(" / ", "");
                data_obj = data_obj.replace(/[- )(]/g, '_');
           
             var jsonStringAccntDtl = '<%=json_acc_head_obj %>';
             if (jsonStringAccntDtl != '') {
                 jsonStringAccntDtl = JSON.parse(jsonStringAccntDtl);         

                 var AccHead_Details = '<table class="table table-secondary table-hover dataTable" id="accHead_Table_id"><tbody>';
                 if (!$('.'+data_obj).is(':empty')) {
                $("." + data_obj).toggle();
            }
                 jsonStringAccntDtl.forEach(function (key, index) {
                     if (subGroup == key.sub_group_name_acc) {
                         //var ope_Bal_debit_acc = 0.00;
                         //var ope_Bal_credit_acc = 0.00;
                         //if (key.open_Bal_debit_acc == null) { ope_Bal_debit_acc = "0.00"; } else { ope_Bal_debit_acc = convert_number(key.open_Bal_debit_acc); }
                         //if (key.open_Bal_credit_acc == null) { ope_Bal_credit_acc = "0.00"; } else { ope_Bal_credit_acc = convert_number(key.open_Bal_credit_acc); }

                         AccHead_Details += '<tr>' +
                             '<td style="text-align: right; width: 80px;">' + key.edit_button_acc + '</td>' +
                             '<td style="text-align: left; width: 265px;">' + key.perticulars_acc + '</td>' +
                             '<td style="text-align: right;">' + key.open_Bal_debit_acc + '</td>' +
                             '<td style="text-align: right;">' + key.open_Bal_credit_acc + '</td>' +
                             '<td style="text-align: right;">' + key.transaction_debit_acc + '</td>' +
                             '<td style="text-align: right;">' + key.transaction_credit_acc + '</td>' +
                             '<td style="text-align: right;">' + key.close_Bal_debit_acc + '</td>' +
                             '<td style="text-align: right;">' + key.close_Bal_credit_acc + '</td>' +
                             '</tr>';
                     }
                 }); 
                 $("."+ data_obj).html(AccHead_Details + '</tbody></table>');
             }
        }

   //Export To Excel
        $("#btnExport").click(function (e) {           

        if ($('.rbtn_GroupWise_class').prop('checked') == true) {
            $('#TrialBalanceGroupTable thead tr:eq(0)').find("th:eq(0)").text("");
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_head_id]').html() + $('div[id=div_export_group_id]').html()));
            e.preventDefault();
        }
       else if ($('.rbtn_LedgerWise_class').prop('checked') == true) {
            $('#TrialBalanceLedgerTable thead tr:eq(0)').find("th:eq(0)").text("");
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_head_id]').html() + $('div[id=div_export_ledger_id]').html()));
            e.preventDefault();
        }
        
        });


         //Export To Word Document   
        function Export2Doc() {
            filename = 'trail_balance';
            if ($('.rbtn_GroupWise_class').prop('checked') == true) {
                element = $("#div_export_head_id").html() +  $("#div_export_group_id").html() ;
                $('#TrialBalanceGroupTable thead tr:eq(0)').find("th:eq(0)").text("");
            }
            else if ($('.rbtn_LedgerWise_class').prop('checked') == true) {
                //element = "div_export_ledger_id";
                 element = $("#div_export_head_id").html() +  $("#div_export_ledger_id").html() ;
                
                $('#TrialBalanceLedgerTable thead tr:eq(0)').find("th:eq(0)").text("");
            }

        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Journal Book</title></head><body style='text-align:center'>";
        var postHtml = "</body></html>";
        var html = preHtml + element + postHtml;
        
        var blob = new Blob(['\ufeff', html], {
            type: 'application/msword'
        });
        // Specify link url
        var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);

        // Specify file name
        filename = filename ? filename + '.doc' : 'document.doc';

        // Create download link element
        var downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if (navigator.msSaveOrOpenBlob) {
            navigator.msSaveOrOpenBlob(blob, filename);
        } else {
            // Create a link to the file
            downloadLink.href = url;

            // Setting the file name
            downloadLink.download = filename;

            //triggering the function
            downloadLink.click();
        }
        document.body.removeChild(downloadLink);
    }

        function ExportPdf() {
        
           var options = {};
             var pdf = new jsPDF('p', 'pt', 'a4');
             pdf.addHTML($("#div_export_group_id"), 15, 15, options, function () {
                 debugger
               pdf.save('TrailBalance.pdf');
             });
        }

    </script>

</asp:Content>
