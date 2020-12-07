<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="CAHome.aspx.cs" Inherits="WebBillingSystem.CAHome" %>
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
          
    <div class="hk-pg-header align-items-top">
                    <div style="padding: 15px;">
						<h4 class="hk-pg-title font-weight-600 mb-10"><%=ca_name %></h4>
                        <h4 class="hk-pg-title font-weight-600 mb-10"><%=ca_code %></h4>
						<%--<h6 class="hk-pg-title font-weight-600 mb-10" style="color: #151397;"><%= address_name %></h6>
						<h6 class="hk-pg-title font-weight-600 mb-10" style="color: #3e95cd;"><%= gst_no %></h6>--%>
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
    
    <br />
        
    <div class="row">
        <div class="hk-row">
			<div class="col-lg-12 " style="padding-right: 0px; padding-left: 0px;">
				 <div class="card-group hk-dash-type-2">

									<div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">Purchase</span>
												</div>
												<div>
													<span class="text-success font-14 font-weight-500">+10%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5"><label runat="server" id="lblPurchaseCount_Id" class="lblPurchaseCount_class">0</label></span>
												<small class="d-block">172,458 Target Users</small>
											</div>
										</div>
									</div>

                                    <div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">Sale</span>
												</div>
												<div>
													<span class="text-success font-14 font-weight-500">+12.5%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5"><label runat="server" id="lblSaleCount_id" class="lblSaleCount_class">0</label></span>
												<small class="d-block">472,458 Targeted</small>
											</div>
										</div>
									</div>
								
									<div class="card card-sm border-primary">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">Expenses</span>
												</div>
												<div>
													<span class="text-warning font-14 font-weight-500">-2.8%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5"><label runat="server" id="lblExpensesCount_id" class="lblExpensesCount_class">0</label></span>
												<small class="d-block">100 Targeted</small>
											</div>
										</div>
									</div>
                                </div>
        <div class="hk-row">
            <div class="col-lg-8">
				<div class="card card-refresh border-primary" style="height: 500px; width: 700px;">									
									<div class="card-header border-primary card-header-action">
										<h6>Company Details</h6>										
									</div>
										<div class="d-flex align-items-center card-action-wrap">
											<table id="datatable_Company_details_display" class="table table-hover display pb-30 table-responsive dataTable dtr-inline">
                                            <thead>
                                                <tr role="row">
                                                    <th>Company Name</th>
                                                    <th>State</th>
                                                    <th>GST No</th>
                                                    <th>GST Details Received</th>  
                                                    <th>GST Filed</th>
                                                    <th>Company Status</th>
                                                </tr>
                                             </thead>
						                    </table>
										<%--</div>--%>
									</div>
								
								</div>
                            </div>
                            <div class="col-lg-4">
                                <div class="card card-refresh border-primary" style="height: 500px; width: 350px;">		
                                <div class="card-header border-primary card-header-action">
									<h2 style="text-align:center; padding-top: 15px;">News &amp; Updates</h2>
                                </div>   
                                    <div class="card-body">
                                            <marquee id="mrq_title_id" width="100%" direction="up" height="400px" scrolldelay="5" scrollamount="3" behavior="scroll" onmouseout="this.start()" onmouseover="this.stop()">
                                            </marquee>
                                        </div>
                                    </div>
                                </div>
                            <%--</div>--%>	
            </div>                
            </div>
       </div>
      </div>
     </section>
     </div>
</div>

    <script type="text/javascript">   

  //datatable_Company_details_display
        function company_details_display() {

            var jsonString = '<%=json_company_obj %>'; //for testing
            if (jsonString != "") {
                jsonString = JSON.parse(jsonString);
                //Load  datatable
                var table = $('#datatable_Company_details_display').DataTable({

                    data: jsonString,
                    autoWidth: false,
                    //paging: false, bSortable: false,
                    //bFilter: false, bInfo: false,
                    //fixedColumns:   {
                    //    heightMatch: 'none'
                    //},
                    language: {
                        search: "",
                        searchPlaceholder: "Search",
                        sLengthMenu: "_MENU_items"
                    },
                    columns: [
                        { "data": "companyname" },
                        { "data": "companystate" },
                        { "data": "gstno" },
                        { "data": "gstdetailsrecieved" },
                        { "data": "gstfile" },
                        { "data": "companystatus" }
                    ]
                });
            }
        }

        window.onload = function () {
            company_details_display();
            var month = new Date().getMonth() +1;        
            $(".month_class").val(month).trigger('change');
        }

        function monthChange() {
            //var index = $(".month_class ").val() - 1;
            //$(".lblPurchaseCount_class").text(final_json_obj["purchase_amount"][index]);
            //$(".lblSaleCount_class").text(final_json_obj["sale_amount"][index]);

            var expeJsonCount = '<%=json_obj_expenses_count%>';
            var exp_json_obj = JSON.parse(expeJsonCount);
            var count = JSON.parse(expeJsonCount).length;
            for (var i = 0; i < count; i++) {
                if ($(".month_class").val() == exp_json_obj[i]['month_id']) {
                    $(".lblExpensesCount_class").text(exp_json_obj[i]["exp_tot"]);
                }
            }
        }

        var new_update_json = '<%=json_obj%>';
        var new_update_json_obj = JSON.parse(new_update_json);
        var count = JSON.parse(new_update_json).length;

        for (var i = 0; i < count; i++) {
            var a = '<h5><a href="'+ new_update_json_obj[i]['pms_news_outapp_link'] +'" target="_blank" style="color:black;">' + new_update_json_obj[i]['pms_news_title'] + '</a></h5> <p>'+ new_update_json_obj[i]['pms_news_description'] +'</p> <hr class="hr-dark mt-10"/>';
            $("#mrq_title_id").append(a);
        }

        for (var i = 0; i < count; i++) {
            var a_maq = '<a href="'+new_update_json_obj[i]['pms_news_outapp_link']+'" target="_blank" style="color:white">'+new_update_json_obj[i]['pms_news_title']+'</a>';
            $("#li_mar_id").append('** ' + a_maq + ' **');
        }
        
</script>		

    <%-- <!-- Title -->
                <div class="hk-pg-header align-items-top">
                    <div>
						<h2 class="hk-pg-title font-weight-600 mb-10">Customer Management</h2>
						<p>Questions about onboarding lead data? <a href="#">Learn more.</a></p>
					</div>
					<div class="d-flex w-500p">
						<select class="form-control custom-select custom-select-sm mr-15">
							<option selected="">Latest Products</option>
							<option value="1">CRM</option>
							<option value="2">Projects</option>
							<option value="3">Statistics</option>
						</select>
						<select class="form-control custom-select custom-select-sm mr-15">
							<option selected="">USA</option>
							<option value="1">USA</option>
							<option value="2">India</option>
							<option value="3">Australia</option>
						</select>
						<select class="form-control custom-select custom-select-sm">
							<option selected="">December</option>
							<option value="1">January</option>
							<option value="2">February</option>
							<option value="3">March</option>
							<option value="1">April</option>
							<option value="2">May</option>
							<option value="3">June</option>
							<option value="1">July</option>
							<option value="2">August</option>
							<option value="3">September</option>
							<option value="1">October</option>
							<option value="2">November</option>
							<option value="3">December</option>
						</select>
					</div>
                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hk-row">
							<div class="col-sm-12">
								<div class="card-group hk-dash-type-2">
									<div class="card card-sm">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">Users</span>
												</div>
												<div>
													<span class="text-success font-14 font-weight-500">+10%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5">168M</span>
												<small class="d-block">172,458 Target Users</small>
											</div>
										</div>
									</div>
								
									<div class="card card-sm">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">Campaign Leads</span>
												</div>
												<div>
													<span class="text-success font-14 font-weight-500">+12.5%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5"><span class="counter-anim">168,856</span></span>
												<small class="d-block">472,458 Targeted</small>
											</div>
										</div>
									</div>
								
									<div class="card card-sm">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">New Contacts</span>
												</div>
												<div>
													<span class="text-warning font-14 font-weight-500">-2.8%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5">73</span>
												<small class="d-block">100 Targeted</small>
											</div>
										</div>
									</div>
								
									<div class="card card-sm">
										<div class="card-body">
											<div class="d-flex justify-content-between mb-5">
												<div>
													<span class="d-block font-15 text-dark font-weight-500">Win/Loss Ratio</span>
												</div>
												<div>
													<span class="text-danger font-14 font-weight-500">-75%</span>
												</div>
											</div>
											<div>
												<span class="d-block display-4 text-dark mb-5">48:65</span>
												<small class="d-block">42:32 Targeted</small>
											</div>
										</div>
									</div>
								</div>
							</div>	
						</div>
						<div class="hk-row">
							<div class="col-lg-6">
								<div class="card card-refresh">
									<div class="refresh-container">
										<div class="loader-pendulums"></div>
									</div>
									<div class="card-header card-header-action">
										<h6>Youtube Subscribers</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<a href="#" class="inline-block refresh mr-15">
												<i class="ion ion-md-radio-button-off"></i>
											</a>
											<div class="inline-block dropdown">
												<a class="dropdown-toggle no-caret" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="ion ion-md-more"></i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#">Action</a>
													<a class="dropdown-item" href="#">Another action</a>
													<a class="dropdown-item" href="#">Something else here</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Separated link</a>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="hk-legend-wrap mb-20">
											<div class="hk-legend">
												<span class="d-10 bg-violet rounded-circle d-inline-block"></span><span>Desktop</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-4 rounded-circle d-inline-block"></span><span>Mobile</span>
											</div>
										</div>
										<div id="e_chart_9" class="echart" style="height: 240px;"></div>
									</div>
								</div>
								<div class="card">
									<div class="card-header card-header-action">
										<h6>Country Stats</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<a href="#" class="inline-block refresh mr-15">
												<i class="ion ion-md-arrow-down"></i>
											</a>
											<a href="#" class="inline-block full-screen">
												<i class="ion ion-md-expand"></i>
											</a>
										</div>
									</div>
									<div class="card-body pa-0">
										<div class="pa-20">
											<div id="world_map_marker_1" style="height: 300px"></div>
										</div>
										<div class="table-wrap">
											<div class="table-responsive">
												<table class="table table-sm table-hover mb-0">
													<thead>
														<tr>
															<th class="w-25">Country</th>
															<th>Sessions</th>
															<th>Goals</th>
															<th>Goals Rate</th>
															<th>Bounce Rate</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>Canada</td>
															<td>55,555</td>
															<td>210</td>
															<td>2.46%</td>
															<td>0.26%</td>
														</tr>
														<tr>
															<td>India</td>
															<td>24,152</td>
															<td>135</td>
															<td>0.58%</td>
															<td>0.43%</td>
														</tr>
														<tr>
															<td>UK</td>
															<td>15,640</td>
															<td>324</td>
															<td>5.15%</td>
															<td>2.47%</td>
														</tr>
														<tr>
															<td>Botswana</td>
															<td>12,148</td>
															<td>854</td>
															<td>4.19%</td>
															<td>0.1%</td>
														</tr>
														<tr>
															<td>UAE</td>
															<td>11,258</td>
															<td>453</td>
															<td>8.15%</td>
															<td>0.14%</td>
														</tr>
														<tr>
															<td>Australia</td>
															<td>10,786</td>
															<td>376</td>
															<td>5.48%</td>
															<td>0.45%</td>
														</tr>
														<tr>
															<td>Phillipines</td>
															<td>9,485</td>
															<td>63</td>
															<td>3.51%</td>
															<td>0.9%</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="card">
									<div class="card-header card-header-action">
										<h6>Linkedin Key Metrics</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<a href="#" class="inline-block refresh mr-15">
												<i class="ion ion-md-arrow-down"></i>
											</a>
											<a href="#" class="inline-block full-screen mr-15">
												<i class="ion ion-md-expand"></i>
											</a>
											<a class="inline-block card-close" href="#" data-effect="fadeOut">
												<i class="ion ion-md-close"></i>
											</a>
										</div>
									</div>
									<div class="card-body pa-0">
										<div class="table-wrap">
											<div class="table-responsive">
												<table class="table table-sm table-hover mb-0">
													<thead>
														<tr>
															<th>Metrics</th>
															<th class="w-40">Period</th>
															<th class="w-25">Past</th>
															<th>Trend</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>Clicks</td>
															<td>
																<div class="progress-wrap lb-side-left mnw-125p">
																	<div class="progress-lb-wrap">
																		<label class="progress-label mnw-50p">1,184</label>
																		<div class="progress progress-bar-rounded progress-bar-xs">
																			<div class="progress-bar bg-primary w-70" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
																		</div>
																	</div>
																</div>
															</td>
															<td>1,234</td>
															<td><div id="sparkline_1"></div></td>
														</tr>
														<tr>
															<td>Visits</td>
															<td>
																<div class="progress-wrap lb-side-left mnw-125p">
																	<div class="progress-lb-wrap">
																		<label class="progress-label mnw-50p">1,425</label>
																		<div class="progress progress-bar-rounded progress-bar-xs">
																			<div class="progress-bar bg-violet-light-3 w-70" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
																		</div>
																	</div>
																</div>
															</td>
															<td>3,458</td>
															<td><div id="sparkline_2"></div></td>
														</tr>
														<tr>
															<td>Views</td>
															<td>
																<div class="progress-wrap lb-side-left mnw-125p">
																	<div class="progress-lb-wrap">
																		<label class="progress-label mnw-50p">5,623</label>
																		<div class="progress progress-bar-rounded progress-bar-xs">
																			<div class="progress-bar bg-violet-light-4 w-60" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
																		</div>
																	</div>
																</div>
															</td>
															<td>53,637</td>
															<td><div id="sparkline_3"></div></td>
														</tr>
														<tr>
															<td>Returns</td>
															<td>
																<div class="progress-wrap lb-side-left mnw-125p">
																	<div class="progress-lb-wrap">
																		<label class="progress-label mnw-50p">4,851</label>
																		<div class="progress progress-bar-rounded progress-bar-xs">
																			<div class="progress-bar bg-danger w-55" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
																		</div>
																	</div>
																</div>
															</td>
															<td>20,596</td>
															<td><div id="sparkline_4"></div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header card-header-action">
										<h6>Users by Gendar & Age</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<div class="inline-block dropdown">
												<a class="dropdown-toggle no-caret" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="ion ion-ios-more"></i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#">Action</a>
													<a class="dropdown-item" href="#">Another action</a>
													<a class="dropdown-item" href="#">Something else here</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Separated link</a>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div id="e_chart_5" class="echart" style="height:250px;"></div>
										<div class="hk-legend-wrap mt-20">
											<div class="hk-legend">
												<span class="d-10 bg-primary rounded-circle d-inline-block"></span><span>18-24</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-2 rounded-circle d-inline-block"></span><span>25-34</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-3 rounded-circle d-inline-block"></span><span>35-44</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-4 rounded-circle d-inline-block"></span><span>45-54</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-5 rounded-circle d-inline-block"></span><span>55-64</span>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header card-header-action">
										<h6>Analytics Audience Matrics</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<div class="inline-block dropdown">
												<a class="dropdown-toggle no-caret" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="ion ion-ios-more"></i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#">Action</a>
													<a class="dropdown-item" href="#">Another action</a>
													<a class="dropdown-item" href="#">Something else here</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Separated link</a>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="hk-legend-wrap mb-20">
											<div class="hk-legend">
												<span class="d-10 bg-violet rounded-circle d-inline-block"></span><span>Users</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-1 rounded-circle d-inline-block"></span><span>Sessions</span>
											</div>
											<div class="hk-legend">
												<span class="d-10 bg-violet-light-4 rounded-circle d-inline-block"></span><span>Pageviews</span>
											</div>
										</div>
										<div id="e_chart_6" class="echart" style="height:250px;"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="mt-40 mb-30">
							<h5 class="d-flex align-items-end">User Activities <i class="ion ion-md-help-circle-outline text-light font-21 ml-10" data-toggle="tooltip" data-placement="top" title="User input data and activities"></i></h5>
						</div>	
						<div class="hk-row">
							<div class="col-lg-8">
								<div class="card">
									<div class="card-header card-header-action">
										<h6>Ratings & Reviews</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<button class="btn btn-secondary btn-sm">Rate the template</button>
										</div>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-sm-5">
												<div class="d-flex align-items-center h-100 justify-content-center text-center">
													<div>
														<div class="d-flex align-items-center  justify-content-center text-dark">
															<span class="counter-anim display-2">4.4</span>
															<span class="review-star starred ml-10">
																<span class="feather-icon"><i data-feather="star"></i></span>
															</span>
														</div>
														<span class="font-18">949 ratings & 18 reviews</span>
													</div>
												</div>
											</div>
											<div class="col-sm-7">
												<div class="progress-wrap lb-side-left mt-5">
													<div class="progress-lb-wrap mb-10">
														<label class="progress-label mnw-50p">5.0<i class="zmdi zmdi-star text-light-20 ml-5"></i></label>
														<div class="progress progress-bar-rounded progress-bar-xs">
															<div class="progress-bar bg-primary w-85" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
													<div class="progress-lb-wrap mb-10">
														<label class="progress-label mnw-50p">4.0<i class="zmdi zmdi-star text-light-20 ml-5"></i></label>
														<div class="progress progress-bar-rounded progress-bar-xs">
															<div class="progress-bar bg-violet-light-1 w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
													<div class="progress-lb-wrap mb-10">
														<label class="progress-label mnw-50p">3.0<i class="zmdi zmdi-star text-light-20 ml-5"></i></label>
														<div class="progress progress-bar-rounded progress-bar-xs">
															<div class="progress-bar bg-violet-light-2 w-65" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
													<div class="progress-lb-wrap mb-10">
														<label class="progress-label mnw-50p">2.0<i class="zmdi zmdi-star text-light-20 ml-5"></i></label>
														<div class="progress progress-bar-rounded progress-bar-xs">
															<div class="progress-bar bg-violet-light-3 w-55" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
													<div class="progress-lb-wrap mb-10">
														<label class="progress-label mnw-50p">1.0<i class="zmdi zmdi-star text-light-20 ml-5"></i></label>
														<div class="progress progress-bar-rounded progress-bar-xs">
															<div class="progress-bar bg-danger w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-body pa-0">
										<div class="table-wrap">
											<div class="table-responsive">
												<table class="table table-hover mb-0">
													<thead>
														<tr>
															<th>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck4">
																	<label class="custom-control-label" for="customCheck4">Lead Title</label>
																</div>
															</th>
															<th>Sales</th>
															<th>Company</th>
															<th>Date Created</th>
															<th>Lead Status</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck41" checked="">
																	<label class="custom-control-label" for="customCheck41"><span class="w-130p d-block text-truncate">connar_weiked@ae.com</span></label>
																</div>
															</td>
															<td>$2000</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-primary rounded-circle"><span class="initial-wrap"><span>A</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">American Express</span> 
																	</div>
																</div>
															</td>
															<td>
																22/10/2018
															</td>
															<td><span class="badge badge-primary">On track</span></td>
														</tr>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck42">
																	<label class="custom-control-label" for="customCheck42"><span class="w-130p d-block text-truncate">express_notingham@em.au</span></label>
																</div>
															</td>
															<td>$1600</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-danger rounded-circle"><span class="initial-wrap"><span>M</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">Exxon Mobil</span> 
																	</div>
																</div>
															</td>
															<td>
																15/09/2018
															</td>
															<td><span class="badge badge-primary">On track</span></td>
														</tr>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck43">
																	<label class="custom-control-label" for="customCheck43"><span class="w-130p d-block text-truncate">locast12_host@nova.com</span></label>
																</div>
															</td>
															<td>$1265</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-teal rounded-circle"><span class="initial-wrap"><span>B</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">Big Blackship</span> 
																	</div>
																</div>
															</td>
															<td>
																30/08/2018
															</td>
															<td><span class="badge badge-danger">Behind</span></td>
														</tr>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck44">
																	<label class="custom-control-label" for="customCheck44"><span class="w-130p d-block text-truncate">grillmac@sundance.co.in</span></label>
																</div>
															</td>
															<td>$4562</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-indigo rounded-circle"><span class="initial-wrap"><span>F</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">Folkswagan</span> 
																	</div>
																</div>
															</td>
															<td>
																14/03/2018
															</td>
															<td><span class="badge badge-purple">Negotiation</span></td>
														</tr>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck45">
																	<label class="custom-control-label" for="customCheck45"><span class="w-130p d-block text-truncate">admin@novotel.inc</span></label>
																</div>
															</td>
															<td>$5012</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-purple rounded-circle"><span class="initial-wrap"><span>N</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">Novotel</span> 
																	</div>
																</div>
															</td>
															<td>
																21/02/2018
															</td>
															<td><span class="badge badge-orange">Offer Made</span></td>
														</tr>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck46">
																	<label class="custom-control-label" for="customCheck46"><span class="w-130p d-block text-truncate">displaypic@ho.au</span></label>
																</div>
															</td>
															<td>$1245</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-pink rounded-circle"><span class="initial-wrap"><span>D</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">Displaypic</span> 
																	</div>
																</div>
															</td>
															<td>
																3/02/2018
															</td>
															<td><span class="badge badge-orange">Offer Made</span></td>
														</tr>
														<tr>
															<td>
																<div class="custom-control custom-checkbox checkbox-primary">
																	<input type="checkbox" class="custom-control-input" id="customCheck47">
																	<label class="custom-control-label" for="customCheck47"><span class="w-130p d-block text-truncate">manager@cobito.com</span></label>
																</div>
															</td>
															<td>$1245</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-img-wrap d-flex mr-10">
																		<div class="avatar avatar-xs">
																			<span class="avatar-text avatar-text-yellow rounded-circle"><span class="initial-wrap"><span>C</span></span></span>
																		</div>
																	</div>
																	<div class="media-body">
																		<span class="d-block">Cobito co.</span> 
																	</div>
																</div>
															</td>
															<td>
																18/01/2018
															</td>
															<td><span class="badge badge-danger">Behind</span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="card overflow-hide border-0">
									<div class="card-body pa-0">
										<div id="owl_demo_1" class="owl-carousel dots-on-item owl-theme">
											<div class="fadeOut item img-background overlay-wrap" style="background-image:url(dist/img/slide1.jpg);">
												<div class="position-relative z-index-2 pa-20">
													<div class="position-relative text-white mnh-225p">
														<p>Very easy to use. Thanks to design, we've just launched our 5th website! Thank you for making it painless, pleasant and most of all hassle free! Just what I was looking for.</p>
														<div class="media position-absolute b-0 l-0 align-items-center">
															<div class="media-img-wrap d-flex mr-15">
																<div class="avatar avatar-sm">
																	<span class="avatar-text avatar-text-inv-pink rounded-circle"><span class="initial-wrap"><span>ZC</span></span></span>
																</div>
															</div>
															<div class="media-body">
																<span class="d-block font-14 font-weight-500">Zuck Chan</span>
																<span class="d-block font-12">Design Lead, Hencework</span>
															</div>
														</div>
													</div>
												</div>
												<div class="bg-overlay bg-trans-dark-50"></div>
											</div>
											<div class="fadeOut item img-background overlay-wrap" style="background-image:url(dist/img/slide2.jpg);">
												<div class="position-relative z-index-2 pa-20">
													<div class="position-relative text-white mnh-225p">
														<p>Nice work on your design. Design is worth much more than I paid. We've used design for the last five years. I just can't get enough of design.</p>
														<div class="media position-absolute b-0 l-0 align-items-center">
															<div class="media-img-wrap d-flex mr-15">
																<div class="avatar avatar-sm">
																	<span class="avatar-text avatar-text-inv-primary rounded-circle"><span class="initial-wrap"><span>NT</span></span></span>
																</div>
															</div>
															<div class="media-body">
																<span class="d-block font-14 font-weight-500">Normand T.</span>
																<span class="d-block font-12">Sales Executive, Media</span>
															</div>
														</div>
													</div>
												</div>
												<div class="bg-overlay bg-trans-dark-50"></div>
											</div>
										</div>
									</div>
								</div>
							
								<div class="card">
									<div class="card-header card-header-action">
										<h6>Recent Activity</h6>
										<div class="d-flex align-items-center card-action-wrap">
											<div class="inline-block dropdown">
												<a class="dropdown-toggle no-caret" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="ion ion-ios-more"></i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#">Action</a>
													<a class="dropdown-item" href="#">Another action</a>
													<a class="dropdown-item" href="#">Something else here</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Separated link</a>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="user-activity user-activity-sm">
											<div class="media">
												<div class="media-img-wrap">
													<div class="avatar avatar-xs">
														<img src="dist/img/avatar2.jpg" alt="user" class="avatar-img rounded-circle">
													</div>
												</div>
												<div class="media-body">
													<div>
														<span class="d-block mb-5"><span class="font-weight-500 text-dark text-capitalize">Laura Thompson</span><span class="pl-5">joined josh groben team.</span></span>
														<span class="d-block font-13">3 hours ago</span>
													</div>
												</div>
											</div>
											<div class="media">
												<div class="media-img-wrap">
													<div class="avatar avatar-xs">
														<img src="dist/img/avatar3.jpg" alt="user" class="avatar-img rounded-circle">
													</div>
												</div>
												<div class="media-body">
													<div>
														<span class="d-block mb-5"><span class="font-weight-500 text-dark text-capitalize">Meayme Fletcher</span><span class="pl-5">liked photos</span></span>
														<span class="d-block font-13 mb-10">6 hours ago</span>
													</div>
													<div class="d-flex">
														<a href="#" class="w-75p mr-10"><img class="card-img-top rounded" src="dist/img/slide1.jpg" alt="Card image cap"></a>
														<a href="#" class="w-75p mr-10"><img class="card-img-top rounded" src="dist/img/slide2.jpg" alt="Card image cap"></a>
														<a href="#" class="w-75p mr-10"><img class="card-img-top rounded" src="dist/img/slide3.jpg" alt="Card image cap"></a>
													</div>
												</div>
											</div>
											<div class="media">
												<div class="media-img-wrap">
													<div class="avatar avatar-xs">
														<img src="dist/img/avatar4.jpg" alt="user" class="avatar-img rounded-circle">
													</div>
												</div>
												<div class="media-body">
													<div>
														<span class="d-block mb-5"><span class="font-weight-500 text-dark text-capitalize">Billy Flowers</span><span class="pl-5">Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text.</span></span>
														<span class="d-block font-13">32 days ago</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
                <!-- /Row -->--%>
        
</asp:Content>
