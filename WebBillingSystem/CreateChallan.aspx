<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CreateChallan.aspx.cs" Inherits="WebBillingSystem.CreateChalan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Create Challan</h2>
    <table style="width:80%;">
        <tr>
            <th>Challan No. : </th>
            <th>
                <asp:Label ID="ChalanNo" runat="server" Text="1"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>Receiver Name : </th>
            <td>
                <asp:TextBox ID="ReceiverName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>Destination : </th>
            <td>    
                <asp:TextBox ID="Destination" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>Contact No. : </th>
            <td>
                <asp:TextBox ID="ContactNo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>Vehicle No. : </th>
            <td>
                <asp:TextBox ID="VehicleNo" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
     <table style="width:80%;">
        <tr>
            <th>Sr No.</th>
            <th>Name</th>
            <th>Unit</th>
            <th>QTY</th>
            </tr>
        <tr>
            <td>
                <asp:Label ID="SrNo" runat="server" Text="1"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="ItemName1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="UnitName1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="QTY1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="2"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="ItemName2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="UnitName2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="QTY2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="3"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="ItemName3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="UnitName3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="QTY3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="4"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="ItemName4" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="UnitName4" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="QTY4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="5"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="ItemName5" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="UnitName5" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="QTY5" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
             <td>
    <asp:Button ID="PrintChalan" runat="server" Text="Create Challan" OnClick="PrintChalan_Click" />
             </td>
         </tr>
    </table>
    </asp:Content>
