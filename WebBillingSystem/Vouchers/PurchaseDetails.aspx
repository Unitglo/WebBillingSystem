<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchaseDetails.aspx.cs" Inherits="WebBillingSystem.PurchaseDetails" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
    <%--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <%--<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
    <!-- Breadcrumb -->
    <div>
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Purchase Invoice</li>
                </ol>
            </nav>
        

        
     <%--<button onclick="return loadModalDiv()" class="btn btn-primary btn-just-icon btn-round" rel="tooltip" data-toggle="modal" data-target="#RegionMasterModal" data-original-title="Add New Region" style="float: right;" call-url="http://localhost:53130/Master/AddAccount.aspx">
							<i class="fa fa-plus"></i>
						<div class="ripple-container"></div></button>
     --%>   </div>
            <!-- /Breadcrumb -->
    
            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Purchase Invoice Details</h4>
                    <input type="button" id="Addbtn" onclick="loadModalDiv();" class="btn btn-primary btn-just-icon btn-round" rel="tooltip" style="float: right;" value="+" data-toggle="tooltip-dark" data-placement="top" title="Add new Purchase Entry"/>
                </div>
                 <!-- /Title -->

                <!-- fileupload -->
               
                <div class="row">
                    <div class="col-sm">
                        <a href='javascript:$(".exportPurExcel").click();' class="btn btn-blue">Export to Excel</a>
                        <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-purchase');"/>
                </div>
                </div>
                <!-- /fileupload -->

                    <!-- DataTable -->
               <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
      
         
                <div class="col-sm-12">
                    <table id="data-table-purchase-details-display" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                                            
                    <%--<table id="data-table-purchase-details" class="table table-hover w-100 display pb-30 dataTable dtr-inline">--%>
                        <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Data Status</th>
                                <th>Invoice No</th>
                                <th>Invoice Date</th>
                                <th>Seller Name</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                            </tr>
                         </thead>
						</table>
                      </div>
                    
                    <div class="col-sm-12" id="table_div_id">
                    <table id="data-table-purchase-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                    <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Invoice No</th>
                                <th>Invoice Date</th>
                                <th>reverse charge</th>
                                <th>State</th>
                                <th>state code</th>
                                <th>Seller Name</th>
                                <th>seller address</th>
                                <th>GST no</th>
                                <th>state name</th>
                                <th>state code</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                                <th>Total IGST</th>
                                <th>Total CGST</th>
                                <th>Total SGST</th>
                                <th>Discount</th>
                                <th>Payment Mode</th>
                                <th>Payment status</th>
                                <th>invoice_type</th>
                                <th>remark</th>
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
    //data-table-purchase-details

    function purchase_details() {

        var jsonString = JSON.parse('<%=json_purchase_obj %>') //for testing
       
        //Load  datatable
        var table = $('#data-table-purchase-details').DataTable({
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Export to Excel',
                className: 'exportPurExcel',
                filename: 'Purchase_Excel',
                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19] }
            }],

            data: jsonString,
            "paging":   false,
            "ordering": false,
            "info":     false,
            "searching": false,

            columns: [
                { "data": "edit_button"},
                { "data": "invoice_no" },
                { "data": "invoice_date" },
                { "data": "reverse_charge" },
                { "data": "i_state" },
                { "data": "statecode" },
                { "data": "seller_name" },
                { "data": "Seller_address" },
                { "data": "gstin" },
                { "data": "s_state" },
                { "data": "state_code"},
                { "data": "total_cost" },
                { "data": "total_gst" },
                { "data": "total_igst" },
                { "data": "total_cgst" },
                { "data": "total_sgst" },
                { "data": "total_discount" },
                { "data": "payment_mode" },
                { "data": "payment_status" },
                { "data": "invoice_type" },
                { "data": "remark" }
    ]
        });

    }
       function purchase_details_display() {

        var jsonString = JSON.parse('<%=json_purchase_obj %>') //for testing
       
        //Load  datatable
        var table = $('#data-table-purchase-details-display').DataTable({
        
            data: jsonString,
           autoWidth: false,
           
            language: { search: "",
                searchPlaceholder: "Search",
                sLengthMenu: "_MENU_items"

            },
            columns: [
                { "data": "edit_button" },
                { "data": "status_label" },
                { "data": "invoice_no" },
                { "data": "invoice_date" },
                { "data": "seller_name" },
                { "data": "total_cost" },
                { "data": "total_gst" }
    ]
        });

        $('#data-table-purchase-details-display thead tr').clone(true).appendTo('#data-table-purchase-details-display thead');
        $('#data-table-purchase-details-display thead tr:eq(1) th').each(function (i) {
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
                $(".class_Seller").css("width", "120px");                
                $(".class_Total").css("width", "50px");
    }

    window.onload = function () {
        purchase_details_display()
        $("#table_div_id").hide();
        purchase_details();
        $("a.exportPurExcel").removeClass("dt-button buttons-excel buttons-html5");
        $("a.exportPurExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
        loadModalDiv();
    };

     function loadModalDiv()
    {
      <%  if (Session["page_role"].ToString() == "CA")
    {%>
         $("#Addbtn").hide();
       
      <% }%>
         <%else{%>
         $("#Addbtn").Show();
         $("#Addbtn").click(function(){ 
             location.href = '/Vouchers/Purchaseinvoice';
         })
 <% }%>
  }

    function Export2Doc(element, filename = '') {
        $(".exportPurExcel").hide();
        
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
