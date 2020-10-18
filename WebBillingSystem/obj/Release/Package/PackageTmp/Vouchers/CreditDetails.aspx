<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CreditDetails.aspx.cs" Inherits="WebBillingSystem.CreditDetails" %>

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
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Credit Note</li>
                </ol>
            </nav>
         </div>
            <!-- /Breadcrumb -->
        
            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title" id="header_id" runat="server"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Credit Note Details</h4>
               <asp:Button ID="btnAdd" class="btn btn-primary btn-just-icon btn-round" runat="server" Text="+" OnClick="btnAddClick" data-toggle="tooltip-dark" data-placement="top" title="Add Credit Note" Width="24px"/>

                     </div>
                

                <!-- /Title -->

               <!-- fileupload -->
                
                <div class="row">
                    <div class="col-sm">
                        <a href='javascript:$(".exportCreditExcel").click();' class="btn btn-blue" data-toggle="tooltip-dark" data-placement="top" title="Export Data in Excel">Export to Excel</a>
                        &nbsp;&nbsp;
                        <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-credit');"/>
                </div>
                </div>
          <%--            
            <hr class="mt-5" />
                         <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                              <asp:FileUpload ID="FileUpload1" runat="server" />
                  <asp:Button ID="btnUpload" class="btn btn-primary btn-just-icon btn-round" runat="server"  Text="Import Data" OnClick="btnUpload_Click"/>
                         </div>
                  <br />--%>
                <!-- /fileupload -->
          
                
                    <!-- DataTable -->
               <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
      
         
                <div class="col-sm-12" >
                    <table id="data-table-credit-details-display" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                        <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Data Status</th>
                                <th>Document No</th>
                                <th>Date Of Issue</th>  
                                <th>Against Invoice</th>
                                <th>Bill to Party Name</th>
                                <th>Ship to Party Name</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                            </tr>
                         </thead>
						</table>
                      </div>
                    
                    <div class="col-sm-12" id="table_div_id">
                    <table id="data-table-credit-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                        <thead>
                            <tr role="row">
                                <th>Action</th>
                               <th>Document No</th>
                                <th>Date Of Issue</th>    
                                <th>Doc State</th>
                                <th>Doc state code</th>
                                <th>Against Invoice</th>
                                <th>date of invoice</th>
                                <th>Bill to Party Name</th>
                                <th>Bill to Party Address</th>
                                <th>Bill to PartyGstin</th>
                                <th>Bill to Party state</th>
                                <th>Bill to Party state code</th>
                                <th>Ship to Party Name</th>
                                <th>Ship to Party Address</th>
                                <th>Ship to Party Gstin</th>
                                <th>Ship to Party state</</th>
                                <th>Ship to Party state code</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                                <th>total_igst</th>
                                <th>total_cgst</th>
                                <th>total_sgst</th>
                                <th>Total Discount</th>
                                <th>Note type</th>
                                <th>remarks</th>
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
    //data-table-credit-details
    function debit_details() {

        var jsonString = '<%=json_cr_obj %>'; //for testing
        if (jsonString != '') {
            jsonString = JSON.parse(jsonString);
            //Load  datatable
            var table = $('#data-table-credit-details').DataTable({
                dom: 'Bfrtip',
                buttons: [{
                    extend: 'excel',
                    text: 'Export to Excel',
                    className: 'exportCreditExcel',
                    filename: 'Credit_Excel',
                    //exportOptions: { modifier: { page: 'all' } }
                    exportOptions: { columns: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23] }
                }],

                data: jsonString,
                "paging": false,
                "ordering": false,
                "info": false,
                "searching": false,

                columns: [
                    { "data": "edit_button" },
                    { "data": "document_no" },
                    { "data": "date_of_issue" },
                    { "data": "doc_state" },
                    { "data": "doc_state_code" },
                    { "data": "against_invoice" },
                    { "data": "date_of_invoice" },
                    { "data": "bill_party_name" },
                    { "data": "bill_party_address" },
                    { "data": "bill_party_gstin" },
                    { "data": "bill_party_state" },
                    { "data": "bill_party_state_code" },
                    { "data": "ship_party_name" },
                    { "data": "ship_party_address" },
                    { "data": "ship_party_gstin" },
                    { "data": "ship_party_state" },
                    { "data": "ship_party_code" },
                    { "data": "total_cost" },
                    { "data": "total_gst" },
                    { "data": "total_igst" },
                    { "data": "total_cgst" },
                    { "data": "total_sgst" },
                    { "data": "total_discount" },
                    { "data": "note_type" },
                    { "data": "remarks" }
                ]
            });
        }
    }
    //data-table-credit-details-display
    function debit_details_display() {

        var jsonString = '<%=json_cr_obj %>'; //for testing
        if (jsonString != '') {
            jsonString = JSON.parse(jsonString);
            //Load  datatable
            var table = $('#data-table-credit-details-display').DataTable({

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
                    { "data": "document_no" },
                    { "data": "date_of_issue" },
                    { "data": "against_invoice" },
                    { "data": "bill_party_name" },
                    { "data": "ship_party_name" },
                    { "data": "total_cost" },
                    { "data": "total_gst" }
                ]
            });

            $('#data-table-credit-details-display thead tr').clone(true).appendTo('#data-table-credit-details-display thead');
            $('#data-table-credit-details-display thead tr:eq(1) th').each(function (i) {
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
            $(".class_Document").css("width", "50px");
            $(".class_Date").css("width", "50px");
            $(".class_Against").css("width", "50px");
            $(".class_Bill").css("width", "50px");
            $(".class_Ship").css("width", "50px");
            $(".class_Total").css("width", "30px");
        }
    }

    window.onload = function () {
        debit_details_display();
        $("#table_div_id").hide();
        debit_details();
        $("a.exportCreditExcel").removeClass("dt-button buttons-excel buttons-html5");
        $("a.exportCreditExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");

    };

    function loadModalDiv()
    {
        location.href = '/Vouchers/CreditNote';
    }

    function Export2Doc(element, filename = '') {
        $(".exportCreditExcel").hide();
        
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
