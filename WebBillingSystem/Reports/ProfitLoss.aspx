<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="ProfitLoss.aspx.cs" Inherits="WebBillingSystem.ProfitLoss" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">

    <style>
         table, th, td {
            border: 1px solid black;
         }
         .card.card-sm .card-body {
            padding: 1px !important;
         }
         tbody th, thead th, table.dataTable tbody td {
            padding: 1px !important;
         }
         .TrialBalanceGroupTable_class {
            background-color: lightgrey;
         }
         /*table thead  {
            background-color: darkgrey;
         }*/
         .rotate_angle {
            transform: rotate(90deg);
        }
     </style>
<div>
   <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Trial Balance</li>
                </ol>
            </nav>
  <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Profit and Loss</h4>
            </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
        <div class="row">
           <div class="col-xl-12">
            <section class="bg-light hk-sec-wrapper">
                <div class="row">
<%--                   <div class="col-sm">
                       <div class="row">
                           <div class="col-md-4 form-group">
                               <input type="radio" id="rbtn_GroupWise_Id" class="rbtn_GroupWise_class" name="rbtn_wise_report_name" value="GroupWise" checked>
                               <label for="GroupWise">Group Wise</label>
                            </div>
                            <div class="col-md-4 form-group">
                               <input type="radio" id="rbtn_LedgerWise_Id" class="rbtn_LedgerWise_class" name="rbtn_wise_report_name" value="LedgerWise">
                               <label for="LedgerWise">Ledger Wise</label>
                           </div>  
                          </div>
                     </div>--%>
                </div>

                <div id="editor"></div>
                <div id="div_export_head_id">                
                     <div style="text-align:center;" class="row">                         
                         <div class="col-lg-12" style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">
                                    <div class="card card-sm">
										<div class="card-body bg-light" style="text-align: -webkit-center;">
                                            <h4 id="comp_name_id" runat="server"></h4>
                                            <label id="comp_trade_name_id" runat="server"></label>
                                            <label id="from_date_id" runat="server"></label> to <label id="to_date_id" runat="server"></label>
                                        </div>
									</div>                            
							   </div>
                             <hr class="mt-10" style="display:none"/>
                           </div>
                     </div>
                 </div>
                 <div id="div_export_group_id">   
                  <div class="row">
                    <div class="col-sm-12">    
                        <!-- start Table -->                        
                      <table id="" class="table table-secondary table-hover w-100 pb-30 dataTable dtr-inline table-bordered " role="grid">
                            <thead class="thead-secondary">
						        <tr>
                                    <th>Particulars</th>
							        <th >Amount</th>
							        <th >Amount</th>
                                    <th>Particulars</th>
							        <th >Amount</th>
							        <th >Amount</th>
							    </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    
                                    <th class="openning_stock">Openning Stock</th>
							        <td class="openning_stock_amt1"></td>
							        <td class="openning_stock_amt2">0.00</td>
                                    <td>Revenue from operations</td>
							        <td class="revenue_from_operations_amt1"></td>
							        <td class="revenue_from_operations_amt2">0.00</td>
                                </tr>
                                <tr>
                                    
                                    <th>Cost of material Consumed</th>
							        <td class="cost_of_material_consumed_amt1"></td>
							        <td class="cost_of_material_consumed_amt2">0.00</td>
                                    <td></td>
							        <th ></th>
							        <th ></th>
                                </tr>
                                <tr>
                                    
                                    <th onclick="show_details(this)" data-name="Purchase of stock-in-trade" >Purchase of stock-in-trade</th>
							        <td class="purchase_of_stock_in_trade_amt1"></td>
							        <td class="purchase_of_stock_in_trade_amt2">0.00</td>
                                    <th><a href='/Reports/ClosingStockValuationReport.aspx' class='btn btn-xs btn-light details-control-accHead fa fa-share' data-toggle='tooltip-dark' data-placement='top' title='Expand'></a>Closing Stock</th>
							        <td class="clossing_stock_am1"></td>
							        <td class="clossing_stock_am2">0.00</td>
                                </tr>
                                <tr>
                                    
                                    <th>Direct expenses</th>
							        <td class="direct_expenses_amt1"></td>
							        <td class="direct_expenses_amt2">0.00</td>
                                    <td></td>
							        <th ></th>
							        <th ></th>
                                </tr>

                                <tr>
                                    <th>Gross Profit</th>
							        <td class="gross_profit_amt1"></td>
							        <td class="gross_profit_amt2">0.00</td>
                                    <td></td>
							        <th ></th>
							        <th ></th>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <td class="type1_amt_total1"></td>
                                    <th class="type1_amt_total2">0.00</th>
                                    <td></td>
                                    <td class="type2_amt_total1"></td>
                                    <th class="type2_amt_total2">0.00</th>
                                </tr>                                 
                                <tr>                                    
                                    <th onclick="show_details(this)" data-name="Employee benefit expenses">Employee benefit expenses</th>
							        <td class="employee_benefit_expenses_amt1"></td>
							        <td class="employee_benefit_expenses_amt2">0.00</td>
                                    <th>Gross Profit</th>
							        <td class="gross_profit_amt1"></td>
							        <td class="gross_profit_amt2">0.00</td>
                                </tr>
                                <tr>                                    
                                    <th onclick="show_details(this)" data-name="Finance costs">Finance costs</th>
							        <td class="finance_costs_amt1"></td>
							        <td class="finance_costs_amt2">0.00</td>
                                    <td></td>
							        <th ></th>
							        <th ></th>
                                </tr>
                                <tr>                                    
                                    <th onclick="show_details(this)" data-name="Other expenses">Other expenses</th>
							        <td class="other_expenses_amt1"></td>
							        <td class="other_expenses_amt2">0.00</td>
                                    <th>Other income</th>
							        <td class="other_income_amt1"></td>
							        <td class="other_income_amt2">0.00</td>
                                </tr>
                                <tr>                                    
                                    <th>Depreciation and amortization expenses</th>
							        <td class="depreciation_and_amortization_expenses_amt1" ></td>
							        <td class="depreciation_and_amortization_expenses_amt2">0.00</td>
                                    <td></td>
							        <td ></td>
							        <td ></td>
                                </tr>
                                <tr>                                    
                                    <th>Net Profit</th>
							        <td class="net_profit_amt1" ></td>
							        <td class="net_profit_amt2" >0.00</td>
                                    <th>Loss Accounts</th>
							        <td class="loss_accounts_amt1" ></td>
							        <td class="loss_accounts_amt2" >0.00</td>
                                </tr>                                
                                <tr>                                    
                                    <th>Total</th>
							        <th  ></th>
							        <th class="total_type1" ></th>
                                    <td></td>
							        <td></td>
							        <th class="total_type2" ></th>
                                </tr>

                            </tbody>
                      </table>
                        <!-- /start Table -->
	              </div> 
                </div>
             </div>
            </section>
          </div>
        </div>
        <!-- end row -->
    </div>
  </div>
    <script>
        window.onload = function () {
            var jsonStringSubGroup = '<%=json_sub_group_obj %>';
            if (jsonStringSubGroup != '')
                jsonStringSubGroup = JSON.parse(jsonStringSubGroup);
            var jsonStringAccntDtl = '<%=json_acc_head_obj %>';
            if (jsonStringAccntDtl != '')
                jsonStringAccntDtl = JSON.parse(jsonStringAccntDtl);


            jsonStringSubGroup.forEach(function (key, index) { // loop start 


                //one condition start
                if (key.perticulars_sub.toLowerCase() == "purchase of stock-in-trade") {
                    var suGrp_cr_close = 0.00;
                    var suGrp_dr_close = 0.00;
                    // closing balance total dr, cr
                    jsonStringAccntDtl.forEach(function (key1, index1) {
                        if (key.perticulars_sub == key1.sub_group_name_acc) {
                            suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                            suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                            delete jsonStringAccntDtl[index1];
                        }
                    });
                    //                    $(".purchase_of_stock_in_trade_amt1").html(suGrp_dr_close);
                    $(".purchase_of_stock_in_trade_amt2").html(suGrp_dr_close-suGrp_cr_close);
                }//end condition 
               
                    else if (key.perticulars_sub.toLowerCase() == "cost of material consumed") {
                        var suGrp_cr_close = 0.00;
                        var suGrp_dr_close = 0.00;
                        // closing balance total dr, cr
                        jsonStringAccntDtl.forEach(function (key1, index1) {
                            if (key.perticulars_sub == key1.sub_group_name_acc) {
                                suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                delete jsonStringAccntDtl[index1];
                            }
                        });
                        //                  $(".cost_of_material_consumed_amt1").html(suGrp_dr_close);
                        $(".cost_of_material_consumed_amt2").html(suGrp_dr_close-suGrp_cr_close);
                    } else
                        if (key.perticulars_sub.toLowerCase() == "direct expenses") {
                            var suGrp_cr_close = 0.00;
                            var suGrp_dr_close = 0.00;
                            // closing balance total dr, cr
                            jsonStringAccntDtl.forEach(function (key1, index1) {
                                if (key.perticulars_sub == key1.sub_group_name_acc) {
                                    suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                    suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                    delete jsonStringAccntDtl[index1];
                                }
                            });
                            // $(".direct_expenses_amt1").html(suGrp_dr_close);
                            $(".direct_expenses_amt2").html(suGrp_dr_close-suGrp_cr_close);
                        } else
                            if (key.perticulars_sub.toLowerCase() == "revenue from operations") {
                                var suGrp_cr_close = 0.00;
                                var suGrp_dr_close = 0.00;
                                // closing balance total dr, cr
                                jsonStringAccntDtl.forEach(function (key1, index1) {
                                    if (key.perticulars_sub == key1.sub_group_name_acc) {
                                        suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                        suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                        delete jsonStringAccntDtl[index1];
                                    }
                                });
                                //$(".revenue_from_operations_amt1").html(suGrp_dr_close);
                                $(".revenue_from_operations_amt2").html(suGrp_cr_close - suGrp_dr_close);
                            } else
                                if (key.perticulars_sub.toLowerCase() == "employee benefit expenses") {
                                    var suGrp_cr_close = 0.00;
                                    var suGrp_dr_close = 0.00;
                                    // closing balance total dr, cr
                                    jsonStringAccntDtl.forEach(function (key1, index1) {
                                        if (key.perticulars_sub == key1.sub_group_name_acc) {
                                            suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                            suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                            delete jsonStringAccntDtl[index1];
                                        }
                                    });
                                    //$(".employee_benefit_expenses_amt1").html(suGrp_dr_close);
                                    $(".employee_benefit_expenses_amt2").html(suGrp_dr_close-suGrp_cr_close);
                                }
                                else
                                    if (key.perticulars_sub.toLowerCase() == "finance costs") {
                                        var suGrp_cr_close = 0.00;
                                        var suGrp_dr_close = 0.00;
                                        // closing balance total dr, cr
                                        jsonStringAccntDtl.forEach(function (key1, index1) {
                                            if (key.perticulars_sub == key1.sub_group_name_acc) {
                                                suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                                suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                                delete jsonStringAccntDtl[index1];
                                            }
                                        });
                                        //$(".finance_costs_amt1").html(suGrp_dr_close);
                                        $(".finance_costs_amt2").html(suGrp_dr_close-suGrp_cr_close);
                                    }
                                    else
                                        if (key.perticulars_sub.toLowerCase() == "other expenses") {
                                            var suGrp_cr_close = 0.00;
                                            var suGrp_dr_close = 0.00;
                                            // closing balance total dr, cr
                                            jsonStringAccntDtl.forEach(function (key1, index1) {
                                                if (key.perticulars_sub == key1.sub_group_name_acc) {
                                                    suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                                    suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                                    delete jsonStringAccntDtl[index1];
                                                }
                                            });
                                            //$(".other_expenses_amt1").html(suGrp_dr_close);
                                            $(".other_expenses_amt2").html(suGrp_dr_close-suGrp_cr_close);
                                        } else
                                            if (key.perticulars_sub.toLowerCase() == "other income") {
                                                var suGrp_cr_close = 0.00;
                                                var suGrp_dr_close = 0.00;
                                                // closing balance total dr, cr
                                                jsonStringAccntDtl.forEach(function (key1, index1) {
                                                    if (key.perticulars_sub == key1.sub_group_name_acc) {
                                                        suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                                        suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                                        delete jsonStringAccntDtl[index1];
                                                    }
                                                });
                                                //$(".other_income_amt1").html(suGrp_dr_close);
                                                $(".other_income_amt2").html(suGrp_cr_close - suGrp_dr_close);
                                            } else
                                                if (key.perticulars_sub.toLowerCase() == "depreciation and amortization expenses") {
                                                    var suGrp_cr_close = 0.00;
                                                    var suGrp_dr_close = 0.00;
                                                    // closing balance total dr, cr
                                                    jsonStringAccntDtl.forEach(function (key1, index1) {
                                                        if (key.perticulars_sub == key1.sub_group_name_acc) {
                                                            suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                                            suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                                            delete jsonStringAccntDtl[index1];
                                                        }
                                                    });
                                                    //$(".depreciation_and_amortization_expenses_amt1").html(suGrp_dr_close);
                                                    $(".depreciation_and_amortization_expenses_amt2").html(suGrp_dr_close-suGrp_cr_close);
                                                } else
                                                    if (key.perticulars_sub.toLowerCase() == "loss accounts") {
                                                        var suGrp_cr_close = 0.00;
                                                        var suGrp_dr_close = 0.00;
                                                        // closing balance total dr, cr
                                                        jsonStringAccntDtl.forEach(function (key1, index1) {
                                                            if (key.perticulars_sub == key1.sub_group_name_acc) {
                                                                suGrp_dr_close += parseFloat(key1.close_Bal_debit_acc);
                                                                suGrp_cr_close += parseFloat(key1.close_Bal_credit_acc);
                                                                delete jsonStringAccntDtl[index1];
                                                            }
                                                        });
                                                        //$(".depreciation_and_amortization_expenses_amt1").html(suGrp_dr_close);
                                                        $(".loss_accounts_amt2").html(suGrp_cr_close - suGrp_dr_close);
                                                    }
                                                   
                                                    

            });

            var openi_amt = "<%=openi_amt_cnt%>";
                $(".openning_stock_amt1").html("" );
                $(".openning_stock_amt2").html("0.00" );
                $(".openning_stock_amt2").html("" + openi_amt);
            
            var close_amt_cnt  = "<%=close_amt_cnt %>";
                $(".clossing_stock_am1").html("" );
                $(".clossing_stock_am2").html("0.00" );
                $(".clossing_stock_am2").html("" + close_amt_cnt );
            
            $(".type2_amt_total2").html(""+(parseFloat($(".clossing_stock_am2").html()) + parseFloat($(".revenue_from_operations_amt2").html()))+"");
            var gross_profit2 =((parseFloat($(".type2_amt_total2").html()))- (parseFloat($(".openning_stock_amt2").html())+parseFloat($(".cost_of_material_consumed_amt2").html())+parseFloat($(".purchase_of_stock_in_trade_amt2").html())+parseFloat($(".direct_expenses_amt2").html()))).toFixed(2);
  //          var gross_profit1 = parseFloat($(".openning_stock_amt1").html())+parseFloat($(".cost_of_material_consumed_amt1").html())+parseFloat($(".purchase_of_stock_in_trade_amt1").html())+parseFloat($(".direct_expenses_amt1").html());
            //$(".clossing_stock_am1")
//            $(".gross_profit_amt1").html(gross_profit1);
            $(".gross_profit_amt2").html("" + gross_profit2);
            $(".type1_amt_total2").html($(".type2_amt_total2").html());
//            type2_amt_total1
            var total_type2 = 0.0;
            total_type2 = (parseFloat($(".gross_profit_amt2").html()) + parseFloat($(".other_income_amt2").html()) + parseFloat($(".loss_accounts_amt2").html())).toFixed(2);
            $(".total_type2").html(total_type2);                
            $(".total_type1").html(total_type2);
            var net_profit_amt2 =parseFloat($(".total_type2").html())-(parseFloat($(".employee_benefit_expenses_amt2").html())+parseFloat($(".finance_costs_amt2").html())+parseFloat($(".other_expenses_amt2").html())+parseFloat($(".depreciation_and_amortization_expenses_amt2").html()));            
            $(".net_profit_amt2 ").html(net_profit_amt2);




            // total amount design 
            $(".type1_amt_total2").html("<hr>" + $(".type1_amt_total2").html() + "<hr>");
            $(".type2_amt_total2").html("<hr>" + $(".type2_amt_total2").html() + "<hr>");
            $(".total_type1").html("<hr>" + $(".total_type1").html() + "<hr>");
            $(".total_type2").html("<hr>" + $(".total_type2").html() + "<hr>");
        };
        function show_details(head) {            
            var subGroup =$(head).attr("data-name");
            var data_obj = subGroup.replace(" / ", "");
                data_obj = data_obj.replace(/[- )(]/g, '_');           
             var jsonStringAccntDtl1 = '<%=json_acc_head_obj %>';
            if ($($(head)).find("table").length != 0) {
                     $(head).html($(head).attr("data-name"))
            }else {
            if (jsonStringAccntDtl1 != '') 
                jsonStringAccntDtl1 = JSON.parse(jsonStringAccntDtl1);
                var AccHead_Details = '<table class="table table-secondary table-hover dataTable" id="accHead_Table_id"><tbody><tr><td colspan=4>'+subGroup+'</td></tr>';
                // if (!$('.'+data_obj).is(':empty')) {
                //    $("." + data_obj).toggle();
                //}

                jsonStringAccntDtl1.forEach(function (key, index) {
                    if (subGroup.toLowerCase() == key.sub_group_name_acc.toLowerCase()) {
                        AccHead_Details += '<tr>' +
                            '<td style="text-align: right; width: 80px;">' + key.edit_button_acc + '</td>' +
                            '<td style="text-align: left; width: 265px;">' + key.perticulars_acc + '</td>' +
                            '<td style="text-align: right;">' + key.close_Bal_debit_acc + '</td>' +
                            '<td style="text-align: right;">' + key.close_Bal_credit_acc + '</td>' +
                            '</tr>';
                    }
                });
                $(head).html(AccHead_Details + '</tbody></table>');
            }
    }
        
    </script>
    <style>
        hr {
                    margin-top:1px !important;
                    margin-bottom:1px !important;
                    border-top: 1px solid #000000 !important;
            }
    </style>
</asp:Content>
