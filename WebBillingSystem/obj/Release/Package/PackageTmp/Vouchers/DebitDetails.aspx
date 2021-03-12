<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="DebitDetails.aspx.cs" Inherits="WebBillingSystem.DebitDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
   <%-- <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>

    <!-- Breadcrumb -->
    <div>
        <nav class="hk-breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-light bg-transparent">
                <li class="breadcrumb-item"><a href="#">Forms</a></li>
                <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Debit Note</li>
            </ol>
        </nav>
       </div>
    <!-- /Breadcrumb -->

    <!-- Container -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header">
            <h4 class="hk-pg-title" id="header_id" runat="server"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Debit Note Details</h4>
            <asp:Button ID="btnAdd" class="btn btn-primary btn-just-icon btn-round" runat="server" Text="+" OnClick="btnAddClick"/>
        </div>
        <!-- /Title -->

        <!-- fileupload -->
         <div class="row">
                    <div class="col-sm">
                        <a href='javascript:$(".exportDebitExcel").click();' class="btn btn-blue">Export to Excel</a>
                        <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-debit');"/>
                </div>
                </div>
        <!-- /fileupload -->

        <!-- DataTable -->
        <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border: groove;">

                    <div class="col-sm-12">
                        <table id="data-table-debit-details-display" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                            <thead>
                                <tr role="row">
                                    <th>Action</th>
                                    <th>Data Status</th>
                                    <th>Document No</th>
                                    <th>Date Of Issue</th>
                                    <th>date of invoice</th>
                                    <th>Bill to Party Name</th>
                                    <th>Ship to Party Name</th>
                                    <th>Total Cost</th>
                                    <th>Total GST</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    
                    <div class="col-sm-12" id="table_div_id">
                        <table id="data-table-debit-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                            <thead>
                                <tr role="row">
                                    <th>Action</th>
                                    <th>Document No</th>
                                    <th>Date Of Issue</th>
                                    <th>Doc State</th>
                                    <th>Doc State code</th>
                                    <th>Against Invoice</th>
                                    <th>date of invoice</th>
                                    <th>Bill to Party Name</th>
                                    <th>Address</th>
                                    <th>GST no</th>
                                    <th>State</th>
                                    <th>State Code</th>
                                    <th>Ship to Party Name</th>
                                    <th>Address</th>
                                    <th>GST No</th>
                                    <th>State</th>
                                    <th>State Code</th>
                                    <th>Total Cost</th>
                                    <th>Total GST</th>
                                    <th>Total IGST</th>
                                    <th>Total CGST</th>
                                    <th>Total SGST </th>
                                    <th>Discount</th>
                                    <th>Remark</th>
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
        //data-table-debit-details
        function debit_details() {

            var jsonString = '<%=json_debit_obj %>'; //for testing
            if (jsonString != '') {
                jsonString = JSON.parse(jsonString);
                //Load  datatable
                var table = $('#data-table-debit-details').DataTable({
                    dom: 'Bfrtip',
                    buttons: [{
                        extend: 'excel',
                        text: 'Export to Excel',
                        className: 'exportDebitExcel',
                        filename: 'Debit_Excel',
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
                        { "data": "remarks" }
                    ]
                });
            }
        }

        function debit_details_display() {

            var jsonString = '<%=json_debit_obj %>'; //for testing
            if (jsonString != '') {
                jsonString = JSON.parse(jsonString);
                //Load  datatable
                var table = $('#data-table-debit-details-display').DataTable({

                    data: jsonString,
                    //   responsive: true,
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
                        { "data": "date_of_invoice" },
                        { "data": "bill_party_name" },
                        { "data": "ship_party_name" },
                        { "data": "total_cost" },
                        { "data": "total_gst" }
                    ]
                });

                $('#data-table-debit-details-display thead tr').clone(true).appendTo('#data-table-debit-details-display thead');
                $('#data-table-debit-details-display thead tr:eq(1) th').each(function (i) {
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
                $(".class_Document").css("width", "50px");
                $(".class_Date").css("width", "50px");
                $(".class_date").css("width", "50px");
                $(".class_Against").css("width", "50px");
                $(".class_Bill").css("width", "70px");
                $(".class_Ship").css("width", "70px");
                $(".class_Total").css("width", "30px");
            }
        }

        window.onload = function () {
            debit_details_display();
            $("#table_div_id").hide();
            debit_details(); 
            $("a.exportDebitExcel").removeClass("dt-button buttons-excel buttons-html5");
            $("a.exportDebitExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
            btnAddClick();
        };

 function btnAddClick()
    {
      <%  if (Session["page_role"].ToString() == "CA")
    {%>
        $("#ContentPlaceHolder1_btnAdd").hide();
       
      <% }%>
   <%else{%>
        $("#ContentPlaceHolder1_btnAdd").show();
        $("#Addbtn").click(function(){ 
            location.href = '/Vouchers/DebitNote';
        })
 <% }%>
  }


        function Export2Doc(element, filename = '') {
            $(".exportDebitExcel").hide();
        
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
