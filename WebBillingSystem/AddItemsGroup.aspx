<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddItemsGroup.aspx.cs" Inherits="WebBillingSystem.AddRowItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  >
        <br />
        <h2>Add Group</h2>
        <br />
        <table>
            <tr>
                <td> Group Name :
                </td>
                <td>
                    <asp:TextBox ID="GrupNames" runat="server"></asp:TextBox>
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
     </div>
<asp:Table ID="Table1" runat="server"></asp:Table>

    </asp:Content>
