<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CreditorsStatement.aspx.cs" Inherits="WebBillingSystem.CreditorsStatement" %>
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
         
     </style>
          <script src="https://kendo.cdn.telerik.com/2017.2.621/js/jszip.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>
<div>
   <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Creditors Statement</li>
                </ol>
            </nav>
  <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Creditors Statement</h4>
            </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
        <div class="row">
           <div class="col-xl-12">
            <section class="bg-light hk-sec-wrapper">

                   <div class="row">
                     <%-- <div class="col-md-4 form-group">
                              <label>Account Head :</label>
                              <select runat="server" class="form-control select2 account_head_class"  id="account_head_id" name="account_head_name" onchange="Debtors_Statement_Display();">
                              </select>
                      </div>--%>
                      <div class="col-md-4 form-group"> 
                          <br />
<%--                              <asp:LinkButton runat="server" ID="linkbtnSearch"  class="btn btn-xs btn-light"><i class="fa fa-search" style="font-size: 20px;" data-toggle="tooltip-dark" data-placement="top" title="Search Records"></i></asp:LinkButton>--%>
                              &nbsp;<button id="btnExport" value="Excel" class="btn btn-xs btn-light" data-toggle="tooltip-dark" data-placement="top" title="Export to Excel"><i class="fa fa-file-excel-o" style="font-size:20px;color:forestgreen"></i></button>
                              &nbsp;<button id="btnPDF" class="btn btn-xs btn-light" onclick="ExportPdf()" data-toggle="tooltip-dark" data-placement="top" title="Export to PDF"><i class="fa fa-file-pdf-o" style="font-size:20px;color:red"></i></button>
                              &nbsp;<button id="btnWordDoc" class="btn btn-xs btn-light" value="Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document"  onclick="Export2Doc('div_export_head_id', 'word-content-account-ledger');"><i class="fa fa-file-word-o" style="font-size: 20px;color:blue"></i></button>
                       </div>
                </div>



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
                           </div>
                     </div>
                 
             <div class="row">
             <div class="col-sm-12">    
                        <!-- start Table -->                        
                      <table id="DebtorsStatementTable" class="table table-secondary table-hover w-100 pb-30 dataTable dtr-inline table-bordered DebtorsStatementTable_class" role="grid">
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
                                    <th class="border border-dark" style="text-align:right;" colspan="2">Grand Total</th>
                                    <th class="border border-dark" style="text-align:right;" runat="server" id="total_dr_open_bal_ledger"></th>
                                    <th class="border border-dark" style="text-align:right;" runat="server" id="total_cr_open_bal_ledger"></th>
                                    <th class="border border-dark" style="text-align:right;" runat="server" id="total_dr_tran_ledger"></th>
                                    <th class="border border-dark" style="text-align:right;" runat="server" id="total_cr_tran_ledger"></th>
                                    <th class="border border-dark" style="text-align:right;" runat="server" id="total_dr_cl_bal_ledger"></th>
                                    <th class="border border-dark" style="text-align:right;" runat="server" id="total_cr_cl_bal_ledger"></th>
                              </tr>
                          </tfoot>
					   </table>
                        <!-- /start Table -->
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
            //$(".account_head_class").select2();
            Debtors_Statement_Display();
        };

        function ExportToExcel(obj) {
            $(obj).parent().parent().find("th:eq(0)").text("");

            var contents = $(obj).parent().parent().find("td:eq(1)").html();
            contents = $("#det_id").html() + "<div> Month : " + contents + $("." + contents).html() + "</div>";
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(contents));
        }
        //Export To Excel Per Year
        $("#btnExport").click(function (e) {
            //if ($('#chk_display_narration_id').prop('checked') == false) {
            //    $("#AccountLedgerTable #note_tr_id").remove();
            //}
            $('#DebtorsStatementTable thead tr:eq(0)').find("th:eq(0)").text("");
            $('#dtl_Table thead tr').remove();
            $('#dtl_Table  tbody').find('tr:eq(0)').remove();

            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_head_id]').html()));
            e.preventDefault();
        });


         //Export To PDF
        function ExportPdf() {
        
            $('#dtl_Table thead tr').remove();
            $('#dtl_Table  tbody').find('tr:eq(0)').remove();
            kendo.drawing
             .drawDOM("#div_export_head_id",
            {
                paperSize: "A4",
                margin: { top: "1cm", bottom: "1cm" },
                scale: 0.6,
                height: 500
            })
                .then(function (group) {
                    kendo.drawing.pdf.saveAs(group, "Exported.pdf")
                });
        }

        //Export To Word Document  
        function Export2Doc(element, filename = '') {
           
           var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Journal Book</title></head><body style='text-align:center'>";
            var postHtml = "</body></html>";
            var html = preHtml + document.getElementById(element).innerHTML + postHtml;
        
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

   


        function Debtors_Statement_Display() {
            $('#DebtorsStatementTable> tbody').html('');
            var jsonString = '<%=json_acc_head_obj %>'; //for testing
            if (jsonString != '') {
                jsonString = JSON.parse(jsonString); //for testing

                var table = $('#DebtorsStatementTable').DataTable({
                    data: jsonString,
                    autoWidth: false,
                    paging: false,
                    bSortable: false,
                    bInfo: false,
                    //bFilter: false,
                    
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
    </script>

</asp:Content>
