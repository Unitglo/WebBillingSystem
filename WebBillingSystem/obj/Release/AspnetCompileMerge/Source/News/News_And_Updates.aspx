<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="News_And_Updates.aspx.cs" Inherits="WebBillingSystem.News_And_Updates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Breadcrumb -->
    <div>
        <nav class="hk-breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-light bg-transparent">
                <li class="breadcrumb-item"><a href="#">Forms</a></li>
                <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add News and Updates</li>
            </ol>
        </nav>
        <!-- Container -->
        <div class="container">
            <!-- Title -->
            <div class="hk-pg-header">
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>News and Updates</h4>
            </div>
            <!-- /Title -->
            <div class="row">
                <div class="col-xl-12">
                    <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border: groove;">
                            <div class="row">
                                    <div class="col-sm">
                                   
                                            
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                              <div class="row">
                                 <div class="col-md-10 mb-10">                                  
                                    <h6>Title : </h6>
                                    <input runat="server" type="text" id="title_id" class="form-control"/>
                                </div>
                               </div>   <hr class="mt-0">         
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                              <div class="row">
                                 <div class="col-md-10 mb-10">     
                                       <h6> Description :  </h6>
                                       <textarea id="description_id" runat="server" class="form-control mt-15" rows="3" placeholder="Enter Description..."></textarea>
                                 </div>
                              </div> <hr class="mt-0">   
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                               <div class="row">
                                 <div class="col-md-10 mb-10">                              
                                        <h5>Validation Date : </h5>
                                 </div> 
                                </div>
                                 <div class="row">
                                   <div class="col-md-5 mb-10"> 
                                       <h6> From Date : </h6>
                                       <input type="date" runat="server" id="from_date_id" class="form-control from_date_class" />
                                    </div>
                                       <div class="col-md-5 mb-10"> 
                                   <h6> To Date : </h6>
                                        <%--<input runat="server" id="rbtn_to_date_id" class="rbtn_to_date_class" type="radio" value="1">--%>
                                        <input type="date" runat="server" id="to_date_id" class="form-control to_date_class" />
                                </div> 
                             </div> 
                          <hr class="mt-0">   
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                        <div class="row">
                                   <div class="col-md-5 mb-10"> 
                                       <h6><input runat="server" id="rbtnInApp_Id" class="rbtnInApp_class" type="radio" value="1" onclick="$('.txtLink_class').hide();" checked> In App : </h6> 
                                   </div>
                                <div class="col-md-5 mb-10"> 
                                   <h6><input runat="server" id="rbtnOutApp_Id" class="rbtnOutApp_class" type="radio" value="0" onclick="$('.txtLink_class').show();"> Out App : </h6>                                        
                                      </div>
                            <div class="col-md-10 mb-10"> 
                                <input runat="server" type="text" id="txtLink_id" class="form-control txtLink_class"/>
                             </div> 
                         </div>
                          <hr class="mt-0">
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                         </div>
                    </div>
                 
                        <div class="row">
                             <div class="col-sm">
                                 <asp:Button runat="server" class="btn btn-primary" type="submit" id="submit_new_id" text="Save" OnClick="submit_new" data-toggle="tooltip-dark" data-placement="top" title="Save New and Update"/>
                             </div>
                        </div>
                            
                    </section>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        window.onload = function () {
            
            $('.txtLink_class').hide();
            if ($('[id*=breadcrumb_title]').text() == "Update News") {
                
                if ($('.rbtnOutApp_class:checked').val() == 0) {
                    $('.txtLink_class').show();
                }
            }
        }
    </script>

</asp:Content>
