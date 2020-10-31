<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="gstr1.aspx.cs" Inherits="WebBillingSystem.gstr1" %>

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
                                            v<option value="1">January</option>
	                  						<option value="2">February</option>
	                  						<option value="3">March</option>
	                  					</select>
	                  				</div>    
                          </div>
                              <div class="col-md-6 mb-20">
                              <h6><input type="radio" runat="server" name="DateDisplay" id="rbtnQuarterlyId" class="rbtnQuarterlyClass" value="Quarterly" onclick="$('.month_class').hide(); $('.quarteryearClass').show(); quarterChange();">  Quarterly</h6><br>
                                  <div class="d-flex w-300p" style="margin-bottom:1px">
                                      <select runat="server" id="quarteryear" class="form-control quarteryearClass" onchange="quarterChange()">
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
      <table class="table table-bordered" id="gstin_Table" style="border: 1px solid;">
           <tbody>
			<tr>
            <th style="border: 1px solid #ccc">GSTIN *</th>
            <td style="border: 1px solid #ccc"><label>10AAVFM2440B1ZS</label></td>
            
        </tr>
        <tr>
            <th style="border: 1px solid #ccc">Financial Year *</th>
            <td style="border: 1px solid #ccc"><label>2019-20</label></td>
        </tr>
        <tr>
            <th style="border: 1px solid #ccc">Period</th>
            <td style="border: 1px solid #ccc"><label>August</label></td>
        </tr>
        <tr>
            <th style="border: 1px solid #ccc">Show HSN Summary Sheet</th>
            <td style="border: 1px solid #ccc"><label>NO</label></td>
        </tr>
        <tr>
            <th style="border: 1px solid #ccc">Show B2CS Summary Sheet</th>
            <td style="border: 1px solid #ccc"><label>NO</label></td>
        </tr>
        <tr>
            <th style="border: 1px solid #ccc">Show Exempted Summary Sheet</th>
            <td style="border: 1px solid #ccc"><label>NO</label></td>
            </tr>
        <tr>
            <th style="border: 1px solid #ccc">Show Original inv. No. column <font color="red">(Required only in amendment case)</font></th>
            <td style="border: 1px solid #ccc"><label>NO</label></td>
        </tr>
               <tr><td colspan="2" style="border: 1px solid #ccc"><font color="skyblue">Instructions:-</font></td> <hr class="mt-0"></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">1. Invoice number can contain only 0-9,A-Z , ‘/’ and ‘-‘ . No space between two digits. Maximum 16 digits.</td></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">2. State should be filled in all invoices.</td></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">3. GSTIN no. of counterparty should be Valid.	</td></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">4. Item name in Description column Must Be less than 30 Character	</td></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">5. In case of goods, UQC in unit column should be as per Provided Units.	</td></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">6.To feed an invoice having multiple rate items, make separate row for each item/rate, but make sure that invoice value that is the total of invoice is same in all such rows. 	</td></tr>
               <tr><td colspan="2" style="border: 1px solid #ccc">For eg.-Mr. A (GSTIN-08AAAPA1111A1Z1) has an invoice of Rs. 55550 having Invoice no. A-101 dated 15.07.2017	</td></tr>

               <tr><td colspan="4"></td></tr>
              
               <tr>
                   <th style="border: 1px solid #ccc">GST RATE</th>
                   <th style="border: 1px solid #ccc">TAXABLE VALUE</th>
                   <th style="border: 1px solid #ccc">TAX</th>
                   <th style="border: 1px solid #ccc">INVOICE VALUE</th>
               </tr>
               <tr>
                   <td style="border: 1px solid #ccc">5%</td>
                   <td style="border: 1px solid #ccc">1000</td>
                   <td style="border: 1px solid #ccc">50</td>
                   <td style="border: 1px solid #ccc">1050
</td>
               </tr>
                    <tr>
                   <td style="border: 1px solid #ccc">12%</td>
                   <td style="border: 1px solid #ccc">10000</td>
                   <td style="border: 1px solid #ccc">1200</td>
                   <td style="border: 1px solid #ccc">11200</td>
               </tr>
                    <tr>
                   <td style="border: 1px solid #ccc">18%</td>
                   <td style="border: 1px solid #ccc">15000</td>
                   <td style="border: 1px solid #ccc">2700</td>
                   <td style="border: 1px solid #ccc">17700</td>
               </tr>
                    <tr>
                   <td style="border: 1px solid #ccc">28%</td>
                   <td style="border: 1px solid #ccc">20000</td>
                   <td style="border: 1px solid #ccc">5600</td>
                   <td style="border: 1px solid #ccc">25600</td>
               </tr>
                  
                       <tr><th style="border: 1px solid #ccc">Total</th>
                           <th style="border: 1px solid #ccc">46000</th>
                           <th style="border: 1px solid #ccc">9550</th>
                           <th style="border: 1px solid #ccc">55550</th>
                       </tr>
                  <tr><td colspan="4"></td></tr>
        <tr><td colspan="2" style="border: 1px solid #ccc">8.In case of intra state sale or  inter state sale wit6h invoice value less than Rs. 2.5 lakhs to unregistered person, you may feed all the invoices or you can feed a consolidated entry state wise and rate wise. If you consolidate, you may feed an invoice no. say 'Unreg' with any date. However it is recommended to give invoice wise details as software will make reverse charge calculations and consolidate the invoices on it's own</td></tr>
         <tr><td colspan="2" style="border: 1px solid #ccc">9. if yes optioin is selected for b2cs summary sheet or hsn summary sheet then data will be imported in software on the basis of these sheets	</td></tr>
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
         <table class="table table-bordered" id="outwardSupply_Table" style="border: 1px solid;">
                    <%--<table id="myTable" class="table table-hover table-bordered mb-0" style="font: initial;">--%>
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="29" style="background-color:sandybrown;">Details of outward supplies </td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the receipient*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="6" style="border: 1px solid #ccc; border-color:black;">Invoice Details</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST   <font color="red"> (Only for Inter State Supply)</font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">CGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Cess</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Indicate if supply attracts reverse charge $</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of ecommerce operator</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN of ecommerce operato <font color="red"> (if applicable)</font></th>
                  <th colspan="4" style="border: 1px solid #ccc; border-color:black;">Shipping Bill  <font color="red"> (In case of export)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Select Receipient Category if different from "Regular"</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Item Type</th>
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
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">Export Type </th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date </th>
                   <th style="border: 1px solid #ccc; border-color:black;">Port Code </th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
               </tr>
            </thead>
             <tbody>
               <%--<tr>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl1"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl2"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl3"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl4"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl5"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl6"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl7"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl8"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl9"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl10"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl11"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl12"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl13"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl14"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl15"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl16"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl17"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl18"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl19"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl20"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl21"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl22"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl23"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl24"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl25"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl26"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl27"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl28"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="outSupp_lbl29"></label></td>
                                                                  

               </tr>--%>
                        </tbody>
						</table>
 <a id="downloadLink1" onclick="export_outwardSupply(this)">Export to excel</a> <br /> <br/>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" class="btn btn-light btn-just-icon btn-round" runat="server"  Text="Append Data" OnClick="btnUpload_Click"/>
            
        <input type="text" name="hdnJson" style="visibility:hidden" ID="txtoutwardSupplyId" class="txtoutwardSupplyClass" runat="server" />
                       
        <hr class="mt-10">
        <script type="text/javascript">
   function export_outwardSupply(elem) {
                
        var table = document.getElementById("outwardSupply_Table");
        var html = table.outerHTML;
        var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
        elem.setAttribute("href", url);
        elem.setAttribute("download", "Outward Supply.xls"); // Choose the file name
        return false;
  }
   
       </script>
<%----------------------------------------------------------------------------------------------------------------------------------------%>
         <%--Amendment outward supply--%>
       <table class="table table-bordered" id="Amendment_outward_supply_Table" style="border: 1px solid;">
           
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Amendments to details of outward supplies of earlier tax periods </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the receipient*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                 <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Original Invoice Details</th>
                  <th colspan="6" style="border: 1px solid #ccc; border-color:black;">Revised Invoice Details</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST   <font color="red"> (Only for Inter State Supply)</font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">CGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Cess</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Indicate if supply attracts reverse charge</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Tax on this Invoice is paid under provisional assessment</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Provisional Assessment Order Details <font color="red">(Enter Details when value in column AA is YES)	</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of ecommerce operator</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN of ecommerce operato <font color="red"> (if applicable)</font></th>
                  <th colspan="4" style="border: 1px solid #ccc; border-color:black;">Shipping Bill  <font color="red"> (In case of export)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Select Receipient Category if different from "Regular"</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Item Type</th>
			  </tr>
               <tr>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.*</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date*</th>
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
                   <th style="border: 1px solid #ccc; border-color:black;">No.</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">Export Type </th>
                   <th style="border: 1px solid #ccc; border-color:black;">No.</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Date </th>
                   <th style="border: 1px solid #ccc; border-color:black;">Port Code </th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
               </tr>
            </thead>
            <tbody>
               <%--<tr>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl1"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl2"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl3"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl4"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl5"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl6"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl7"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl8"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl9"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl10"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl11"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl12"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl13"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl14"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl15"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl16"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl17"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl18"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl19"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl20"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl21"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl22"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl23"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl24"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl25"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl26"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl27"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl28"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl29"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl30"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl31"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl32"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl33"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amOutSupp_lbl34"></label></td>
                   
                                                                  

               </tr>--%>
                        </tbody>
						</table>

    <a id="downloadLink2" onclick="export_Amendment_outward_supply(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
            function export_Amendment_outward_supply(elem) {
      var table = document.getElementById("Amendment_outward_supply_Table");
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
  elem.setAttribute("href", url);
  elem.setAttribute("download", "Amendment outward supply.xls"); // Choose the file name
  return false;
            }

      
       </script>

 <%----------------------------------------------------------------------------------------------------------------------------------------%>
           <%--CRDRNOTE--%>
        <table class="table table-bordered" id="CRDRNOTE_Table" style="border: 1px solid;">
           
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Details of Credit/Debit Notes </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the receipient*  <font color="red">(Mandatory in case of unregistered person) </font></th>
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
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Differential Value *</th>                 
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
             <%--  <tr>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl1"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl2"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl3"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl4"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl5"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl6"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl7"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl8"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl9"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl10"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl11"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl12"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl13"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl14"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl15"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl16"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl17"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl18"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl19"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl20"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl21"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl22"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl23"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl24"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="crdrnota_lbl25"></label></td>
                   
                                                                  

               </tr>--%>
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

<%----------------------------------------------------------------------------------------------------------------------------------------%>
   <%--Amendment_CRDRNOTES--%>
        <table class="table table-bordered" id="Amendment_CRDRNOTES_Table" style="border: 1px solid;">
           
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Amendment to Details of Credit/Debit Notes of earlier tax periods </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the receipient*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Type of note* (Debit/Credit)</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Original Debit Note/credit note</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">"Revised Debit Note/credit note </th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Reason Code for issuing Debit/Credit Note*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">HSN Code of Goods/Service</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Goods/Service description</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Original Invoice Details</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Differential Value *</th>                 
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
             <%--   <tr>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl1"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl2"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl3"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl4"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl5"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl6"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl7"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl8"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl9"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl10"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl11"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl12"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl13"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl14"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl15"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl16"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl17"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl18"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl19"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl20"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl21"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl22"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl23"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl24"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl25"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl26"></label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="amecrdr_lbl27"></label></td>
                   
                                                                  

               </tr>--%>
                        </tbody>
						</table>
     <a id="downloadLink4" onclick="export_Amendment_CRDRNOTES(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
            function export_Amendment_CRDRNOTES(elem) {
                var table = document.getElementById("Amendment_CRDRNOTES_Table");
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
  elem.setAttribute("href", url);
  elem.setAttribute("download", "Amendment CRDRNOTES.xls"); // Choose the file name
  return false;
            }

       </script>

<%------------------------------------------------------------------------------------------------------------------------------------%>
                <%--Advance Received InvoicePending--%>

          <table class="table table-bordered" id="Advance_Received_InvoicePending_Table" style="border: 1px solid;">
           
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Tax liability arising on account of Time of Supply without issuance of Invoice in the same period </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the receipient*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Document</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">HSN Code of Goods/Service</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Goods/Service description</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Quantity	</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"Amount of advance received/ Value of Supply provided without raising a bill*</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST   <font color="red"> (Only for Inter State Supply)</font></th>
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
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">Qty</th>
                   <th style="border: 1px solid #ccc; border-color:black;">Unit</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
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
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl1">1</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl2">2</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl3">3</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl4">4</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl5">5</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl6">6</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl7">7</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl8">8</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl9">9</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl10">10</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl11">11</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl12">12</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl13">13</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl14">14</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl15">15</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl16">16</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl17">17</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl18">18</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="adReInvoicepend_lbl19">19</label></td>
                </tr>
             </tbody>
		</table>

     <a id="downloadLink5" onclick="export_Advance_Received_InvoicePending(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
            function export_Advance_Received_InvoicePending(elem) {
                var table = document.getElementById("Advance_Received_InvoicePending_Table");
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
  elem.setAttribute("href", url);
  elem.setAttribute("download", "Advance Received InvoicePending.xls"); // Choose the file name
  return false;
}
       </script>


<%------------------------------------------------------------------------------------------------------------------------------------%>
<%--Earlier Advance Invoice Issued--%>
         <table class="table table-bordered" id="Earlier_Advance_Invoice_Issued_Table" style="border: 1px solid; height:400px;">
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Tax already paid (on advance receipt/ on account of time of supply) on invoices issued in the current period	 </font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Name of the receipient*  <font color="red">(Mandatory in case of unregistered person) </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">GSTIN/ UIN*  <font color="red"> (Mandatory in case of Registered person)</font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">State Name*</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"POS  <font color="red">(only if different from the location of recipient)" </font></th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Invoice No. *</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Invoice Date*</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Document</th>
                   <th colspan="1" style="border: 1px solid #ccc; border-color:black;">HSN Code of Goods/Service</th>
                   <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Goods/Service description</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">"Amount of advance received/ Value of Supply provided without raising a bill*</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">IGST   <font color="red"> (Only for Inter State Supply)</font></th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">CGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SGST	</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">Cess</th>
                  
			  </tr>
               <tr>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
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
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl1">1</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl2">2</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl3">3</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl4">4</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl5">5</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl6">6</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl7">7</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl8">8</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl9">9</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl10">10</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl11">11</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl12">12</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl13">13</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl14">14</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl15">15</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl16">16</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl17">17</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl18">18</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="erAdInvoiceIssue_lbl19">19</label></td>
                   
               </tr>
           </tbody>
		</table>
        
     <a id="downloadLink6" onclick="export_Earlier_Advance_Invoice_Issued(this)">Export to excel</a>
     <hr class="mt-10">
        <script type="text/javascript">
            function export_Earlier_Advance_Invoice_Issued(elem) {
                var table = document.getElementById("Earlier_Advance_Invoice_Issued_Table");
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
  elem.setAttribute("href", url);
  elem.setAttribute("download", "Earlier Advance Invoice Issued.xls"); // Choose the file name
  return false;
}
       </script>

<%------------------------------------------------------------------------------------------------------------------------------------%>
             <%--DocumentIssued--%>
        <div>
         <table class="table table-bordered" id="DocumentIssued_Table" style="border: 1px solid;height:300px;">           
           <thead>
               <tr style="height:5px; border-color:black;"> <td colspan="34" style="background-color:sandybrown;"> <font color="black">Documents issued during the tax period details</font></td></tr>
			  <tr style="border-color:black;">
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Nature of Document</th>
                  <th colspan="2" style="border: 1px solid #ccc; border-color:black;">SR No. </th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Total Number</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Cancelled</th>
                  <th colspan="1" style="border: 1px solid #ccc; border-color:black;">Net issued</th>
                  
			  </tr>
               <tr>
                    <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;">From</th>
                   <th style="border: 1px solid #ccc; border-color:black;">To</th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   <th style="border: 1px solid #ccc; border-color:black;"></th>
                   
               </tr>
            </thead>
             <tbody>
               <tr>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="docIssue_lbl1">1</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="docIssue_lbl2">2</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="docIssue_lbl3">3</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="docIssue_lbl4">4</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="docIssue_lbl5">5</label></td>
                   <td colspan="1" style="border: 1px solid #ccc; border-color:black;"><label runat="server" id="docIssue_lbl6">6</label></td>
                                                                                                                                
               </tr>                                                                                                            
                        </tbody>                                                                                                
						</table>
     </div>
        <a id="downloadLink7" onclick="export_DocumentIssued(this)">Export to excel</a>
     <hr class="mt-10">
        
                    
        <script type="text/javascript">
            function export_DocumentIssued(elem) {
                var table = document.getElementById("DocumentIssued_Table");
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
  elem.setAttribute("href", url);
  elem.setAttribute("download", "Document Issued.xls"); // Choose the file name
  return false;
}
       </script>

  <%------------------------------------------------------------------------------------------------------------------------------------%>

                      </div>
                   
   <br />
<asp:HiddenField ID="hfGridHtml" runat="server" />
<asp:HiddenField ID="hdnMonthFromDateId" runat="server" />
<asp:HiddenField ID="hdnMonthToDateId" runat="server" />
<asp:HiddenField ID="hdnQuarterFromDateId" runat="server" />
<asp:HiddenField ID="hdnQuarterToDateId" runat="server" />
    </section></div></div>
     <script type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js">
    </script>
    <script>
        window.onload = function () {
           
            if ($(".rbtnQuarterlyClass").attr("checked") == true) {
                //quarterChange();
                $('.quarteryearClass').show();
                $('.month_class').hide();
            } else if ($(".rbtnMonthClass").attr("checked") == true) {
               // monthChange();
                $('.month_class').show();
                $('.quarteryearClass').hide();
            }

            var jsonSettings = '<%=json_outwardSupply_obj%>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            //p_json_obj.data.splice(0, 1);
            for (var i = 0; i < count; i++) {
                //if (i > 0) {
                $('#outwardSupply_Table> tbody:last').append('<tr>' +
                
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['recename'] + '</td>' +
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
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['ecomoperator'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['comp_gstin'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['exporttype'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['shipbillno'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['shipbilldate'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['portcode'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['regular'] + '</td>' +
                             '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['itemtype'] + '</td>' +
                             '</tr>'
                             );
                //}
            }

     <%-- var jsonSettings = '<%=json_Amendment_outward_supply_obj%>';
      var p_json_obj = JSON.parse(jsonSettings);
      var count = JSON.parse(jsonSettings).length;
      for (var i = 0; i < count; i++) {
          $('#Amendment_outward_supply_Table> tbody:last').append('<tr>' +

                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['recename'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['gstno'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['istate'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['pos'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['orinvno'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['orivdate'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['revinvno'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['revivdate'] + '</td>' +
                    '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['invoicevalue'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['hsn'] + '</td>' +
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
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['taxprovasse'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['provasseordno'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['provasseordate'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['ecomoperator'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['comp_gstin'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['exporttype'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['shipbillno'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['shipbilldate'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['portcode'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['regular'] + '</td>' +
                   '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['itemtype'] + '</td>' +
                   '</tr>'
                   );
      }--%>
                var jsonSettings = '<%=json_sheet_four_obj%>';
                var p_json_obj = JSON.parse(jsonSettings);
                var count = JSON.parse(jsonSettings).length;
                for (var i = 0; i < count; i++) {
                    $('#CRDRNOTE_Table> tbody:last').append('<tr>' +
                   
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['recename'] + '</td>' +
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
             
             <%--var jsonSettings = '<%=json_sheet_five_obj%>';
                var p_json_obj = JSON.parse(jsonSettings);
                var count = JSON.parse(jsonSettings).length;
                for (var i = 0; i < count; i++) {
                    $('#Amendment_CRDRNOTES_Table> tbody:last').append('<tr>' +

                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['recename'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['gstno'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['istate'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['pos'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['type'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['drcrno'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['drcrdate'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['revdrcrno'] + '</td>' +
                              '<td colspan="1" style="border: 1px solid #ccc; border-color:black;">' + p_json_obj[i]['revdrcrdate'] + '</td>' +
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

                }--%>
            //financialyear();
        }

        function exportHTML() {
            //var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' " +
            //     "xmlns:w='urn:schemas-microsoft-com:office:word' " +
            //     "xmlns='http://www.w3.org/TR/REC-html40'>" +
            //     "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
            //var footer = "</body></html>";
            //var sourceHTML = header + document.getElementById("Grid").innerHTML + footer;
            //var href = $('a').hide();
            //var btn = $(".btn").hide();
            //var file = $("[id*=FileUpload1").hide();
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

        //function exportHTML() {
        //    //outward Supply
        //    var sourceHTML_outwardSupply = document.getElementById("outwardSupply_Table");
        //    var html_outwardSupply = sourceHTML_outwardSupply.outerHTML;
        //    var source_outwardSupply = 'data:application/vnd.ms-word,' + escape(html_outwardSupply);
        //    var fileDownload_outwardSupply = document.createElement("a");
        //    document.body.appendChild(fileDownload_outwardSupply);
        //    fileDownload_outwardSupply.href = source_outwardSupply;
        //    fileDownload_outwardSupply.download = 'outwardSupplydocument.doc';
        //    fileDownload_outwardSupply.click();
        //    document.body.removeChild(fileDownload_outwardSupply);

        //    var sourceHTML_Amendment_outward_supply = document.getElementById("Amendment_outward_supply_Table");
        //    var html_Amendment_outward_supply = sourceHTML_Amendment_outward_supply.outerHTML;
        //    var source_Amendment_outward_supply = 'data:application/vnd.ms-word,' + escape(html_Amendment_outward_supply);
        //    var fileDownload_Amendment_outward_supply = document.createElement("a");
        //    document.body.appendChild(fileDownload_Amendment_outward_supply);
        //    fileDownload_Amendment_outward_supply.href = source_Amendment_outward_supply;
        //    fileDownload_Amendment_outward_supply.download = 'Amendment_outward_supplydocument.doc';
        //    fileDownload_Amendment_outward_supply.click();
        //    document.body.removeChild(fileDownload_Amendment_outward_supply);

        //    var sourceHTML_CRDRNOTE = document.getElementById("CRDRNOTE_Table");
        //    var html_CRDRNOTE = sourceHTML_CRDRNOTE.outerHTML;
        //    var source_CRDRNOTE = 'data:application/vnd.ms-word,' + escape(html_CRDRNOTE);
        //    var fileDownload_CRDRNOTE = document.createElement("a");
        //    document.body.appendChild(fileDownload_CRDRNOTE);
        //    fileDownload_CRDRNOTE.href = source_CRDRNOTE;
        //    fileDownload_CRDRNOTE.download = 'CRDRNOTEdocument.doc';
        //    fileDownload_CRDRNOTE.click();
        //    document.body.removeChild(fileDownload_CRDRNOTE);

        //    var sourceHTML_Amendment_CRDRNOTES = document.getElementById("Amendment_CRDRNOTES_Table");
        //    var html_Amendment_CRDRNOTES = sourceHTML_Amendment_CRDRNOTES.outerHTML;
        //    var source_Amendment_CRDRNOTES = 'data:application/vnd.ms-word,' + escape(html_Amendment_CRDRNOTES);
        //    var fileDownload_Amendment_CRDRNOTES = document.createElement("a");
        //    document.body.appendChild(fileDownload_Amendment_CRDRNOTES);
        //    fileDownload_Amendment_CRDRNOTES.href = source_Amendment_CRDRNOTES;
        //    fileDownload_Amendment_CRDRNOTES.download = 'Amendment_CRDRNOTESdocument.doc';
        //    fileDownload_Amendment_CRDRNOTES.click();
        //    document.body.removeChild(fileDownload_Amendment_CRDRNOTES);

        //    var sourceHTML_Advance_Received_InvoicePending = document.getElementById("Advance_Received_InvoicePending_Table");
        //    var html_Advance_Received_InvoicePending = sourceHTML_Advance_Received_InvoicePending.outerHTML;
        //    var source_Advance_Received_InvoicePending = 'data:application/vnd.ms-word,' + escape(html_Advance_Received_InvoicePending);
        //    var fileDownload_Advance_Received_InvoicePending = document.createElement("a");
        //    document.body.appendChild(fileDownload_Advance_Received_InvoicePending);
        //    fileDownload_Advance_Received_InvoicePending.href = source_Advance_Received_InvoicePending;
        //    fileDownload_Advance_Received_InvoicePending.download = 'Advance_Received_InvoicePendingdocument.doc';
        //    fileDownload_Advance_Received_InvoicePending.click();
        //    document.body.removeChild(fileDownload_Advance_Received_InvoicePending);

        //    var sourceHTML_Advance_Received_InvoicePending = document.getElementById("Advance_Received_InvoicePending_Table");
        //    var html_Advance_Received_InvoicePending = sourceHTML_Advance_Received_InvoicePending.outerHTML;
        //    var source_Advance_Received_InvoicePending = 'data:application/vnd.ms-word,' + escape(html_Advance_Received_InvoicePending);
        //    var fileDownload_Advance_Received_InvoicePending = document.createElement("a");
        //    document.body.appendChild(fileDownload_Advance_Received_InvoicePending);
        //    fileDownload_Advance_Received_InvoicePending.href = source_Advance_Received_InvoicePending;
        //    fileDownload_Advance_Received_InvoicePending.download = 'Advance_Received_InvoicePendingdocument.doc';
        //    fileDownload_Advance_Received_InvoicePending.click();
        //    document.body.removeChild(fileDownload_Advance_Received_InvoicePending);

        //}
//***************************************************************************************

//    var tablesToExcel = (function () {
//    var uri = 'data:application/vnd.ms-excel;base64,'
//    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets>'
//    , templateend = '</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>'
//    , body = '<body>'
//    , tablevar = '<table>{table'
//    , tablevarend = '}</table>'
//    , bodyend = '</body></html>'
//    , worksheet = '<x:ExcelWorksheet><x:Name>'
//    , worksheetend = '</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>'
//    , worksheetvar = '{worksheet'
//    , worksheetvarend = '}'
//    , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
//    , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
//    , wstemplate = ''
//    , tabletemplate = '';

//    return function (table, name, filename) {
//        var tables = table;
//        
//        for (var i = 0; i < tables.length; ++i) {
//            wstemplate += worksheet + worksheetvar + i + worksheetvarend + worksheetend;
//            tabletemplate += tablevar + i + tablevarend;
//        }

//        var allTemplate = template + wstemplate + templateend;
//        var allWorksheet = body + tabletemplate + bodyend;
//        var allOfIt = allTemplate + allWorksheet;

//        var ctx = {};
//        for (var j = 0; j < tables.length; ++j) {
//            ctx['worksheet' + j] = name[j];
//        }
 
//        for (var k = 0; k < tables.length; ++k) {
//            var exceltable;
//            if (!tables[k].nodeType) exceltable = document.getElementById(tables[k]);
//            ctx['table' + k] = exceltable.innerHTML;
//        }

//        //document.getElementById("dlink").href = uri + base64(format(template, ctx));
//        //document.getElementById("dlink").download = filename;
//        //document.getElementById("dlink").click();

//        window.location.href = uri + base64(format(allOfIt, ctx));

//    }
//})();
//***************************************************************************************
var tablesToExcel = (function() {
var uri = 'data:application/vnd.ms-excel;base64,'
, tmplWorkbookXML = '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">'
  + '<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office"><Author>Axel Richter</Author><Created>{created}</Created></DocumentProperties>'
  + '<Styles>'
  + '<Style ss:ID="Currency"><NumberFormat ss:Format="Currency"></NumberFormat></Style>'
  + '<Style ss:ID="Date"><NumberFormat ss:Format="Medium Date"></NumberFormat></Style>'
  + '</Styles>' 
  + '{worksheets}</Workbook>'
, tmplWorksheetXML = '<Worksheet ss:Name="{nameWS}"><Table>{rows}</Table></Worksheet>'
, tmplCellXML = '<Cell{attributeStyleID}{attributeFormula}><Data ss:Type="{nameType}">{data}</Data></Cell>'
, base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
, format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
return function(tables, wsnames, wbname, appname) {
  var ctx = "";
  var workbookXML = "";
  var worksheetsXML = "";
  var rowsXML = "";

  for (var i = 0; i < tables.length; i++) {
    if (!tables[i].nodeType) tables[i] = document.getElementById(tables[i]);
    for (var j = 0; j < tables[i].rows.length; j++) {
      rowsXML += '<Row>'
      for (var k = 0; k < tables[i].rows[j].cells.length; k++) {
        var dataType = tables[i].rows[j].cells[k].getAttribute("data-type");
        var dataStyle = tables[i].rows[j].cells[k].getAttribute("data-style");
        var dataValue = tables[i].rows[j].cells[k].getAttribute("data-value");
        dataValue = (dataValue)?dataValue:tables[i].rows[j].cells[k].innerHTML;
        var dataFormula = tables[i].rows[j].cells[k].getAttribute("data-formula");
        dataFormula = (dataFormula)?dataFormula:(appname=='Calc' && dataType=='DateTime')?dataValue:null;
        ctx = {  attributeStyleID: (dataStyle=='Currency' || dataStyle=='Date')?' ss:StyleID="'+dataStyle+'"':''
               , nameType: (dataType=='Number' || dataType=='DateTime' || dataType=='Boolean' || dataType=='Error')?dataType:'String'
               , data: (dataFormula)?'':dataValue
               , attributeFormula: (dataFormula)?' ss:Formula="'+dataFormula+'"':''
              };
        rowsXML += format(tmplCellXML, ctx);
      }
      rowsXML += '</Row>'
    }
    ctx = {rows: rowsXML, nameWS: wsnames[i] || 'Sheet' + i};
    worksheetsXML += format(tmplWorksheetXML, ctx);
    rowsXML = "";
  }

  ctx = {created: (new Date()).getTime(), worksheets: worksheetsXML};
  workbookXML = format(tmplWorkbookXML, ctx);

console.log(workbookXML);

  var link = document.createElement("A");
  link.href = uri + base64(workbookXML);
  link.download = wbname || 'Workbook.xls';
  link.target = '_blank';
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}
 })();
        //***************************************************************************

    //    function tablesToExcel(tables) {
    //    var uri = 'data:application/vnd.ms-excel;base64,',
    //    template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
    //    base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))); },
    //    format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) };    
        
    //        var worksheetsData = "";
    //        
    //    for (var i = 0; i < tables.length; i++) {
    //        var table = document.getElementById(tables[i]);
            
    //        var dataValue = table.outerHTML;
            
    //        ctx = { worksheet: 'sheet' + i, table: dataValue };                        
    //        worksheetsData += format(template, ctx);
    //    }

    //    var link = document.createElement("A");
    //    link.href = uri + base64(worksheetsData);
    //    link.download = 'ExportData' || 'Workbook.xls';
    //    link.target = '_blank';
    //    document.body.appendChild(link);
    //    link.click();
    //    document.body.removeChild(link);
    //}


 //$.fn.extend(
 //   {
 // quarteryearpicker: function()
 // {
 //   var select = $(this);

 //   var date = new Date();
 //   var year = date.getFullYear();
 //   var quarter = Math.floor(date.getMonth() / 3);

 //   for (var i = -10; i < 11; i++)
 //   {
 //     var year_to_add = year + i;

 //     for (var j = 0; j < 4; j++)
 //     {
 //       var option = $('<option/>');
 //       var quarter_text = get_quarter_text(j);

 //       var value = year_to_add + '-' + (j + 1);
 //       var text = year_to_add + ' ' + quarter_text;

 //       option.val(value).text(text);

 //       if (year_to_add == year && quarter == j)
 //       {
 //         option
 //           .css('font-weight', 'bold')
 //           .attr('selected', 'selected');
 //       }

 //       select.append(option);
 //     }
 //   }

 //   function get_quarter_text(num)
 //   {
 //     switch(num)
 //     {
 //       case 0:
 //         return 'Jan-Mar';
 //       case 1:
 //         return 'Apr-Jun';
 //       case 2:
 //         return 'Jul-Sep';
 //       case 3:
 //         return 'Oct-Dec';
 //     }
 //   }
 // }
        //           });


        // need to be modify 


    var date = new Date();
    var FromDateId = "";
    var ToDateId = "";
    var year = date.getFullYear();
    //function financialyear() {
      
    //    if (Int32.Parse(Convert.ToDateTime(Session["start_date"].ToString()).ToString("MM")) < 4)
    //    {
    //        alert("hi")
    //        FromDateId = (year - 1) + "-04-01";
    //    }
    //    else {
    //        FromDateId = year + "-04-01";
    //    }

    //    date.innerHTML = FromDateId + " TO " + ToDateId;
    //}
       
        
   
  
   
    
  
        function monthChange() {
            
            var firstDay = date.getFullYear() + "-" +  $('.month_class').val() + "-" + 1; 
             var lastDay = date.getFullYear() + "-" + $('.month_class').val() + "-" + daysInMonth($('.month_class').val(), date.getFullYear()); 
            $("[id*=hdnMonthFromDateId]").val(firstDay);
            $("[id*=hdnMonthToDateId]").val(lastDay);
            year();
            
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
            
            if($("[id*=hdnQuarterFromDateId]").val().split("-")[1] == "1")
            {
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