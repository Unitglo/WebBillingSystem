<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="WebBillingSystem.ParchesOrder" %>
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
    <h2>&nbsp;Purchase Order</h2>
    <input type="date" id="dates" style="float:right" runat="server" />
    <table style="width:80%;">
        <tr>
            <td>PO NO. : </td>
            <td><asp:Label ID="PONo" runat="server" Text="1"></asp:Label></td>
        </tr>

        <tr>
            <td>
                Supplier Name :
            </td>
            <td>
                <asp:DropDownList ID="SupplierNameList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SupplierNameList_SelectedIndexChanged" Width="150" >
                    <asp:ListItem Text="Select Any Supplier" Value="0">Select Any Supplier</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Vat Type. : </td>
            <td>
                <!-- can't Change -->
                    <asp:DropDownList ID="VatTypeList" runat="server" Width="150">
                    <asp:ListItem Text="Select Vat" Value="0"></asp:ListItem>
                    <asp:ListItem Text="VAT 5% " Value="0.05"></asp:ListItem>
                    <asp:ListItem Text="VAT 12.5% " Value="0.125"></asp:ListItem>
                    <asp:ListItem Text="CST" Value="0.17"></asp:ListItem>
                    <asp:ListItem Text="EXCISE" Value="0.02"></asp:ListItem>
                </asp:DropDownList>
                                <!-- can't Change -->

</td>
        </tr>
          <tr>
            <td>Vat No. : </td>
            <td><asp:Label ID="VatNumber" runat="server" Text="101231231"></asp:Label></td>
        </tr>
    </table>
<table style="width:80%;">
    <tr>
        <th>Sr NO.</th>
        <th>Item Name</th>
        <th>Item Rate</th>
        <th>QTY</th>
        <th>Vat Amount</th>
        <th>Amount</th>
    </tr>

    <tr>
        <td>1</td>
        <td>
              <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate1" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);" ></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount1" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
        <tr>
        <td>2</td>
        <td>
              <asp:DropDownList ID="DropDownList2" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate2" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);" ></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount2" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
        <tr>
        <td>3&nbsp;</td>
        <td>
              <asp:DropDownList ID="DropDownList3" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate3" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount3" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
    <tr>
        <td>4</td>
        <td>
              <asp:DropDownList ID="DropDownList4" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate4" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount4" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
<tr>
        <td>5</td>
        <td>
              <asp:DropDownList ID="DropDownList5" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate5" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox5" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label5" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount5" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
<tr>
        <td>6</td>
        <td>
              <asp:DropDownList ID="DropDownList6" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate6" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox6" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label6" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount6" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
<tr>
        <td>7</td>
        <td>
              <asp:DropDownList ID="DropDownList7" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate7" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox7" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label7" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount7" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
<tr>
        <td>8</td>
        <td>
              <asp:DropDownList ID="DropDownList8" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate8" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox8" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label8" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount8" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
<tr>
        <td>9</td>
        <td>
              <asp:DropDownList ID="DropDownList9" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate9" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox9" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label9" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount9" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>
<tr>
        <td>10</td>
        <td>
              <asp:DropDownList ID="DropDownList10" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"   >
                    <asp:ListItem Text="Select Any Item" Value="0">Select Any Item</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Rate10" runat="server" Text="0"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TextBox10" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" onkeypress="CheckNumeric(event);"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label10" runat="server" Text="0"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Amount10" runat="server" Text="0"></asp:Label>
        </td>
        
    </tr>

</table >  
    <div style="float:right; text-align:right;" >
      <table > 
          <tr >
              <td> Vat Total </td>
                  <td>:</td>
              <td><asp:Label ID="VatTotal" runat="server" Text="0000.00"></asp:Label></td>
</tr>
          <tr>
              <td>
        Total</td>
              <td> : </td>
               <td><asp:Label ID="TotalAmount" runat="server" Text="0000.00"></asp:Label></td>
          </tr>
          </table>
        <asp:Button ID="PrintBill" runat="server" Text="Print" Width="110" OnClick="PrintBill_Click" />
    </div>
    
</asp:Content>
