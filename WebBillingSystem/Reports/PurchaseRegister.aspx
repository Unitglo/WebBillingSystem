<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchaseRegister.aspx.cs" Inherits="WebBillingSystem.PurchaseRegister" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">

            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Purchase Register</li>
                </ol>
            </nav>
  <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Purchase Register</h4>
             </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
        <div class="row">
           <div class="col-xl-12">
            <section class="bg-light hk-sec-wrapper">
                
                <div id="editor"></div>
                <div id="div_export_id">   
                   <div style="text-align:center;" class="row">                         
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
							        <th data-orderable="false" style="border: 2px solid; text-align:center;">Debit Amount</th>
							        <th data-orderable="false" style="border: 2px solid; text-align:center;">Credit Amount</th>
							        <th data-orderable="false" style="border: 2px solid; text-align:center;">Closing Balance</th>
							    </tr>
                            </thead>
                            <tbody>

                            </tbody>
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
    
    <style>
    
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
                     var month_class = data["month"] + "_" + 'monthRowClass'; 
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
            row.child(format(row.data()) ).show();
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
                        this.child(format(this.data())).show();
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
    
    
    var op_bal_cr = "";
    var op_bal_dr = "";
    function format(d) {         
        var jsonStringDtl = '<%=json_journal_book_dtl_obj %>';
        if (jsonStringDtl != '') {
            jsonStringDtl = JSON.parse(jsonStringDtl);
            
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
                        '<td colspan = "4" style="text-align: center;">Opening Balance</td>' +
                        '<td style="text-align: center;"><label id="drvalue" runat="server">'+ op_bal_dr +'</label></td>' +
                        '<td style="text-align: center;"><label id="crvalue" runat="server">'+ op_bal_cr +'</label></td>' +
                        '<td></td>' +
                '</tr>';
            var temp_date = ""; 
            op_bal_dr = "0.00";
            op_bal_cr = "0.00";
            jsonStringDtl.forEach(function (key, index) {
              
                if (key.month == d.month) {
                    op_bal_dr = key.acc_cl_bal;
                    if (op_bal_dr.slice(-2) == "Dr") {
                        op_bal_dr = key.acc_cl_bal;
                    } else {
                        op_bal_cr = key.acc_cl_bal;
                    }

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
        contents = $("#det_id").html() + "<div> Month : " + contents + $("." + contents).html() + "</div>";
        window.open('data:application/vnd.ms-excel,' + encodeURIComponent(contents));
    }
    function ExportToDocMonth(element) {

        var filename = "Purchase Register Month Report";
        contents = $(element).parent().parent().find("td:eq(1)").html();
        contents = $("#det_id").html() + "<div> Month : " + contents + $("." + contents).html() + "</div>";

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
 </script>
</asp:Content>
