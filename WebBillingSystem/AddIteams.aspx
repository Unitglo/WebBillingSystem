<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddIteams.aspx.cs" Inherits="WebBillingSystem.AddIteams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
        <h2>Add Items</h2>
        <table style="width:80%;">
        <tr>
            <td>Name :</td>
            <td>
                <asp:TextBox ID="ItemName" runat="server"></asp:TextBox>
            </td>
        </tr>

            <tr>
            <td>Groups :</td>
            <td>
              <asp:DropDownList ID="GroupList" runat="server" Width="150">
                    <asp:ListItem Text="Select Group" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
                </tr>
            <tr>
            <td>Unit Symbols :</td>
            <td>
              <asp:DropDownList ID="UnitList" runat="server" Width="150">
                    <asp:ListItem Text="Select Unit" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
                </tr>
            <tr>
            <td>Item Type :</td>
            <td>
              <asp:DropDownList ID="ItemTypes" runat="server" Width="150">
                    <asp:ListItem Text="Select Type" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
                </tr>
              <tr>
            <td>Rate :</td>
            <td>
                <asp:TextBox ID="Rate" runat="server" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>Wait In Grams :</td>
            <td>
                <asp:TextBox ID="Par" runat="server"></asp:TextBox>
            </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Submit" width="110" OnClick="Button1_Click" />
                </td>
                <td><input type="reset" value="Reset" style="width:110px;" /></td></tr>
        </table>
</asp:Content>
