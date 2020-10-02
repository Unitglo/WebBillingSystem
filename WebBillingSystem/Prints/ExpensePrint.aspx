<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpensePrint.aspx.cs" Inherits="WebBillingSystem.Prints.ExpensePrint" %>

<html>

    <table style="width: 100%;text-align:center">
       
        <tr><td>
             <b style="font-size:larger"> <label runat="server" id="company_name" /></b>
         </td></tr>
        <tr><td>
             <b style="font-size:larger"> <label runat="server" id="address" /></b>
            </td>
            </tr>
       
           
        <tr><td>
         <b style="font-size:larger">  State :  <label runat="server" id="exp_state" /></b>
     <b style="font-size:larger">State Code: <label runat="server" id="exp_state_code" /></b>

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
            <b style="font-size:larger"> GSTIN : <label runat="server" id="label" /></b><hr />
            </td></tr>
      <tr style="background-color:lightblue"> <td> <b style="font-size:xx-large">Tax Invoice </b><br /></td></tr>
     
     
        
       </table>&nbsp;
     <table style="width:60%">
     <tr>
  <td style="text-align:left"><b style="font-size:medium">Invoice No: <label  runat="server" id="exexp_invoice_no" /></b>&nbsp;</td>
     <td style="text-align:right"><b style="font-size:medium";>Invoice date: <label  runat="server" id="invoice_date1" /></b>
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
                                                <label runat="server" id="exp_invoice_no" />     
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Voucher Date </td>
                                                <td colspan="2">:
                                                <label runat="server" id="exp_voucher_date" />     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Reverse Charge  </td>
                                                <td colspan="2"> :
                                          <label runat="server" id="exp_reverse_charge" />     
      
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
                                                <td colspan="2" style="width: 25%;"> Name  </td>
                                                <td colspan="2">:
                                                <label runat="server" id="exp_supplier_name" />     
                                                </td><td></td><td></td>
                                           </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">Address </td>
                                                <td colspan="2">:
                                                <label runat="server" id="exp_supplier_addr" />     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                <td colspan="2">GSTIN  </td>
                                                <td colspan="2"> :
                                          <label runat="server" id="exp_supplier_gstin" />     
      
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr class="mt-0">
                                            </td></tr>
                                            <tr>
                                                
                                                <td colspan="2"> Expenses Head</td>
                                               <td colspan="2">:
                                           <label runat="server" id="expenses_head" /> 
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
						    <th style="border: 2px solid;"> Taxable Value</th>
                             <th style="border: 2px solid;"> IGST Rate</th>
                            <th  style="border: 2px solid;"> IGST Amount</th>
                           <th style="border: 2px solid;"> CGST Rate</th>
                            <th  style="border: 2px solid;"> CGST Amount</th>
                            <th colspan="2" style="border: 2px solid;"> SGST Rate</th>
                            <th colspan="1" style="border: 2px solid;"> SGST Amount</th>
                            <th colspan="6"  style="border: 2px solid;"> TOTAL</th>
						</tr>
                            </thead>
						<tbody id="item_holder_tbody" style="border: 1px solid;" runat="server">

						<tr><td style="border:1px solid!important;">1</td>
                            <td style="border:1px solid!important;" class="product-discription">bank charge</td>
                            <td style="border:1px solid!important;" class="hsncode"></td>
                          <td style="border:1px solid!important;" class="tax-value">85.00</td>
                            <td style="border:1px solid!important;" class="igst-rate">9.00</td>
                            <td style="border:1px solid!important;" class="igst-amount">7.65</td>
                          <td style="border:1px solid!important;" class="cgst-rate">9.00</td>
                            <td style="border:1px solid!important;" class="cgst-amount">7.65</td>
                            <td style="border:1px solid!important;" class="sgst-rate">9.00</td>
                            <td  style="border:1px solid!important;" class="sgst-amount">7.65</td>
                            <td colspan="6" style="border:1px solid!important;" class="tot_class">100.30</td>
						</tr></tbody>
                      <tfoot class="border: 1px solid;">
                      <tr>
                          <th colspan="3" id="foot_tot" class="text-center font-weight-600" style="border: 2px solid"><b>Total</b></th>
                          <th id="tot_row_Taxval" runat="server" colspan="1" class="text-right font-weight-600" style="border: 2px solid">85.00</th>
                          <th id="tot_row_igst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                          <th id="tot_row_cgst" runat="server" colspan="2" class="text-right font-weight-600" style="border: 2px solid">7.65</th>
                          <th id="tot_row_sgst" runat="server" colspan="4" class="text-right font-weight-600" style="border: 2px solid">7.65</th>
                          <th id="tot_row_Amt_tax" runat="server" colspan="6" class="text-right font-weight-600" style="border: 2px solid">100.30</th>
                      </tr>
                         <tr>
                            <th colspan="8" class="text-center font-weight-600" style="border: 2px solid"><b>Total Invoice amount in words</b></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount before Tax</th>
                          <th id="tot_invoice_beforetax" colspan="6" runat="server" class="text-right font-weight-600" style="border: 2px solid">85.00</th>
                      </tr>
                     <tr>
                            <th colspan="8" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: IGST</th>
                          <th id="tot_add_igst" colspan="6" runat="server" class="text-right font-weight-600" style="border: 2px solid">0.00</th>
                      </tr>
                      <tr>
                            <th colspan="8" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: CGST</th>
                          <th id="tot_add_cgst" colspan="6" runat="server" class="text-right font-weight-600" style="border: 2px solid">7.65</th>
                      </tr>
                      <tr>
                            <th colspan="8" class="text-center font-weight-600" style="border-right: 2px solid; border-left: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Add: SGST</th>
                          <th id="tot_add_sgst" colspan="6" runat="server" class="text-right font-weight-600" style="border: 2px solid">7.65</th>
                      </tr>
                           <tr>
                            <th colspan="8" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Tax Amount:</th>
                          <th id="tot_tax" runat="server" class="text-right font-weight-600" style="border: 2px solid">15.30</th>
                      </tr>
                      <tr>
                            <th colspan="8" class="text-center font-weight-600" style="border: 2px solid"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">Total Amount after Tax:</th>
                          <th id="tot_amt_aftertax"  runat="server" class="text-right font-weight-600" style="border: 2px solid">100.30</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-center font-weight-600" style="border: 2px solid">Bank Details</th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px transparent;"></th>
                              <th colspan="1" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="4" class="text-center font-weight-600" style="border: 2px solid">GST on Reverse Charge</th>
                          <th class="text-right font-weight-600" style="border: 2px solid">0</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-left font-weight-600" style="border: 2px solid">Bank Name :  <input name="ctl00$ContentPlaceHolder1$bank_name" type="text" id="ContentPlaceHolder1_bank_name" value="UNITED BANK OF INDIA"> <br> Bank A/C   : <input name="ctl00$ContentPlaceHolder1$bankAc_Id" type="text" id="ContentPlaceHolder1_bankAc_Id" value="9658745632145"> </th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px transparent;"></th>
                              <th colspan="1" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border-right: 2px solid; font-size:12px;">Ceritified that the particulars given above are true and correct</th>
                      </tr>

                          <tr>
                            <th colspan="5" class="text-left font-weight-600" style="border: 2px solid">Bank IFSC :  <input name="ctl00$ContentPlaceHolder1$bankIFSC_id" type="text" id="ContentPlaceHolder1_bankIFSC_id" value="UTBI000548"></th>
                              <th colspan="2" class="text-center font-weight-600" style="border-right: 2px transparent;"></th>
                              <th colspan="1" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                           <th colspan="5" class="text-center font-weight-600" style="border-right: 2px solid;"></th>
                      </tr>

                      <tr style="height:100px">
                            <th colspan="5" class="text-center font-weight-600" style="border: 2px solid; vertical-align: text-top;">Terms and Conditions 
                                <br><label id="ContentPlaceHolder1_termcond_Id" class="termCond_class">1 E OE 2 Subject to Patna Jurisdiction 3 Late Payment Interest 24 4 Error in bills can only be brought forth within 7 days</label>
                          
                                 </th>
                        
                              <th colspan="3" class="text-center font-weight-600" style="border: 2px solid; vertical-align: bottom;">Common Seal</th>
<%--                              <th colspan="2" class="text-center font-weight-600" style="border: 2px solid"></th>--%>
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