<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="ClosingStockValuationReport.aspx.cs" Inherits="WebBillingSystem.ClosingStockValuationReport" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
  <!-- Breadcrumb -->
     <nav class="hk-breadcrumb" aria-label="breadcrumb">
         <ol class="breadcrumb breadcrumb-light bg-transparent">
             <li class="breadcrumb-item"><a href="#">Report</a></li>
             <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Closing Stock Report</li>
         </ol>
     </nav>
  <!-- /Breadcrumb -->

    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Closing Stock Report</h4>
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
                                    <option value="0">All...</option>
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
                                            
                                       </tbody></table>
                         </div></div></div></div>
                     </div>                    
                 
                  <div class="row">
                    <div class="col-sm-12">    
                        <!-- start Table -->

                        <table class="table table-hover w-100 pb-30 dtr-inline table-bordered" role="grid" id="StockLedger">
                            <thead>
                              <%--  <tr>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Group</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:350px;">Product Name</th>
                                    <th colspan="3" data-orderable="false" style="border: 2px solid; text-align:center; width:350px;">Closing Balance</th>
                                <tr>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;"></th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;"></th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Rate</th>
                                    <th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>
                                </tr>--%>

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
    var monthsName = [ "April", "May", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March" ];
    var monthNum = [ "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3" ];
    // main function
     window.onload = function () {  
         $(".product_desc_class").select2();
         stock_details_display();
    };
        var all_products = '<%=all_products_json %>';
        var month_wise_products = '<%=month_wise_products_json %>';
    
    function stock_details_display() {
        if (all_products != '') {
            all_products = JSON.parse(all_products  );
        }
        if (month_wise_products != '') {
            month_wise_products = JSON.parse(month_wise_products  );
        }
        var month_wise_tr = "";
        monthsName.forEach(function (key, index) {
            var edit_button = "<a class='btn btn-xs btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand' data-month-name='" + key + "' data-month-num='" + monthNum[index] + "' onClick='month_div(this)'></a>";
            month_wise_tr += "<tr>" +
                        "<td colspan='1'>"+ edit_button + "</td>" +
                        "<td colspan='10' >" + key + "</td>" +
                        "<tr id='month-" + key + "'></tr>"+
                        "</tr>";
        });
        $("#StockLedger tbody").html(month_wise_tr);
        monthsName.forEach(function (key, index) {
            show_details_of_month(key);
        });
        
    }
    function month_div(obj) {
        var m_name = $(obj).attr("data-month-name");
        $("#month-"+m_name).toggle(20);
    }
    function show_details_of_month(month) {
        var day_details = "";
        
        all_products.forEach(function (key, index) {

            var product_month_qty = parseFloat(all_products[index].product_open_qty);
            var product_month_cost =parseFloat( all_products[index].product_open_value);
            var product_month_unit_rate = parseFloat(all_products[index].product_open_unit_rate);
            var product_month_value = parseFloat(all_products[index].product_open_value);
            var inword_qty = 0.00;
            var inword_cost = 0.00;
            var outword_qty = 0.00;
            var outword_cost = 0.00;
            month_wise_products.forEach(function (key1, index1) {

                if (key1.product_name == key.product_name && key1.product_monthname == month) {
                    //product_month_qty = key.product_open_qty;
                    //product_month_cost = key.product_open_cost;
                    //product_month_unit_rate = key.product_open_unit_rate;
                    //product_month_value = key.product_open_value;

                    if (key1.product_static_type == "sales") {
                        // sale prize is high so cost is showing negative 
                        outword_qty = outword_qty + parseFloat(key1.product_qty);
                        outword_cost = outword_qty + parseFloat(key1.product_value);
                        //                       product_month_cost = product_month_cost -(product_month_unit_rate * product_month_qty);
                        //                        product_month_qty = product_month_qty - key1.product_qty;                       
                    }
                    if (key1.product_static_type == "saleReturn") {
                        inword_qty = inword_qty + parseFloat(key1.product_qty);
                        inword_cost = inword_qty + parseFloat(key1.product_value);

                        //                      product_month_cost = product_month_cost +(product_month_unit_rate * product_month_qty);
                        //                      product_month_qty = product_month_qty + key1.product_qty;                       
                    }
                    if (key1.product_static_type == "purchase") {
                        inword_qty = inword_qty + parseFloat(key1.product_qty);
                        inword_cost = inword_qty + parseFloat(key1.product_value);
                        //var po_product_month_unit_rate = key1.product_value/ key1.product_qty;
                        //all_products[index].product_open_unit_rate = (product_month_unit_rate+po_product_month_unit_rate)/2;
                        //product_month_cost = product_month_cost +(product_month_unit_rate * product_month_qty);
                        //product_month_qty = product_month_qty + key1.product_qty;                       
                    }
                    if (key1.product_static_type == "purchaseReturn") {
                        outword_qty = outword_qty + parseFloat(key1.product_qty);
                        outword_cost = outword_qty + parseFloat(key1.product_value);
                        //var po_product_month_unit_rate = product_month_cost / product_month_qty;
                        //all_products[index].product_open_unit_rate = (product_month_unit_rate+po_product_month_unit_rate)/2;
                        //product_month_cost = product_month_cost -(product_month_unit_rate * product_month_qty);
                        //product_month_qty = product_month_qty - key1.product_qty;                       
                    }


                    //                    all_products[index].product_close_qty = key1.product_qty;
                    //                    all_products[index].product_close_cost = key1.product_value/key1.product_qty;
                    //                    all_products[index].product_close_unit_rate = key1.product_value/key1.product_qty;
                    //                    all_products[index].product_close_value = key1.product_value;


                    //all_products[index].product_close_qty = key.product_qty;
                    //all_products[index].product_close_cost = key.product_close_cost;
                    //all_products[index].product_close_unit_rate = key.product_close_unit_rate;
                    //all_products[index].product_close_value = key.product_value;

                    //all_products[index].product_close_qty = key.product_qty;
                    //all_products[index].product_close_cost = key.product_close_cost;
                    //all_products[index].product_close_unit_rate = key.product_close_unit_rate;
                    //all_products[index].product_close_value = key.product_value;

                }
            });

            /*
            product_close_qty
            product_close_cost
            product_close_unit_rate
            product_close_value
            */

            /*
            product_open_cost
            product_open_qty
            product_open_unit_rate
            product_open_value
            */


            //            product_month_unit_rate
            //            product_month_value

            var temp_unit_rate = product_month_cost / product_month_qty;
            var temp_unit_rate1 = outword_cost / outword_qty;
            var temp_unit_rate2 = inword_cost / inword_qty;
            if (!isNaN(temp_unit_rate1) && !isNaN(temp_unit_rate)) {
                temp_unit_rate = (temp_unit_rate + temp_unit_rate1) / 2;
            }
            if (isNaN(temp_unit_rate)) {
                if (isNaN(temp_unit_rate1)) {
                    temp_unit_rate = temp_unit_rate2;
                } else {
                    temp_unit_rate = temp_unit_rate1;
                }
            }
            
                   product_month_qty = (product_month_qty + inword_qty - outword_qty);
                   product_month_cost = temp_unit_rate * product_month_qty;
                   product_month_unit_rate = temp_unit_rate;
                   product_month_value = temp_unit_rate * product_month_qty;

                    all_products[index].product_open_qty = product_month_qty ;
                    all_products[index].product_open_cost = product_month_cost;
                    all_products[index].product_open_unit_rate = product_month_unit_rate ;
                    all_products[index].product_open_value = product_month_cost;

                    all_products[index].product_close_qty = product_month_qty;
                    all_products[index].product_close_cost = product_month_cost;
                    all_products[index].product_close_unit_rate = product_month_unit_rate ;
            all_products[index].product_close_value = product_month_cost;

            // Closing Balance ( Cost Price ) 		

            var cost_price =  (!isNaN(parseFloat(all_products[index].product_sale_price))?parseFloat(all_products[index].product_sale_price):0);
            var market_price =  (!isNaN(parseFloat(all_products[index].product_mrp))?parseFloat(all_products[index].product_mrp):0);

            day_details += '' +
                '<tr><td style="text-align:center; width: 80px;">' + key.product_group + '</td>' +
                '<td style="text-align:center; width: 270px">' + key.product_name + '</td>' +

                '<td style="text-align: right; width: 100px;">' + ((!isNaN(all_products[index].product_close_qty))?all_products[index].product_close_qty:0).toFixed(2) + '</td>' +
                    '<td style="text-align: right; width: 100px;">' + (cost_price).toFixed(2) + '</td>' +
                '<td style="text-align: right; width: 100px;">' + (cost_price*all_products[index].product_close_qty).toFixed(2) + '</td>' +

                    '<td style="text-align: right; width: 100px;">' + ((!isNaN(all_products[index].product_close_qty))?all_products[index].product_close_qty:0).toFixed(2) + '</td>' +
                    '<td style="text-align: right; width: 100px;">' + (market_price).toFixed(2) + '</td>' +
                '<td style="text-align: right; width: 100px;">' + (market_price*all_products[index].product_close_qty).toFixed(2) + '</td>' +

                '<td style="text-align: right; width: 100px;">' + ((!isNaN(all_products[index].product_close_qty)) ? all_products[index].product_close_qty : 0).toFixed(2) + '</td>' +
                    '<td style="text-align: right; width: 100px;">' + ((!isNaN(all_products[index].product_close_unit_rate)) ? all_products[index].product_close_unit_rate : 0).toFixed(2) + '</td>' +
                    '<td style="text-align: right; width: 100px;">' + ((!isNaN(all_products[index].product_close_value ))?all_products[index].product_close_value :0).toFixed(2)+ '</td>' +
                '</tr>';

        });
        day_details = '<tr>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Group</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Product Name</th>' +
            '<th colspan="3" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Closing Balance(Cost Price)</th>' +
            '<th colspan="3" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Closing Balance( Market Price )</th>' +
            '<th colspan="3" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;">Closing Balance</th>' +
            '</tr><tr>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;"></th>'+
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:50px;"></th>'+

            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Rate</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>'+

            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Rate</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>'+

            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Quantity</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Rate</th>' +
            '<th colspan="1" data-orderable="false" style="border: 2px solid; text-align:center; width:100px;">Value</th>'+
            '</tr>'+
            '<tr> ' + day_details;
        $("#month-" + month).html("<td colspan='11'><table style='width: 100%;'>"+day_details+"</table></td>");

    }

    //Export To Excel Per Year
    $("#btnExport").click(function (e) {

        window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_id]').html()));
            e.preventDefault();
    });


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
</asp:Content> 