<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Puraches_Report.aspx.cs" Inherits="WebBillingSystem.Puraches_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Invoice</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->
            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header mb-10">
                    <div>
                        <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Stock Purchase</h4>
                    </div>
                    <div class="d-flex">
                        <a href="#" class="text-secondary mr-15"><span class="feather-icon"><i data-feather="printer"></i></span></a>
                        <a href="#" class="text-secondary mr-15"><span class="feather-icon"><i data-feather="download"></i></span></a>
                        <button class="btn btn-primary btn-sm">EWay Bill</button>
                    </div>
                </div>
                <!-- /Title -->
                <!-- Row -->
                <div class="row">
                    <div class="col-xl-12">
                        <section class="bg-light hk-sec-wrapper hk-invoice-wrap pa-35">
                            <div class="invoice-from-wrap">
                                <div class="row">
                                    <div class="col-md-4 mb-20">
                                        <h4 class="mb-35 font-weight-600"></h4>
                                        <h6 class="mb-5">Invoice No :</h6>
                                        <h6 class="mb-5">Invoice Date :</h6>
                                        <h6 class="mb-5">Reverse Change </h6>
                                        <h6 class="mb-5">State :  <span style="float:right;">Code :</span></h6>

                                    </div>
                                    <div class="col-md-3 mb-20">
                                    </div>
                                    <div class="col-md-4 mb-20">
                                        <h4 class="mb-35 font-weight-600"></h4>
                                        <h6 class="mb-5">Seller Name : 	</h6>
                                               <%-- <select class="form-control custom-select d-block w-100" id="seller_name" runat="server">
                                                    <option value="">Select...</option>
                                                    <option value="">Balaji Enterprises</option>
                                                    <%--<option>United States</option>--%>
                                                <%--</select>--%>
                                        <input class="form-control" id="seller_name" runat="server" placeholder="" value="" type="text">

                                        <address>
                                          <%-- <span class="d-block">4747, Pearl Street</span>--%>
                                           <%-- <input class="form-control" id="address" runat="server" placeholder="" value="" type="text">--%>
                                            <textarea class="form-control"></textarea>
                                        </address>
                                       
                                        <h6 class="mb-5">GSTIN :
                                          <input class="form-control" id="gstin" runat="server" placeholder="" value="" type="text">
                                        </h6>
                                        <h6 class="mb-5">State : 
                                            <select class="form-control custom-select d-block w-100" id="Select_state" runat="server">
                                                    <option value="">Select...</option> 
                                                </select>
                                           <%-- <input class="form-control" id="state" runat="server" placeholder="" value="" type="text">--%>
                                          </h6>
                                   
                                           <h6 class="mb-5">Code :
                                               <%--<span style="float:right ;"/>--%> 
                                               <input class="form-control" id="code" runat="server" placeholder="" value="" type="text">
                                           </h6>
                                        
                                    </div>
                                    <div class="col-md-1 mb-20">
                                    </div>


                                </div>
                            </div>
                            <hr class="mt-0">
                          
                            <h5>Items</h5>
                            <hr>
                            <div class="invoice-details">
                                <div class="table-wrap">
                                    <div class="table-responsive">
                                        <style>

                                            .table th {
                                                padding: 0.3rem 1.0rem !important;
                                                border: solid 1px;
                                            }

                                            .table td {
                                                border: solid 1px;
                                            }

                                            .table tr {
                                                border: solid 1px;
                                            }
                                        </style>
                                        <table class="table  table-bordered table-striped mb-0" id="edit_datable_1" runat="server">
                                            <thead>
                                                <tr>
                                                    <th class=" ">S. No.</th>
                                                    <th class="w-20">Product Discription</th>
                                                    <th class=" ">HSN Code</th>
                                                    <th class=" ">Uomi</th>
                                                    <th class=" ">Qty</th>
                                                    <th class=" ">Rate</th>
                                                    <th class=" ">Amount</th>
                                                    <th class=" ">Discount</th>
                                                    <th class=" ">Taxable Value</th>
                                                    <th class="" colspan="2">IGST</th>
                                                    <th class=" " colspan="2">CGST</th>
                                                    <th class=" " colspan="2">SGST</th>
                                                    <th class=" ">Total</th>
                                                    <th class="  w-20">MRP Per Unit</th>
                                                    <th class="  w-20">Sale Price Per Unit</th>

                                                </tr>

                                                <tr>
                                                    <th class=" "></th>
                                                    <th class="w-20"></th>
                                                    <th class=" "> </th>
                                                    <th class=" "></th>
                                                    <th class=" "></th>
                                                    <th class=" "></th>
                                                    <th class=" "></th>
                                                    <th class=" "></th>
                                                    <th class=" "></th>
                                                    <th class="">Rate</th>
                                                    <th class="">Amount</th>
                                                    <th class=" ">Rate</th>
                                                    <th class="">Amount</th>
                                                    <th class=" ">Rate</th>
                                                    <th class="">Amount</th>
                                                    <th class=" "></th>
                                                    <th class="  w-20"></th>
                                                    <th class="  w-20"></th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                </tr>
                                                <tr>
                                                    <td class=" ">1</td>
                                                    <td class=" ">$7500</td>
                                                    <td class=" ">$7500</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                </tr>
                                                <tr>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                    <td class=" ">15</td>
                                                    <td class=" ">$180</td>
                                                    <td class=" ">$9000</td>
                                                    <td class=" ">2</td>
                                                    <td class=" ">$1500</td>
                                                    <td class=" ">$3000</td>
                                                </tr>
                                                <tr class="bg-transparent">
                                                    <td colspan="4" class="">Total</td>
                                                    <td class=" "></td>
                                                    <td class=" "></td>
                                                    <td class=" "></td>
                                                    <td class=" "></td>
                                                    <td class=" "></td>
                                                    <td colspan="2"></td>
                                                    <td colspan="2"></td>
                                                    <td colspan="2"></td>
                                                    <td class=" "></td>
                                                </tr>
                                                <tr class="bg-transparent">
                                                    <td colspan="11" class="  text-light border-top-0">Total Invoice Amount in Words</td>
                                                    <td colspan="4">Total Amount Before Tax</td>
                                                    <td> &nbsp; </td>
                                                </tr>
                                                <tr class="bg-transparent">
                                                    <td colspan="11" class="  text-light border-top-0"></td>
                                                    <td colspan="4">IGST</td>
                                                    <td> &nbsp; </td>
                                                </tr>
                                                <tr class="bg-transparent">
                                                    <td colspan="11" class="  text-light border-top-0"></td>
                                                    <td colspan="4">CGST</td>
                                                    <td> &nbsp; </td>
                                                </tr>
                                                <tr class="bg-transparent">
                                                    <td colspan="11" class="  text-light border-top-0"></td>
                                                    <td colspan="4">SGST</td>
                                                    <td> &nbsp; </td>
                                                </tr>

                                            </tbody>
                                            <tfoot class="border-bottom border-1">
                                                <tr>
                                                    <th colspan="11" class="  font-weight-600"></th>
                                                    <th colspan="4" class="  font-weight-600">Total Amount After Tax</th>
                                                    <th class="  font-weight-600"></th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <hr>
                        </section>
                    </div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->

</asp:Content>

