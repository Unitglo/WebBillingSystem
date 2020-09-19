﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebBillingSystem.WebForm3" %>

<HTML>
<HEAD>
<TITLE> Add/Remove dynamic rows in HTML table </TITLE>
<SCRIPT language="javascript">
    function addRow(tableID) {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;
        var row = table.insertRow(rowCount);
        //Column 1
        var cell1 = row.insertCell(0);
        var element1 = document.createElement("input");
        element1.type = "button";
        var btnName = "button" + (rowCount + 1);
        element1.name = btnName;
        element1.setAttribute('value', 'Delete'); // or element1.value = "button";
        element1.onclick = function () { removeRow(btnName); }
        cell1.appendChild(element1);
        //Column 2  
        var cell2 = row.insertCell(1);
        cell2.innerHTML = rowCount + 1;
        //Column 3
        var cell3 = row.insertCell(2);
        var element3 = document.createElement("input");
        element3.type = "text";
        cell3.appendChild(element3);
    }
    function removeRow(btnName) {
        try {
            var table = document.getElementById('dataTable');
            var rowCount = table.rows.length;
            for (var i = 0; i < rowCount; i++) {
                var row = table.rows[i];
                var rowObj = row.cells[0].childNodes[0];
                if (rowObj.name == btnName) {
                    table.deleteRow(i);
                    rowCount--;
                }
            }
        }
        catch (e) {
            alert(e);
        }
    }
</SCRIPT>
</HEAD>
<H3>This demo html file provides you easiest approach to dynamically add and delete rows</H3>
<BODY>
<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
<TABLE id="dataTable" width="350px" border="1">
<TR>
<TD><input type="button" name="button1" value="Delete" onclick="removeRow('button1')"></TD>
<TD>1</TD>
<TD><input type="text" value="" name="nameTxt"></TD>
</TR>
</TABLE>  
</BODY>
</HTML>