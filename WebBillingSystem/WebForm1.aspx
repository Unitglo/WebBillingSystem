<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebBillingSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add New Row" /> &nbsp;
    <asp:Button ID="Button2" runat="server" Text="Remove Selected Row(s)"
        onclick="Button2_Click" />
        <asp:Table ID="Table1" runat="server"></asp:Table>
    </form>
</body>
</html>
