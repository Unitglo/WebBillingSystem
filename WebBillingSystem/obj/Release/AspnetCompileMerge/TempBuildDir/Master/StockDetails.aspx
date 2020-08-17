<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="StockDetails.aspx.cs" Inherits="WebBillingSystem.StockDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
    <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page" runat="server" id="breadcrumb_title"> Inventory</li>
                </ol>
            </nav>
    <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Stock Details</h4>
                    <input type="button" onclick="loadModalDiv();" class="btn btn-primary btn-just-icon btn-round" style="float: right;" value="+" data-toggle="tooltip-dark" data-placement="top" title="Add Inventory"/>
                </div>
                <!-- /Title -->
      <div class="row">
        <div class="col-sm"> 
                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                   <input type="file" id="fileUploader" class="fileUploader_class" runat="server" accept=".xls, .xlsx"/>
                    <%--<asp:FileUpload ID="FileUpload1" runat="server" />--%>
                    <asp:Button ID="btnUpload" class="btn btn-primary btn-just-icon btn-round" runat="server"  Text="Import Data" OnClick="btnUpload_Click" data-toggle="tooltip-dark" data-placement="top" title="Import Data in Database"/> <%--<button class="btn btn-primary popover-button" onclick="event.preventDefault();">Import Template</button>--%>
                     &nbsp;&nbsp;
                    <a href="/upload/StockExcelTemplate.xlsx" class="btn btn-primary" runat="server" data-toggle="tooltip-dark" data-placement="top" title="Download Template">download Template</a>
                    &nbsp;&nbsp;
                    <a href='javascript:$(".exportExcel").click();' class="btn btn-blue" data-toggle="tooltip-dark" data-placement="top" title="Export Data In Excel">Export to Excel</a>
                    &nbsp;&nbsp;
                    <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-stock');"/>
                </div>
       </div>
          </div>
                <hr class="mt-5">
             
             
               <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
                   <span style="float:right"><small>Opening Amount Total : </small><label runat="server" id="lbl_open_amt_count_id"></label></span>
              <!-- DataTable -->
               
                <div class="col-sm-12">
                    <table id="data-table-stock-details-display" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline">
                       <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>group</th>
                                <th>Product Name</th>
                                <th>HSN/SAC Code</th>
                                <th>GST Rate</th>
                                
                            </tr>
                        </thead>
					</table>
                </div>
                 <div class="col-sm-12" id="table_div_id">
                    <table id="data-table-stock-details" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline">
                                                                
                        <thead>
                            <tr role="row">
                                <th>Nature of opration</th>
                                <th>Group</th>
                                <th>Product Name</th>
                                <th>First Unit of Measurment</th>
                                <th>Second Unit of Measurment</th>
                                <th>Conversion Factor</th>
                                <th>HSN/SAC Code</th>
                                <th>GST Rate</th>
                                <th>MRP</th>
                                <th>Sale Price without GST</th>
                                <%--<th>Expiry Date</th>
                                <th>Batch Details</th>--%>
                                <th>Opening Quantity</th>
                                <th>Purchase Price Per Unit</th>
                                <th>Opening Amount</th>
                                <th>Recorder Level</th>
                                <th>Recorder Quantity</th>
                                <th>Minimum Stock Reminder</th>
                            </tr>
                        </thead>
						</table></div>
                    </section>
                </div>
     </div>
             </div>
    <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
                 <!-- /DataTable -->
     <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/jszip.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/xlsx.js"></script>--%>
    <script lang="javascript" src="/js/xlsx.full.min.js"></script>
<script>

    $(function () {

        //$("#fileUploader").change(function (evt) {
        //    var selectedFile = evt.target.files[0];
        //    var reader = new FileReader();
        //    reader.onload = function (event) {
        //        var data = event.target.result;
        //        var workbook = XLSX.read(data, { type: 'binary' });

        //        workbook.SheetNames.forEach(function (sheetName) {
        //            
        //            // Obtain The Current Row As CSV
        //           // var sCSV = XLS.utils.make_csv(wb.Sheets[sheetName]);
        //            var XL_ROW_OBJ = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
        //            var json_obj = JSON.stringify(XL_ROW_OBJ);
        //            $(".txthdn_Json").val(json_obj);
        //        })
        //    };
        //     reader.onerror = function (event) {
        //        console.error("File could not be read! Code " + event.target.error.code);
        //    };
        //    reader.readAsBinaryString(selectedFile);
        //});
        $(".fileUploader_class").change(function (evt) {
            var files = evt.target.files; // FileList object
            var xl2json = new ExcelToJSON();
            xl2json.parseExcel(files[0]);
        });

    });
    var ExcelToJSON = function () {

        this.parseExcel = function (file) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                
                var data = e.target.result;
                var workbook = XLSX.read(data, {
                    type: 'binary'
                });
                workbook.SheetNames.forEach(function (sheetName) {
                    var firstSheetName = workbook.Workbook.Sheets["0"].name;
                    // Here is your object
                    var XL_row_object = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheetName], {
                        blankRows: false,
                        defval: '',
                    });
                    var json_object = JSON.stringify(XL_row_object);
                    console.log(JSON.parse(json_object));
                    $(".txthdn_Json").val(json_object);
                })
            };

            reader.onerror = function (ex) {
                console.log(ex);
            };

            reader.readAsBinaryString(file);
        };
    };

    //data-table-stock-details

    function stock_details_display() {

        var jsonString = JSON.parse('<%=json_obj %>') //for testing

        //Load  datatable
        var table = $('#data-table-stock-details-display').DataTable({
           
            data: jsonString,
            responsive: true,
            autoWidth: false,
            language: { search: "",
                searchPlaceholder: "Search",
                sLengthMenu: "_MENU_items"

            },
            columns: [
                { "data": "edit_button" },
                { "data": "stock_group" },
                { "data": "inv_product_name" },
                { "data": "inv_hsn_sac_code" },
                { "data": "inv_gst_rate" },
                
    ]
        });

        $('#data-table-stock-details-display thead tr').clone(true).appendTo('#data-table-stock-details-display thead');
        $('#data-table-stock-details-display thead tr:eq(1) th').each(function (i) {
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
            $(".class_group").css("width", "50px");
            //$(".class_Product").css("width", "100px");
            $(".class_GST").css("width", "50px");
            $(".code").css("width", "50px");
    }

    function stock_details() {

        var jsonString = JSON.parse('<%=json_obj %>') //for testing

        //Load  datatable
        var table = $('#data-table-stock-details').DataTable({
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Export to Excel',
                className: 'exportExcel',
                filename: 'Stock_Excel',
                exportOptions: { modifier: { page: 'all' } }
              }],
            data: jsonString,
            "paging":   false,
            "ordering": false,
            "info":     false,
            "searching": false,

            columns: [
                { "data": "stock_nature_of_opration" },
                { "data": "stock_group" },
                { "data": "inv_product_name" },
                { "data": "stock_pri_unit_of_measurment" },
                { "data": "stock_sec_unit_of_measurement" },
                { "data": "stock_conversion_factor" },
                { "data": "inv_hsn_sac_code" },
                { "data": "inv_gst_rate" },
                { "data": "stock_mrp" },
                { "data": "stock_sale_price_without_gst" },
                //{ "data": "stock_expiry_date" },
                //{ "data": "stock_batch" },
                { "data": "stock_opening_qty" },
                { "data": "stock_purc_price_per_unit" },
                { "data": "stock_opening_amt" },
                { "data": "inv_recorder_level" },
                { "data": "inv_recorder_quantity" },
                { "data": "inv_minimum_stock_reminder" }
                
    ]
        });

    }
    window.onload = function () {
        stock_details_display();
        $("#table_div_id").hide();
        stock_details();
        $("a.exportExcel").removeClass("dt-button buttons-excel buttons-html5");
        $("a.exportExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
    };

    function loadModalDiv() {
        location.href = '/Master/AddStock';
    }

    function Export2Doc(element, filename = '') {
        $(".exportExcel").hide();
        
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