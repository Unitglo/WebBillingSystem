<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="WebBillingSystem.AddSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <script>
        function Task() {
            document.getElementById('<%=BankName.ClientID%>').readOnly = false;
            document.getElementById('<%=BranchName.ClientID%>').readOnly = false;
            document.getElementById('<%=AccountNo.ClientID%>').readOnly = false;
            document.getElementById('<%=IFSC.ClientID%>').readOnly = false;
            document.getElementById('<%=BankName.ClientID%>').value = "";
            document.getElementById('<%=BranchName.ClientID%>').value = "";
            document.getElementById('<%=AccountNo.ClientID%>').value = "";
            document.getElementById('<%=IFSC.ClientID%>').value = "";
        }
        function Task1() {
            document.getElementById('<%=BankName.ClientID%>').readOnly = true;
            document.getElementById('<%=BranchName.ClientID%>').readOnly = true;
            document.getElementById('<%=AccountNo.ClientID%>').readOnly = true;
            document.getElementById('<%=IFSC.ClientID%>').readOnly = true;
            document.getElementById('<%=BankName.ClientID%>').value = "NA";
            document.getElementById('<%=BranchName.ClientID%>').value = "NA";
            document.getElementById('<%=AccountNo.ClientID%>').value = "NA";
            document.getElementById('<%=IFSC.ClientID%>').value = "NA";

        }
    </script>--%>

    <h2>Add Suppliers Detatils</h2>
    <table style="width: 80%;">
        <tr>
            <td>Name :</td>
            <td>
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Address :</td>
            <td>
                <asp:TextBox ID="TextArea" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Contact No. :</td>
            <td>
                <asp:TextBox ID="contact" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>PAN no. :</td>
            <td>
                <asp:TextBox ID="pan" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>State :</td>
            <td>
                <asp:TextBox ID="State" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Pin Code :</td>
            <td>
                <asp:TextBox ID="PinCode" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Vat No :</td>
            <td>
                <asp:TextBox ID="Vat" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email Id :</td>
            <td>
                <asp:TextBox ID="emailid" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Bank Info </td>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="temp" Text="YES" OnCheckedChanged="RadioButton1_CheckedChanged"  AutoPostBack="True" />
                    <br />
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="temp" Text="NO" OnCheckedChanged="RadioButton2_CheckedChanged"  AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>Bank Name :</td>
            <td>
                <asp:TextBox ID="BankName" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Branch Name :</td>
            <td>
                <asp:TextBox ID="BranchName" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Account No. :</td>
            <td>
                <asp:TextBox ID="AccountNo" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>IFSC No. :</td>
            <td>
                <asp:TextBox ID="IFSC" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Submit" runat="server" Text="Submit" Width="110" OnClick="Submit_Click" />
            </td>
            <td>
                <input type="reset" runat="server" value="Reset" style="width: 110px;" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
    
    <asp:Table ID="Table1" runat="server"></asp:Table>
        </asp:Panel>
</asp:Content>
