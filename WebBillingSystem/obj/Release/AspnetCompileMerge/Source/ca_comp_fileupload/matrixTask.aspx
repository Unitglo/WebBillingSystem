<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="matrixTask.aspx.cs" Inherits="WebBillingSystem.matrixTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>*******************************************************************************
        <br />
      <label id="lblFirst">Enter First String :</label>
        <input type="text" id="txtFirst" runat="server"/>
    </div>
        <br />
    <div>
      <label id="lblSecond">Enter Second String :</label>
        <input type="text" id="txtSecond" runat="server"/>
    </div>
        <br />
        <div>
            <asp:Button  ID="btnadd" runat="server" OnClick="btnPrintClick" Text="ADD"/>
        </div>
    </form>
</body>
</html>
