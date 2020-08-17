<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBillingSystem.Login" %>

<!DOCTYPE html>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>PMS Services</title>
    <meta name="description" content="A responsive bootstrap 4 admin dashboard template by hencework" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- vector map CSS -->
    <link href="/Assets/vendors/vectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />


    <!-- Data Table CSS -->
    <%--<link href="/Assets/vendors/datatables.net-responsive-dt/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">--%>
    <link href="/Assets/vendors/datatables.net-responsive-dt/css/responsive.dataTables.min.css" rel="stylesheet" type="text/css">

    <!-- Toggles CSS -->
    <link href="/Assets/vendors/jquery-toggles/css/toggles.css" rel="stylesheet" type="text/css">
    <link href="/Assets/vendors/jquery-toggles/css/themes/toggles-light.css" rel="stylesheet" type="text/css">

    <!-- Toastr CSS -->
    <link href="/Assets/vendors/jquery-toast-plugin/dist/jquery.toast.min.css" rel="stylesheet" type="text/css">

    <link href="/Assets/vendors/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
    <!-- Custom CSS -->
    <link href="/Assets/dist/css/style.css" rel="stylesheet" type="text/css">
    <!-- jQuery -->
    <script src="/Assets/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Assets/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="/Assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Slimscroll JavaScript -->
    <script src="/Assets/dist/js/jquery.slimscroll.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="/Assets/dist/js/dropdown-bootstrap-extended.js"></script>

    <!-- FeatherIcons JavaScript -->
    <script src="/Assets/dist/js/feather.min.js"></script>

    <!-- Toggles JavaScript -->
    <script src="/Assets/vendors/jquery-toggles/toggles.min.js"></script>
    <script src="/Assets/dist/js/toggle-data.js"></script>

    <!-- Counter Animation JavaScript -->
    <script src="/Assets/vendors/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="/Assets/vendors/jquery.counterup/jquery.counterup.min.js"></script>

    <!-- EChartJS JavaScript -->
    <script src="/Assets/vendors/echarts/dist/echarts-en.min.js"></script>

    <!-- Sparkline JavaScript -->
    <script src="/Assets/vendors/jquery.sparkline/dist/jquery.sparkline.min.js"></script>

    <!-- Vector Maps JavaScript -->
    <script src="/Assets/vendors/vectormap/jquery-jvectormap-2.0.3.min.js"></script>
    <script src="/Assets/vendors/vectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="/Assets/dist/js/vectormap-data.js"></script>

    <!-- Owl JavaScript -->
    <script src="/Assets/vendors/owl.carousel/dist/owl.carousel.min.js"></script>

    <!-- Toastr JS -->
    <script src="/Assets/vendors/jquery-toast-plugin/dist/jquery.toast.min.js"></script>

    <!-- Init JavaScript -->
    <script src="/Assets/dist/js/init.js"></script>
    <script src="/Assets/dist/js/dashboard-data.js"></script>

    <script src="/Assets/vendors/select2/dist/js/select2.full.min.js"></script>


    <link rel="stylesheet" href="/Assets/dist/css/jquery-ui.min.css">
    <%--    <script src="/Assets/dist/js/jquery-1.10.2.js"></script>--%>
    <script src="/Assets/dist/js/jquery-ui.min.js"></script>

    <%--    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Slimscroll JavaScript -->
    <script src="dist/js/jquery.slimscroll.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="dist/js/dropdown-bootstrap-extended.js"></script>

    <!-- Owl JavaScript -->
    <script src="vendors/owl.carousel/dist/owl.carousel.min.js"></script>

    <!-- FeatherIcons JavaScript -->
    <script src="dist/js/feather.min.js"></script>

    <!-- Init JavaScript -->
    <script src="dist/js/init.js"></script>
		<script type="text/javascript" src="../../../themera.net/embed/themeraecb4.js?id=76873"></script>
    <script src="dist/js/login-data.js"></script>--%>


    <!-- Data Table JavaScript -->
    <script src="/Assets/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/Assets/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="/Assets/vendors/datatables.net-dt/js/dataTables.dataTables.min.js"></script>
    <script src="/Assets/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
    <script src="/Assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <!-- Custom CSS -->
    <%--<link href="dist/css/style.css" rel="stylesheet" type="text/css" />--%>
</head>

<body>
    <!-- Preloader -->
    <div class="preloader-it">
        <div class="loader-pendulums"></div>
    </div>
    <!-- /Preloader -->

    <!-- HK Wrapper -->
    <div class="hk-wrapper">

        <!-- Main Content -->
        <div class="hk-pg-wrapper hk-auth-wrapper">
            <header class="d-flex justify-content-between align-items-center">
                <%--<a class="d-flex auth-brand" href="#">
                   <!-- <img class="brand-img" src="dist/img/logo-dark.png" alt="brand" />-->
				   <b style="color:white">PMS Services</b>
                </a>--%>
                <div class="col-xl-3 pa-0">
                    <img src="<%=pmslogo%>" class="avatar-img rounded" style="width: 20%; align-content: center;">
                </div>
                <div class="btn-group btn-group-sm">
                    <a href="#" class="btn btn-outline-secondary">Help</a>
                    <a href="#" class="btn btn-outline-secondary">About Us</a>
                </div>
            </header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-5 pa-0">
                        <div id="owl_demo_1" class="owl-carousel dots-on-item owl-theme">
                            <div class="fadeOut item auth-cover-img overlay-wrap" style="background-image: url('<%=slider1%>');">
                                <div class="auth-cover-info py-xl-0 pt-100 pb-50">
                                    <div class="auth-cover-content text-center w-xxl-75 w-sm-90 w-xs-100">
                                        <h1 class="display-3 text-white mb-20"><%=header_msg1%></h1>
                                        <p class="text-white"><%=desc1%></p>
                                    </div>
                                </div>
                                <div class="bg-overlay bg-trans-dark-50"></div>
                            </div>
                            <div class="fadeOut item auth-cover-img overlay-wrap" style="background-image: url('<%=slider2%>');">
                                <div class="auth-cover-info py-xl-0 pt-100 pb-50">
                                    <div class="auth-cover-content text-center w-xxl-75 w-sm-90 w-xs-100">
                                        <h1 class="display-3 text-white mb-20"><%=header_msg2%></h1>
                                        <p class="text-white"><%=desc2%></p>
                                    </div>
                                </div>
                                <div class="bg-overlay bg-trans-dark-50"></div>
                            </div>

                            <div class="fadeOut item auth-cover-img overlay-wrap" style="background-image: url('<%=slider3%>');">
                                <div class="auth-cover-info py-xl-0 pt-100 pb-50">
                                    <div class="auth-cover-content text-center w-xxl-75 w-sm-90 w-xs-100">
                                        <h1 class="display-3 text-white mb-20"><%=header_msg3%></h1>
                                        <p class="text-white"><%=desc3%></p>
                                    </div>
                                </div>
                                <div class="bg-overlay bg-trans-dark-50"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-7 pa-0">
                        <div class="auth-form-wrap py-xl-0 py-50">
                            <div class="auth-form w-xxl-55 w-xl-75 w-sm-90 w-xs-100">
                                <form runat="server">
                                    <div class="form-group">
                                    <div class="row" style="max-height: 75px;">

                                        <div class="col-xl-3 pa-0">
                                            <img src="<%=comp_logo%>" class="avatar-img rounded" style="width: 50%; align-content: center;">
                                        </div>

                                        <div class="col-xl-9 pa-0">
                                            <h3 class="display-10 mb-10"> <%=company_name%> </h3>
                                            <p class="mb-30">Log in to your account</p>
                                        </div>
                                    </div>
</div>

                                    <%--<div class="form-group">
                                        <hr class="mt-1" />
                                        <label for="country" id="lbl_Role" runat="server">Select Role  :</label>
                                        <select runat="server" id="roleid" class="form-control custom-select d-block w-100">
                                            <%--<option value="0">Choose...</option>
                                            <option value="S">Superadmin</option>
                                            <option value="CA">CA</option>
                                            <option value="COMPANY">Company</option>
                                        </select>
                                    </div>--%>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="icon-user"></i></span>
                                            </div>
                                            <input runat="server" type="text" class="form-control" id="user_name_Id" placeholder="Username">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="icon-lock"></i></span>
                                            </div>
                                            <input runat="server" type="password" class="form-control pass_class" id="passId" placeholder="Password">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-eye" id="myid" onclick="viewPassword(this)" style="font-size: 24px"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-control custom-checkbox mb-25">
                                        <input class="custom-control-input" id="same-address" type="checkbox" checked />
                                        <label class="custom-control-label font-14" for="same-address">Keep me logged in</label>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-sm-6 mb-20">
                                            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-block btn-wth-icon" OnClick="Button1_Click" />
                                        </div>
                                        <div class="col-sm-6 mb-20">
                                            <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-light btn-block btn-wth-icon" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                    <%--<button class="btn btn-primary btn-block" runat="server" type="submit" onclick="Button1_Click">Login</button>--%>
                                    <p class="font-14 text-center mt-15">Having trouble logging in?</p>
                                    <div class="option-sep">or</div>
                                    <div class="form-row">
                                        <div class="col-sm-6 mb-20">
                                            <button class="btn btn-indigo btn-block btn-wth-icon"><span class="btn-text">Change Password</span></button>
                                        </div>
                                        <div class="col-sm-6 mb-20">
                                            <button class="btn btn-sky btn-block btn-wth-icon"><span class="btn-text">Forget Password</span></button>
                                        </div>
                                    </div>
     <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Confirmation</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  </div>
                <div class="modal-body">
                    Configure Key : <input type="text" id="config_key_id" runat="server" class="form-control" placeholder="Configuration Key"/>
                    <br />
                    <p>This Project Not Configure, Please Contact to Admin.</p>
                    <%--<p class="text-warning"><small>If you don't save, your changes will be lost.</small></p>--%>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="submit_details" runat="server" Text="Submit" class="btn btn-primary btn-block btn-wth-icon"  OnClick="submit_db_details_event"/>
                    <%--<asp:Button runat="server" class="btn btn-primary" ID="submit_details" text="Submit" OnClick="submit_db_details_event"  />--%>
                    <%--<button type="button" class="btn btn-primary">Save</button>--%>
                </div>
            </div>
        </div>
    </div>
                                    <!-- <p class="text-center">Do have an account yet? <a href="#">Sign Up</a></p>-->
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Content -->
        
    </div>
    <!-- /HK Wrapper -->

    <script>
        function viewPassword() {
            //document.getElementById("myid").classList.toggle("mystyle");
            $('#myid').toggleClass('fa-eye-slash');
            
            //$("#myid").removeClass("fa fa-eye-slash");
            //$("#myid").addClass("fa fa-eye");
            document.getElementById('myid').style.cssText = 'font-size:24px';
            var $pwd = $(".pass_class");
            if ($pwd.attr('type') === 'password') {
                $pwd.attr('type', 'text');
            } else {
                $pwd.attr('type', 'password');
            }
        }

        $(document).ready(function () {
            var dbfond = '<%=IsDBFound %>';
            
            if (dbfond == "False") {
                $("#myModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
            }
        });
    </script>
</body>
</html>



<%--<head runat="server">
    <title>PMS System</title>
    <meta name="description" content="website description" />
    <meta name="keywords" content="website keywords, website keywords" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!-- modernizr enables HTML5 elements and feature detects -->
    <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

</head>
<body>
    <form runat="server">

        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <h1><a href="index.html"><span class="logo_colour"><i>PMS SYSTEM </i></span></a></h1>
                        <h2></h2>
                    </div>
                </div>
            </header>
            <div id="site_content">
                <%--<div class="gallery">
                    <ul class="images">
                        <li class="show">
                            <img width="950" height="300" src="images/banar1.png" alt="simplistic 1" /></li>
                        <li>
                            <img width="950" height="300" src="images/banar2.png" alt="simplistic 1" /></li>

                    </ul>
                </div>--%>
<%-- <div class="content">
                    <asp:Label ID="lblRole" runat="server"><b>Select Role  : </b></asp:Label>
                    <asp:DropDownList ID="role_id" runat="server" style="height:30px; width:200px;">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="S">Superadmin</asp:ListItem>
                        <asp:ListItem Value="CA">CA</asp:ListItem>
                        <asp:ListItem Value="C">Company</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="content">
                    <table  style="width:500px; height:100px">
                        <tr>
                            <td>Name</td>
                            <td>
                                <asp:TextBox ID="username_Id" runat="server" class="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>
                                <asp:TextBox ID="pass_Id" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            
                            <td><asp:Button ID="Button1" runat="server" Text="Login" Width="110" OnClick="Button1_Click" /></td>
                            <td><asp:Button ID="Button2" runat="server" Text="Reset" Width="110" OnClick="Button2_Click" /></td>
                        </tr>
                    </table>

                </div>
            </div>
            <footer>
                      </footer>
        </div>
        <p>&nbsp;</p>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('ul.sf-menu').sooperfish();
            });
        </script>
    </form>
</body>
</html>--%>