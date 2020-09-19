<%@ Page Title="" Language="C#" MasterPageFile="~/MainReport.Master" AutoEventWireup="true" CodeBehind="ReportSalesPayment.aspx.cs" Inherits="WebBillingSystem.ReportSalesPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Sales Payment Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <asp:Button ID="Button1" runat="server" Text="HOME" Width="110" OnClick="Button1_Click" /><asp:Button ID="Button2" runat="server" Text="PRINT" Width="110" OnClick="Button2_Click" />
    <br />
       <h2>Sales Payment Report</h2>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="30%" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Text="Select bill No" Value="0"></asp:ListItem>
    </asp:DropDownList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRecivar" runat="server">
        <tr>
        <td style="width: 40%;">Customer Name</td>
        <td>
            <asp:Label ID="Name" runat="server" Text="-"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 40%;">Customer Contact</td>
        <td>
            <asp:Label ID="ContactNo" runat="server" Text="-"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 40%;">Address </td>
        <td>
            <asp:Label ID="Address" runat="server" Text="-"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 40%;">Email</td>
        <td>
            <asp:Label ID="Email" runat="server" Text="-"></asp:Label></td>
    </tr>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentBill" runat="server">
    <tr>
        <td>Date:</td>
        <td>
            <asp:Label ID="Dates" runat="server" Text="-"></asp:Label>
        </td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Bill Info</h2>
    <br />
    <asp:GridView ID="GridView2" runat="server" Width="100%"></asp:GridView>
<br />
    <h2>Bill Item Info</h2><br />
    <asp:Table ID="Table1" runat="server" Width="100%" Border="1" ></asp:Table>
    <div >
        <br />
        Total :
        <asp:Label ID="TotalAmount" runat="server" Text="-"></asp:Label>
        <br />
        Vat :
        <asp:Label ID="TotalVat" runat="server" Text="-"></asp:Label>
    </div>
</asp:Content>
