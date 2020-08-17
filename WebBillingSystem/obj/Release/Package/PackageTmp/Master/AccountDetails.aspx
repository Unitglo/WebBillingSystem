<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="WebBillingSystem.AccountDetails" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
<script>
    function Export2Doc(element, filename = '') {
        $(".exportExcel").hide();
        
        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Account Details</title></head><body>";
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
    
    <!-- Breadcrumb -->
    <div>
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add account</li>
                </ol>
            </nav>
       
        <%--<button class="btn btn-icon btn-primary btn-icon-style-1" onclick="loadModalDiv();" style="float: right;"><span class="btn-icon-wrap"><i class="fa fa-plus"></i></span></button>--%>
       </div>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Account Details</h4>
                     <input type="button" onclick="loadModalDiv();" class="btn btn-icon btn-primary btn-icon-wrap" style="float: right;" value="+" data-toggle="tooltip-dark" data-placement="top" title="Add New Account" />
                </div>
                
                <!-- /Title -->
    <div class="row">
        <div class="col-sm">
            <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                <input runat="server" type="file" id="fileUploader" class="fileUploader_class" accept=".xls, .xlsx"/>
               <asp:Button ID="btnUpload" class="btn btn-primary btn-just-icon btn-round" runat="server"  Text="Import Data" OnClick="btnUpload_Click" data-toggle="tooltip-dark" data-placement="top" title="Import Excel Data In Database" /> <%--<button class="btn btn-primary popover-button" onclick="event.preventDefault();">Import Template</button>--%>   
                &nbsp;&nbsp;
                <a href="/upload/AccountExcelTemplate.xlsx" class="btn btn-primary" runat="server" data-toggle="tooltip-dark" data-placement="top" title="Firstly Download Template">download Template</a>
                &nbsp;&nbsp;
                <a href='javascript:$(".exportExcel").click();' class="btn btn-blue" data-toggle="tooltip-dark" data-placement="top" title="Export To Excel Data">Export to Excel</a>
           &nbsp;&nbsp;
                <input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_id', 'word-content-account');"/>
               
            </div>
        </div>
    </div>
    <br />
               
                    <!-- DataTable -->
               <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
      
            <div class="col-sm-12">
                    <table id="data-table-account_display-details" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline">
                        <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Account Head</th>                                
                                <th>Main GROUP</th>
                                <th>Sub GROUP</th>
                                <th>Party Name</th>
                                <th>GST No</th>
                                <th>Pan No</th>
                            </tr>
                        </thead>
						</table>
            </div>
                

                <div class="col-sm-12" id="table_div_id">
                    <table id="data-table-account-details" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline">
                        <thead>
                            <tr role="row">
                                <th>Id</th>
                                <th>Account Head</th>                                
                                <th>Main Group</th>
                                <th>Sub Group</th>
                                <th>Party Name</th>
                                <th>Inventory Value Affected</th>
                                <th>Address One</th>
                                <th>Address Two</th>
                                <th>District</th>
                                <th>State</th>
                                <th>State Code</th>
                                <th>Country</th>
                                <th>Pin Code</th>
                                <th>GST No</th>
                                <th>Pan No</th>
                                <th>CIN no</th>
                                <th>Phone no</th>
                                <th>Email</th>
                                <th>Opening Balance</th>
                                <th>Opening Balance Type</th>                                
                            </tr>
                         </thead>
						</table>
                      </div>
                    </section>
                </div>
             </div>
    <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
</div>
     <%--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
   
                 <!-- /DataTable -->
    <style>
        .dataTables_filter{
            display: none;
        }
    </style>

    <script lang="javascript" src="/js/xlsx.full.min.js"></script>
    <script>
    function account_details_display() {

        var jsonString = JSON.parse('<%=json_obj %>') //for testing
        var table = $('#data-table-account_display-details').DataTable({
            //dom: 'Bfrtip',
            //buttons: [
            //    'pdf',
            //],

            data: jsonString,
            //responsive: true,
            autoWidth: false,
            
            language: {
                search: "",
                searchPlaceholder: "Search",
                sLengthMenu: "_MENU_items"
            },
            columns: [
                { "data": "edit_button" },
                { "data": "account_head" },
                { "data": "main_group_name" },
                { "data": "sub_group_name" },
                { "data": "account_party_name" },
                { "data": "account_gst_number" },
                { "data": "account_pan_number" },
            ]
        });

        $('#data-table-account_display-details thead tr').clone(true).appendTo('#data-table-account_display-details thead');
        $('#data-table-account_display-details thead tr:eq(1) th').each(function (i) {
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
            $(".class_Account").css("width", "100px");
        $(".class_Main").css("width", "50px");
        $(".class_Sub").css("width", "50px");
            $(".class_GST").css("width", "50px");
            $(".class_Pan").css("width", "50px");
            $(".class_Pan").css("width", "50px");
            $(".class_Party").css("width", "100px");
    }
        var dt ="";
    //data-table-account-details
    function account_details() {

        var jsonString = JSON.parse('<%=json_obj %>') //for testing

        //Load  datatable
         dt = $('#data-table-account-details').DataTable({
            dom: 'Bfrtip',
            buttons: [
               {
                   filename: 'Account Excel',
                   text: 'Export to Excel',
                   extend: 'excel', //'copy', 'csv', 'excel', 'pdf', 'print'
                   className: 'exportExcel',
                   exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] }
               }
            ],

            data: jsonString,
            "paging":   false,
            "ordering": false,
            "info":     false,
            "searching": false,

            columns: [
                { "data": "account_id" },
                { "data": "account_head" },                
                { "data": "main_group_name" },
                { "data": "sub_group_name" },
                { "data": "account_party_name" },
                { "data": "account_inventory_value_affected" },
                { "data": "account_add_one" },
                { "data": "account_add_two" },
                { "data": "account_district" },
                { "data": "account_state" },
                { "data": "account_state_code" },
                { "data": "account_country" },
                { "data": "account_pin_code" },
                { "data": "account_gst_number" },
                { "data": "account_pan_number" },                
                { "data": "account_cin_number" },
                { "data": "account_phone_number" },
                { "data": "account_email" },
                { "data": "account_opening_balance" },
                { "data": "account_opening_balance_type" }
            ]
        });
        //table.columns([1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20]).visible(false);
        
    }
        window.onload = function () {
            $("#table_div_id").hide();            
            account_details_display();            
            account_details();
            $("a.exportExcel").removeClass("dt-button buttons-excel buttons-html5");
            $("a.exportExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
         };

    function loadModalDiv()
    {
        window.location.href = '/Master/AddAccount.aspx';
    }

    
    $(function () {
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
                        //Fetch the name of First Sheet.
                    
                    var firstSheetName = workbook.Workbook.Sheets["0"].name;
                    //var firstSheet = workbook.Sheets[firstSheetName];
                  
                    //Read all rows from First Sheet into an JSON array.
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
        
</script>
</asp:Content>
