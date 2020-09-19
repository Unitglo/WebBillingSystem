<%@ Page Title="" Language="C#" MasterPageFile="~/MainReport.Master" AutoEventWireup="true" CodeBehind="ReportChallan.aspx.cs" Inherits="WebBillingSystem.ReportChallan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Report Challan
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <asp:Button ID="Button1" runat="server" Text="HOME" Width="110" OnClick="Button1_Click" /><asp:Button ID="Button2" runat="server" Text="PRINT" Width="110" OnClick="Button2_Click" />
    <br />
       <h2>Report Challan</h2>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="30%" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Text="Select Chalan" Value="0"></asp:ListItem>
    </asp:DropDownList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRecivar" runat="server">
    <tr>
        <td>Receiver name</td>
        <td>
            <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
        </td>

    </tr>
    <tr>
        <td>Destination</td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
        </td>

    </tr>
    <tr>
        <td>Contact</td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="-"></asp:Label>
        </td>

    </tr>
    <tr>
        <td>Vehicle no</td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="-"></asp:Label>
        </td>

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
     <h2>Challan Items Info</h2>
    <asp:GridView ID="GridView1" runat="server" Width="100%" BorderWidth="1"></asp:GridView>
</asp:Content>
