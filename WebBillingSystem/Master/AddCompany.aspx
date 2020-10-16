<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="WebBillingSystem.Company" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .field-icon {
  float: right;
  margin-left: -25px;
  margin-top: -25px;
  position: relative;
  z-index: 2;
}
    </style>
     <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page" runat="server" id="breadcrumb_title">Add Company</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container" >
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Add Company</h4>
                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-xl-12">
                        <section class="bg-light hk-sec-wrapper" >
                          <!--  <h5 class="hk-sec-title">Default Layout</h5>
                            <p class="mb-25">More complex forms can be built using the grid classes. Use these for form layouts that require multiple columns, varied widths, and additional alignment options.</p>
                            --><div class="row">
                                <div class="col-sm">
                                   <%-- <form runat="server">--%>
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <label for="firstName">Unique Customer Id</label>
                                                <input class="form-control" id="customerid" runat="server" maxlength="6" value="" type="text" style="text-transform: uppercase;">
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label for="country">Person Type</label>
                                                <select class="form-control custom-select d-block w-100" id="person_type" runat="server">
                                                    <option value="0">Choose...</option>
                                                    <%--<option>United States</option>--%>
                                                </select>
                                            </div>
											</div>
										
										<div class="row">

										   <div class="col-md-4 form-group">
                                                <label for="firstName">Surname/Firm Name</label>
                                                <input class="form-control" id="surnamename" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label for="lastName">Middle name</label>
                                                <input class="form-control" id="middlename" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                            </div>
											<div class="col-md-4 form-group">
                                                <label for="lastName">First name</label>
                                                <input class="form-control" id="firstname" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                            </div>
                                        </div>
										
										<div class="row">
										<div class="col-md-6 form-group">
                                                <label for="lastName">Add Line 1</label>
                                                <input class="form-control" id="address1" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Add Line 2</label>
                                                <input class="form-control" id="address2" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Add Line 3</label>
                                                <input class="form-control" id="address3" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">District</label>
                                                <input class="form-control" id="district" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
                                          
                                        <div class="col-md-6 form-group">
                                                <label for="State">State</label>
                                                <select class="form-control custom-select d-block w-100 state_name select2" id="Select_state" runat="server">
                                                    <option value="0">Select...</option> 
                                                </select>
                                            </div>
									<%--	<div class="col-md-6 form-group">
                                                <label for="lastName">State</label>
                                                <input class="form-control" id="state" runat="server" placeholder="" value="" type="text">
                                        </div>--%>
										<div class="col-md-6 form-group">
                                                <label for="lastName">State Code</label>
                                                <input class="form-control stateCode" id="state_code" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Country</label>
                                                <input class="form-control" id="country" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Pincode</label>
                                                <input class="form-control" id="pincode" runat="server" placeholder="" value="" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Email</label>
                                                <input class="form-control" id="email" runat="server" placeholder="" value="" type="text" style="text-transform: lowercase;" onblur="validateEmail(this.value);" >
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Phone</label>
                                                <input class="form-control" id="phone" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="10" value="" type="text">
                                        </div>
										
										</div>
										
										
										<div class="row">
										
										<div class="col-md-4 form-group">
                                                <label for="lastName">GST No</label>
                                                <input class="form-control" id="gst_no" runat="server" placeholder="" value="" style="text-transform: uppercase;" type="text" onchange="GStNoChange();">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">Pan No</label>
                                                <input class="form-control" id="pan_no" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">CIN No</label>
                                                <input class="form-control" id="cin_no" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">Trade Name</label>
                                                <input class="form-control" id="trade_name" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">GST Practinoer UCID</label>
                                                <input class="form-control" id="gst_practinoer_ucid" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										
										<div class="col-md-4 form-group">
                                                <label for="lastName">CA UCID</label>
                                                <input class="form-control" id="ca_ucid" runat="server" placeholder=""   value="" type="text" style="text-transform: uppercase;">
                                        </div>
										
										<div class="col-md-4 form-group">
                                                <label for="lastName">Financial Year Start From</label>
                                                <input type="number" class="form-control year_class" id="year_start_start" runat="server" placeholder="YYYY" value="2019" min="2017" max="2100" onchange="yearChange(this);">
                                                
                                            <%--<input class="form-control" id="year_start_start" runat="server" placeholder="YYYY-YYYY" value="" type="text" />--%> <%--onchange="yearChange(this);">--%>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <br />
                                                <br />
                                            <label id="heading_id" style="color:red; height:10px; text-size-adjust:5%">YYYY-YYYY(2019-2020) Format</label>
                                        </div>
										
										</div>
										
										<div class="row">
										
										</div>

										<div class="row">
										<div class="col-md-4 form-group">
                                                <label>GST ID</label>
                                                <input class="form-control" id="gst_id" runat="server" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label>Password</label>
                                            
                                            <input id="password_field" runat="server" type="text" class="form-control pass_class" name="password" >                                             
                                            <span toggle="#password_field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                             <%--input runat="server" type="text" class="form-control pass_class" value="" id="pass_Id" TextMode="Password"/> 
                                                <input type="checkbox" runat="server" id="chkID" onclick="myFunction()">Show Password--%>

                                        </div>
										<div class="col-md-4 form-group" style="padding-top: 30px;">										
                                            <asp:Button runat="server" class="btn btn-primary" type="submit" id="btnLogin" text="Login" OnClick="loginClick" />
                                            <%--<input type="button" class="btn btn-primary" onClick="loginClick()" value="Login"/>--%>
										<%--<button type="submit" class="btn btn-primary" onClick="loginClick()">Login</button>--%>
										</div>
										
										</div>
										
										<div class="row">
										<div class="col-md-12 form-group">
										<h5 class="hk-sec-title">Default Bank Details</h5>
										</div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Bank Name</label>
                                                <input class="form-control" id="bank_name" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Branch Name</label>
                                                <input class="form-control" id="branch_name" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Account Number</label>
                                                <input class="form-control" id="acc_no" runat="server" placeholder="" value="" type="text" >
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">IFSC Number</label>
                                                <input class="form-control" id="ifsc_no" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										
										</div>

										<div class="row">
										<div class="col-md-12 form-group">
										<h5 class="hk-sec-title">Primary Authorised Signatory</h5>
										</div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Name</label>
                                                <input class="form-control" id="primary_name" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Designation</label>
                                                <input class="form-control" id="designation" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-12 form-group">
                                                <label for="lastName">Address</label>
                                                <input class="form-control" id="address" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Email</label>
                                                <input class="form-control" id="email1" runat="server" placeholder="" value="" type="text" onblur="validateEmail(this.value);">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Mobile No.</label>
                                                <input class="form-control" id="mobile_no" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="10" value="" type="text">
                                        </div>
										
										
										</div>
									

										<div class="row">
										<div class="col-md-12 form-group">
										<h5>Secondery Authorised Signatory</h5>
										</div>
										<br>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Name</label>
                                                <input class="form-control" id="secondery_name" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Designation</label>
                                                <input class="form-control" id="secondery_designation" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-12 form-group">
                                                <label for="lastName">Address</label>
                                                <input class="form-control" id="secondery_address" runat="server" placeholder="" value="" type="text" style="text-transform: uppercase;">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Email</label>
                                                <input class="form-control" id="email2" runat="server" placeholder="" value="" type="text" onblur="validateEmail(this.value);">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Mobile No.</label>
                                                <input class="form-control" id="mobile_no2" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="10" value="" type="text">
                                        </div>
										
										
										</div>
                                    <asp:HiddenField ID="financialYear" runat="server"/>	
                                        <hr>
                                     <%--   <button class="btn btn-primary" runat="server" type="submit">Submit</button>--%>
                                      <asp:Button runat="server" class="btn btn-primary" type="submit" id="submit_company_details" text="Save" OnClientClick="yearChange()" OnClick="submit_company_details_even" data-toggle="tooltip-dark" data-placement="top" title="Save Company"/>
								      <asp:Button runat="server" class="btn btn-light" type="submit" id="btnCancel" text="Cancel" OnClick="cancel_event" data-toggle="tooltip-dark" data-placement="top" title="Leave Page"/>
                                   <%-- </form>--%>
                                </div>
                            </div>
                        </section>
					</div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->

    <script>
        //var db_nm = $("[id*=surnamename]").val().sp;
        //alert(db_nm);
        //$("[id*=dbname_id]").val(db_nm);
        //$(window).keypress(function (event) {
        //    
        //    if (!(event.which == 115 && event.altKey) && !(event.which == 19)) return true;
        //    alert("Alt-S pressed");
        //    //event.preventDefault();
        //    return false;
        //});
 document.onkeydown = function(event){
    if (event.altKey && event.keyCode == 83) //ALT+S
    {
        $('#<%=submit_company_details.ClientID%>').click();
    }
};

        window.onload = function () {
            $(".select2").select2();
            $('.state_name').on('select2:select', function (e) {
                // trclick($(this).val());
                $(".stateCode").val($(this).val());
            });

           

            $(".toggle-password").click(function () {

                $(this).toggleClass("fa-eye fa-eye-slash");
                var input = $(".pass_class");//$($(this).attr("toggle"));
                if (input.attr("type") == "password") {
                    input.attr("type", "text");
                } else {
                    input.attr("type", "password");
                }
            });
        };
   function yearChange() {
       
       var year = $("[id*=year_start_start]").val();
       var fina_year = (parseInt(year) + 1);
       // $(".year_class").val(year + "-" + fina_year);
       var finacial_year = year + "_" + fina_year;
       $("[id*=financialYear]").val(finacial_year);
   }

   function validateEmail(sEmail) {
       var reEmail = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/;

       if (!sEmail.match(reEmail)) {
           warning_message("Invalid email address");
           return false;
       } else {
           return true;
       }
   }

   function GStNoChange() {
       var gstno = $("[id*=gst_no]").val();
       var statecode = $("[id*=state_code]").val();
       var newStr = gstno.substring(2);
       var str = newStr.substring(0, newStr.length - 3);
       $("[id*=pan_no]").val(str);
  }
   //document.querySelector("input[type=number]").oninput = e => console.log(new Date(e.target.valueAsNumber, 0, 1))
  
   //function myFunction() {
   //    
   //    var $pwd = $(".pass_class");
   //    if ($pwd.attr('type') === 'password') {
   //        //$pwd.attr('type', 'text');
   //        $pwd.attr('type', 'password');
   //    } else {
   //        $pwd.attr('type', 'text');
   //       // $pwd.attr('type', 'password');
   //    }
        //}


 
        <%if (Request.QueryString["value"] != null && Session["page_role"].ToString() == "COMPANY")
        {
   %>       
                    $("#ContentPlaceHolder1_ca_ucid").prop("disabled", true);
                    $("#ContentPlaceHolder1_customerid").prop("disabled", true);
               
        <%  }
        %>

   
       
    </script>


</asp:Content>
