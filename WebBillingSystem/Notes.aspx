<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="WebBillingSystem.Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <th>Enter Not</th>
            <td>
                <textarea id="TextBox1" cols="20" rows="4" runat="server" ></textarea>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Add" runat="server" Text="Add" Width="110" OnClick="Add_Click" />
            </td>
            <td>
                <asp:Button ID="Clear" runat="server" Text="Clear" Width="110" />
            </td>
        </tr>

    </table>
    <br />
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
    
    <asp:Table ID="Table1" runat="server"></asp:Table>
        </asp:Panel>

</asp:Content>
