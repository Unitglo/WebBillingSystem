<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AccountLedger.aspx.cs" Inherits="WebBillingSystem.AccountLedger" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">2
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">--%>
   
<div>
  <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Accounts Ledger</li>
                </ol>
            </nav>
  <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Accounts Ledger</h4>
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
                               <label>Under Main Group: </label>
                               <select class="form-control custom-select d-block w-100"  runat="server" id="account_main_group" onserverchange="mainGroup_Changed" >
                                   <option value="0">All...</option>
                               </select>
                           </div>
                           <div class="col-md-4 form-group">
                                <label for="account_sub_group">Under Sub Group : </label>
                                   <select class="form-control custom-select d-block w-100 sub_group"  runat="server" id="account_sub_group" onserverchange="Group_Changed">
                                       <%--<option value="0">All...</option>--%>
                                   </select>
                           </div>
                           <div class="col-md-4 form-group">
                              <label>Account Head :</label>
                              <select runat="server" class="form-control select2 account_head_class"  id="account_head_id" name="account_head_name" >
                                <%--<option value="0">ALL...</option>--%>
                              </select>
                          </div>
                        </div>
                      <div class="row">
                          
                          <div class="col-md-4 form-group">
                              <label>From Date :</label>
                            <input type="date" runat="server" class="form-control from_date_class"  id="from_date_id" />
                          </div>
                          <div class="col-md-4 form-group">
                              <label>To Date :</label>
                            <input type="date" runat="server" class="form-control to_date_class"  id="to_date_id"/>
                          </div>
                          <div class="col-md-4 form-group">
                              <br />
                              <asp:LinkButton runat="server" ID="linkbtnSearch" OnClick="search_jv_details_event" class="btn btn-xs btn-light"><i class="fa fa-search" style="font-size: 20px;" data-toggle="tooltip-dark" data-placement="top" title="Search Records"></i></asp:LinkButton>
                              &nbsp;<button id="btnExport" value="Excel" class="btn btn-xs btn-light" data-toggle="tooltip-dark" data-placement="top" title="Export to Excel"><i class="fa fa-file-excel-o" style="font-size:20px;color:forestgreen"></i></button>
                              &nbsp;<button id="btnPDF" class="btn btn-xs btn-light" onclick="ExportPdf()" data-toggle="tooltip-dark" data-placement="top" title="Export to PDF"><i class="fa fa-file-pdf-o" style="font-size:20px;color:red"></i></button>
                              &nbsp;<button id="btnWordDoc" class="btn btn-xs btn-light" value="Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('div_export_id', 'word-content-account-ledger');"><i class="fa fa-file-word-o" style="font-size: 20px;color:blue"></i></button>
                          </div>
                     </div>
                       <div  class="row">
                          <div class="col-md-3 form-group">
                           <input type="checkbox" id="chk_all_display_dtl" class="chk-details-control" style="width: 15px; height: 15px;"/>&nbsp; : <label>Expand/Collapse All</label>
                              </div>
                           <div class="col-md-3 form-group">
                           &nbsp;<input type="checkbox" id="chk_display_narration_id" class="chk-details-control" style="width: 15px; height: 15px;"/>&nbsp; : <label>Note</label>
                               </div>
                       </div>
                     </div>
                </div>
                <div id="editor"></div>
                <div id="div_export_id">
                
                   <div style="text-align:center; display:none;" class="row">
                         
                         <div class="col-lg-12" style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">
                                    <div class="card card-sm">
										<div class="card-body bg-light" style="text-align: -webkit-center;">
                                            <table>
                                                <tr><td><h4 id="comp_name_id" runat="server"></h4></td></tr>
                                                <tr><td style="width:100px;">Trade Name -<label id="comp_trade_name_id" runat="server"></label></td></tr>
                                                <tr><td> Address -<label runat="server" id="comp_add_id"></label></td></tr>
                                                <tr><td>Email  - <label runat="server" id="comp_email_id"></label></td> </tr>
                                                <tr><td>Phone  - <label runat="server" id="comp_phone_id"></label></td></tr>
                                                <tr><td>GST No - <label runat="server" id="comp_gst_no_id"></label></td></tr>
                                                <tr><td>PAN No - <label runat="server" id="comp_pan_no_id"></label></td></tr>
                                                <tr><td>CIN No - <label runat="server" id="comp_cin_no_id"></label></td></tr>
                                            </table>
										</div>
									</div>
                                   					
									                                  
								</div>
                            </div>
                         </div> 
                        <hr class="mt-0"/>
                     <div id="det_id" class="row">
                        <div class="col-lg-12" style="padding-right: 0px; padding-left: 0px;">
                             <div class="card-group hk-dash-type-2">
                                 <div class="card card-sm">
									<div class="card-body bg-light" style="text-align: -webkit-center;">
                                        <table><tbody>
                                             <tr><td> <h5 id="company_name_id" runat="server"></h5></td></tr>
                                             <tr><td> Auth.Dealer - <label id="auth_dealer_id" runat="server"></label></td></tr>
                                             <tr><td> <label runat="server" id="state_id"></label></td></tr>
                                             <tr><td> <label runat="server" id="address_id"></label></td></tr>
                                             <tr><td> GSTIN NO - <label runat="server" id="gstin_id"></label></td></tr>
                                             <tr><td> State Code - <label runat="server" id="statecode_id"></label></td></tr>
                                             <tr><td> <h4>Accounts Ledger</h4></td></tr>
                                             <tr><td> For <label runat="server" id="date_id"></label></td></tr>
                                       </tbody></table>
                         </div></div></div></div>
                     </div>                    
                 
                  <div class="row">
                    <div class="col-sm-12">    
                        <!-- start Table -->
                        
                        <table id="AccountLedgerTable" class="table table-hover w-100 pb-30 dataTable dtr-inline" role="grid">
                        <thead>
						        <tr>
                                    <th data-orderable="false" style="border: 2px solid; text-align:center;">Action</th>
							        <th data-orderable="false" style="border: 2px solid; text-align:center;">Particulars</th>
							        <%--<th style="border: 2px solid;">Voucher Type</th>
                                    <th style="border: 2px solid;">Vouchers No</th>--%>
                                    <th data-orderable="false" style="border: 2px solid; text-align:center;">Debit Amount</th>
							        <th data-orderable="false" style="border: 2px solid; text-align:center;">Credit Amount</th>
							        <th data-orderable="false" style="border: 2px solid; text-align:center;">Closing Balance</th>
							    </tr>
                            </thead>
                            <tbody>
                             <%--<tr><td colspan="3">Opening Balance :</td><td colspan="2"><label id="op_bal_id">0.00</label></td></tr>--%>
                            </tbody>
					     </table>
                        <!-- /start Table -->
	                    </div> 
                    </div></div>
                </section>
            </div>
        </div>
        <!-- end row -->
    </div>
    </div>
    <style>
    /*.table {
             height: 500px;
        }*/
    table.dataTable thead th, table.dataTable thead td, table.dataTable tbody th, table.dataTable tbody td {
                padding: 0px !important;
        }
        .table th, td {
            font-size: 12px;
        }
        label {
            margin-bottom: 1px;
        }
        .rotate_angle{
            transform: rotate(90deg);
        }
        .card.card-sm .card-body {
            padding: 0px !important;
        }
    </style>
    <script src="https://kendo.cdn.telerik.com/2017.2.621/js/jszip.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous">
    </script>

     <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
<script language='javascript'>

    // main function 
     window.onload = function () {  
         $(".account_head_class").select2();
         account_details_display();
         $('#AccountLedgerTable').removeClass('sorting_asc');
         $(".details-control-day").on('click', function(event){
             // $(".details-control-day").on('click', function () {
             event.name_val_Day();
         });
    };
    

     function account_details_display() {
         
         var jsonString = '<%=json_journal_book_obj %>'; //for testing
         if (jsonString != '') {
             jsonString = JSON.parse(jsonString); //for testing
             var table = $('#AccountLedgerTable').DataTable({
                 data: jsonString,
                 autoWidth: false,
                 paging: false,
                 bSortable: false,
                 bInfo: false,
                 bFilter: false,
                 //ordering : false,
                 
                 columns: [
                     { "data": "action"},
                     { "data": "month" },
                     { "data": "drtotal" },
                     { "data": "crtotal" },
                     { "data": "acc_cl_balance" }
                 ],
                 rowCallback: function (row, data) {
                     var month_class = data["month"] + "_" + 'month RowClass'; 
                    $(row).addClass(month_class);
                 }
             });
         }
         table.row.add($('<tr style="font-weight: bold;"><td></td><td></td><td></td><td></td><td></td></tr>')[0] ).draw();
        
         $('#AccountLedgerTable tbody tr').find("td:eq(0)").css("text-align", "center");
         $('#AccountLedgerTable tbody tr').find("td:eq(1)").css("text-align", "center");
         $('#AccountLedgerTable tbody tr').find("td:eq(2)").css("text-align", "right");
         $('#AccountLedgerTable tbody tr').find("td:eq(3)").css( "text-align", "right" );
         $('#AccountLedgerTable tbody tr').find("td:eq(4)").css("text-align", "right");

         $('#AccountLedgerTable tbody tr:eq(0) td:eq(0)').html("");
         $('#AccountLedgerTable tbody tr:eq(0) td:eq(1)').html("Opening Balance");
         $('#AccountLedgerTable tbody tr:eq(0) td:eq(2)').html('<label id="op_bal_dr_id" runat="server">0.00</label>');
         $('#AccountLedgerTable tbody tr:eq(0) td:eq(3)').html('<label id="op_bal_cr_id" runat="server">0.00</label>');
         $('#AccountLedgerTable tbody tr:eq(0) td:eq(4)').html("");
         
     //Format Second Table(call to this table)
     $('#AccountLedgerTable tbody').on('click', '.details-control', function() {
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
            row.child(format(row) ).show();
            tr.addClass('shown');
             $(tr).find(".fa-angle-right").css("transform", "rotate(90deg)");
         }
     });

    //Expand and Collaps all columns
         $('#chk_all_display_dtl').on('click', function () {
            if ($('#chk_all_display_dtl').prop('checked') == false) {
                
                table.rows().every(function () {
                   // If row has details expanded
                    if (this.child.isShown()) {
                        // Collapse row details
                        this.child.hide();
                        $(this.node()).removeClass('shown');
                    }
                });
            } else {                
                // Enumerate all rows
                table.rows().every(function () {
                    
                    // If row has details collapsed
                    if (!this.child.isShown()) {
                        // Open this row
                        this.child(format(this)).show();
                        $(this.node()).addClass('shown');
                    }
                });
                $('#AccountLedgerTable tbody tr:eq(1)').remove();
            }
         });
     // Narration onclick hide and show
         $('#chk_display_narration_id').on('click', function () {
             
             if ($('#chk_display_narration_id').prop('checked') == false) {
                 $("#AccountLedgerTable #note_tr_id").hide();
             } else {
                 $("#AccountLedgerTable #note_tr_id").show();
             }
         });
         
     }
    
    
    
    function format(obj) {
        var op_bal_cr = "0.00";
        var op_bal_dr = "0.00";
        var d = obj.data();
        var op_balance = 0.00;
        var jsonStringDtl = '<%=json_journal_book_dtl_obj %>';
        if (jsonStringDtl != '') {
            jsonStringDtl = JSON.parse(jsonStringDtl);
            
            if (obj[0] < 1) {
                op_balance = $("#AccountLedgerTable tbody tr").eq(0).find("td").eq(2).html();
            } else {
                op_balance=$("#AccountLedgerTable tbody tr.RowClass").eq(obj[0]).find("td:last").html();      
            }

            if (op_balance.includes("Cr")) {
                op_bal_cr = op_balance;
            } else {
                op_bal_dr = op_balance; 
            }

         var name_val = '<div  class="'+ d.month +'"><table class="table table-hover dataTable" id="dtl_Table" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width: 100%;">';
             name_val += '<thead><tr style="text-align: center;">' +
                        '<th>Action</th>' +
                        '<th>Date</th>' +
                        '<th>Perticulars</th>' +
                        '<th>Voucher Type </th>' +
                        '<th>Debit Amount</th>' +
                        '<th>Credit amount</th>' +
                        '<th>Closing Balance</th>' +
                        '</tr></thead>';
            name_val += '<tbody>';
            name_val += '<tr style="font-weight: bold;">' +
                        '<td colspan = "4" style="text-align: center;">Opening Balance </td>' +
                        '<td style="text-align: center;"><label id="drvalue" runat="server">'+ op_bal_dr +'</label></td>' +
                        '<td style="text-align: center;"><label id="crvalue" runat="server">'+ op_bal_cr +'</label></td>' +
                        '<td></td>' +
                '</tr>';
            var temp_date = ""; 
            
            jsonStringDtl.forEach(function (key, index) {
              
                if (key.month == d.month) {
                    //op_bal_dr = key.acc_cl_bal;
                    //if (op_bal_dr.slice(-2) == "Dr") {
                    //    op_bal_dr = key.acc_cl_bal;
                    //} else {
                    //    op_bal_cr = key.acc_cl_bal;
                    //}

                    var temp_date_2 = key.jv_date.replace(/\//g, "_");
                    if (temp_date == "" || temp_date != temp_date_2) {
                        temp_date = temp_date_2;
                        //name_val += "<tr>"+
                        //    "<td> <a class='btn btn-xs btn-warning details-control-day fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand' onclick='$(\"." + temp_date + "\").toggle();$(this).toggleClass(\"rotate_angle\")'></a></td >" +
                        //    " <td colspan='6'>" + key.jv_date + "</td></tr> ";
                       }
                    name_val += '<tr id="table_tr_id" class="'+ temp_date +' date_filter">' +
                        '<td>'+ key.edit_button + '</td>' +
                        '<td style="text-align: center;">' + key.jv_date + '</td>' +
                        '<td style="text-align: center;"><label>' + key.acc_head_name + '</label></td>' +
                        '<td style="text-align: center;">' + key.master_id_type + '</td>' +
                        '<td style="text-align: right;"><label>' + key.dr_total + '</label></td>' +
                        '<td style="text-align: right;"><label>' + key.cr_total + '</label></td>' +
                        '<td style="text-align: right;">' + key.acc_cl_bal + '</td>' +
                        '</tr>';

            name_val += "<tr class='"+key.journal_id+"_"+temp_date+"'></tr>";
            name_val += '<tr class="bg-blue-light-5" id="note_tr_id" style="font-weight: bold; display: none;">' +
                        '<td colspan = "1"></td>' +
                        //'<td colspan = "1" style="font-weight: bold;">Note</td>' +
                        '<td colspan = "6">' + key.note + '</td>' +
                        '</tr>';
                   
                }
                
            });           
            return name_val + '</tbody></table></div>';    
        }        
    }

    function format_day(obj) {
        $(obj).toggleClass("rotate_angle");
        
        var day = $(obj).attr("data-date");
        var jv_id = $(obj).attr("data-jv-id");
        var data_obj = jv_id + "_" + day.replace(/\//g, "_");
        $(obj).parent().parent().find("td:eq(2) label").toggle();
        $(obj).parent().parent().find("td:eq(4) label").toggle();
        $(obj).parent().parent().find("td:eq(5) label").toggle();
        var jsonStringDayDtl = '<%=json_journal_book_day_obj %>';
        if (jsonStringDayDtl != '') {
            jsonStringDayDtl = JSON.parse(jsonStringDayDtl);
           
         
             var name_val_Day = '<table class="table table-hover dataTable" id="AccountLedgerTableThree"><tbody>';
            /*'<thead><tr style="text-align: center;">' +
                        '<th>Action</th>' +
                        '<th>Date</th>' +
                        '<th>Perticulars</th>' +
                        '<th>Voucher Type </th>' +
                        '<th>Debit Amount</th>' +
                        '<th>Credit amount</th>' +
                        //'<th>Closing Balance</th>' +
                        '</tr></thead>';
            */
            if (!$('.'+data_obj).is(':empty')) {
                $("." + data_obj).toggle();
            }
                jsonStringDayDtl.forEach(function (key, index) {
                if (day == key.jv_date && key.journal_id == jv_id){
                    name_val_Day += '<tr>' +
                        '<td style="text-align: center;"></td>' +
                        '<td style="text-align: center;"></td>' +
                        '<td style="text-align: center;">' + key.acc_head_name + '</td>' +
                        '<td style="text-align: center;"></td>' +
                        '<td style="text-align: right;">' +  key.dr_total + '</td>' +
                        '<td style="text-align: right;">' + key.cr_total + '</td>' +
                        '<td style="text-align: center;"></td>' +
                        '</tr>';
                }
            }); 
            $("."+ data_obj).html(name_val_Day + '</tbody></table>');
        }
    }
    
    function ExportToExcel(obj) {
        $(obj).parent().parent().find("th:eq(0)").text("");

        var contents = $(obj).parent().parent().find("td:eq(1)").html();
        contents = $("#det_id").html() + "<div> Month : " + contents + $("." + contents).html()+"</div>";
        window.open('data:application/vnd.ms-excel,' + encodeURIComponent(contents));
    }

//Export To Excel Per Year
    $("#btnExport").click(function (e) {
        if ($('#chk_display_narration_id').prop('checked') == false) {
            $("#AccountLedgerTable #note_tr_id").remove();
          } 
        $('#AccountLedgerTable thead tr:eq(0)').find("th:eq(0)").text("");
        $('#dtl_Table thead tr').remove();
        $('#dtl_Table  tbody').find('tr:eq(0)').remove();

        window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_id]').html()));
            e.preventDefault();
    });


 //Export To Word Document   
    function Export2Doc(element, filename = '') {
        $('#AccountLedgerTable thead tr:eq(0)').find("th:eq(0)").text("");
        $('#dtl_Table thead tr').remove();        
        $('#dtl_Table  tbody').find('tr:eq(0)').remove();

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

    //Export To Word Document
    function ExportToDocMonth(element) {

        var filename = "Account Ledger Month Report";
        contents = $(element).parent().parent().find("td:eq(1)").html();
        contents = $("#det_id").html() + "<div> Month : " + contents + $("." + contents).html()+"</div>";

        $(element).parent().parent().find("th:eq(0)").text("");

        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Journal Book</title></head><body style='text-align:center'>";
        var postHtml = "</body></html>";
        var html = preHtml + contents + postHtml;
        
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


//Export To PDF
    function ExportPdf() { 
        $('#dtl_Table thead tr').remove();
        $('#dtl_Table  tbody').find('tr:eq(0)').remove();

            kendo.drawing
                .drawDOM("#div_export_id", 
                { 
                    paperSize: "A4",
                    margin: { top: "1cm", bottom: "1cm" },
                    scale: 0.8,
                    height: 500
                })
                    .then(function(group){
                    kendo.drawing.pdf.saveAs(group, "Exported.pdf")
                });
    }

    $(document).ready(function() { 
                var specialElementHandlers = {
                    '#editor': function(element, renderer) { return true; }
                };

                $('.btnPdfMonth').click(function() {
                    var doc = new jsPDF();

                    doc.fromHTML($('#div_export_id').html(), 15, 15, {
                        'width': 170,'elementHandlers': specialElementHandlers
                    });

                    doc.save('sample-file.pdf');
                });  
            });
    ////Export To PDF Monthwise
    // function ExportMonthPdf(){ 
    //        var doc = new jsPDF();
    //        doc.addHTML($('#div_export_id'), 15, 15, {
    //        'background': '#fff',
    //        'border':'2px solid white',
    //        }, function() {
    //        doc.save('sample-file.pdf');
    //        });
    // }

 </script>
   
  <%--</form>
 </body>
</html>--%>
</asp:Content>
