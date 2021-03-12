<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="ExpensesDetails.aspx.cs" Inherits="WebBillingSystem.ExpensesDetails" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
   <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
    <!-- Breadcrumb -->
       <div>
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Expenses Vouchers</li>
                </ol>
            </nav>
        
        </div>
            <!-- /Breadcrumb -->
    
            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Expenses Vouchers Details</h4>
                    <input type="button" id="Addbtn" onclick="loadModalDiv();" class="btn btn-primary btn-just-icon btn-round" rel="tooltip" data-toggle="modal"  data-original-title="Add New Region" style="float: right;" value="+"/>
                </div>
                 <!-- /Title -->
                <br />
                <div class="row">
                    <div class="col-sm">
                        <a href='javascript:$(".exportExpeExcel").click();' class="btn btn-blue" data-toggle="tooltip-dark" data-placement="top" title="Export Data in Excel">Export to Excel</a>
                        <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-expenses');"/>
                </div>
                </div>
                <br />
                    <!-- DataTable -->
               <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
      
         
                <div class="col-sm-12" >
                    <table id="data-table-Expenses-details-display" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                      <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Data Status</th>
                                <th>Exp Vouchers No</th>
                                <th>exp voucher date</th>
                                <th>Suppliers Name</th>
                                <th>Expenses Head</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                               </tr>
                         </thead>
						</table>
                      </div>
                <div class="col-sm-12" id="table_div_id">
                    <table id="data-table-Expenses-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                      <thead>
                            <tr role="row">
                                <th>exp voucher date</th>
                                <th>Place Of Supply</th>
                                <th>Reverse Charge</th>
                                <th>State</th>
                                <th>state code</th>
                                <th>Suppliers Name</th>
                                <th>address</th>
                                <th>GST no</th>
                                <th>state name</th>
                                <th>state code</th>
                                <th>Expenses Head</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                                <th>Total IGST</th>
                                <th>Total CGST</th>
                                <th>Total SGST</th>
                                <th>Company Name</th>
                                <th>Auth Name</th>
                                <th>Payment Mode</th>
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
    //data-table-Expenses-details

    function expense_details() {
    
        var jsonString = JSON.parse('<%=json_expenses_obj %>') //for testing
        //Load  datatable
       
        var table = $('#data-table-Expenses-details').DataTable({
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Export to Excel',
                className: 'exportExpeExcel',
                filename: 'Expenses_Excel',
                exportOptions: { modifier: { page: 'all' } }
                //exportOptions: { columns: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,21] }
            }],

            data: jsonString,
            "paging":   false,
            "ordering": false,
            "info":     false,
            "searching": false,

            columns: [
                { "data": "exp_voucher_date" },
                { "data": "exp_place_of_supply" },
                { "data": "exp_reverse_charge" },
                { "data": "exp_state" },
                { "data": "exp_state_code" },
                { "data": "exp_supplier_name" },
                { "data": "exp_supplier_addr" },
                { "data": "exp_supplier_gstin" },
                { "data": "exp_supplier_state" },
                { "data": "exp_supplier_state_code" },
                { "data": "expenses_head" },
                { "data": "total_cost" },
                { "data": "total_gst" },
                { "data": "total_igst" },
                { "data": "total_cgst" },
                { "data": "total_sgst" },
                { "data": "company_name" },
                { "data": "auth_name" },
                { "data": "payment_mode" },
    ]
        });

    }

    function expense_details_display() {
        debugger
        var jsonString = JSON.parse('<%=json_expenses_obj %>') //for testing
        //Load  datatable
        //if (jsonString != '') {
        //    jsonString = JSON.parse(jsonString);
            var table = $('#data-table-Expenses-details-display').DataTable({
                data: jsonString,
                autoWidth: false,
           
                language: { search: "",
                    searchPlaceholder: "Search",
                    sLengthMenu: "_MENU_items"

                },
                columns: [
                    { "data": "edit_button" },
                    { "data": "status_label" },
                    { "data": "exp_voucher_no" },
                    { "data": "exp_voucher_date" },
                    { "data": "exp_supplier_name" },
                    { "data": "expenses_head" },
                    { "data": "total_cost" },
                    { "data": "total_gst" },
                ]
            });

            $('#data-table-Expenses-details-display thead tr').clone(true).appendTo('#data-table-Expenses-details-display thead');
            $('#data-table-Expenses-details-display thead tr:eq(1) th').each(function (i) {
                var title = $(this).text();
                $(this).html('<input type="text" class="class_' + title + '"  placeholder="Search ' + title + '" />');
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
            $(".class_Exp").css("width", "50px");
            $(".class_exp").css("width", "50px");
            $(".class_Suppliers").css("width", "50px");                
            $(".class_Expenses").css("width", "50px");                
            $(".class_Total").css("width", "50px");
        }
    
    window.onload = function () {
        loadModalDiv();
        expense_details_display();
        $("#table_div_id").hide();
        expense_details();
        $("a.exportExpeExcel").removeClass("dt-button buttons-excel buttons-html5");
        $("a.exportExpeExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
       
    };

   function loadModalDiv()
    {
      
       <%if (Session["page_role"].ToString() == "CA")
    {%>
      
       $("#Addbtn").hide();
      
      <% }%>
   <%else{%>
       $("#Addbtn").show();
       $("#Addbtn").click(function(){ 
           location.href = '/Vouchers/ExpensesVoucher';
       })
 <% }%>
  }

    function Export2Doc(element, filename = '') {
        $(".exportExpeExcel").hide();
        
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
