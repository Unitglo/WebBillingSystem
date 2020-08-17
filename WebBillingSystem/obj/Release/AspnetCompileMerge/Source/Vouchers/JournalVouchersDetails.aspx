<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="JournalVouchersDetails.aspx.cs" Inherits="WebBillingSystem.JournalVouchersDetails" %>

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
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Journal Entry</li>
                </ol>
            </nav>
        </div>
            <!-- /Breadcrumb -->     
            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Journal Vouchers Details</h4>
                    &nbsp&nbsp<input type="button" onclick="loadModalDiv();" class="btn btn-primary btn-just-icon btn-round" rel="tooltip" data-toggle="tooltip-dark" data-placement="top" title="Add new Journal Entry" style="float: right;" value="+"/>
                </div>                
                <!-- /Title -->

                <!-- fileupload -->
                    
                <!-- /fileupload -->
          
                
                    <!-- DataTable -->
          <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
                <div><input type="checkbox" id="chk_all_display_dtl" class="chk-details-control" style="width: 15px; height: 15px;"/> : <label>Expand/Collapse All</label>
                    <input type="text" style="float:right;" id="search_Id" class="search_class"/>

                </div>
                <div class="col-sm-12" >
                    <table id="data-table-journalVoucher-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                       <thead>
                            <tr role="row">                                
                                <th>Action</th>
                                <th>Vouchers No</th>
                                <th>Journal Date</th>    
                                <th>Total</th>
                                <th>Data Status</th>
                            </tr>
                         </thead>
						</table>
                      </div>

                    </section>
                </div>
             </div>
     </div>

                 <!-- /DataTable -->
    <style>
    td.details-control {
    background: url('../resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('../resources/details_close.png') no-repeat center center;
}
        </style>
<script>
    var jsonStringDtl = JSON.parse('<%=json_obj_dt_jv_dtl %>');

    function format(d) {
        var name_val = '<table class="dataTable" id="dtl_Table" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
        jsonStringDtl.forEach(function (key, index) {
            if (key.journal_id == d.journal_id)
                name_val += '<tr>' +
                '<td>' + key.name + '</td>' +
                '<td>' + key.debit_amount + '</td>' +
                '<td>' + key.credit_amount + '</td>' +
                '</tr>';

        });
            name_val += '<tr style="background-color: lightgreen;"><td colspan=3>' + d.note +'</td></tr>';

        return name_val+'</table>';
    }
    //data-table-journalVoucher-details
    function jourEntry_details() {

        var jsonString = JSON.parse('<%=json_obj_dt_jv %>') //for testing
        //Load  datatable
        var table = $('#data-table-journalVoucher-details').DataTable({
           
            data: jsonString,
            autoWidth: false,
            
            columns: [                 
                { "data": "edit_button" },               
                { "data": "manual_id" },
                { "data": "jv_date" },
                { "data": "dr_total" },
                { "data": "status_label" }
             ]
        });

        $('#data-table-journalVoucher-details tbody ').on('click', '.details-control', function() {
            var tr = $(this).closest('tr');
            var row = table.row( tr );
 
            if ( row.child.isShown() ) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
                $(tr).find(".fa-angle-right").css("transform", "rotate(0deg)");
            }
            else {
                // Open this row
                row.child(format(row.data()) ).show();
                tr.addClass('shown');
                $(tr).find(".fa-angle-right").css("transform", "rotate(90deg)");
            }
        });
        //table.column(7).visible(false);
        
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
                        this.child(format(this.data())).show();
                        $(this.node()).addClass('shown');
                    }
                });
            }
            });
        
        $('#data-table-journalVoucher-details thead tr').clone(true).appendTo('#data-table-journalVoucher-details thead');
        $('#data-table-journalVoucher-details thead tr:eq(1) th').each(function (i) {
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
        //$(".class_Vouchers").css("width", "50px");
        //$(".class_Journal").css("width", "50px");                
        $(".class_Total").css("width", "50px");
    }
    
    window.onload = function () {
        jourEntry_details();
        $("a.exportJVExcel").removeClass("dt-button buttons-excel buttons-html5");
        $("a.exportJVExcel").addClass("btn btn-info btn-sm btn-just-icon btn-round");
        $('.form-control-sm').eq(1).parent().hide();
      
        $(".search_class").keyup(function () {
           var input, filter, table, tr, td, i, txtValue;
                 input = $('.search_class').val();
            filter = input.toUpperCase();
            
            table = $("table#dtl_Table.dataTable");
            if (input != "") {
                table.each(function (index, value) {
                    var is_table = false;
                    $(value).find("tr").each(function (index1, value1) {
                        if (input == +  $(value1).find("td").eq(0).html()) {
                            is_table = true;
                            return false;
                        } else {
                            is_table = false;
                        }
                    });
                    if (is_table || input == "")
                        $(value).css("display", "contents");
                    else
                        $(value).css("display", "none");
                });
            } else {
                $("table#dtl_Table.dataTable").css("display", "contents");
            }
        });
    }

    function loadModalDiv()
    {
        location.href = '/Vouchers/JournalEntry';
    }    
</script>
</asp:Content>
