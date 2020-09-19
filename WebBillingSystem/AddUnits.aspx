<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddUnits.aspx.cs" Inherits="WebBillingSystem.AddUnits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <h2>Add Unit</h2>
        <table>
        <tr>
            <td>Name :</td>
            <td>
                <asp:TextBox ID="UnitNameText" runat="server"></asp:TextBox></td>
            </tr>
        <tr>
            <td>Sort Names :</td>
            <td>
                <asp:TextBox ID="UnitSortNameText" runat="server"></asp:TextBox></td>
            </tr>  <tr>
            <td>Description :</td>
            <td>
                <asp:TextBox ID="DescriptionText" runat="server"></asp:TextBox></td>
            </tr>  <tr>
            <td>Symbols :</td>
            <td>
                <asp:TextBox ID="SymbolsText" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" Width="110" /></td>
                <td>
                    <input type="reset" value="Reset" style="width:110px;" /></td>
            </tr>
        </table>
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
        <asp:Table ID="Table1" runat="server" ></asp:Table>
    </asp:Panel>
    
   
</asp:Content>
