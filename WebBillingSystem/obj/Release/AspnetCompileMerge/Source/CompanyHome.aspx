<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CompanyHome.aspx.cs" Inherits="WebBillingSystem.CompanyHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha256-TQq84xX6vkwR0Qs1qH5ADkP+MvH0W+9E7TdHJsoIQiM=" crossorigin="anonymous"></script>
    
    <div class="row" style="position: fixed; z-index: 99; width: 100%;">
        <div class="col-xl-12">
             <div class="hk-row">
				 <div class="col-sm-12">
                     <div style="height: 40px; padding-top: 6px; background-color: #2d1453; font-size: larger;">
	                        <marquee id="left_marq_id" behavior="scroll" direction="left">
	                    	    <ul style="overflow: hidden;">
	                    		    <li style="display: inline-block; color:white;" id="li_mar_id">
                                        
	                    		    </li>
	                    	    </ul>
	                        </marquee>
                     </div>
                </div>
            </div>
       </div>
   </div>
    
<div class="row">
    <div class="col-xl-12">
      <section class="hk-sec-wrapper hk-invoice-wrap pa-35">
          
             <div class="hk-pg-header align-items-top" style="margin-bottom:1px">
                    <div style="padding: 15px;">
						<h3 class="hk-pg-title font-weight-600 mb-10"><%=company_name %></h3>
						<h6 class="hk-pg-title font-weight-600 mb-10" style="color: #151397;"><%= address_name %></h6>
						<h6 class="hk-pg-title font-weight-600 mb-10" style="color: #3e95cd;"><%= gst_no %></h6>
						<%--<p>Questions about onboarding lead data? <a href="#">Learn more.</a></p>--%>
					</div>
					<div class="d-flex w-300p" style="margin-bottom:1px">						
						<select runat="server" id="month_id" class="form-control custom-select custom-select-sm month_class" onchange="monthChange()">
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
    
    <div class="row">
        <div class="hk-row">
							<div class="col-lg-12 " style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">

									<div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
											<table class="table">
                                                  <tbody>
                                                    
                                                    <tr><th>Op. Stock </th><td><b>:-</b>  <label runat="server" id="op_stock_id" class="op_stock_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>PURCHASE</th><td><b>:-</b>  <label runat="server" id="purchase_id"  class="purchase_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>IGST</th><td><b>:-</b>  <label runat="server" id="purchase_igst_id" class="purchase_igst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>CGST</th><td><b>:-</b>  <label runat="server" id="purchase_cgst_id" class="purchase_cgst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>SGST</th><td><b>:-</b>  <label runat="server" id="purchase_sgst_id" class="purchase_sgst_class dashboard_value_check">0.00</label></td></tr>
                                                  
                                                  </tbody>
                                                </table>
                                                
                                            </div>
										</div>
									</div>

                                    <div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
                                                
                                                <table class="table">
                                                  <tbody>                                                    
                                                    <tr><th>Cl. Stock  </th><td><b>:-</b> <label runat="server" id="cl_stock_id" class="cl_stock_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>SALE</th><td><b>:-</b>  <label runat="server" id="sale_id" class="sale_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>IGST</th><td><b>:-</b> <label runat="server" id="sale_igst_id" class="sale_igst_class dashboard_value_check">0.00</label> </td></tr>
                                                    <tr><th>CGST</th><td><b>:-</b> <label runat="server" id="sale_cgst_id" class="sale_cgst_class dashboard_value_check">0.00</label> </td></tr>
                                                    <tr><th>SGST</th><td><b>:-</b> <label runat="server" id="sale_sgst_id" class="sale_sgst_class dashboard_value_check">0.00</label> </td></tr>
                                                  </tbody>
                                                </table>
											</div>
										</div>
									</div>
								
								<div class="card card-sm border-primary">
									<div class="card-body">
										<div class="d-flex justify-content-between mb-5">
											<div class="d-flex justify-content-between mb-5">

                                                 <table class="table">
                                                  <tbody>                                                    
                                                    <tr><th>Non GST Expenses </th><td><b>:-</b> <label runat="server" id="non_gst_expenses_id" class="non_gst_expenses_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>GST Expenses </th><td><b>:-</b> <label runat="server" id="gst_expenses_id" class="gst_expenses_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>IGST</th><td><b>:-</b><label runat="server" id="expeses_igst_id" class="expeses_igst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>CGST</th><td><b>:-</b><label runat="server" id="expeses_cgst_id" class="expeses_cgst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>SGST</th><td><b>:-</b><label runat="server" id="expeses_sgst_id" class="expeses_sgst_class dashboard_value_check">0.00</label></td></tr>
                                                  </tbody>
                                                </table>

                                               <%-- <div>
												 <span class="d-block font-15 text-dark font-weight-500">Non GST Expenses :- 
                                                    <label runat="server" id="non_gst_expenses_id" class="non_gst_expenses_class">0.00</label> </span>
												<span class="d-block font-15 text-dark font-weight-500"> GST Expenses :- 
                                                    <label runat="server" id="gst_expenses_id" class="gst_expenses_class">0.00</label></span>
												<span class="d-block font-15 text-dark font-weight-500"> IGST  :- 
                                                    <label runat="server" id="expeses_igst_id" class="expeses_igst_class">0.00</label></span>
												<span class="d-block font-15 text-dark font-weight-500"> CGST  :- 
                                                    <label runat="server" id="expeses_cgst_id" class="expeses_cgst_class">0.00</label></span>
												<span class="d-block font-15 text-dark font-weight-500"> SGST  :- 
                                                    <label runat="server" id="expeses_sgst_id" class="expeses_sgst_class">0.00</label></span>
										  </div>--%>

											</div>
                                          </div>	
										</div>
									</div>
                                 </div>
                         		</div>
                            <%--</div>--%>


            <style>
                .card.card-sm .card-body {
                     padding-bottom: 0px !important;
                     padding-top: 0px !important;
                }
                .table {
                    margin-bottom: 0px !important;
                }
                .table td, .table th {
                    padding: 0px !important;
                    border-top: none !important;
                }
               
            </style>
            <div class="col-lg-12 " style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">

									<div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
                                                <table class="table">
                                                  <tbody>
                                                    <tr style="text-align:center;"><th colspan="2"><h6>Total ITC</h6></th></tr>
                                                    <tr><th>IGST</th><td><b>:-</b>  <label runat="server" id="total_itc_igst_id" class="total_itc_igst_class dashboard_value_check"></label></td></tr>
                                                    <tr><th>CGST</th><td><b>:-</b>  <label runat="server" id="total_itc_cgst_id" class="total_itc_cgst_class dashboard_value_check"></label></td></tr>
                                                    <tr><th>SGST</th><td><b>:-</b>  <label runat="server" id="total_itc_sgst_id" class="total_itc_sgst_class dashboard_value_check"></label></td></tr>
                                                  
                                                  </tbody>
                                                </table>
                                                
										</div>
									</div>
                                </div>
                                    <div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												 <table class="table">
                                                  <tbody>
                                                    <tr style="text-align:center;"><th colspan="2"><h6>Total OTL</h6></th></tr>
                                                    <tr><th>IGST</th><td><b>:-</b>  <label runat="server" id="total_otl_igst_id" class="total_otl_igst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>CGST</th><td><b>:-</b>  <label runat="server" id="total_otl_cgst_id" class="total_otl_cgst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>SGST</th><td><b>:-</b>  <label runat="server" id="total_otl_sgst_id" class="total_otl_sgst_class dashboard_value_check">0.00</label></td></tr>
                                                  
                                                  </tbody>
                                                </table>
                                                
										</div>
									</div>
								</div>
									<div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												
                                                <table class="table">
                                                  <tbody>
                                                    <tr><th>Gross Profit</th><td><b>:-</b>  <label runat="server" id="gross_profit_id" class="gross_profit_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>Net Profit</th><td><b>:-</b>  <label runat="server" id="net_profit_id" class="net_profit_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>Net IGST Payable</th><td><b>:-</b>  <label runat="server" id="net_igst_id" class="net_igst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>Net CGST Payable</th><td><b>:-</b>  <label runat="server" id="net_cgst_id" class="net_cgst_class dashboard_value_check">0.00</label></td></tr>
                                                    <tr><th>Net SGST Payable</th><td><b>:-</b>  <label runat="server" id="net_sgst_id" class="net_sgst_class dashboard_value_check">0.00</label></td></tr>
                                                  
                                                  </tbody>
                                                </table>
											</div>
										</div>
									</div>                                    
								</div>
                            </div>
            
                    <div class="hk-row">
        				<div class="col-lg-8" style=" height: 550px; width: 720px;">
                              <div class="card border-primary">
									<div class="card-header card-header-action border-primary">
										<h6>Voucher Chart</h6>		
									</div>
									<div class="card-body">
										<canvas id="bar-chart-grouped" width="750" height="450"></canvas>
									</div>
								</div>
</div>
                          <div class="col-lg-4" style="height: 500px; width: 400px;">
                                <div class="card card-refresh border-primary">		
                                <div class="card-header border-primary card-header-action">
									<h4 style="text-align:center; padding-top: 15px;">News &amp; Updates</h4>
                                </div>   
                                    <div class="card-body">
                                            <marquee id="mrq_title_id" width="100%" direction="up" height="400px" scrolldelay="5" scrollamount="3" behavior="scroll" onmouseout="this.start()" onmouseover="this.stop()">
                                            </marquee>
                                        </div>
                                    </div>
                                </div>
                           </div>
                    </div>
                 </div>
        </section>
    </div>          
</div>

   <style>
    .card-body {
        padding: 0.5rem;
    }
     .hk-pg-wrapper .hk-pg-header > div:first-child, .hk-pg-wrapper .hk-pg-header > div:last-child {
     margin-bottom: 0px; 
     }
   </style>

    <script type="text/javascript"> 
                          var finalJsonCount = '<%=final_json_obj_count%>';
                          var final_json_obj = JSON.parse(finalJsonCount);
                            final_json_obj = final_json_obj[0];
                            console.log(final_json_obj);
                       var myChart = new Chart(document.getElementById("bar-chart-grouped"), {
                               type: 'bar',
                               data: {
                                 labels: ["April","May", "June", "July", "August","September","October","November","December", "January", "February", "March"],
                                 datasets: [
                                   {
                                     label: "Purchase",
                                     backgroundColor: "#3e95cd",
                                     data: final_json_obj['purchase_amount']
                                   }, {
                                     label: "Sale",
                                     backgroundColor: "#8e5ea2",
                                     data: final_json_obj['sale_amount']
                                   },{
                                     label: "Debit",
                                     backgroundColor: "lightgreen",
                                     data: final_json_obj['dabit_amount']
                                   },{
                                     label: "Credit",
                                     backgroundColor: "lightpink",
                                     data: final_json_obj['credit_amount']
                                   }
                                 ]
                               },
                               options: {
                                 title: {
                                   display: true,
                                   text: ''
                                 }
                               }
                           });
             
        window.onload = function () {
            var month = new Date().getMonth() + 1;
            $(".month_class").val(month).trigger('change');


            var cl_stock = 0.00;
            var sale_total = 0.00;
            var igst_total = 0.00;
            var cgst_total = 0.00;
            var sgst_total = 0.00;
            var op_stock = 0.00;
            var purchase_total = 0.00;
            var purchase_igst_total = 0.00;
            var purchase_cgst_total = 0.00;
            var purchase_sgst_total = 0.00;

            
            var saleJsonCount = '<%=json_obj_saleinv_count%>';
            if (saleJsonCount != '') {
                var sale_json_obj = JSON.parse(saleJsonCount);
                var count = JSON.parse(saleJsonCount).length;

                $(".cl_stock_class").text(0.00);
                $(".sale_class").text(0.00);
                $(".sale_igst_class").text(0.00);
                $(".sale_cgst_class").text(0.00);
                $(".sale_sgst_class").text(0.00);

                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == sale_json_obj[i]['month']) {
                        
                        cl_stock = sale_json_obj[i]["qty"];
                        sale_total = sale_json_obj[i]["total"];
                        igst_total = sale_json_obj[i]["igst_amt"];
                        cgst_total = sale_json_obj[i]["cgst_amt"];
                        sgst_total = sale_json_obj[i]["sgst_amt"];
                        $(".cl_stock_class").text(cl_stock);
                        $(".sale_class").text(sale_total);
                        $(".sale_igst_class").text(igst_total);
                        $(".sale_cgst_class").text(cgst_total);
                        $(".sale_sgst_class").text(sgst_total);
                        
                    }
                }
            }


            var purchaseJsonCount = '<%=json_obj_purchaseinv_count%>';
            if (purchaseJsonCount != '') {
                var purchase_json_obj = JSON.parse(purchaseJsonCount);
                var count = JSON.parse(purchaseJsonCount).length;

                $(".op_stock_class").text(0.00);
                $(".purchase_class").text(0.00);
                $(".purchase_igst_class").text(0.00);
                $(".purchase_cgst_class").text(0.00);
                $(".purchase_sgst_class").text(0.00);

                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == purchase_json_obj[i]['month']) {
                        op_stock = purchase_json_obj[i]["qty"];
                        purchase_total = purchase_json_obj[i]["total"];
                        purchase_igst_total = purchase_json_obj[i]["igst_amt"];
                        purchase_cgst_total = purchase_json_obj[i]["cgst_amt"];
                        purchase_sgst_total = purchase_json_obj[i]["sgst_amt"];
                        //$(".op_stock_class").text(op_stock);
                        $(".purchase_class").text(purchase_total);
                        $(".purchase_igst_class").text(purchase_igst_total);
                        $(".purchase_cgst_class").text(purchase_cgst_total);
                        $(".purchase_sgst_class").text(purchase_sgst_total);
                       
                    }
                }
            }

            var saleCreditJsonCount = '<%=json_obj_dr_cr_count%>';
            if (saleCreditJsonCount != '') {
                var DebitCredit_json_obj = JSON.parse(saleCreditJsonCount);
                var count = DebitCredit_json_obj.length;
                
                for (var i = 0; i < count; i++) {

                    if (DebitCredit_json_obj[i]['note_type'] == 'credit') {
                        if ($(".month_class").val() == DebitCredit_json_obj[i]['month']) {
                            
                            cl_stock = (parseFloat($(".cl_stock_class").text()) - parseFloat(DebitCredit_json_obj[i]["qty"]));
                            sale_total = (parseFloat($(".sale_class").text()) - parseFloat(DebitCredit_json_obj[i]["total"]));
                            igst_total = (parseFloat($(".sale_igst_class").text()) - parseFloat(DebitCredit_json_obj[i]["igst_amt"]));
                            cgst_total = (parseFloat($(".sale_cgst_class").text()) - parseFloat(DebitCredit_json_obj[i]["cgst_amt"]));
                            sgst_total = (parseFloat($(".sale_sgst_class").text()) - parseFloat(DebitCredit_json_obj[i]["sgst_amt"]));
                            $(".cl_stock_class").text(cl_stock);
                            $(".sale_class").text(sale_total);
                            $(".sale_igst_class").text(igst_total);
                            $(".sale_cgst_class").text(cgst_total);
                            $(".sale_sgst_class").text(sgst_total);
                        }
                    } else if (DebitCredit_json_obj[i]['note_type'] == 'debit') {
                        if ($(".month_class").val() == DebitCredit_json_obj[i]['month']) {
                           
                           // op_stock = (parseFloat($(".op_stock_class").text()) - parseFloat(DebitCredit_json_obj[i]["qty"]));
                            purchase_total = (parseFloat($(".purchase_class").text()) - parseFloat(DebitCredit_json_obj[i]["total"]));
                            purchase_igst_total = (parseFloat($(".purchase_igst_class").text()) - parseFloat(DebitCredit_json_obj[i]["igst_amt"]));
                            purchase_cgst_total = (parseFloat($(".purchase_cgst_class").text()) - parseFloat(DebitCredit_json_obj[i]["cgst_amt"]));
                            purchase_sgst_total = (parseFloat($(".purchase_sgst_class").text()) - parseFloat(DebitCredit_json_obj[i]["sgst_amt"]));
                            //$(".op_stock_class").text(op_stock);
                            $(".purchase_class").text(purchase_total);
                            $(".purchase_igst_class").text(purchase_igst_total);
                            $(".purchase_cgst_class").text(purchase_cgst_total);
                            $(".purchase_sgst_class").text(purchase_sgst_total);
                            
                        }
                    }
                }
            }

               var opstockJsonCount = '<%=json_obj_opstock_count%>';
            if (opstockJsonCount != '') {
                var opstock_json_obj = JSON.parse(opstockJsonCount);
                var count = JSON.parse(opstockJsonCount).length;
                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == opstock_json_obj[i]['month']) {
                        $(".op_stock_class").text(opstock_json_obj[i]["op_stock_cnt"]);
                    }
                }
            }

           var expense_total = 0.00;
           var expense_igst_total = 0.00;
           var expense_cgst_total = 0.00;
           var expense_sgst_total = 0.00;
            
            var expensesJsonCount = '<%=json_obj_expense_count%>';
            if (expensesJsonCount != '') {
                var expense_json_obj = JSON.parse(expensesJsonCount);
                
                var count = JSON.parse(expensesJsonCount).length;

                $(".non_gst_expenses_class").text(0.00);
                $(".gst_expenses_class").text(0.00);
                $(".expeses_igst_class").text(0.00);
                $(".expeses_cgst_class").text(0.00);
                $(".expeses_sgst_class").text(0.00);

                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == expense_json_obj[i]['month']) {
                        expense_total = expense_json_obj[i]["gst_expensestotal"];
                        expense_igst_total = expense_json_obj[i]["expeses_igst"];
                        expense_cgst_total = expense_json_obj[i]["expeses_cgst"];
                        expense_sgst_total = expense_json_obj[i]["expeses_sgst"];
                        $(".non_gst_expenses_class").text(expense_total);
                        $(".gst_expenses_class").text(expense_total);
                        $(".expeses_igst_class").text(expense_igst_total);
                        $(".expeses_cgst_class").text(expense_cgst_total);
                        $(".expeses_sgst_class").text(expense_sgst_total);
                    }
                }
            }

            var nonexpense = 0.00;
            var nonexpensesJsonCount = '<%=json_obj_nonexpenses_count%>';
            if (nonexpensesJsonCount != '') {

                var non_expense_json_obj = JSON.parse(nonexpensesJsonCount);
                var count = JSON.parse(nonexpensesJsonCount).length;
                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == non_expense_json_obj[i]['month']) {
                        nonexpense = parseFloat(non_expense_json_obj[i]['debit_amount']) - parseFloat($(".non_gst_expenses_class").text())
                        $(".non_gst_expenses_class").text(nonexpense);
                    }
                }
            }

            $("[id*=total_itc_igst_id]").text(parseFloat($(".purchase_igst_class").text()) - parseFloat($(".expeses_igst_class").text()));
            $("[id*=total_itc_cgst_id]").text(parseFloat($(".purchase_cgst_class").text()) - parseFloat($(".expeses_cgst_class").text()));
            $("[id*=total_itc_sgst_id]").text(parseFloat($(".purchase_sgst_class").text()) - parseFloat($(".expeses_sgst_class").text()));
            $("[id*=total_otl_igst_id]").text(parseFloat($(".sale_igst_class").text()) - parseFloat($(".expeses_igst_class").text()));
            $("[id*=total_otl_cgst_id]").text(parseFloat($(".sale_cgst_class").text()) - parseFloat($(".expeses_cgst_class").text()));
            $("[id*=total_otl_sgst_id]").text(parseFloat($(".sale_sgst_class").text()) - parseFloat($(".expeses_sgst_class").text()));

            $(".gross_profit_class").text(parseFloat($(".sale_class").text()) - parseFloat($(".purchase_class").text()));
            var netpurchase = (parseFloat($(".purchase_class").text()) + parseFloat($(".purchase_igst_class").text()) + parseFloat($(".purchase_cgst_class").text()) + parseFloat($(".purchase_sgst_class").text()));
                var netsale = (parseFloat($(".sale_class").text()) + parseFloat($(".sale_igst_class").text()) + parseFloat($(".sale_cgst_class").text()) + parseFloat($(".sale_sgst_class").text()));
            $(".net_profit_class").text(netsale - netpurchase);

            $(".net_igst_class").text(parseFloat($(".sale_igst_class").text()) - parseFloat($(".purchase_igst_class").text()));
            $(".net_cgst_class").text(parseFloat($(".sale_cgst_class").text()) - parseFloat($(".purchase_cgst_class").text()));
            $(".net_sgst_class").text(parseFloat($(".sale_sgst_class").text()) - parseFloat($(".purchase_sgst_class").text()));


            $(".dashboard_value_check").each(function () {
                var val = parseFloat($(this).text());
                if (val < 0) {
                    $(this).css("color", "red");
                } else {
                    $(this).css("color", "black");
                }
            });
        }

        
        function monthChange() {
            var index = $(".month_class ").val() - 1;
            $(".lblPurchaseCount_class").text(final_json_obj["purchase_amount"][index]);
            $(".lblSaleCount_class").text(final_json_obj["sale_amount"][index]);

            var expeJsonCount = '<%=json_obj_expenses_count%>';
            var exp_json_obj = JSON.parse(expeJsonCount);
            var count = JSON.parse(expeJsonCount).length;
            for (var i = 0; i < count; i++) {
                if ($(".month_class").val() == exp_json_obj[i]['month_id']) {
                    $(".lblExpensesCount_class").text(exp_json_obj[i]["exp_tot"]);
                } else {
                    $(".lblExpensesCount_class").text(0);
                }
            }

            
            var cl_stock = 0.00;
            var sale_total = 0.00;
            var igst_total = 0.00;
            var cgst_total = 0.00;
            var sgst_total = 0.00;
            var op_stock = 0.00;
            var purchase_total = 0.00;
            var purchase_igst_total = 0.00;
            var purchase_cgst_total = 0.00;
            var purchase_sgst_total = 0.00;

            
            var saleJsonCount = '<%=json_obj_saleinv_count%>';
            if (saleJsonCount != '') {
                var sale_json_obj = JSON.parse(saleJsonCount);
                var count = JSON.parse(saleJsonCount).length;

                $(".cl_stock_class").text(0.00);
                $(".sale_class").text(0.00);
                $(".sale_igst_class").text(0.00);
                $(".sale_cgst_class").text(0.00);
                $(".sale_sgst_class").text(0.00);

                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == sale_json_obj[i]['month']) {
                        
                        cl_stock = sale_json_obj[i]["qty"];
                        sale_total = sale_json_obj[i]["total"];
                        igst_total = sale_json_obj[i]["igst_amt"];
                        cgst_total = sale_json_obj[i]["cgst_amt"];
                        sgst_total = sale_json_obj[i]["sgst_amt"];
                        $(".cl_stock_class").text(cl_stock);
                        $(".sale_class").text(sale_total);
                        $(".sale_igst_class").text(igst_total);
                        $(".sale_cgst_class").text(cgst_total);
                        $(".sale_sgst_class").text(sgst_total);
                        
                    }
                }
            }


            var purchaseJsonCount = '<%=json_obj_purchaseinv_count%>';
            if (purchaseJsonCount != '') {
                var purchase_json_obj = JSON.parse(purchaseJsonCount);
                var count = JSON.parse(purchaseJsonCount).length;

                $(".op_stock_class").text(0.00);
                $(".purchase_class").text(0.00);
                $(".purchase_igst_class").text(0.00);
                $(".purchase_cgst_class").text(0.00);
                $(".purchase_sgst_class").text(0.00);

                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == purchase_json_obj[i]['month']) {
                        op_stock = purchase_json_obj[i]["qty"];
                        purchase_total = purchase_json_obj[i]["total"];
                        purchase_igst_total = purchase_json_obj[i]["igst_amt"];
                        purchase_cgst_total = purchase_json_obj[i]["cgst_amt"];
                        purchase_sgst_total = purchase_json_obj[i]["sgst_amt"];
                        //$(".op_stock_class").text(op_stock);
                        $(".purchase_class").text(purchase_total);
                        $(".purchase_igst_class").text(purchase_igst_total);
                        $(".purchase_cgst_class").text(purchase_cgst_total);
                        $(".purchase_sgst_class").text(purchase_sgst_total);
                       
                    }
                }
            }

            var saleCreditJsonCount = '<%=json_obj_dr_cr_count%>';
            if (saleCreditJsonCount != '') {
                var DebitCredit_json_obj = JSON.parse(saleCreditJsonCount);
                var count = DebitCredit_json_obj.length;
                
                for (var i = 0; i < count; i++) {

                    if (DebitCredit_json_obj[i]['note_type'] == 'credit') {
                        if ($(".month_class").val() == DebitCredit_json_obj[i]['month']) {
                            
                            cl_stock = (parseFloat($(".cl_stock_class").text()) + parseFloat(DebitCredit_json_obj[i]["qty"]));
                            sale_total = (parseFloat($(".sale_class").text()) + parseFloat(DebitCredit_json_obj[i]["total"]));
                            igst_total = (parseFloat($(".sale_igst_class").text()) + parseFloat(DebitCredit_json_obj[i]["igst_amt"]));
                            cgst_total = (parseFloat($(".sale_cgst_class").text()) + parseFloat(DebitCredit_json_obj[i]["cgst_amt"]));
                            sgst_total = (parseFloat($(".sale_sgst_class").text()) + parseFloat(DebitCredit_json_obj[i]["sgst_amt"]));
                            $(".cl_stock_class").text(cl_stock);
                            $(".sale_class").text(sale_total);
                            $(".sale_igst_class").text(igst_total);
                            $(".sale_cgst_class").text(cgst_total);
                            $(".sale_sgst_class").text(sgst_total);
                        }
                    } else if (DebitCredit_json_obj[i]['note_type'] == 'debit') {
                        if ($(".month_class").val() == DebitCredit_json_obj[i]['month']) {
                           
                            //op_stock = (parseFloat($(".op_stock_class").text()) + parseFloat(DebitCredit_json_obj[i]["qty"]));
                            purchase_total = (parseFloat($(".purchase_class").text()) + parseFloat(DebitCredit_json_obj[i]["total"]));
                            purchase_igst_total = (parseFloat($(".purchase_igst_class").text()) + parseFloat(DebitCredit_json_obj[i]["igst_amt"]));
                            purchase_cgst_total = (parseFloat($(".purchase_cgst_class").text()) + parseFloat(DebitCredit_json_obj[i]["cgst_amt"]));
                            purchase_sgst_total = (parseFloat($(".purchase_sgst_class").text()) + parseFloat(DebitCredit_json_obj[i]["sgst_amt"]));
                            //$(".op_stock_class").text(op_stock);
                            $(".purchase_class").text(purchase_total);
                            $(".purchase_igst_class").text(purchase_igst_total);
                            $(".purchase_cgst_class").text(purchase_cgst_total);
                            $(".purchase_sgst_class").text(purchase_sgst_total);
                            
                        }
                    }
                }
            }

                var opstockJsonCount = '<%=json_obj_opstock_count%>';
            if (opstockJsonCount != '') {
                var opstock_json_obj = JSON.parse(opstockJsonCount);
                var count = JSON.parse(opstockJsonCount).length;
                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == opstock_json_obj[i]['month']) {
                        $(".op_stock_class").text(opstock_json_obj[i]["op_stock_cnt"]);
                    }
                }
            }

           var expense_total = 0.00;
           var expense_igst_total = 0.00;
           var expense_cgst_total = 0.00;
           var expense_sgst_total = 0.00;
            
            var expensesJsonCount = '<%=json_obj_expense_count%>';
            if (expensesJsonCount != '') {
                var expense_json_obj = JSON.parse(expensesJsonCount);
                
                var count = JSON.parse(expensesJsonCount).length;

                $(".non_gst_expenses_class").text(0.00);
                $(".gst_expenses_class").text(0.00);
                $(".expeses_igst_class").text(0.00);
                $(".expeses_cgst_class").text(0.00);
                $(".expeses_sgst_class").text(0.00);

                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == expense_json_obj[i]['month']) {
                        expense_total = expense_json_obj[i]["gst_expensestotal"];
                        expense_igst_total = expense_json_obj[i]["expeses_igst"];
                        expense_cgst_total = expense_json_obj[i]["expeses_cgst"];
                        expense_sgst_total = expense_json_obj[i]["expeses_sgst"];
                        $(".non_gst_expenses_class").text(expense_total);
                        $(".gst_expenses_class").text(expense_total);
                        $(".expeses_igst_class").text(expense_igst_total);
                        $(".expeses_cgst_class").text(expense_cgst_total);
                        $(".expeses_sgst_class").text(expense_sgst_total);
                    }
                }
            }

            var nonexpense = 0.00;
            var nonexpensesJsonCount = '<%=json_obj_nonexpenses_count%>';
            if (nonexpensesJsonCount != '') {

                var non_expense_json_obj = JSON.parse(nonexpensesJsonCount);
                var count = JSON.parse(nonexpensesJsonCount).length;
                for (var i = 0; i < count; i++) {
                    if ($(".month_class").val() == non_expense_json_obj[i]['month']) {
                        nonexpense = parseFloat(non_expense_json_obj[i]['debit_amount']) - parseFloat($(".non_gst_expenses_class").text())
                        $(".non_gst_expenses_class").text(nonexpense);
                    }
                }
            }

            $("[id*=total_itc_igst_id]").text(parseFloat($(".purchase_igst_class").text()) - parseFloat($(".expeses_igst_class").text()));
            $("[id*=total_itc_cgst_id]").text(parseFloat($(".purchase_cgst_class").text()) - parseFloat($(".expeses_cgst_class").text()));
            $("[id*=total_itc_sgst_id]").text(parseFloat($(".purchase_sgst_class").text()) - parseFloat($(".expeses_sgst_class").text()));
            $("[id*=total_otl_igst_id]").text(parseFloat($(".sale_igst_class").text()) - parseFloat($(".expeses_igst_class").text()));
            $("[id*=total_otl_cgst_id]").text(parseFloat($(".sale_cgst_class").text()) - parseFloat($(".expeses_cgst_class").text()));
            $("[id*=total_otl_sgst_id]").text(parseFloat($(".sale_sgst_class").text()) - parseFloat($(".expeses_sgst_class").text()));

            $(".gross_profit_class").text(parseFloat($(".purchase_class").text()) - parseFloat($(".sale_class").text()));

            var netpurchase = (parseFloat($(".purchase_class").text()) + parseFloat($(".purchase_igst_class").text()) + parseFloat($(".purchase_cgst_class").text()) + parseFloat($(".purchase_sgst_class").text()));
                var netsale = (parseFloat($(".sale_class").text()) + parseFloat($(".sale_igst_class").text()) + parseFloat($(".sale_cgst_class").text()) + parseFloat($(".sale_sgst_class").text()));
            $(".net_profit_class").text(netsale - netpurchase);

            $(".net_igst_class").text(parseFloat($(".sale_igst_class").text()) - parseFloat($(".purchase_igst_class").text()));
            $(".net_cgst_class").text(parseFloat($(".sale_cgst_class").text()) - parseFloat($(".purchase_cgst_class").text()));
            $(".net_sgst_class").text(parseFloat($(".sale_sgst_class").text()) - parseFloat($(".purchase_sgst_class").text()));


            $(".dashboard_value_check").each(function () {
                var val = parseFloat($(this).text());
                if (val < 0) {
                    $(this).css("color","red");
                } else {
                    $(this).css("color", "black");
                }
            });
        }

        var new_update_json = '<%=json_obj%>';
        var new_update_json_obj = JSON.parse(new_update_json);
        var count = JSON.parse(new_update_json).length;
        
        for(var i = 0; i < count; i++) {
            var a = '<h5><a href="'+ new_update_json_obj[i]['pms_news_outapp_link'] +'" target="_blank" style="color:black;">' + new_update_json_obj[i]['pms_news_title'] + '</a></h5> <p>'+ new_update_json_obj[i]['pms_news_description'] +'</p> <hr class="hr-dark mt-10"/>';
            $("#mrq_title_id").append(a);
        }

        for(var i = 0; i < count; i++) {
            var a_maq = '<a href="'+new_update_json_obj[i]['pms_news_outapp_link']+'" target="_blank" style="color:white">'+new_update_json_obj[i]['pms_news_title']+'</a>';
            $("#li_mar_id").append('** ' + a_maq + ' **');
        }        
</script>				
</asp:Content>