<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="WebBillingSystem.Company" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Add Company</li>
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
                        <section class="hk-sec-wrapper" >
                          <!--  <h5 class="hk-sec-title">Default Layout</h5>
                            <p class="mb-25">More complex forms can be built using the grid classes. Use these for form layouts that require multiple columns, varied widths, and additional alignment options.</p>
                            --><div class="row">
                                <div class="col-sm">
                                    <form runat="server">
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <label for="firstName">Unique Customer Id</label>
                                                <input class="form-control" id="firstName" placeholder="" value="" type="text">
                                            </div>
                                            <div class="col-md-5 mb-10">
                                                <label for="country">Person Type</label>
                                                <select class="form-control custom-select d-block w-100" id="country">
                                                    <option value="">Choose...</option>
                                                    <option>United States</option>
                                                </select>
                                            </div>
											</div>
										
										<div class="row">

										   <div class="col-md-4 form-group">
                                                <label for="firstName">Surname/Firm Name</label>
                                                <input class="form-control" id="firstName" placeholder="" value="" type="text">
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label for="lastName">Middle name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                            </div>
											<div class="col-md-4 form-group">
                                                <label for="lastName">First name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                            </div>
                                        </div>
										
										<div class="row">
										<div class="col-md-6 form-group">
                                                <label for="lastName">Add Line 1</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Add Line 2</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Add Line 3</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">District</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">State</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">State Code</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Country</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Pincode</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Email</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Phone</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										
										</div>
										
										
										<div class="row">
										
										<div class="col-md-4 form-group">
                                                <label for="lastName">GST No</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">Pan No</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">CIN No</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Trade Name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">GST Practinoer UCID</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										
										</div>
										
										<div class="row">
										
										<div class="col-md-6 form-group">
                                                <label for="lastName">Financial Year Start From</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										
										</div>
										
										<div class="row">
										
										</div>

										<div class="row">
										<div class="col-md-4 form-group">
                                                <label for="lastName">GST ID</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-4 form-group">
                                                <label for="lastName">Password</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-4 form-group" style="padding-top: 30px;">
										
										<button type="submit" class="btn btn-primary">Login</button>
										</div>
										
										</div>
										
										<div class="row">
										<div class="col-md-12 form-group">
										<h5 class="hk-sec-title">Default Bank Details</h5>
										</div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Bank Name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Branch Name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Account Number</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">IFSC Number</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										
										</div>

										<div class="row">
										<div class="col-md-12 form-group">
										<h5 class="hk-sec-title">Primary Authorised Signatory</h5>
										</div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Designation</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-12 form-group">
                                                <label for="lastName">Address</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Email</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Mobile No.</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										
										
										</div>
										
										<div class="row">
										<div class="col-md-12 form-group">
										<h5>Secondery Authorised Signatory</h5>
										</div>
										<br>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Name</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Designation</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-12 form-group">
                                                <label for="lastName">Address</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Email</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										<div class="col-md-6 form-group">
                                                <label for="lastName">Mobile No.</label>
                                                <input class="form-control" id="lastName" placeholder="" value="" type="text">
                                        </div>
										
										
										</div>
                                        <hr>
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </section>
					</div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->

</asp:Content>
