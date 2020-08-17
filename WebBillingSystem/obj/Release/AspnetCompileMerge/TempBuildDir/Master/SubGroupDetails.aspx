<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="SubGroupDetails.aspx.cs" Inherits="WebBillingSystem.SubGroupDetails" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
    
    <!-- Breadcrumb -->
    <div> <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page" runat="server" id="breadcrumb_title">Edit Sub Group</li>
                </ol>
            </nav>
    </div>
    <!-- /Breadcrumb -->
         

            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Sub Group Details</h4>
                </div>
                </div>
                <!-- /Title -->

         <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
                
                    <div>
                        <label id="subGrName" runat="server">Sub Group Name : </label>
                        <input type="text" runat="server" id="subGr_Name" class="form-control subGr_class"/>
                    </div>
                    <br />
                   <asp:Button runat="server" class="btn btn-primary" type="submit" id="submit_account_details" text="Save" OnClick="submit_account_details_event" data-toggle="tooltip-dark" data-placement="top" title="Save Record"/>

                <br />
                    <br />

                    <!-- DataTable -->
               
                <div class="col-sm-12">
                    <table id="data-table-company-details" class="table table-hover w-100 display pb-30 dataTable dtr-inline">
                        <thead>
                            <tr role="row">
                                <th>Main Group</th>
                                <th>Sub Group Id</th>
                                <th>Sub Group Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
						</table></div>

                </section>
</div></div>
                 <!-- /DataTable -->

<script>
    //data-table-account-details
    function comp_details() {

        var jsonString = JSON.parse('<%=json_SubGroup_obj %>') //for testing

        //Load  datatable
        $('#data-table-company-details').DataTable({
            data: jsonString,
            responsive: true,
            autoWidth: false,
            language: { search: "",
                searchPlaceholder: "Search",
                sLengthMenu: "_MENU_items"

            },
            columns: [
                { "data": "account_master_main_group_id" },
                { "data": "account_master_sub_group_id" },
                { "data": "account_master_sub_group_name" },
                { "data": "edit_button" },
    ]
        });
    }
    window.onload = function () {
        comp_details();
    };

    function loadModalDiv()
    {
        location.href = '/Master/AddCompany';
    }

</script>
</asp:Content>
