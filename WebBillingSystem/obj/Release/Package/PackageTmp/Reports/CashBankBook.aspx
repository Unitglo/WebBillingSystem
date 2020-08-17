<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CashBankBook.aspx.cs" Inherits="WebBillingSystem.CashBankBook" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">

  <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Cash Book / Bank Book</li>
                </ol>
            </nav>
  <!-- /Breadcrumb -->

        <div class="container" id="contain">
           <!-- Title -->
           <div class="hk-pg-header">
              <div>
               <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Cash Book / Bank Book</h4>
              </div>
           </div>
           <!-- /Title -->

        <!-- start row -->
         <!-- Row -->
         <div class="row">
             <div class="col-xl-12">
                 <section class="bg-light hk-sec-wrapper">
              
               
           <!-- start Row2 -->
                <div id="div_export_ledger_id"> 
                  <div class="row">
                  <div class="col-sm-12">    
                             <!-- start Table -->                        
                           <table id="CashBankBookTable" class="table table-secondary table-hover w-100 pb-30 dataTable dtr-inline table-bordered CashBankBookTable_class" role="grid">
                                 <thead  class="thead-secondary">
			        			        <tr>
                                             <th>Action</th>
                                             <th>Account Head</th>
			        				    </tr>                                     
                                 </thead>
                                 <tbody>

                                 </tbody>
                              <%--<tfoot style="border-top: solid;">
                                   <tr>
                                         <th class="border border-dark" colspan="2">Grand Total</th>
                                         <th class="border border-dark" runat="server" id="total_dr_open_bal_ledger"></th>
                                         <th class="border border-dark" runat="server" id="total_cr_open_bal_ledger"></th>
                                         <th class="border border-dark" runat="server" id="total_dr_tran_ledger"></th>
                                         <th class="border border-dark" runat="server" id="total_cr_tran_ledger"></th>
                                         <th class="border border-dark" runat="server" id="total_dr_cl_bal_ledger"></th>
                                         <th class="border border-dark" runat="server" id="total_cr_cl_bal_ledger"></th>
                                   </tr>
                               </tfoot>--%>
			        		   </table>
                             <!-- /start Table -->
	                   </div> 
                     </div>
                   </div>
                <!-- end Row2 -->
                </section>
            </div>
        </div>
        <!-- end row -->
    </div>
   
<script language='javascript'>

    // main function 
     window.onload = function () {  
         cashbankbook_display();
    };

    function cashbankbook_display() {
            
            var jsonString = '<%=json_acc_head_obj %>'; //for testing
            if (jsonString != '') {
                jsonString = JSON.parse(jsonString); //for testing
                var table = $('#CashBankBookTable').DataTable({
                    data: jsonString,
                    autoWidth: false,
                    paging: false,
                    bSortable: false,
                    bInfo: false,
                    bFilter: false,                    
                    columns: [
                        { "data": "edit_button_acc" },
                        { "data": "perticulars_acc" },
                    ],
                });
            }            
     }
 </script>
</asp:Content>
