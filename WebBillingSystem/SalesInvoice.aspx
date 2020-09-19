<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="SalesInvoice.aspx.cs" Inherits="WebBillingSystem.SalesInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>

    </table>
    <h2>
        <asp:Label ID="Label1" runat="server" ></asp:Label>
    </h2>
    <asp:Table ID="Table1" runat="server"></asp:Table>
    <asp:Table ID="Table2" runat="server" Visible="false"></asp:Table>
</asp:Content>
