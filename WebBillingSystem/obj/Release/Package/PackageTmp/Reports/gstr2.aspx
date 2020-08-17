<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="gstr2.aspx.cs" Inherits="WebBillingSystem.gstr2" %>

<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
 <style>
     thead {
          background-color:darkseagreen;
        border-color:black;
     }
      tbody {
        background-color:darkseagreen;
        border-color:black;
     }
     table {       
        height:500px;
        /*overflow:auto;*/  
        margin-top:20px;
        display: block;
        overflow: scroll;
           }
          td, th {
        border: 1px thin #dddddd;
        text-align: left;
        padding: 8px;
      }


 </style>
    <div class="row">
            <div class="col-xl-12">
                <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35" style="border:groove;">
                      <div class="row">
                          <div class="col-md-6 mb-20">
                              <h6><input type="radio" runat="server" name="DateDisplay" id="rbtnMonthId" class="rbtnMonthClass" value="Monthly" onclick="$('.month_class').show(); $('.quarteryearClass').hide(); monthChange();" checked>  Monthly</h6><br />
                              <div class="d-flex w-300p" style="margin-bottom:1px">						
	                  					<select id="month_id" class="form-control custom-select month_class" onchange="monthChange()">
	                  						<option value="4">April</option>
	                  						<option value="5">May</option>
	                  						<option value="6">June</option>
	                  						<option value="7">July</option>
	                  						<option value="8">August</option>
	                  						<option value="9">September</option>
	                  						<option value="10">October</option>
	                  						<option value="11">November</option>
	                  						<option value="12">December</option>
                                            <option value="1">January</option>
	                  						<option value="2">February</option>
	                  						<option value="3">March</option>
	                  					</select>
	                  				</div>    
                          </div>
                              <div class="col-md-6 mb-20">
                              <h6><input type="radio" runat="server" name="DateDisplay" id="rbtnQuarterlyId" class="rbtnQuarterlyClass" value="Quarterly" onclick="$('.month_class').hide(); $('.quarteryearClass').show(); quarterChange();">  Quarterly</h6><br>
                                  <div class="d-flex w-300p" style="margin-bottom:1px">
                                      <select id="quarteryear" class="form-control quarteryearClass" onchange="quarterChange()">
                                            <option value="1">Quarterly 1</option>
	                  						<option value="2">Quarterly 2</option>
	                  						<option value="3">Quarterly 3</option>
	                  						<option value="4">Quarterly 4</option>
	                  						</select>
                                  </div>
                          </div>
                      </div>
                    
                       <br /><br /><asp:Button runat="server" class="btn btn-primary" ID="btnSearch" Text="Search" OnClick="search_jv_details_event"/>
                       <button id="btn-export" class="btn btn-light btn-just-icon btn-round" onclick="exportHTML();">Export to word doc</button>
                       <a id="dlink"  style="display:none;"></a>
                       <input type="button" class="btn btn-light btn-just-icon btn-round" onclick="tablesToExcel(['gstin_Table', 'outwardSupply_Table','Amendment_outward_supply_Table','CRDRNOTE_Table','Amendment_CRDRNOTES_Table','Advance_Received_InvoicePending_Table','Earlier_Advance_Invoice_Issued_Table','DocumentIssued_Table'], ['gstin_Table', 'outwardSupply_Table','Amendment_outward_supply_Table','CRDRNOTE_Table','Amendment_CRDRNOTES_Table','Advance_Received_InvoicePending_Table','Earlier_Advance_Invoice_Issued_Table','DocumentIssued_Table'], 'myfile.xls', 'Excel')" value="Export to Excel">
                        <%--<input type="button" onclick="tablesToExcel(['gstin_Table', 'outwardSupply_Table','Amendment_outward_supply_Table','CRDRNOTE_Table','Amendment_CRDRNOTES_Table','Advance_Received_InvoicePending_Table','Earlier_Advance_Invoice_Issued_Table','DocumentIssued_Table'])" value="Export to Excel">--%>
                        <script src="~/Views/JS/JSExcel.js" type="text/javascript"></script>
                       <br />
<div class="col-sm-12" id="Grid" runat="server">
<%------------------------------------------------------------------------------------------------------------------------%>
        <%--GSTIN--%>
      <table class="table table-bordered" id="gstin_Table" style="border: 1px solid; height:210px; width:310px;">
           <tbody>
        <tr>
            <th style="border: 1px solid #ccc">GSTIN *</th>
            <td style="border: 1px solid #ccc"><label>10AAVFM2440B1ZS</label></td>
            
        </tr>
        <tr>
           
           <th style="border: 1px solid #ccc">Financial Year *</th>
            <td style="border: 1px solid #ccc"><label>2020-21</label></td>
        </tr>
        <tr>
           <th style="border: 1px solid #ccc">Period</th>
            <td style="border: 1px solid #ccc"><label>August</label></td>
        </tr>
		  </tbody>
		</table>  
         
        <a id="downloadLink" onclick="exportF(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
               function exportF(elem) {
                      var table = document.getElementById("gstin_Table");
                     var html = table.outerHTML;
                     var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
                     elem.setAttribute("href", url);
                     elem.setAttribute("download", "gstin.xls"); // Choose the file name
                     return false;
               }
       </script>
<%----------------------------------------------------------------------------------------------------------------------------------%>
       
        <%--OutWard Supply--%>
         <table class="table table-bordered" id="inwardSupply_Table" style="border: 1px solid;">
                    <%--<table id="myTable" class="table table-hover table-bordered mb-0" style="font: initial;">--%>
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="29" style="background-color:sandybrown;">Details of outward supplies </td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the supplier*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="6" style="border: 1px solid #ccc; border-color:black;">Invoice Details  <font color="red">Note: Enter Bill of entry No./Import Report No. In case of Import</font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST   <font color="red"> (Only for Inter State Supply)</font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">CGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Cess</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Reverse Charge Applicable</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Eligibility of ITC as inputs/capital goods/inputservices/none</th>
                  <th colspan="4" style="border: 1px solid #ccc; border-color:black;">Total Tax available as ITC</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Port Code(In case Of Import)</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Dealer Type(If Other Than Regular)</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Item Type (in case of zero tax on product/service)</th>
			  </tr>
               <tr>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Invoice Value</th>
                   <th style="border: 1px solid #ccc; border-color:black;">HSN/SAC</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Goods/Service description</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Taxable value*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Qty</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Unit</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>                   
                   <th style="border: 1px solid #ccc; border-color:black;">IGST</th>
                   <th style="border: 1px solid #ccc; border-color:black;">CGST</th>
                   <th style="border: 1px solid #ccc; border-color:black;">SGST </th>
                   <th style="border: 1px solid #ccc; border-color:black;">Cess</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
               </tr>
            </thead>
             <tbody>
          </tbody>
	</table>

 <a id="downloadLink1" onclick="export_outwardSupply(this)">Export to excel</a> <br /> <br/>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" class="btn btn-light btn-just-icon btn-round" runat="server"  Text="Append Data" OnClick="btnUpload_Click"/>
            
        <input type="text" name="hdnJson" style="visibility:hidden" ID="txtoutwardSupplyId" class="txtoutwardSupplyClass" runat="server" />
     <hr class="mt-10">
        <script type="text/javascript">
   function export_outwardSupply(elem) {
                
        var table = document.getElementById("inwardSupply_Table");
        var html = table.outerHTML;
        var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
        elem.setAttribute("href", url);
        elem.setAttribute("download", "Outward Supply.xls"); // Choose the file name
        return false;
  }
   
       </script>
 <%----------------------------------------------------------------------------------------------------------------------------------------%>
           <%--CRDRNOTE--%>
        <table class="table table-bordered" id="CRDRNOTE_Table" style="border: 1px solid;">
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Details of Credit/Debit Notes </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the supplier*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Type of note* (Debit/Credit)</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Debit Note/credit note</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Reason Code for issuing Debit/Credit Note*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">HSN Code of Goods/Service</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Goods/Service description</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Original Invoice Details</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Note Value</th>                 
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST   <font color="red"> (Only for Inter State Supply)</font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">CGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Cess</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Indicate if supply attracts reverse charge</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Whether Pre GST</th>
                  
			  </tr>
               <tr>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date*</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">Qty</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Unit</th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date*</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   
               </tr>
            </thead>
             <tbody>
         </tbody>
	</table>
    <a id="downloadLink3" onclick="export_CRDRNOTE(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
            function export_CRDRNOTE(elem) {
                var table = document.getElementById("CRDRNOTE_Table");
                var html = table.outerHTML;
                var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
                elem.setAttribute("href", url);
                elem.setAttribute("download", "CRDRNOTE.xls"); // Choose the file name
                return false;
            }
    </script>
<%------------------------------------------------------------------------------------------------------------------------------------%>
                <%--Advance Received InvoicePending--%>

          <table class="table table-bordered" id="AdvancePaid_withoutInvoice_Table" style="border: 1px solid;">
           
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Tax liability arising on account of Time of Supply without issuance of Invoice in the same period </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the supplier*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="6" style="border: 1px solid #ccc; border-color:black;">Document Details</th>
                   <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">CGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Cess</th>
                  
			  </tr>
               <tr>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Value</th>
                   <th style="border: 1px solid #ccc; border-color:black;">HSN/SAC Code(enter G/S if code not known)</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Goods/Service description</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Taxable value*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Qty</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Unit</th>>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Rate*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Amt*</th>
                   
               </tr>
            </thead>
             <tbody>
               <tr>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl1">1</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl2">2</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl3">3</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl4">4</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl5">5</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl6">6</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl7">7</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl8">8</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl9">9</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl10">10</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl11">11</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl12">12</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl13">13</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl14">14</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl15">15</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl16">16</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl17">17</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl18">18</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="AdvancePaid_withoutInvoice_lbl19">19</label></td>
                </tr>
             </tbody>
		</table>
     <a id="downloadLink5" onclick="export_Advance_Received_InvoicePending(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
            function export_Advance_Received_InvoicePending(elem) {
                var table = document.getElementById("AdvancePaid_withoutInvoice_Table");
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
  elem.setAttribute("href", url);
  elem.setAttribute("download", "Advance Received InvoicePending.xls"); // Choose the file name
  return false;
}
       </script>
<%------------------------------------------------------------------------------------------------------------------------------------%>
            </div>
            <asp:HiddenField ID="hfGridHtml" runat="server" />
        <asp:HiddenField ID="hdnMonthFromDateId" runat="server" />
<asp:HiddenField ID="hdnMonthToDateId" runat="server" />
<asp:HiddenField ID="hdnQuarterFromDateId" runat="server" />
<asp:HiddenField ID="hdnQuarterToDateId" runat="server" />
        </section>
   </div>
</div>

<%------------------------------------------------------------------------------------------------------------------------------------%>
     <script type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js">
    </script>
    <script>
        window.onload = function () {
            if ($(".rbtnQuarterlyClass").attr("checked") == true) {
                $('.quarteryearClass').show();
                $('.month_class').hide();
            } else if ($(".rbtnMonthClass").attr("checked") == true) {
                $('.month_class').show();
                $('.quarteryearClass').hide();
            }

            var jsonSettings = '<%=json_inwardSupply_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            //p_json_obj.data.splice(0, 1);
            for (var i = 0; i < count; i++) {
                //if (i > 0) {
                    $('#inwardSupply_Table> tbody:last').append('<tr>' +

                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['suppliername'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['gstno'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['statename'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['pos'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['no'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['idate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['invoice_value'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['hsncode'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['goodservice'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['taxval'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['qauty'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['unit'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['igstrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['igstamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cgstrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cgstamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['sgstrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['sgstamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cessrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cessamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['revcharge'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['eligi_itc'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['total_tax_igst'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['total_tax_cgst'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['total_tax_sgst'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['total_tax_cess'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['portcode'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['regular'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['itemtype'] + '</td>' +
                             '</tr>'
                             );
            }
            
                var jsonSettings = '<%=json_crdrnote%>';
                var p_json_obj = JSON.parse(jsonSettings);
                var count = JSON.parse(jsonSettings).length;
                for (var i = 0; i < count; i++) {
                    $('#CRDRNOTE_Table> tbody:last').append('<tr>' +

                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['suppliername'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['gstno'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['istate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['pos'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['type'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['drcrditno'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['drcrdate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['reason'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['hsn'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['goodservice'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['qauty'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['unit'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['origino'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['origidate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['diffvalue'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['igstrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['igstamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cgstrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cgstamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['sgstrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['sgstamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cessrate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['cessamt'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['revcharge'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['pregst'] + '</td>' +
                             '</tr>'
                             );

                }
             
        }

        function exportHTML() {            
            $('a').remove();
            $(".btn").remove();
            $("[id*=FileUpload1").remove();
            
            var sourceHTML = document.getElementById("Grid").innerHTML;
            var source = 'data:application/vnd.ms-word,' + encodeURIComponent(sourceHTML);
            var fileDownload = document.createElement("a");
            document.body.appendChild(fileDownload);
            fileDownload.href = source;
            fileDownload.download = 'document.doc';
            fileDownload.click();
            document.body.removeChild(fileDownload);
            window.location.reload();

        }
   var date = new Date();
     
        function monthChange() {
            
            var firstDay = date.getFullYear() + "-" +  $('.month_class').val() + "-" + 1; 
             var lastDay = date.getFullYear() + "-" + $('.month_class').val() + "-" + daysInMonth($('.month_class').val(), date.getFullYear()); 
            $("[id*=hdnMonthFromDateId]").val(firstDay);
            $("[id*=hdnMonthToDateId]").val(lastDay);
            
        }

        function daysInMonth (month, year) { 
                return new Date(year, month, 0).getDate(); 
        } 
        var firstDayQuarter = "";
        var lastDayQuarter = "";
        function quarterChange() {
            
            if ($(".quarteryearClass").val() == 1) {
             var firstDayQuarter = date.getFullYear() + "-" + 01 + "-" + 01; 
             var lastDayQuarter = date.getFullYear() + "-" + 03 + "-" + 31; 
            
            } else if ($(".quarteryearClass").val() == 2) {
                var firstDayQuarter = date.getFullYear() + "-" + 04 + "-" + 01; 
                var lastDayQuarter = date.getFullYear() + "-" + 06 + "-" + 30; 
            
            } else if ($(".quarteryearClass").val() == 3) {
                var firstDayQuarter = date.getFullYear() + "-" + 07 + "-" + 01; 
                var lastDayQuarter = date.getFullYear() + "-" + 09 + "-" + 30; 
            
            } else if ($(".quarteryearClass").val() == 4) {
                var firstDayQuarter = date.getFullYear() + "-" + 10 + "-" + 01; 
                var lastDayQuarter = date.getFullYear() + "-" + 12 + "-" + 31; 
            
            }
            $("[id*=hdnQuarterFromDateId]").val(firstDayQuarter);
            $("[id*=hdnQuarterToDateId]").val(lastDayQuarter);            
        }

        if ($("[id*=hdnMonthFromDateId]").val() != "") {
            $(".month_class").val($("[id*=hdnMonthFromDateId]").val().split("-")[1]);
        }
       
        if ($("[id*=hdnQuarterFromDateId]").val() != "") {
            
            if($("[id*=hdnQuarterFromDateId]").val().split("-")[1] == "1") {
               $(".quarteryearClass").val("1");
            } else if ($("[id*=hdnQuarterFromDateId]").val().split("-")[1] == "4") {
               $(".quarteryearClass").val("2");
            } else if ($("[id*=hdnQuarterFromDateId]").val().split("-")[1] == "7") {
               $(".quarteryearClass").val("3");                
            } else if ($("[id*=hdnQuarterFromDateId]").val().split("-")[1] == "10") {
               $(".quarteryearClass").val("4");
            } 
        } 
    </script>
   
    
</asp:Content>

<%--SELECT purchasemst.seller_name as suppliername, 
purchasemst.gstin as gstno, 
purchasemst.s_state as statename, 
'' as pos,
purchasemst.invoice_no no,
purchasemst.invoice_date idate, 
total_cost as invoice_value, 
purchasedtl.hsn_code as hsncode,
purchasedtl.product_desc goodservice, 
purchasedtl.tax_val taxval, purchasedtl.qty qauty, purchasedtl.uom unit, 
purchasedtl.igst_rate igstrate, purchasedtl.igst_amt igstamt, 
purchasedtl.cgst_rate cgstrate, purchasedtl.cgst_amt cgstamt, 
purchasedtl.sgst_rate sgstrate, purchasedtl.sgst_amount sgstamt,
0 cessrate, 0 cessamt, purchasemst.`reverse_charge` revcharge, 
'' eligi_itc, 0 total_tax_igst, 0 total_tax_cgst, 0 total_tax_sgst, 0 total_tax_cess, 
0 portcode, 
'' regular, '' itemtype 
FROM `pms_purchase_invoice_mst` as purchasemst 
LEFT JOIN pms_purchase_invoice_dtl AS purchasedtl 
ON purchasemst.pur_mst_auto_id = purchasedtl.reference_id--%>