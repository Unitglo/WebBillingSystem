<%@ Page Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="JournalBook.aspx.cs" Inherits="WebBillingSystem.JournalBook" %>
<asp:Content id="Content1" ContentPlaceHolderid="ContentPlaceHolder1" runat="server">
<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">--%>
   <style>
      tr, td {
           padding: 0px !important;
       }
      tr, th {
          padding-top:3px !important;
          padding-bottom:3px !important;
      }
      .table th, td {
            font-size: 14px;
        }

       label {
             margin-bottom: 0px;
       }
       .card.card-sm .card-body {
             padding: 0.5rem;
       }
       
   </style>
<div>
     <!-- Breadcrumb -->
   <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Report</a></li>
                    <li runat="server" class="breadcrumb-item active" aria-current="page" id="breadcrumb_title">Journal Book</li>
                </ol>
            </nav>
    <!-- /Breadcrumb -->
    <div class="container">
        <!-- Title -->
        <div class="hk-pg-header mb-10">
            <div>
                <h4 class="hk-pg-title" runat="server" id="Header_ID"><span class="pg-title-icon"><span class="feather-icon"><i data-feather="book"></i></span></span>Journal Book</h4>
                <%--<br />Company Name :- <b> <label id="lblcomp" runat="server"></label></b>--%>
            </div>
        </div>
        <!-- /Title -->

        <!-- start row -->
        <div class="row">
           <div class="col-xl-12">
            <section class="bg-light hk-sec-wrapper">

                <div class="row">
                   <div class="col-sm">
                      <div class="row">
                         <div class="col-md-4 form-group">
                              <label>From Date :</label>
                            <input type="date" runat="server" class="form-control from_date_class"  id="from_date_id" />
                          </div>
                          <div class="col-md-4 form-group">
                              <label>To Date :</label>
                            <input type="date" runat="server" class="form-control to_date_class"  id="to_date_id"/>
                          </div>                          
                     <div class="col-md-4 form-group">
                         <br />
                       <asp:LinkButton runat="server" ID="linkbtnSearch" OnClick="search_jv_details_event" class="btn btn-light"><i class="fa fa-search" style="font-size: 20px;"></i></asp:LinkButton>
                       &nbsp;<button id="btnExport" value="Excel" class="btn btn-light"><i class="fa fa-file-excel-o" style="font-size:20px;color:forestgreen"></i></button>
                       &nbsp;<button id="btnPDF" class="btn btn-light" onclick="ExportPdf()"><i class="fa fa-file-pdf-o" style="font-size:20px;color:red"></i></button>
                       &nbsp;<button id="btnWordDoc" class="btn btn-light" value="Word" data-toggle="tooltip-dark" data-placement="top" title="Export To Word Document" onclick="Export2Doc('div_export_id', 'word-content-journal-book');"><i class="fa fa-file-word-o" style="font-size: 20px;color:blue"></i></button>
                     </div>
                    </div>
                  </div>
                </div>

                 <div  class="row">
                          
                           <div class="col-md-3 form-group">
                           &nbsp;<input type="checkbox" id="chk_display_narration_id" class="chk-details-control" style="width: 15px; height: 15px;"/>&nbsp; : <label>Note</label>
                               </div>
                       </div>

               <div id="editor"></div>
                <div id="div_export_id">
                <hr class="mt-0"/>
                         <div style="text-align:center; margin-bottom: 10px;">
                             <h4 id="company_name_id" runat="server"></h4>
                         </div>
                         <div class="row">
                         
                         <div class="col-lg-12" style="padding-right: 0px; padding-left: 0px;">
						    <div class="card-group hk-dash-type-2">
                                    <div class="card card-sm">
										<div class="card-body bg-light">
                                            <table>
                                                <tr><td> Address  -</td></tr>
                                                    <tr><td> <label runat="server" id="address_id" style="font-size: 14px;"></label></td></tr>
                                            </table>
										</div>
									</div>

                                    <div class="card card-sm">
										<div class="card-body bg-light ">
                                            <table>
                                                <tr><td>GSTIN No </td><td> - <label runat="server" id="gstin_id"></label></td> </tr>
                                                <tr><td>State </td><td> - <label runat="server" id="state_id"></label></td></tr>
                                                <tr><td>State Code </td><td> - <label runat="server" id="statecode_id"></label></td></tr>
                                            </table>
										</div>
									</div>
								
									<div class="card card-sm">
										<div class="card-body bg-light ">
                                            <table>
                                                <tr><u>Report Date</u></tr>
                                                <tr><td>From Date </td><td> - <label runat="server" id="fr_date_id"></label></td></tr>
                                                <tr><td>To Date </td><td> - <label runat="server" id="todate_id"></label></td></tr>
                                            </table>
										</div>
									</div>                                    
								</div>
                            </div>
                         </div> 
                         <div style="text-align:center; margin-bottom: 10px;">
                             <h2 style="margin: 2.5px;">Day Book</h2>
                         </div>
                         
                  <div class="row">
                    <div class="col-sm-12">    
                        <!-- start Table -->
                        <table id="journalBookTable" class="table table-striped table-hover w-100 display no-footer dtr-inline border border-dark table-responsive" role="grid">
                            <thead>
						        <tr style="text-align:center;">
                                    <th style="border: 2px solid;">Action</th>                                    
                                    <th style="border: 2px solid;">Date</th>                                    
                                    <th style="border: 2px solid; text-align:center;">Vouchers No</th>
							        <th style="border: 2px solid;">Voucher Type</th>							        
							        <th style="border: 2px solid;">No</th>
                                    <th style="border: 2px solid;">Particulars</th>
                                    <th style="border: 2px solid;">Debit Amount</th>
							        <th style="border: 2px solid;">Credit Amount</th>
                                 </tr>
                              </thead>						   
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
   <style>
       tbody{
           position: relative; overflow: auto; max-height: 450px; width: 100%;
       }
       .table {
             height: 500px;
        }
        th td {
            text-align: center;
        }
       .btn {
           padding: 0!important;
       }
    #journalBookTable tbody tr td {
        height: 1px;
        max-height: 1px;
        text-align: center;
        }
    .particular_class {
        text-align: left;
    }

    </style>
    
     <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    
    <%--<script src="https://kendo.cdn.telerik.com/2017.2.621/js/jquery.min.js"></script>--%>
 <script src="https://kendo.cdn.telerik.com/2017.2.621/js/jszip.min.js"></script>
 <script src="https://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous">
    </script>
</div>

            <script language='javascript'>

                     window.onload = function () {  
                         account_details_display(); 
                         $( ".dataTables_scrollHeadInner .table" ).removeClass( "table-responsive" );
                         
                     };

                     function account_details_display() {

                         $('#journalBookTable thead tr').clone(true).appendTo('#journalBookTable thead');
                         $('#journalBookTable thead tr:eq(1) th').each(function (i) {                            
                             var title = $(this).text();
                             $(this).html('<input type="text" class="search_class class_'+ title +'"/>');
                             $('input', this).on('keyup change', function () {
                                 if (table.column(i).search() !== this.value) {
                                     table
                                         .column(i)
                                         .search(this.value)
                                         .draw();
                                 }
                             });
                         });


                         var jsonString = '<%=json_journal_book_obj %>'; //for testing
                         if (jsonString != '') {
                             jsonString = JSON.parse(jsonString);
                         }

                             var table = $('#journalBookTable').DataTable({                                  
                                 data: jsonString,
                                 autoWidth: false,
                                 paging: false, 
                                 //scrollY: "500px",
                                 scrollX: true,
                                 //bSortable: false,
                                 //bFilter: false, 
                                 //bInfo: false,
                                 fixedColumns:   {
                                     heightMatch: 'none'
                                 },

                                 language: {
                                      search: "",
                                     searchPlaceholder: "Search",
                                     sLengthMenu: "_MENU_items"
                                 },

                                 columns: [
                                     { "data": "edit_button" },
                                     { "data": "jv_date" },
                                     { "data": "journal_id" },
                                     { "data": "master_id_type" },                                     
                                     { "data": "vou_no" },
                                     { "data": "particular_name"},
                                     { "data": "debit_amount" },
                                     { "data": "credit_amount" }
                                 ]
                             });
                         $('#journalBookTable tbody tr').find("td:eq(5)").css( "text-align", "left" );
                         $('#journalBookTable tbody tr').find("td:eq(6)").css( "text-align", "right" );
                         $('#journalBookTable tbody tr').find("td:eq(7)").css("text-align", "right");
                         $('.dataTables_filter').css("text-align","right");
                         $( ".dataTables_scrollHeadInner .table" ).removeClass( "table-responsive" );

                         // Narration onclick hide and show
                            $('#chk_display_narration_id').on('click', function () {
                                
                                if ($('#chk_display_narration_id').prop('checked') == false) {
                
                                      table.rows().every(function () {
                                            // If row has details expanded
                                             if (this.child.isShown()) {
                                                 // Collapse row details
                                                 this.child.hide();
                                                 $(this.node()).removeClass('shown');
                                             }
                                         });
                                     } else {                
                                         // Enumerate all rows
                                         table.rows().every(function () {
                                             
                                             // If row has details collapsed
                                             if (!this.child.isShown()) {
                                                 // Open this row
                                                 this.child(format(this.data())).show();
                                                 $(this.node()).addClass('shown');
                                             }
                                         });
                                         $('#AccountLedgerTable tbody tr:eq(1)').remove();
                                     }
                                
                            });

                         $(".class_Action").css("width", "30px");
                         $(".class_Date").css("width", "50px");
                         $(".class_Vouchers").css("width", "30px");
                         $(".class_Voucher").css("width", "50px");
                         $(".class_No").css("width", "20px");
                         $(".class_Perticulars").css("width", "100px");
                         $(".class_Debit").css("width", "50px");
                         $(".class_Credit").css("width", "50px");
                     }


                function format(d) {
                    var jsonStringDtl = '<%=json_journal_book_note_obj %>';
                    if (jsonStringDtl != '') {
                        
                        jsonStringDtl = JSON.parse(jsonStringDtl);
                        var name_val = '<div style="text-align: start;">';
                            jsonStringDtl.forEach(function (key, index) {
                                if (key.journal_id == d.journal_id) {                                   
                                    name_val += '<label style="font-weight: bold;">'+ key.note + '</label>';
                                }
                                
                           });
                               return name_val+'</div>';
                    }
                }

    $("#btnExport").click(function (e) {
        $('#journalBookTable tbody tr').find("td:eq(0)").remove();
        $('#journalBookTable thead tr').find("th:eq(0)").remove();
        $(".dataTables_scrollHead").remove();
        $('#journalBookTable thead tr:eq(0)').css("height","30px");
        $('#journalBookTable thead').find("tr:eq(1)").remove();

           window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id=div_export_id]').html()));
        e.preventDefault();

        location.reload(true);
    });
    
    function Export2Doc(element, filename = '') {
        $('#journalBookTable tbody tr').find("td:eq(0)").remove();
        $('#journalBookTable thead tr').find("th:eq(0)").remove();
        $(".search_class").remove();
        $(".dataTables_scrollHead").remove();

        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Journal Book</title></head><body style='text-align:center'>";
        var postHtml = "</body></html>";
        var html = preHtml + document.getElementById(element).innerHTML + postHtml;
        
        var blob = new Blob(['\ufeff', html], {
            type: 'application/msword'
        });

        // Specify link url
        var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);

        // Specify file name
        filename = filename ? filename + '.doc' : 'document.doc';

        // Create download link element
        var downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if (navigator.msSaveOrOpenBlob) {
            navigator.msSaveOrOpenBlob(blob, filename);
        } else {
            // Create a link to the file
            downloadLink.href = url;

            // Setting the file name
            downloadLink.download = filename;

            //triggering the function
            downloadLink.click();
        }

        document.body.removeChild(downloadLink);
    }
            
    function ExportPdf() {
        $('#journalBookTable thead').find("tr:eq(1)").remove();
        $('#journalBookTable tbody tr').find("td:eq(0)").remove();
        $('#journalBookTable thead tr').find("th:eq(0)").remove();
        $(".dataTables_scrollHead").remove();

                    kendo.drawing
                     .drawDOM("#div_export_id", 
                    { 
                        paperSize: "A4",
                        margin: { top: "1cm", bottom: "1cm" },
                        scale: 0.6,
                        height: 500
                    })
                        .then(function(group){
                        kendo.drawing.pdf.saveAs(group, "Exported.pdf")
                    });
                }
                
    </script>

  <%--</form>
 </body>
</html>--%>
    </asp:Content>
