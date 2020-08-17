<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="News_And_Updates_Details.aspx.cs" Inherits="WebBillingSystem.News_And_Updates_Details" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb -->
       <div>
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">News and Update</li>
                </ol>
            </nav>
       </div>
    <!-- /Breadcrumb -->
    <div class="container">

        <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>News and Update Details</h4>
                     <input type="button" onclick="loadModalDiv();" class="btn btn-icon btn-primary btn-icon-wrap" style="float: right;" value="+" data-toggle="tooltip-dark" data-placement="top" title="Add New News" />
                </div>
                <br />
                <!-- /Title -->

        <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
      
            <div class="col-sm-12">
                    <table id="datatable-news-and-update-details" class="table table-hover w-100 display pb-30 table-responsive dataTable dtr-inline">
                        <thead>
                            <tr role="row">
                                <th>Action</th>
                                <th>Title</th>                                
                                <th>Description</th>
                                <th>Validation From Date</th>
                                <th>Validation To Date</th>
                                <th>Link</th>
                            </tr>
                        </thead>
						</table>
                    </div>
                </section>
            </div>
         </div>
    </div>

    <script>
        window.onload = function () {
            account_details();
        };

        function account_details() {

        var jsonString = JSON.parse('<%=json_obj %>') //for testing
        var table = $('#datatable-news-and-update-details').DataTable({
           
            data: jsonString,
            autoWidth: false,
            
            language: {
                search: "",
                searchPlaceholder: "Search",
                sLengthMenu: "_MENU_items"
            },
            columns: [
                { "data": "edit_button" },
                { "data": "pms_news_title" },
                { "data": "pms_news_description" },
                { "data": "pms_news_validate_from_date" },
                { "data": "pms_news_validate_to_date" },
                { "data": "pms_news_outapp_link" },
            ]
        });

        $('#datatable-news-and-update-details thead tr').clone(true).appendTo('#datatable-news-and-update-details thead');
        $('#datatable-news-and-update-details thead tr:eq(1) th').each(function (i) {
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

         function loadModalDiv()
         {
            window.location.href = '/News/News_And_Updates.aspx';
         }
    </script>
</asp:Content>
