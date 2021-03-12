<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="WebBillingSystem.AddStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
         table, th, td {
            border: 1px solid black;
         }
         .table td, .table th {
             padding: 1px;
         }
     </style>
    <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page" runat="server" id="breadcrumb_title"> Inventory</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">
                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span>Add Stock</h4>
                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-xl-12">
                        <section class="bg-light hk-sec-wrapper">
                          <!--  <h5 class="hk-sec-title">Default Layout</h5>
                            <p class="mb-25">More complex forms can be built using the grid classes. Use these for form layouts that require multiple columns, varied widths, and additional alignment options.</p>-->
                            <div class="row">
                                <div class="col-sm">
                                        <div class="row">
                                            <div class="col-md-4 mb-10">
                                                <label for="country">Nature Of Operation : *</label>
                                                <select class="form-control custom-select d-block w-100 inv_nature_operation_class"  runat="server" id="inv_nature_operation" name="inv_nature_operation" onserverchange="NatureOperation_Changed">
                                                  <option value="">Select...</option>
                                                </select>
                                            </div>
											<div class="col-md-4 mb-10">
                                                <label for="inv_group">Group : *</label>
                                                <select class="form-control custom-select d-block w-100 inv_group"  runat="server" id="inv_group">
                                                    <option data-group="SHOW" value="0">Select...</option>
                                                    <option data-group="SHOW" value="add">Add New </option>
                                                  <%--  <option>Goods</option>
													<option>Sales</option>--%>
                                                </select>
                                            </div>
											
											<div class="col-md-4 form-group">
                                                <label for="firstName">Product Name : *</label>
                                                <input class="form-control product_name_class" runat="server" id="inv_product_name" placeholder="" value="" type="text" onkeydown="upperCaseF(this)">
                                            </div>
                                            
											</div>
											
											<div class="row">
                                            <div class="col-md-4 mb-10" id="inv_unit_measurement_div">
                                                <input type="radio" runat="server" id="rbtn_primuom_id" name="rbtn_name" value="0" checked/> - <label for="firstounitmesure">Primary Unit Of Measurement :</label> 
                                                <select class="form-control custom-select d-block w-100 inv_unit_measurement_class" runat="server" id="inv_unit_measurement">
                                                    <option value="">Select...</option>
                                               <%--     <option>BAG-BAGS</option>
													<option>BAL-BALE</option>
													<option>BDL-BUNDLES</option>
													<option>BKL-BUCKLES</option>
													<option>BOU-BILLION OF UNITS</option>
													<option>BOX-BOX</option>
													<option>BTL-BOTTLES</option>
													<option>BUN-BUNCHES</option>
													<option>CAN-CANS</option>
													<option>CBM-CUBIC METERS</option>
													<option>CCM-CUBIC CENTIMETERS</option>
													<option>CMS-CENTIMETERS</option>
													<option>CTN-CARTONS</option>
													<option>DOZ-DOZENS</option>
													<option>DRM-DRUMS</option>
													<option>GGK-GREAT GROSS</option>
													<option>GMS-GRAMMES</option>
													<option>GRS-GROSS</option>
													<option>GYD-GROSS YARDS</option>
													<option>KGS-KILOGRAMS</option>
													<option>KLR-KILOLITRE</option>
													<option>KME-KILOMETRE</option>
													<option>MLT-MILILITRE</option>
													<option>MTR-METERS</option>
													<option>MTS-METRIC TON</option>
													<option>NOS-NUMBERS</option>
													<option>PAC-PACKS</option>
													<option>PCS-PIECES</option>
													<option>PRS-PAIRS</option>
													<option>QTL-QUINTAL</option>
													<option>ROL-ROLLS</option>
													<option>SET-SETS</option>
													<option>SQF-SQUARE FEET</option>
													<option>SQM-SQUARE METERS</option>
													<option>SQY-SQUARE YARDS</option>
													<option>TBS-TABLETS</option>
													<option>TGM-TEN GROSS</option>
													<option>THD-THOUSANDS</option>
													<option>TON-TONNES</option>
													<option>TUB-TUBES</option>
													<option>UGS-US GALLONS</option>
													<option>UNT-UNITS</option>
													<option>YDS-YARDS</option>
													<option>OTH-OTHERS</option>--%>
													
                                                </select>
                                            </div>

                                            <div class="col-md-4 form-group" id="inv_secounitmesure_id_div">
                                                <input type="radio" runat="server" id="rbtn_secouom_id" name="rbtn_name" value="1"/> - <label for="secounitmesure">Secondary Unit Of Measurement :</label>
                                                <%--<input type="checkbox" id="chk_secouom_id" onclick="$('[id*=rbtn_primuom_id]').prop('checked', false);"/>--%>
                                                <input class="form-control" runat="server" id="secounitmesure_id" placeholder="" value="" type="text" onkeydown="upperCaseF(this)"/>
                                            </div>

                                            <div class="col-md-4 form-group" id="inv_convfactor_id_div">
                                                <label for="convfactor">Conversion Factor : </label>
                                                <input class="form-control" runat="server" id="convfactor_id" placeholder="" value="" type="text" />
                                            </div>
                                         </div>
                                                <div class="row">
											<div class="col-md-4 form-group">
                                                <label for="firstName">HSN / SAC Code :</label>
                                                <input class="form-control inv_hsn_sac_code_class" runat="server" id="inv_hsn_sac_code" placeholder="" value="" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                            <a target="_blank" href="https://cbic-gst.gov.in/gst-goods-services-rates.html">Search Here..</a>
											</div>

                                                 <div class="col-md-4 form-group" id="inv_gst_rate_div">
                                                <label for="inv_gst_rate">GST Rate :</label>
                                                <input class="form-control" runat="server" id="inv_gst_rate" placeholder="" value="" type="text">
                                            </div>
											                                            
											<div class="col-md-4 form-group" id="mrp_id_div">
                                                <label>MRP :</label>
                                                <input class="form-control" runat="server" id="mrp_id" placeholder="" type="text">
                                            </div>
                                            </div>
                                            <div class="row">
                                            <div class="col-md-3 form-group" id="salePriceGst_id_div">
                                                <label>Sale Price Without GST :</label>
                                                <input class="form-control" runat="server" id="salePriceGst_id" value="0.00" type="text">
                                             </div>
                                               
                                            <div class="col-md-3 form-group" id="qty_id_div">
                                                <label for="inv_recorder_level">Opening Quantity :</label>
                                                <input class="form-control qty_class" runat="server" id="qty_id" value="0.00" type="text" readonly>
                                            </div>
											
											<div class="col-md-3 form-group" id="pur_price_unit_id_div">
                                                <label>Purchase Price Per Unit :</label>
                                                <input class="form-control pur_price_unit_class" value="0.00" runat="server" id="pur_price_unit_id" type="text" readonly>
                                            </div>
											
											<div class="col-md-3 form-group" id="amount_id_div">
                                                <label for="inv_minimum_stock_reminder">Opening Amount :</label>
                                                <input class="form-control amount_class" runat="server" id="amount_id" type="text" value="0.00" readonly>
                                            </div>
                                           </div>
                                    <div class="row">
											<div class="col-md-4 form-group" id="recorder_level_div">
                                                <label for="inv_recorder_level">Re-order Level</label>
                                                <input class="form-control" runat="server" id="inv_recorder_level" placeholder="" value="0.00" type="text">
                                            </div>
											
											<div class="col-md-4 form-group" id="recorder_quantity_div">
                                                <label for="inv_recorder_quantity">Re-order Quantity</label>
                                                <input class="form-control" runat="server" id="inv_recorder_quantity" placeholder="" value="0.00" type="text">
                                            </div>
											
											<div class="col-md-4 form-group" id="minimum_stock_reminder_div">
                                                <label for="inv_minimum_stock_reminder">Minimum Stock Reminder</label>
                                                <input class="form-control" runat="server" id="inv_minimum_stock_reminder" placeholder="" value="0.00" type="text">
                                            </div>
                                           </div>
                                    <hr class="hr-light-30 mt-10" style="border-width:30px">
                                    <label>In the case of multiple batch in the Opening Stock-Enter Opening balance here for batchwise details </label>
                                           <div class="row">
                                            <div class="col-md-4 form-group" id="expiry_date_id_div">
                                                <label>Expiry Date :</label>
                                                <input type="date" runat="server" id="expiry_date_id" class="form-control expiry_date_class" style="width: 95%" value="0001-01-01"/>
                                            </div>                                 
                                            <div class="col-md-4 form-group" id="Batch_id_div">
                                                <label>Batch :</label>
                                                <input class="form-control batch_class" runat="server" id="Batch_id" type="text" onkeydown="upperCaseF(this)">
                                            </div>
                                            
                                            </div>
											<div class="row">
                                            <div class="col-md-4 form-group">
                                                <label for="inv_recorder_level">Opening Quantity :</label>
                                                <input class="form-control quantity_class" runat="server" id="Text1" value="0.00" type="text" onchange="$('.amt_class').val(''); calculation()">
                                            </div>
											<div class="col-md-4 form-group">
                                                <label>Purchase Price Per Unit :</label>
                                                <input class="form-control purpriceunit_class" value="0.00" runat="server" id="Text2" type="text"  onchange="$('.amt_class').val(''); calculation()">
                                            </div>
											
											<div class="col-md-4 form-group">
                                                <label for="inv_minimum_stock_reminder">Opening Amount :</label>
                                                <input class="form-control amt_class" runat="server" id="Text3" type="text" onchange="calculation()" value="0.00">
                                            </div>
                                        <div class="row">
                                            <div class="col-md-4 form-group">
                                                </div>
                                            <div class="col-md-4 form-group">
                                                <input class="btn btn-primary" value="Add" runat="server" type="button" onclick="AddRecordTable()">
                                            </div>
                                         </div>
										</div>
                                       
                                    <table id="addTable_id" class="table bordered">
                                        <thead>
                                            <tr>
                                                <th>Expiry Date </th>
                                                <th>Batch </th>
                                                <th>Opening Quantity </th>
                                                <th>Purchase Price Per Unit </th>
                                                <th>Opening Amount </th>
                                                <th>Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                       <hr>
                                      <asp:Button runat="server" class="btn btn-primary" type="submit" id="submit_stock_details" text="Submit" OnClick="submit_stock_details_even" data-toggle="tooltip-dark" data-placement="top" title="Save Stock"/>
                                      <asp:Button runat="server" class="btn btn-light" type="submit" id="btnCancel" text="Cancel" OnClick="cancel_event" data-toggle="tooltip-dark" data-placement="top" title="Leave Page"/>
							   </div>
                        </section>
                    </div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->
                        <div class="modal fade new_group_modal" id="" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title"></h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                   <div class="col-md-6 form-group">
                                                        <label for="new_group_name" id="lblGroupMsg"></label>
                                                        <input class="form-control new_group_name_class" runat="server"  placeholder="" value="" type="text" id="new_group_name" name="new_group_name">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" class="btn btn-primary" type="submit" id="new_group" text="Save" OnClick="add_new_group" />
                                                    <%--<button type="button" runat="server" class="btn btn-primary" OnClick="submit_account_details_event">Save changes</button>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
    <div style="position:absolute;z-index: -1;">
         <input type="text" name="hdnJson" style="visibility:hidden" ID="txthdnJson" class="txthdn_Json" runat="server" />
    </div>
    <script>

  document.onkeydown = function(event){
    if (event.altKey && event.keyCode == 83) //ALT+S
    {
        $('#<%=submit_stock_details.ClientID%>').click();
    }
  };

        window.onload = function () {
            
            $(".select2").select2();
            $('.inv_group').on('change', function (e) {
                if ($(this).val() == "add") {
                    $(".modal-title").html("Add Group");
                    $(".modal-footer").show();
                    $("#lblGroupMsg").html("Group Add");
                    $(".new_group_name_class").show();
                    $(".new_group_modal").modal('show');
                    //$(".new_group_modal").modal();
                }
            });

            if ($('.inv_nature_operation_class').val() == "2") {
                $("[id*=inv_unit_measurement_div]").hide();
                $("[id*=inv_secounitmesure_id_div]").hide();
                $("[id*=inv_convfactor_id_div]").hide();
                $("[id*=mrp_id_div]").hide();
                $("[id*=salePriceGst_id_div]").hide();
                $("[id*=expiry_date_id_div]").hide();
                $("[id*=Batch_id_div]").hide();
                $("[id*=qty_id_div]").hide();
                $("[id*=pur_price_unit_id_div]").hide();
                $("[id*=amount_id_div]").hide();
                $("[id*=recorder_level_div]").hide();
                $("[id*=recorder_quantity_div]").hide();
                $("[id*=minimum_stock_reminder_div]").hide();
            } else {
                $("[id*=inv_unit_measurement_div]").show();
                $("[id*=inv_secounitmesure_id_div]").show();
                $("[id*=inv_convfactor_id_div]").show();
                $("[id*=mrp_id_div]").show();
                $("[id*=salePriceGst_id_div]").show();
                $("[id*=expiry_date_id_div]").show();
                $("[id*=Batch_id_div]").show();
                $("[id*=qty_id_div]").show();
                $("[id*=pur_price_unit_id_div]").show();
                $("[id*=amount_id_div]").show();
                $("[id*=recorder_level_div]").show();
                $("[id*=recorder_quantity_div]").show();
                $("[id*=minimum_stock_reminder_div]").show();
            }

            if ($('[id*=breadcrumb_title]').text() == "Update Stock") {
                
                updateval('<%=json_purchase_dtl %>');

            }
           
            settingsCheck();
        }

        function settingsCheck() {
            
            var jsonSettings = '<%=json_setting_obj %>';
            var p_json_obj = JSON.parse(jsonSettings);
            var count = JSON.parse(jsonSettings).length;
            for (var i = 0; i < count; i++){
                
                if (p_json_obj[i]['batch_wise_details_tax_invoice'] == "1") {
                    $("#Batch_id_div").show();
                    $(".batch_td_class").show();
                    $('td:nth-child(2),th:nth-child(2)').show();
                   
                } else {
                    $("#Batch_id_div").hide();
                    $(".batch_td_class").hide();
                    $('td:nth-child(2),th:nth-child(2)').hide();
                }
                
                if (p_json_obj[i]['expiry_details_tax_invoice'] == "1") {
                    $("#expiry_date_id_div").show();
                    $(".expDate_td_class").show();
                    $('td:nth-child(1),th:nth-child(1)').show();                    
                } else{
                    $("#expiry_date_id_div").hide();
                    $(".expDate_td_class").hide();
                    $('td:nth-child(1),th:nth-child(1)').hide();
                }                
            }
        }

     function upperCaseF(a) {
         setTimeout(function () {
             a.value = a.value.toUpperCase();
         }, 1);
     }

    function calculation() {
          var qty = $(".quantity_class").val() ? $(".quantity_class").val() : 0;
          var pur_price =($(".purpriceunit_class").val())?$(".purpriceunit_class").val() :0;
          var amt = $(".amt_class").val()?$(".amt_class").val():0;
            
          if (amt == "" && pur_price != "" && qty != "") {
              $(".amt_class").val(convert_number(qty) * convert_number(pur_price));
          } else if (amt != "" && pur_price == "" && qty != "") {
              $(".purpriceunit_class").val(convert_number(amt)/convert_number(qty));
          } else if (amt != "" && pur_price != "" && qty == "") {
             $(".quantity_class").val(convert_number(amt) / convert_number(pur_price));
          }
    }

        function showModal() {
            $(".modal-title").html("Warning");
            $(".modal-footer").hide();
            $("#lblGroupMsg").html("Stock Item Already Exist...!!!");
            $(".new_group_name_class").hide();
            $(".new_group_modal").modal('show');
        }

        function AddRecordTable() {
            
            $('#addTable_id> tbody:last').append('<tr>'+
                    '<td class="expDate_td_class" style="border:1px solid!important;">'+ $(".expiry_date_class").val() +'</td>'+ 
                    '<td class="batch_td_class" style="border:1px solid!important;">'+ $(".batch_class").val()  +'</td>'+ 
                    '<td class="qty_td_class" style="border:1px solid!important;">'+ $(".quantity_class").val()+'</td>'+
                    '<td class="purpriceunit_td_class" style="border:1px solid!important;">'+ convert_number($(".purpriceunit_class").val()) +'</td>'+
                    '<td class="amt_td_class" style="border:1px solid!important;">' + convert_number($(".amt_class").val()) + '</td>' +
                    '<td style="border:1px solid!important;"><i class="fa fa-pencil" style="font-size:15px;color:#17a2b8;padding: 10px;" aria-hidden="true" onclick="editRow(this), removeRow(this)"></i><i class="fa fa-close" name="record" style="font-size:15px;color:red" aria-hidden="true" onclick="removeRow(this)"></i>' +
                    '</tr>'               
            ); 
            settingsCheck();
            calculate();
            $(".expiry_date_class").val("0001-01-01");
            $(".batch_class").val("");
            $(".quantity_class").val("0.00");
            $(".purpriceunit_class").val("0.00");
            $(".amt_class").val("0.00");
        }

        
        function calculate() {
            var sum_of = 0.0;

            $('#addTable_id tbody tr').each(function (row, tr) {
                var $input = $(this);
                var $row = $input.closest('tr');
            });

            $(".qty_td_class").each(function (index) {
                sum_of= sum_of+ parseFloat($(this).text());
            });
            $(".qty_class").val("" + convert_number(sum_of));

            sum_of = 0.0;
            $(".amt_td_class").each(function (index) {
                sum_of = sum_of+ parseFloat($(this).text());
            });
            $(".amount_class").val("" + convert_number(sum_of));
           
            sum_of = 0.0;
            $(".purpriceunit_td_class").each(function (index) {
                sum_of = parseFloat($(".amount_class").val()) / parseFloat($(".qty_class").val());
            });
            $(".pur_price_unit_class").val("" + convert_number(sum_of));            
        }

        function editRow(row) {
            var tr = $(row).parents("tr");
           
            $(".expiry_date_class").val($(tr).find('td:eq(0)').text());
            $(".batch_class").val($(tr).find('td:eq(1)').text());
            $(".quantity_class").val($(tr).find('td:eq(2)').text());
            $(".purpriceunit_class").val($(tr).find('td:eq(3)').text());
            $(".amt_class").val($(tr).find('td:eq(4)').text());
        }

        function removeRow(row) {
            
            var tr = $(row).parents("tr");
            $(row).parents("tr").remove();
            calculate();
        }

        function updateval(data) {
            
            jsonPurchase = data;
            var p_json_obj = JSON.parse(jsonPurchase);
            var count = JSON.parse(jsonPurchase).length;
            
            for (var i = 0; i < count; i++) { 
                $(".expiry_date_class").val(p_json_obj[i]['expiry_date']);
                $(".batch_class").val(p_json_obj[i]['batch']);
                $(".quantity_class").val(p_json_obj[i]['qty']);
                $(".purpriceunit_class").val(p_json_obj[i]['rate']);
                $(".amt_class").val(p_json_obj[i]['amount']);

                AddRecordTable();            
            }            
        }

         $('#<%=submit_stock_details.ClientID%>').click(function () {
            
          var JSONObject = new Array();
           $('#addTable_id tbody tr').each(function(row, tr){
               var values = {};
               
                    values.product_desc =  $(".product_name_class").val();
                    values.hsn_code =  $(".inv_hsn_sac_code_class").val();
                    values.uom = $(".inv_unit_measurement_class").val();
                    values.batch = $(tr).find('td:eq(1)').text();
                    values.expiry_date = $(tr).find('td:eq(0)').text();                    
                    values.qty = $(tr).find('td:eq(2)').text();
                    values.rate = $(tr).find('td:eq(3)').text();
                    values.amount = $(tr).find('td:eq(4)').text();
                    values.invoice_type = "stock";
                    JSONObject.push(values);
           });            
                var json_str = JSON.stringify(JSONObject); 
                $(".txthdn_Json").val(json_str);
        });



    </script>

</asp:Content>