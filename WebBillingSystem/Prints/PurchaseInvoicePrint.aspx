﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseInvoicePrint.aspx.cs" Inherits="WebBillingSystem.Prints.PurchaseInvoicePrint" %>

<html>

    <table style="width:100%;text-align:center" >
         <tr><td>
             <b style="font-size:larger"> <label runat="server" id="auth_name" /></b>
         </td></tr>
        <tr><td>
             <b style="font-size:larger"> <label runat="server" id="address" /></b>
            </td>
            </tr>
       
           
        <tr><td>
         <b style="font-size:larger">  State :  <label runat="server" id="s_state" /></b>
     <b style="font-size:larger">State Code: <label runat="server" id="haederstate_code" /></b>

            </td></tr>
        <tr><td>
 <b style="font-size:larger">Email Id:<label runat="server" id="Label1" /></b>
  <b style="font-size:larger">Telephone No:<label runat="server" id="Label2" /></b>

            </td>
            </tr>

         <tr><td>

             </td>
            </tr>
         <tr><td>
            <b style="font-size:larger"> GSTIN : <label runat="server" id="gstin" /></b><hr />
            </td></tr>
                      <tr style="background-color:lightblue"> <td> <b style="font-size:xx-large">Tax Invoice </b></td></tr>
                </table>&nbsp;
        <table style="width:70%">

       <tr><td style="text-align:left"> 
    <b style="font-size:medium">Invoice Number: <label runat="server" id="invoice_num" /></b></td>
  <td style="text-align:right"><b style="font-size:medium">Invoice date: <label runat="server" id="invoice_date1" /></b>

            </td></tr>
     
        </table>
      
<table style="width:100%">
       <tr>
 
            <td style="width:50%">
                <table style="width: 100%; text-align: left;">
                                        <thead style="text-align:center; border:groove;">
                                            <tr><th colspan="4" style="border-right: groove;"> </th>
                                            
                                        </tr></thead>  
                                        
                                        <tbody><tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            
                                        </tbody><tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Inovice No </td>
                                                <td colspan="2">:
                                                <label runat="server" id="invoice_no" />     
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Invoice Date </td>
                                                <td colspan="2">:
                                                <label runat="server" id="invoice_date" />     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Reverse Charge  </td>
                                                <td colspan="2"> :
                                          <label runat="server" id="reverse_charge" />     
      
                                                </td>
                                            </tr>
                                          
                                           
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                        </tbody>
                                    </table>
                </td>
            <td style="width:50%">
                <table style="width: 100%; text-align: left;">
                                        <thead style="text-align:center; border:groove;">
                                            <tr><th colspan="4" style="border-right: groove;"> </th>
                                            
                                        </tr></thead>  
                                        
                                        <tbody><tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            
                                        </tbody><tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Supplier Name  </td>
                                                <td colspan="2">:
                                                <label runat="server" id="bill_to_party_name" />     
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Address </td>
                                                <td colspan="2">:
                                                <label runat="server" id="bill_to_party_Seller_address" />     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">GSTIN  </td>
                                                <td colspan="2"> :
                                          <label runat="server" id="bill_to_party_gstin" />     
      
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">State </td>
                                                <td>:
                                          <label runat="server" id="bill_to_party_s_state" />     
                                                </td>
                                                <td colspan="2">Code: 
                                               
                                           <label runat="server" id="bill_to_party_state_code" /> 
                                                </td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                        </tbody>
                                    </table>
                </td>
         
                
            </tr>
    </table>
    <!-- Product details table  -->
    <br>
 <table class="table table-light table-bordered mb-0 table-responsive" id="myTable" style="border: 1px solid; width: 100%;">
                    
                        <thead class="thead-light">
						<tr>
                            <th style="border: 2px solid;"> Sr. No.</th>
							<th style="border: 2px solid;"> Product Description</th>
							<th style="border: 2px solid;"> HSN code</th>
							<th style="border: 2px solid;"> Unit Of Measurement</th>
							<th style="border: 2px solid;"> Batch</th>
                            <th style="border: 2px solid;"> Expiry Date</th>
							<th style="border: 2px solid;"> Qty</th>
							<th style="border: 2px solid;  display:none;">Rate</th>
							<th style="border: 2px solid;"> Amount</th>
							<th style="border: 2px solid;"> Discount</th>
							<th style="border: 2px solid;"> Taxable Value</th>
                            <th style="border: 2px solid;"> IGST Rate</th>
                            <th style="border: 2px solid;"> IGST Amount</th>
                            <th  style="border: 2px solid;"> CGST Rate</th>
                            <th colspan="3" style="border: 2px solid;"> CGST Amount</th>
                            <th style="border: 2px solid;"> SGST Rate</th>
                            <th style="border: 2px solid;"> SGST Amount</th>
                            <th  style="border: 2px solid;"> TOTAL</th>
						</tr>
                            </thead>
						<tbody id="item_holder_tbody" style="border: 1px solid;" runat="server">

						</tbody>
                      <tfoot class="border: 1px solid;">
                      <tr>
                          <th colspan="6" id="foot_tot" class="text-center font-weight-600" style="border: 2px solid"><b>Total</b></th>
                          <th id="tot_row_Quant" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">20927.92</th>
<%--                          <th id="tot_Rate" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0</th>--%>
                          <th id="tot_row_Amt" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">1205097.24</th>
                          <th id="tot_row_Dis" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_Taxval" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">1205097.24</th>
                          <th id="tot_row_igst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_cgst" runat="server" colspan="4" class="text-right font-weight-600" style="border: 2px solid">144611.67</th>
                        <th id="tot_row_sgst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0</th>

                          <th id="tot_row_Amt_tax" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">1349708.91</th>
                      </tr>
                         <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_beforetax" runat="server" class="text-right font-weight-600" style="border: 2px solid">1205097.24</th>
                      </tr>
                     <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" runat="server" class="text-right font-weight-600" style="border: 2px solid">144611.67</th>
                      </tr>
                      <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" runat="server" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                      </tr>
                      <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" runat="server" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                      </tr>
                      <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_aftertax" runat="server" class="text-right font-weight-600" style="border: 2px solid">1349708.91</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-center font-weight-600" style="border: 2px solid">Bank Details</th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="6" class="text-center font-weight-600" style="border: 2px solid">GST on Reverse Charge</th>
                          <th class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-left font-weight-600" style="border: 2px solid">Bank Name :  <input name="ctl00$ContentPlaceHolder1$bank_name" type="text" id="ContentPlaceHolder1_bank_name" value="UNITED BANK OF INDIA"> <br> Bank A/C   : <input name="ctl00$ContentPlaceHolder1$bankAc_Id" type="text" id="ContentPlaceHolder1_bankAc_Id" value="9658745632145"> </th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="7" class="text-center font-weight-600" style="border-right: 2px solid; font-size:12px;">Ceritified that the particulars given above are true and correct</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-left font-weight-600" style="border: 2px solid">Bank IFSC :  <input name="ctl00$ContentPlaceHolder1$bankIFSC_id" type="text" id="ContentPlaceHolder1_bankIFSC_id" value="UTBI000548"></th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="7" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                      </tr>

                      <tr style="height:100px">
                            <th colspan="5" class="text-center font-weight-600" style="border: 2px solid; vertical-align: text-top;">Terms and Conditions 
                                <br><label id="ContentPlaceHolder1_termcond_Id" class="termCond_class">1 E OE 2 Subject to Patna Jurisdiction 3 Late Payment Interest 24 4 Error in bills can only be brought forth within 7 days</label>
                          
                                 </th>
                        
                              <th colspan="3" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">Common Seal</th>
                              <th colspan="4" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="7" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">
                               <label id="ContentPlaceHolder1_sign_Id" class="sign_class" style="vertical-align: text-top;">SUNIL KUMAR TIWARY</label><br>
                               Authorised signatory
                           </th>
                      </tr>
                      
    <tr>

    </tr>
                
                    
            
                        </table>    
                   </tfoot>
                   
</html>