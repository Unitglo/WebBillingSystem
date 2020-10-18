<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="WebBillingSystem.CompanyDetails" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
    <!-- Breadcrumb -->
    <div> <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page" runat="server" id="breadcrumb_title">Add Company</li>
                </ol>
            </nav> 
        </div>
    
    <asp:Button runat="server" class="btn btn-primary btn-just-icon btn-round btnAdd" Text="+" style="float: right;" OnClick="loadModalDiv" data-toggle="tooltip-primary" data-placement="top" title="Add New Company"/>
    
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Company Details</h4>
                </div>
                <!-- /Title -->
                     <br /> 
                    <div class="col-sm">
                        <a href='javascript:$(".exportExcelCompany").click();' class="btn btn-blue" data-toggle="tooltip-dark" data-placement="top" title="Export To Excel Data">Export to Excel</a>
                        &nbsp;&nbsp;<input type="button" ID="btn_Export" class="btn btn-blue" value="Export to Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('table_div_Id', 'word-content-company');"/>
                    </div>
                 <br /> 

         <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
            <!-- DataTable -->
                <div class="col-sm-12">
                   <table id="data-table-company-details-display" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline" style="width:100%">
                                            
                        <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Code No</th>
                                <th>Name</th>
                                <th>GST No</th>
                                <th>Pan No</th>
                                <th>Trade Name</th>                       
                            </tr>
                        </thead>
						</table></div>
                    <div class="col-sm-12" id="table_div_Id">
                   <table id="data-table-company-details" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline" style="width:100%">
                                            
                        <thead>
                            <tr role="row">
                                <th>Code No</th>
                                <th>Database</th>
                                <th>Person Type</th>
                                <th>surname</th>
                                <th>Middle Name</th>
                                <th>First Name</th>
                                <th>Address One</th>
                                <th>Address Two</th>
                                <th>Address Three</th>
                                <th>District</th>
                                <th>State</th>
                                <th>State Code</th>
                                <th>country</th>
                                <th>Pincode</th>
                                <th>Email</th>
                                <th>Phone No</th>
                                <th>GST No</th>
                                <th>Pan No</th>
                                <th>CIN No</th>
                                <th>Trade Name</th>
                                <th>gst_practitioner_ucid</th>
                                <th>CA UCID</th>
                                <th>Financial Year</th>
                                <th>gst id</th>
                                <th>gst password</th>
                                <th>bank_name</th>
                                <th>bank_branch_name</th>
                                <th>bank_account_number</th>
                                <th>ifsc_code</th>
                                <th>primary_sign_name</th>
                                <th>primary_sign_designation</th>
                                <th>primary_sign_address</th>
                                <th>primary_sign_email</th>
                                <th>primapry_sign_phone</th>
                                <th>secondery_sign_name</th>
                                <th>secondery_sign_designation</th>
                                <th>secondery_sign_address</th>
                                <th>secondery_sign_email</th>
                                <th>secondery_sign_phone</th>
                                <th>Username</th>
                                <th>Password</th>                         
                            </tr>
                        </thead>
						</table></div>

                </section>
            </div>  
         </div>
</div>
    <style>
        .dataTables_filter{
            display: none;
        }
    </style>
                 <!-- /DataTable -->
   
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
   <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
<script>
    //data-table-account-details
    function comp_details() {

        var jsonString = '<%=json_obj %>'; //for testing
        if (jsonString != '') {
        jsonString = JSON.parse(jsonString);
        //Load  datatable
        var table = $('#data-table-company-details').DataTable({
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Export to Excel',
                className: 'exportExcelCompany',
                filename: 'Company Excel',
                //exportOptions: { columns: [1,2,3,4,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44] }
                exportOptions: { modifier: { page: 'all' } }
            }],

            data: jsonString,
            "paging": false,
            "ordering": false,
            "info": false,
            "searching": false,

            columns: [
                { "data": "company_ucid" },
                { "data": "company_db" },
                { "data": "company_person_type" },
                { "data": "company_surname" },
                { "data": "company_middle_name" },
                { "data": "company_first_name" },
                { "data": "company_address_one" },
                { "data": "company_address_two" },
                { "data": "company_address_three" },
                { "data": "company_district" },
                { "data": "company_state" },
                { "data": "company_state_code" },
                { "data": "company_country" },
                { "data": "company_pincode" },
                { "data": "company_email" },
                { "data": "company_phone_number" },
                { "data": "company_gst_number" },
                { "data": "company_pan_number" },
                { "data": "company_cin_number" },
                { "data": "company_trade_name" },
                { "data": "company_gst_practitioner_ucid" },
                { "data": "company_ca_ucid" },
                { "data": "company_financial_year_start" },
                { "data": "company_gst_id" },
                { "data": "company_gst_password" },
                { "data": "company_bank_name" },
                { "data": "company_bank_branch_name" },
                { "data": "company_bank_account_number" },
                { "data": "company_bank_ifsc_code" },
                { "data": "company_primary_sign_name" },
                { "data": "company_primary_sign_designation" },
                { "data": "company_primary_sign_address" },
                { "data": "company_primary_sign_email" },
                { "data": "company_primapry_sign_phone" },
                { "data": "company_secondery_sign_name" },
                { "data": "company_secondery_sign_designation" },
                { "data": "company_secondery_sign_address" },
                { "data": "company_secondery_sign_email" },
                { "data": "company_secondery_sign_phone" },
                { "data": "username" },
                { "data": "password" },
            ]
        });
    }
    }
    
    function comp_details_display() {

        var jsonString = '<%=json_obj %>'; //for testing
        if (jsonString != "") {
            jsonString = JSON.parse(jsonString);
            //Load  datatable
            var table = $('#data-table-company-details-display').DataTable({

                data: jsonString,
                responsive: true,
                autoWidth: false,
                //paging: true,
                language: {
                    search: "",
                    searchPlaceholder: "Search",
                    sLengthMenu: "_MENU_items"
                },
                columns: [
                    { "data": "edit_button" },
                    { "data": "company_ucid" },
                    { "data": "surnamename" },
                    { "data": "company_gst_number" },
                    { "data": "company_pan_number" },
                    { "data": "company_trade_name" },
                ]
            });

            $('#data-table-company-details-display thead tr').clone(true).appendTo('#data-table-company-details-display thead');
            $('#data-table-company-details-display thead tr:eq(1) th').each(function (i) {
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
            $(".class_Code").css("width", "50px");
            $(".class_Name").css("width", "100px");
            $(".class_GST").css("width", "50px");
            $(".class_Pan").css("width", "50px");
            $(".class_Trade").css("width", "50px");
        }
    }
    window.onload = function () {
        
        $("#table_div_Id").hide();
        comp_details();
        comp_details_display()
        $("a.exportExcelCompany").removeClass("dt-button buttons-print");
        $("a.exportExcelCompany").addClass("btn btn-info btn-sm btn-just-icon btn-round");

    };

    function Export2Doc(element, filename = '') {
        $(".exportExcelCompany").hide();
        
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