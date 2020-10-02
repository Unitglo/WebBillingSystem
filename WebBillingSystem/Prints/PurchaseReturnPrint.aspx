<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseReturnPrint.aspx.cs" Inherits="WebBillingSystem.PurchaseReturnPrint" %>
<html>

    <table style="width: 100%;text-align:center">
         <tr><td>
             <b style="font-size:larger"> <label runat="server" id="auth_name" /></b>
         </td></tr>
        <tr><td>
             <b style="font-size:larger"> <label runat="server" id="address" /></b>
            </td>
            </tr>
       
           
        <tr><td>
         <b style="font-size:larger">  State :  <label runat="server" id="doc_state" /></b>
     <b style="font-size:larger">State Code: <label runat="server" id="doc_state_code" /></b>

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
            <b style="font-size:larger"> GSTIN : <label runat="server" id="headergstin" /></b><hr />
            </td></tr>
              <tr style="background-color:lightblue"> <td> <b style="font-size:xx-large">Tax Invoice </b></td></tr>
        </table>&nbsp;
         <table style="width:70%">
         <tr><td style="text-align:left">
    <b style="font-size:medium">Invoice Number: <label runat="server" id="bill_to_party_invoice_no" /></b>
            </td>
        <td style="text-align:right">
    <b style="font-size:medium">Invoice date: <label runat="server" id="bill_to_party_invoice_date" /></b>

            </td></tr>
       </table>
    <table style="width:100%">
       
      
                     <tr>
            <td style="width:50%">
                <table style="width: 100%; text-align: left;">
                                       
                                        
                                        <tbody><tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            
                                        </tbody><tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Document No  </td>
                                                <td colspan="2">:
                                                <label runat="server" id="document_no" />     
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Date of Issue </td>
                                                <td colspan="2">:
                                                <label runat="server" id="date_of_issue" />     
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
                                       
                                        
                                        <tbody><tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            
                                        </tbody><tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Against invoice </td>
                                                <td colspan="2">:
                                                <label runat="server" id="against_invoice" />     
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Date of Invoice </td>
                                                <td colspan="2">:
                                                <label runat="server" id="date_of_invoice" />     
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
        <tr>
        
            <td style="width:50%">
                <table style="width: 100%; text-align: left;">
                                        <thead style="text-align:center; border:groove;">
                                            <tr><th colspan="4" style="border-right: groove;">Bill to Party </th>
                                            
                                        </tr></thead>  
                                        
                                        <tbody><tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            
                                        </tbody><tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Name  </td>
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
            <td style="width: 50%;" >
                <table style="width: 100%; text-align: left;">
                                        <thead style="text-align:center; border:groove;">
                                            <tr><th colspan="4" style="border-right: groove;">Ship to Party </th>
                                            
                                        </tr></thead>  
                                        
                                        <tbody><tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            
                                        </tbody><tbody>
                                            <tr>
                                                <td colspan="2" style="width: 25%;">Name  </td>
                                                <td colspan="2">:
                                        <label runat="server" id="ship_to_party_ship_party_name" />     
       
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Address </td>
                                                 <td colspan="2">:
                                         <label runat="server" id="ship_to_party_ship_party_address" />     
                                          </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">GSTIN  </td>
                                                <td colspan="2"> :
                                    <label runat="server" id="ship_to_party_ship_party_gstin" />     
     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">State </td>
                                                <td>:
                                                      <label runat="server" id="ship_to_party_ship_party_state" /> 
                                                </td>
                                                <td colspan="2">Code: 
                                              
                                          <label runat="server" id="ship_to_party_ship_party_state_code" /> 
                                               </td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                        </tbody>
                                    </table>
                </td>
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
							
							<th style="border: 2px solid;"> Amount</th>
							<th style="border: 2px solid;"> Discount</th>
							<th style="border: 2px solid;"> Taxable Value</th>
                             <th style="border: 2px solid;"> IGST Rate</th>
                            <th style="border: 2px solid;"> IGST Amount</th>
                            <th style="border: 2px solid;"> CGST Rate</th>
                            <th style="border: 2px solid;"> CGST Amount</th>
                            <th style="border: 2px solid;"> SGST Rate</th>
                            <th style="border: 2px solid;"> SGST Amount</th>
                            <th style="border: 2px solid;"> TOTAL</th>
						</tr>
                            </thead>
						<tbody id="item_holder_tbody" style="border: 1px solid;" runat="server">

						<tr><td style="border:1px solid!important;">1</td>
                            <td style="border:1px solid!important;" class="product-discription">90 GSM 585X910 COATED PAPER-GLOSS</td>
                            <td style="border:1px solid!important;" class="hsncode">4802</td>
                            <td style="border:1px solid!important;" class="uom">KGS-KILOGRAMS</td>
                            <td style="border:1px solid!important;" class="batchClass"></td>
                            <td style="border:1px solid!important;" class="expiryClass">0001-01-01</td>
                            <td style="border:1px solid!important;" class="qty">1</td>
                            <td style="border:1px solid!important;" class="amount">608868.12</td>
                            <td style="border:1px solid!important;" class="discount">0.00</td>
                            <td style="border:1px solid!important;" class="tax-value">608868.12</td>

                            <td style="border:1px solid!important;" class="igst-rate">8.00</td>
                            <td style="border:1px solid!important;" class="igst-amount">0.00</td>
                            <td style="border:1px solid!important;" class="cgst-rate">6.00</td>
                            <td style="border:1px solid!important;" class="cgst-amount">0.00</td>
                            <td style="border:1px solid!important;" class="sgst-rate">6.00</td>
                            <td style="border:1px solid!important;" class="sgst-amount">0</td>
                            <td style="border:1px solid!important;" class="tot_class">681932.29.</td>
						</tr></tbody>
                      <tfoot class="border: 1px solid;">
                      <tr>
                          <th colspan="6" id="foot_tot" class="text-center font-weight-600" style="border: 2px solid"><b>Total</b></th>
                          <th id="tot_row_Quant" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">1.00</th>
                          <th id="tot_Rate" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid; display:none;">0</th>
                          <th id="tot_row_Amt" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">608868.12</th>
                          <th id="tot_row_Dis" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_Taxval" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">608868.12</th>
                          <th id="tot_row_igst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_cgst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_sgst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_Amt_tax" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">681932.29</th>
                      </tr>
                         <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_beforetax" runat="server" class="text-right font-weight-600" style="border: 2px solid">608868.12</th>
                      </tr>
                     <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" runat="server" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                      </tr>
                      <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" runat="server" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                      </tr>
                      <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" runat="server" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                      </tr>
                      <tr>
                            <th colspan="12" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_aftertax" runat="server" class="text-right font-weight-600" style="border: 2px solid">681932.29</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-center font-weight-600" style="border: 2px solid">Bank Details</th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">GST on Reverse Charge</th>
                          <th class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-left font-weight-600" style="border: 2px solid">Bank Name :  <input name="ctl00$ContentPlaceHolder1$bank_name" type="text" id="ContentPlaceHolder1_bank_name" value="UNITED BANK OF INDIA"> <br> Bank A/C   : <input name="ctl00$ContentPlaceHolder1$bankAc_Id" type="text" id="ContentPlaceHolder1_bankAc_Id" value="9658745632145"> </th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border-right: 2px solid; font-size:12px;">Ceritified that the particulars given above are true and correct</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-left font-weight-600" style="border: 2px solid">Bank IFSC :  <input name="ctl00$ContentPlaceHolder1$bankIFSC_id" type="text" id="ContentPlaceHolder1_bankIFSC_id" value="UTBI000548"></th>
                              <th colspan="3" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                              <th colspan="4" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                      </tr>

                      <tr style="height:100px">
                            <th colspan="5" class="text-center font-weight-600" style="border: 2px solid; vertical-align: text-top;">Terms and Conditions 
                                <br><label id="ContentPlaceHolder1_termcond_Id" class="termCond_class">1 E OE 2 Subject to Patna Jurisdiction 3 Late Payment Interest 24 4 Error in bills can only be brought forth within 7 days</label>
                          
                                 </th>
                        
                              <th colspan="3" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">Common Seal</th>
                              <th colspan="4" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">
                               <label id="ContentPlaceHolder1_sign_Id" class="sign_class" style="vertical-align: text-top;">SUNIL KUMAR TIWARY</label><br>
                               Authorised signatory
                           </th>
                      </tr>
                      
    <tr>

    </tr>
                
                    
            
                        </table>    
                   </tfoot>
                   
</html>