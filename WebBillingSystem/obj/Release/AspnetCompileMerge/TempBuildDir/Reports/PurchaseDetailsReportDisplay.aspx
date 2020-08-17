<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchaseDetailsReportDisplay.aspx.cs" Inherits="WebBillingSystem.PurchaseDetailsReportDisplay" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
    <!-- Breadcrumb -->
    <div>
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Purchase Invoice</li>
                </ol>
            </nav>
        <input type="button" onclick="loadModalDiv();" class="btn btn-primary btn-just-icon btn-round" rel="tooltip" data-toggle="modal"  data-original-title="Add New Region" style="float: right;" value="ADD"/>

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
                </div>
                
                <!-- /Title -->

               
                
                    <!-- DataTable -->
               <div class="row">
            <div class="col-xl-12">
                <section class="hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
      
         
                <div class="col-sm-12" >
                    <table id="data-table-purchase-details" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                                            
                    <%--<table id="data-table-purchase-details" class="table table-hover w-100 display pb-30 dataTable dtr-inline">--%>
                        <thead>
                            <tr role="row">
                                <th>Invoice No</th>
                                <th>Seller Name</th>
                                <th>Total Cost</th>
                                <th>Total GST</th>
                                <%--<th>Action</th>--%>
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
            data: jsonString,
        //   responsive: true,
           autoWidth: false,
           
            language: { search: "",
                searchPlaceholder: "Search",
                sLengthMenu: "_MENU_items"

            },
            columns: [
                { "data": "invoice_no" },
                { "data": "seller_name" },
                { "data": "total_cost" },
                { "data": "total_gst" },
                //{ "data": "edit_button" }
    ]
        });
        $('#data-table-purchase-details thead tr').clone(true).appendTo('#data-table-purchase-details thead');
        $('#data-table-purchase-details thead tr:eq(1) th').each(function (i) {
            var title = $(this).text();
            $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            $('input', this).on('keyup change', function () {
                if (table.column(i).search() !== this.value) {
                    table
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        });
      

    }
    window.onload = function () {
        purchase_details();
    };

    function loadModalDiv()
    {
        location.href = '/Vouchers/Purchaseinvoice';
    }

</script>
</asp:Content>
