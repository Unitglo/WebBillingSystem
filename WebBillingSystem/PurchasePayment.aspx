<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchasePayment.aspx.cs" Inherits="WebBillingSystem.PurchasePayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Payment Receipts</h2>
    <table runat="server" id="headssss">
        <tr>
            <td>Bill No. :</td>
            <td>
                <asp:Label ID="BillNo" runat="server" Text="1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Supplier Name :</td>
            <td>
                <asp:DropDownList ID="SupplierNameList" runat="server" AutoPostBack="True" Width="150" OnSelectedIndexChanged="SupplierNameList_SelectedIndexChanged">
                    <asp:ListItem Text="Select Any Supplier" Value="0">Select Any Supplier</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Visible="false">
        <asp:Table ID="Table1" runat="server"></asp:Table>
    </asp:Panel>
    <input type="date" runat="server" id="dates">
    <table runat="server" id="disc">
        <tr>
            <td>Total Order Amount :</td>
            <td>
                <asp:Label ID="TotalOrderAmount" runat="server" Text="0000.00"></asp:Label>
            </td>
        </tr> 
        <tr>
            <td>Total Order Accepted Items Amount :</td>
            <td>
                <asp:Label ID="Accept_Order" runat="server" Text="0000.00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Paid Amount :</td>
            <td>
                <asp:Label ID="PaidOrderAmount" runat="server" Text="0000.00"></asp:Label>
            </td>
        </tr>
                <tr>
            <td>Total Order Pending Amount :</td>
            <td>
                <asp:Label ID="TotalPendingAmount1" runat="server" Text="0000.00"></asp:Label>
            </td>
        </tr> 

        <tr>
            <td>Pending Amount :</td>
            <td>
                <asp:Label ID="PendingOrderAmount" runat="server" Text="0000.00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Payment Type</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" Width="150">
                    <asp:ListItem Text="By Hand" Value="By Hand"></asp:ListItem>
                    <asp:ListItem Text="By Check" Value="By Check"></asp:ListItem>
                    <asp:ListItem Text="By Card" Value="By Card"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Paid Amount</td>
            <td>
                <asp:TextBox ID="PaidAmount" runat="server" AutoPostBack="true" OnTextChanged="PaidAmount_TextChanged" ></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="PrintBill" runat="server" Text="Print Bill" Width="110" OnClick="PrintBill_Click" />
</asp:Content>
