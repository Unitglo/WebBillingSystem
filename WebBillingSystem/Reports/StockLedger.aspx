<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="StockLedger.aspx.cs" Inherits="WebBillingSystem.StockLedger" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">

  <!-- Breadcrumb -->
     <nav class="hk-breadcrumb" aria-label="breadcrumb">
         <ol class="breadcrumb breadcrumb-light bg-transparent">
             <li class="breadcrumb-item"><a href="#">Report</a></li>
             <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Stock Ledger</li>
         </ol>
     </nav>
  <!-- /Breadcrumb -->

    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Stock Ledger</h4>
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
                           <div class="col-md-2 form-group">
                                   <label for="stock_group_id">Group : </label>
                                   <select class="form-control custom-select d-block w-100 stock_group"  runat="server" id="stock_group_id" onserverchange="Group_Changed">
                                       <option value="0">All...</option>
                                   </select>
                           </div>
                           <div class="col-md-4 form-group">
                              <label>Product Name :</label>
                              <select runat="server" class="form-control select2 product_desc_class"  id="product_desc_id" name="product_desc_name" >
                              </select>
                          </div>
                           <div class="col-md-3 form-group">
                              <label>From Date :</label>
                            <input type="date" runat="server" class="form-control from_date_class"  id="from_date_id" />
                          </div>
                          <div class="col-md-3 form-group">
                              <label>To Date :</label>
                            <input type="date" runat="server" class="form-control to_date_class"  id="to_date_id"/>
                          </div>
                        </div>
                      <div class="row">
                          <div class="col-md-3 form-group">
                                <input type="checkbox" id="chk_all_display_dtl" class="chk-details-control" style="width: 15px; height: 15px;"/>&nbsp; : <label>Expand/Collapse All</label>
                          </div>
                                                   
                          <div class="col-md-4 form-group">
                              <asp:LinkButton runat="server" ID="linkbtnSearch" OnClick="search_jv_details_event" class="btn btn-xs btn-light"><i class="fa fa-search" style="font-size: 20px;" data-toggle="tooltip-dark" data-placement="top" title="Search Records"></i></asp:LinkButton>
                              &nbsp;<button id="btnExport" value="Excel" class="btn btn-xs btn-light" data-toggle="tooltip-dark" data-placement="top" title="Export to Excel"><i class="fa fa-file-excel-o" style="font-size:20px;color:forestgreen"></i></button>
                              &nbsp;<button id="btnPDF" class="btn btn-xs btn-light" onclick="ExportPdf()" data-toggle="tooltip-dark" data-placement="top" title="Export to PDF"><i class="fa fa-file-pdf-o" style="font-size:20px;color:red"></i></button>
                              &nbsp;<button id="btnWordDoc" class="btn btn-xs btn-light" value="Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('div_export_id', 'word-content-stock-ledger');"><i class="fa fa-file-word-o" style="font-size: 20px;color:blue"></i></button>
                          </div>
                     </div>
                     </div>
                </div>
                <div id="editor"></div>
                <div id="div_export_id">                
                   <div style="text-align:center; display:none; text-align:center" class="row">                         
                         <div class="col-lg-12" style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">
                                    <div class="card card-sm">
										<div class="card-body bg-light" style="text-align: -webkit-center;">
                                            <table class="company_details_table">
                                                <tr><td colspan="14" style="text-align:center"><h4 id="comp_name_id" runat="server"></h4></td></tr>
                                                <tr><td colspan="14" style="text-align:center; width:100px;">Trade Name -<label id="comp_trade_name_id" runat="server"></label></td></tr>
                                                <tr><td colspan="14" style="text-align:center"> Address -<label runat="server" id="comp_add_id"></label></td></tr>
                                                <tr><td colspan="14" style="text-align:center">Email  - <label runat="server" id="comp_email_id"></label></td> </tr>
                                                <tr><td colspan="14" style="text-align:center">Phone  - <label runat="server" id="comp_phone_id"></label></td></tr>
                                                <tr><td colspan="14" style="text-align:center">GST No - <label runat="server" id="comp_gst_no_id"></label></td></tr>
                                                <tr><td colspan="14" style="text-align:center">PAN No - <label runat="server" id="comp_pan_no_id"></label></td></tr>
                                                <tr><td colspan="14" style="text-align:center">CIN No - <label runat="server" id="comp_cin_no_id"></label></td></tr>
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
                                        <table><tbody style="text-align:center">
                                             <tr><td colspan="8" style="text-align:center"> <h5 id="company_name_id" runat="server"></h5></td></tr>
                                             <%--<tr><td> Auth.Dealer - <label id="auth_dealer_id" runat="server"></label></td></tr>
                                             <tr><td> <label runat="server" id="state_id"></label></td></tr>
                                             <tr><td> <label runat="server" id="address_id"></label></td></tr>
                                             <tr><td> GSTIN NO - <label runat="server" id="gstin_id"></label></td></tr>
                                             <tr><td> State Code - <label runat="server" id="statecode_id"></label></td></tr>--%>
                                             <%--<tr><td> <h4>Stock Ledger</h4></td></tr>--%>
                                             <tr><td colspan="8" style="text-align:center"><label runat="server" id="date_id"></label></td></tr>
                                       </tbody></table>
                         </div></div></div></div>
                     </div>                    
                 
                  <div class="row">
                    <div class="col-sm-12">    
                        <!-- start Table -->
                        <table id="ClosingStockLedger" class="table table-hover w-100 pb-30 dataTable dtr-inline table-bordered" role="grid">
                            <thead>
						        <tr>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Action</th>
							        <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:350px;">Particulars</th>
							        <th colspan="2" data-orderable="false" style="border: 2px solid; text-align:center; width:200px;"> Inwards </th>
							        <th colspan="2" data-orderable="false" style="border: 2px solid; text-align:center; width:200px;"> Outwards </th>
							        <th colspan="2" data-orderable="false" style="border: 2px solid; text-align:center; width:200px;">Closing Balance</th>
							    </tr>
                                <tr>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;"></th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:350px;"></th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>
                                </tr>                                          
                            </thead>                                           
                            <tbody>

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
        .rotate_angle {
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
    

<script type="text/javascript">

    // main function 
     window.onload = function () {  
         $(".product_desc_class").select2();
         stock_details_display();
         //$('#ClosingStockLedger').removeClass('sorting_asc');        
    };
    

     function stock_details_display() {         
         var jsonString = '<%=json_month_stk_ledger_obj %>'; //for testing
         if (jsonString != '') {
             jsonString = JSON.parse(jsonString); //for testing
         var table = $('#ClosingStockLedger').DataTable({
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
                     { "data": "inward_qty" },
                     { "data": "inward_value" },
                     { "data": "outward_qty" },
                     { "data": "outward_value" },
                     { "data": "cl_bal_qty" },
                     { "data": "cl_bal_value" }
                 ],
                 rowCallback: function (row, data) {
                     var month_class = data["month"] + "_" + 'month RowClass'; 
                    $(row).addClass(month_class);
                 }
             });
             
         }
         table.row.add($('<tr style="font-weight: bold;"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>')[0]).draw();
            
         $('#ClosingStockLedger tbody tr').find("td:eq(0)").css("text-align", "center");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "50px");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("text-align", "center");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "350px");
         $('#ClosingStockLedger tbody tr').find("td:eq(2)").css("text-align", "right");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "100px");
         $('#ClosingStockLedger tbody tr').find("td:eq(3)").css("text-align", "right");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "100px");
         $('#ClosingStockLedger tbody tr').find("td:eq(4)").css("text-align", "right");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "100px");
         $('#ClosingStockLedger tbody tr').find("td:eq(5)").css("text-align", "right");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "100px");
         $('#ClosingStockLedger tbody tr').find("td:eq(6)").css("text-align", "right");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "100px");
         $('#ClosingStockLedger tbody tr').find("td:eq(7)").css("text-align", "right");
         $('#ClosingStockLedger tbody tr').find("td:eq(1)").css("width", "100px");
         
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(0)').html("");
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(1)').html("Opening Balance");
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(2)').html('<label id="op_bal_qty_id" runat="server">0.00</label>');
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(3)').html('<label id="op_bal_val_id" runat="server">0.00</label>');
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(4)').html("");
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(5)').html("");
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(6)').html("");
         $('#ClosingStockLedger tbody tr:eq(0) td:eq(7)').html("");
         
     //Format Second Table(call to this table)
     $('#ClosingStockLedger tbody').on('click', '.details-control', function() {
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
            row.child(format(row)).show();
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
                $('#ClosingStockLedger tbody tr:eq(1)').remove();
            }
         });
    }

    function format(obj) {
        var d = obj.data();
        var op_balance = 0.00;

        var jsonStringDtl = '<%=json_day_stk_ledger_obj %>';
        if (jsonStringDtl != '') {
            jsonStringDtl = JSON.parse(jsonStringDtl);

            if (obj[0] < 1) {
                op_balance = $("#ClosingStockLedger tbody tr").eq(0).find("td").eq(2).html();
                op_balance_value =  $("#ClosingStockLedger tbody tr").eq(0).find("td").eq(3).html();
            } else {
                op_balance = $("#ClosingStockLedger tbody tr.RowClass").eq(obj[0]).find("td:eq(6)").html();      
                op_balance_value = $("#ClosingStockLedger tbody tr.RowClass").eq(obj[0]).find("td:last").html();      
            }

         var name_val = '<div class="'+ d.month +'"><table class="table table-hover dataTable" id="dtl_Table" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width: 100%;">';
             name_val += '<tbody>';
             name_val += '<tr style="font-weight: bold;">' +
                         '<td colspan = "9" style="text-align: center;">Opening Balance  :  '+ op_balance + "  -  "+ op_balance_value +'</td>' +
                         '</tr>';
             jsonStringDtl.forEach(function (key, index) {              
                if (key.month == d.month) {                    
                    name_val += '<tr id="table_tr_id">' +
                        '<td style="width: 50px;">'+ key.action + '</td>' +
                        '<td style="text-align:center; width: 80px;">' + key.inv_date + '</td>' +
                        '<td style="text-align:center; width: 270px">' + key.party_name + '</td>' +
                        '<td style="text-align: right; width: 100px;">' + key.inward_qty + '</td>' +
                        '<td style="text-align: right; width: 100px;">' + key.inward_value + '</td>' +
                        '<td style="text-align: right; width: 100px;">' + key.outward_qty + '</td>' +
                        '<td style="text-align: right; width: 100px;">' + key.outward_value + '</td>' +
                        '<td style="text-align: right; width: 100px;">' + key.cl_bal_qty + '</td>' +
                        '<td style="text-align: right; width: 100px;">' + key.cl_bal_value + '</td>' +
                        '</tr>';
                }   
             });           
            return name_val + '</tbody></table></div>';    
        }        
    }

    //Export To Excel Per Year
    $("#btnExport").click(function (e) {
      $('#ClosingStockLedger thead tr:eq(0)').find("th:eq(0)").text("");
        $('#ClosingStockLedger thead tr:eq(1)').find("th:eq(0)").text("");

        window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_id]').html()));
            e.preventDefault();
    });


    //Export To Word Document   
    function Export2Doc(element, filename = '') {
        $('#ClosingStockLedger thead tr:eq(0)').find("th:eq(0)").text("");
        $('#ClosingStockLedger thead tr:eq(1)').find("th:eq(0)").text("");
        //$('#ClosingStockLedger tbody tr').find("td:eq(0)").remove();
        
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

    function ExportPdf() { 
        //$('#dtl_Table thead tr').remove();
        //$('#dtl_Table  tbody').find('tr:eq(0)').remove();

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

 </script>
    <style>
        .company_details_table tr td,.company_details_table tr td h4 {
        text-align:center;
        }
    </style>
</asp:Content>
