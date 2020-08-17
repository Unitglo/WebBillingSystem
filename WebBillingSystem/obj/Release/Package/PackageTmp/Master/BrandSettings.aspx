<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="BrandSettings.aspx.cs" Inherits="WebBillingSystem.BrandSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Breadcrumb -->
    <div>
        <nav class="hk-breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-light bg-transparent">
                <li class="breadcrumb-item"><a href="#">Forms</a></li>
                <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Add Branding Settings</li>
            </ol>
        </nav>
        <!-- Container -->
        <div class="container">
            <!-- Title -->
            <div class="hk-pg-header">
                <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Branding Settings</h4>
            </div>
            <!-- /Title -->

            <div class="row">
                <div class="col-xl-12">
                    <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border: groove;">
                        <table class="table table-hover display pb-30">
                            <tbody>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                                <tr id="compnameId" runat="server">
                                    <td>
                                        <label id="">Company Name :</label>
                                    </td>
                                    <td>
                                        <input runat="server" type="text" id="company_name_Id" class="form-control"/>
                                    </td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            <tr>
                                    <td>
                                        <label id="">Logo :</label>
                                    </td>
                                    <td>
                                        <input img-id="img-logo" runat="server" type="file" name="imgLogoFileUpload" id="logo_Id" accept="image/*" onchange="$('.hdn_logo_class').val(''); imageSetUrl(this);" multiple>
                                        
                                       </td>
                                    <td> <img src="<%=logo%>" class="img-logo" style="max-height:70px;"/>
                                <input type="text" name="hdnLogo" style="visibility:hidden" ID="hdn_logo_id" class="hdn_logo_class" runat="server" /></td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            <tr>
                                    <td>
                                        <label id="">Slider Image 1 : </label>
                                    </td>
                                    <td>
                                        <input runat="server" type="file" name="imgSliderOneFileUpload" id="Slider_Image_one_Id" accept="image/*" onchange="$('.hdn_SliderOne_class').val(''); imageSetUrl(this);" img-id="img-slider1" multiple>
                                        <input type="text" name="hdn_SliderOne_name" style="visibility:hidden" ID="hdn_SliderOne_ID" class="hdn_SliderOne_class" runat="server" />
                                    </td>
                                    <td> <img src="<%=slider1%>" class="img-slider1" style="max-height:70px;"/></td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                           <tr>
                                    <td>
                                        <label id="">Slider Image 2 : </label>
                                    </td>
                                    <td>
                                        <input runat="server" type="file" name="img" id="Slider_Image_two_Id" accept="image/*" onchange="$('.hdn_Slider_Image_two_class').val(''); imageSetUrl(this);" img-id="img-slider2" multiple>
                                        <input type="text" style="visibility:hidden" ID="hdn_Slider_Image_two_Id" class="hdn_Slider_Image_two_class" runat="server" />
                                    </td>
                               <td> <img src="<%=slider2%>" class="img-slider2" style="max-height:70px;"/></td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            <tr>
                                    <td>
                                        <label id="">Slider Image 3 : </label>
                                    </td>
                                    <td>
                                        <input runat="server" type="file" name="img" id="Slider_Image_three_Id" accept="image/*" onchange="$('.hdn_Slider_Image_three_class').val(''); imageSetUrl(this);" img-id="img-slider3" multiple>
                                        <input type="text" style="visibility:hidden" ID="hdn_Slider_Image_three_Id" class="hdn_Slider_Image_three_class" runat="server" />
                                    </td>
                                <td> <img src="<%=slider3%>" class="img-slider3" style="max-height:70px;"/></td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                           <tr>
                                    <td>
                                        <label id=""> Header Message 1: </label>
                                    </td>
                                    <td>
                                        <input type="text" runat="server" id="Header_Message_one_Id" class="form-control"/>
                                    </td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                             <tr>
                                    <td>
                                        <label id=""> Header Message 2: </label>
                                    </td>
                                    <td>
                                        <input type="text" runat="server" id="Header_Message_two_Id" class="form-control"/>
                                    </td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                             <tr>
                                    <td>
                                        <label id=""> Header Message 3: </label>
                                    </td>
                                    <td>
                                        <input type="text" runat="server" id="Header_Message_three_Id" class="form-control"/>
                                    </td>
                                </tr>                               
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                               <tr>
                                    <td>
                                        <label id=""> Description Message 1: </label>
                                    </td>
                                    <td>
                                        <textarea type="text" runat="server" id="Description_Message_one_Id" class="form-control"/>
                                    </td>
                                </tr>  
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            <tr>
                                    <td>
                                        <label id=""> Description Message 2: </label>
                                    </td>
                                    <td>
                                        <textarea type="text" runat="server" id="Description_Message_two_Id" class="form-control"/>
                                    </td>
                             </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            <tr>
                                    <td>
                                        <label id=""> Description Message 3: </label>
                                    </td>
                                    <td>
                                        <textarea type="text" runat="server" id="Description_Message_three_Id" class="form-control"/>
                                    </td>
                                </tr>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
                            </tbody>
                        </table>
                        <hr class="mt-0"/>
                        <div class="row">
                             <div class="col-sm">
                                 <input type="button" id="brand_sett_btn_id" class="btn btn-primary" Style="margin-left: 30%" value="Save" onclick="saveBtnClick()" data-toggle="tooltip-dark" data-placement="top" title="Save Brand Setting"/>
                                  <%--<asp:Button type="button" runat="server" ID="master_sett_btn_id" class="btn btn-primary" Style="margin-left: 30%" Text="Save" onclick="saveBtnClick()" OnClientClick=""/>--%>
                                  <asp:Button type="button" runat="server" ID="event_id" class="btn btn-primary" Style="margin-left: 30%" Text="Save2" onclick="button_Click"/>
                             </div>
                        </div>
                    </section>
                </div>
            </div>

        </div>
    </div>

    
    <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
    <input type="text" name="hdnroleval_name" style="visibility:hidden" ID="hdnroleval_id" class="hdnroleval_class" runat="server" />
    
    
    <script type="text/javascript">
        
        function saveBtnClick() {
            
            var JSONObject = {};
            var values = {};
            
                values.login_page_name = $("[id*=company_name_Id]").val();
                values.login_page_logo = $(".hdn_logo_class").val();
                values.login_page_slider1 = $('.hdn_SliderOne_class').val();
                values.login_page_slider2 = $('.hdn_Slider_Image_two_class').val();
                values.login_page_slider3 = $('.hdn_Slider_Image_three_class').val();
                values.login_page_header_msg1 = $("[id*=Header_Message_one_Id]").val();
                values.login_page_header_msg2 = $("[id*=Header_Message_two_Id]").val();
                values.login_page_header_msg3 = $("[id*=Header_Message_three_Id]").val();
                values.login_page_description1 = $("[id*=Description_Message_one_Id]").val();
                values.login_page_description2 = $("[id*=Description_Message_two_Id]").val();
                values.login_page_description3 = $("[id*=Description_Message_three_Id]").val();
                JSONObject['branding_data'] = values;
                <%--JSONObject['installation_type'] = "<%=%>";
                JSONObject['branding_data'] = "<%=%>";
                JSONObject['branding_data'] = "<%=%>";--%>
                var json_str = JSON.stringify(JSONObject);
            $(".txthdn_Json").val(json_str);
            alert($(".txthdn_Json").val());
        
        }

        function imageSetUrl(input) 
        {
            if (input.files && input.files[0])
            {
                var reader = new FileReader(); reader.onload = function (e) {
                    $('.' + $(input).attr("img-id")).attr('src', e.target.result).width(200).height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
