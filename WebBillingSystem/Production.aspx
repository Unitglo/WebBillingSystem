<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Production.aspx.cs" Inherits="WebBillingSystem.Production" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Production Items</h2>
    <table>
        <tr>
            <td>Manufacturing Itams</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
<h2>Use For Production</h2><br />
    <table>
        <tr>
            <td>Sr no.</td>
            <td>Item Name</td>
            <td>Atual Use QTY</td>
        </tr>
        <tr>
            <td>1</td>
            <td> <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:TextBox ID="unit1" runat="server"></asp:TextBox>
            </td>
        </tr>
   <tr>
            <td>2</td>
            <td> <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                </asp:DropDownList></td> 
       <td>
                          <asp:TextBox ID="unit2" runat="server"></asp:TextBox>

       </td>
        </tr>   <tr>
            <td>3</td>
            <td> <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                </asp:DropDownList></td>
   <td>             <asp:TextBox ID="unit3" runat="server"></asp:TextBox></td>
        </tr>   <tr>
            <td>4</td>
            <td> <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:TextBox ID="unit4" runat="server"></asp:TextBox></td>
        </tr>   <tr>
            <td>5</td>
            <td> <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:TextBox ID="unit5" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Submit" Width="110" OnClick="Button1_Click"  />
</asp:Content>
