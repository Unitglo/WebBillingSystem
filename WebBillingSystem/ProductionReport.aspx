<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="ProductionReport.aspx.cs" Inherits="WebBillingSystem.ProductionReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
<input type="date" runat="server" id="dates" />
    <br />

    Enter Production Qty
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit" Width="110" OnClick="Button1_Click" />
    <br />
    <asp:Label runat="server" ID="lable1"> </asp:Label>
    <br />
    <asp:Table ID="Table1" runat="server"></asp:Table>
</asp:Content>
