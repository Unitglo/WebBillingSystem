<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="SaleDetails.aspx.cs" Inherits="WebBillingSystem.SaleDetails" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
    <!-- Breadcrumb -->
     <%--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
   
     <script>
    
</script>

   
    <div style="text-align: center">
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Tax Invoice</li>
                </ol>
            </nav>
        
        <%--<asp:Button ID="btnAdd" class="btn btn-primary btn-just-icon btn-round" runat="server" Text="ADD NEW" OnClick="loadModalDiv();"/>--%>
        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
        
    </div>
            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Sale/Tax Invoice Details</h4>
                    <input type="button" onclick="loadModalDiv();" class="btn btn-primary btn-just-icon btn-round" style="float: right;" value="+" data-toggle="tooltip-dark" data-placement="top" title="Add New Sale"/>
                </div>
                <!-- /Title -->

                <div class="row">
                    <div class="col-sm">
                        <a href='javascript:$(".exportSaleExcel").click();' class="btn btn-blue">Export to Excel</a>
                        <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-sale');"/>
                        
                </div>
                </div>
              
                
                    <!-- DataTable -->
               <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
               
                <div class="col-sm-12" >
                    <table id="data-table-sale-details-display" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                                            
                    <%--<table id="data-table-sale-details" class="table table-hover w-100 display pb-30 dataTable dtr-inline">--%>
                        <thead>
                            <tr role="row">
                                <th id="action_Id">Action</th>
                                <th>Data Status</th>
                                <th>Invoice No</th>
                                <th>Invoice Date</th>
                                <th>Bill Party Name</th>
                                <th>Ship Party Name</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                            </tr>
                         </thead>
						</table>
                      </div>
                <div class="col-sm-12" id="table_div_id">
                    <table id="data-table-sale-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                                            
                    <%--<table id="data-table-sale-details" class="table table-hover w-100 display pb-30 dataTable dtr-inline">--%>
                        <thead>
                            <tr role="row">
                                <th>invoice Id</th>
                                <th>Invoice Date</th>
                                <th>Reverse Charge</th>
                                <th>State</th>
                                <th>State code</th>
                                <th>Transport Mode</th>
                                <th>Vehicle No</th>
                                <th>Date of Supply</th>
                                <th>Place Of supply</th>
                                <th>Bill Party Name</th>
                                <th>Bill Party Address</th>
                                <th>Bill Party GSTID</th>
                                <th>Bill Party State</th>
                                <th>Bill Party State Code</th>
                                <th>Ship Party Name</th>
                                <th>Ship Party Address</th>
                                <th>Ship Party GSTID</th>
                                <th>Ship Party State</th>
                                <th>Ship Party State Code</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                                <th>IGST Total</th>
                                <th>CGST Total</th>
                                <th>SGST Total</th>
                                <th>Discount</th>
                                <th>bank_name</th>
                                <th>Bank Account No</th>
                                <th>Bank IFSC Code</th>
                                <th>Company Name</th>
                                <th>Terms and Condition</th>
                                <th>Auth Name</th>
                                <th>Payment Mode</th>
                                <th>Payment Status</th>
                                <th>Remarks</th>
                            </tr>
                         </thead>
						</table>
                      </div>
                    </section>
                </div>
             </div>
</div>
                 <!-- /DataTable -->

<script>
    //data-table-sale-details
    function sale_details() {

        var jsonString = '<%=json_sale_obj %>'; //for testing
        if (jsonString != '') {

            jsonString = JSON.parse(jsonString)
            //Load  datatable
            var table = $('#data-table-sale-details').DataTable({
                dom: 'Bfrtip',
                buttons: [{
                    extend: 'excel',
                    text: 'Excel to Excel',
                    className: 'exportSaleExcel',
                    filename: 'Sale_Excel',
                    exportOptions: { modifier: { page: 'all' } }
                    //exportOptions: { columns: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,21,22,23,24,25,26,27,28,29,30,31,32,33,34] }
                }],
                data: jsonString,
                "paging": false,
                "ordering": false,
                "info": false,
                "searching": false,

                columns: [
                    { "data": "invoice_no" },
                    { "data": "invoice_date" },
                    { "data": "reverse_charge" },
                    { "data": "i_state" },
                    { "data": "statecode" },
                    { "data": "transport_mode" },
                    { "data": "vehicle_no" },
                    { "data": "date_of_supply" },
                    { "data": "place_of_supply" },
                    { "data": "seller_name" },
                    { "data": "Seller_address" },
                    { "data": "gstin" },
                    { "data": "s_state" },
                    { "data": "state_code" },
                    { "data": "ship_party_name" },
                    { "data": "ship_party_address" },
                    { "data": "ship_party_gstin" },
                    { "data": "ship_party_state" },
                    { "data": "ship_party_state_code" },
                    { "data": "total_cost" },
                    { "data": "total_gst" },
                    { "data": "total_igst" },
                    { "data": "total_cgst" },
                    { "data": "total_sgst" },
                    { "data": "total_discount" },
                    { "data": "bank_name" },
                    { "data": "bank_ac_no" },
                    { "data": "bank_ifsc_code" },
                    { "data": "company_name" },
                    { "data": "terms_and_condition" },
                    { "data": "auth_name" },
                    { "data": "payment_mode" },
                    { "data": "payment_status" },
                    { "data": "remark" }
                ]
            });
        }
    }
    function sale_details_display() {

        var jsonString = '<%=json_sale_obj %>'; //for testing
        if (jsonString != '') {
            jsonString = JSON.parse(jsonString);
            //Load  datatable
            var table = $('#data-table-sale-details-display').DataTable({
                data: jsonString,
                autoWidth: false,
                language: {
                    search: "",
                    searchPlaceholder: "Search",
                    sLengthMenu: "_MENU_items"
                },
                columns: [

                    { "data": "edit_button" },
                    { "data": "status_label" },
                    { "data": "invoice_no" },
                    { "data": "invoice_date" },
                    { "data": "seller_name" },
                    { "data": "ship_party_name" },
                    { "data": "total_cost" },
                    { "data": "total_gst" },
                ]
            });
            $('#data-table-sale-details-display thead tr').clone(true).appendTo('#data-table-sale-details-display thead');
            $('#data-table-sale-details-display thead tr:eq(1) th').each(function (i) {
                var title = $(this).text();
                $(this).html('<input type="text" class="class_' + title + '" placeholder="Search ' + title + '" />');
                $('input', this).on('keyup change', function () {
                    if (table.column(i).search() !== this.value) {
                        table
                            .column(i)
                            .search(this.value)
                            .draw();
                    }
                });
            });
            $(".class_Action").css("display", "none");
            $(".class_Data").css("width", "50px");
            $(".class_Invoice").css("width", "50px");
            $(".class_Bill").css("width", "50px");
            $(".class_Ship").css("width", "50px");
            $(".class_Total").css("width", "30px");
        }
            
    }
    window.onload = function () {
        sale_details_display()
        $("#table_div_id").hide();
        sale_details();
        $("a.exportSaleExcel").removeClass("dt-button buttons-excel buttons-html5");
        $("a.exportSaleExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
}

    function loadModalDiv()
    {
        location.href = '/Vouchers/SaleInvoice';
    }
    
    function Export2Doc(element, filename = '') {
        $(".exportSaleExcel").hide();
        
        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
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
</script>
</asp:Content>
