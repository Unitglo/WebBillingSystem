<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="SalesReceipts.aspx.cs" Inherits="WebBillingSystem.SalesRecipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function CheckNumeric(e) {

            if (window.event) // IE 
            {
                if ((e.keyCode < 48 || e.keyCode > 57) & e.keyCode != 8) {
                    event.returnValue = false;
                    return false;
                }
            }
            else { // Fire Fox
                if ((e.which < 48 || e.which > 57) & e.which != 8) {
                    e.preventDefault();
                    return false;
                }
            }
        }

    </script>
    <h2>Receipts</h2>
    <asp:Label ID="BillNo" runat="server" Text="0"></asp:Label>
    <br />
    <input type="date" runat="server" id="dates" />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="210">
        <asp:ListItem Text="Select Customer" Value="0"></asp:ListItem>
    </asp:DropDownList><br />
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="210">
        <asp:ListItem Text="Select Customer Order" Value="0"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <table>
        <tr>
            <td>Payment Type</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem Text="By Hand" Value="By Hand"></asp:ListItem>
                    <asp:ListItem Text="By Check" Value="By Check"></asp:ListItem>
                    <asp:ListItem Text="By Card" Value="By Card"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Paid Amount</td>
            <td>
                <asp:TextBox ID="PaidAmount" runat="server" onkeypress="CheckNumeric(event);"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="PrintBill" runat="server" Text="Print Bill" Width="110" OnClick="PrintBill_Click" />

</asp:Content>
