<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" 
    CodeBehind="PurchaseDetailsReport.aspx.cs" Inherits="HubApi.NIPL.PAYROLL.REPORT.PurchaseDetailsReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMiddle" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //ddlCmpanyName
            ddlBindCompany();

            $("[id*=ddlCmpanyName]").val($("[id*=hfMstCompanyId]").val());
            $("[id*=ddlCmpanyName]").trigger('change');
             $("[id*=ddlCmpanyName]").prop('disabled', true);
            $("#btnPrint").click(function () {
                debugger
                var NI_HRCPD_COMPCDkey = $("[id*=ddlCmpanyName]").val();
                var NI_DEFUNCTkey = '';
                var chkActiveControl = $("[id*=chkDefunct]");
                if (chkActiveControl.prop("checked") == true) {
                    NI_DEFUNCTkey = 'N';
                }
                else {
                    NI_DEFUNCTkey = 'Y';
                }
                debugger
                var location = 'API_NI_HRFM_EMPLOYEE_WISE_PERK_HTML.aspx?' + nipl_EncryptDecryptValues('COMPCD=' + NI_HRCPD_COMPCDkey + '&DEFUNCT=' + NI_DEFUNCTkey);
                window.open(location, 'top=0,left=0,height=850,width=1650,status=yes,toolbar=no,menubar=no,addressbar=no,align=left,resizable=yes,scrollbars=yes', "_blank");
            });
            $("#btnCancel").click(function () {
                window.location = '';
            });
        });

        function ddlBindCompany() {
            debugger;
            var Base_Url = $("[id *= hfMstaimsNetwebapi]").val();
            var obj = {};
            obj.chubspname = "nipl.NI_CRM_FILL_DDL_USER_MODULE_ALLOCATION";
            obj.p_ENTITY_ID = $("[id*=hfMstEntityId]").val();
            obj.p_ORGCD = $("[id*=hfMstOrgId]").val();
            obj.p_COMPCD = "0";
            obj.p_DIVCD = "0";
            obj.p_USER_ID = $("[id*=hfMstUserId]").val();
            obj.p_USER_TYPE = "0";
            obj.p_USER_NAME = "0";
            obj.p_TYPE = "COMPANY_DDL";
            obj.p_MODULE_ID = "0";
            var WebApiUrl = Base_Url;
            var ctrlNm = $("[id*=ddlCmpanyName]");

            nipl_BindDRP_WebApi(obj, ctrlNm, WebApiUrl, false, "-ALL-");
            $("[id*=ddlCmpanyName]").select2();
            //$("[id*=ddlCompany]").val($("[id*=hfCompId]").val());


        }


    </script>

     <asp:UpdatePanel ID="upanel" runat="server">
         <ContentTemplate>
            <AjaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
            <asp:Panel ID="pnlMain" runat="server">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span5">
                                <div class="control-group">
                                    <label for="ddlCompanyName">Company Name</label>
                                    <div class="controls">
                                        <asp:DropDownList runat="server" ID="ddlCmpanyName"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="checkbox">
                                        <label for="chkActive">
                                        <asp:CheckBox runat="server" ID="chkDefunct"  Checked="true"></asp:CheckBox>
                                           Active </label>

                                    </div>
                                </div>
                            </div>
                            </div>
                        <div class="row-fluid">
                            <div class="span12">
                                  <div class="control-group">
                                    <div class="form-actions">
                                        <button id="btnPrint" class="btn-success btn">PRINT</button>
                                        <button id="btnCancel" class="btn-danger btn">CANCEL</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
