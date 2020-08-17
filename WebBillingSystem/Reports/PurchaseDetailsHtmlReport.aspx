<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchaseDetailsHtmlReport.aspx.cs" 
    Inherits="HubApi.NIPL.PAYROLL.REPORT.PurchaseDetailsHtmlReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table runat="server" id="TableReportBody" style="width:100%">
         <tr style="width:100%">
             <td id="reporttd" style="width:100%">
                 <asp:label id="lblErr" runat="server" text=""></asp:label>
             </td>
         </tr>
     </table> 
</asp:Content>
