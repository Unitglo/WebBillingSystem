<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="WebBillingSystem.Updates" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
        <style>
             
        .button{
            outline:none;
          
        }
        .active1{
           font-size:0;
           width:50px;
           height:50px;
           border-radius:50px;
           border-left-color:transparent;
            animation:rotate 1.4s ease 0.5s infinite;
        }
      @keyframes rotate {
  0% { transform: rotate(360deg); }
  
}
    </style>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".button").click(function () {
                    $(this).addClass("active1");
                })
            })
        </script>
<br><br>
    <div class="container">
        <div class="hk-pg-header">
                            <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-align-left"><line x1="17" y1="10" x2="3" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="17" y1="18" x2="3" y2="18"></line></svg></span></span><b class ="version_text"></b></h4>
        </div>
    
        <br>
    <div class=" cal-sm">
<br>        <asp:Button ID="Button2" class="button update_button" runat="server" Text="Updates Available" OnClick="Button2_Click" />
<br>    <asp:Label runat="server" ID="lbdw" ></asp:Label>
 <br>       <asp:Label runat="server" ID="lbex" ></asp:Label>
    </div>
</div>
    
<script>
    $(document).ready(function () {
        
        setTimeout(function () {
          //  console.log($("version").html());
       $(".version_text").html("Current system version is : - "+$("version").html());
            display();
        }, 500);
    });
    function display() {
                $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            url: "http://pms.unitglo.com/version.php",
            data: {"vesion":""+$("version").html()},
            dataType: "json",
            success: function (data) {
                    if (data.status == 1) {
                        $('.update_button').prop('disabled', false);
                        $('.update_button').val(data.message);
                    } else { 
                        $('.update_button').prop('disabled', true);
                        $('.update_button').val(data.message);
                    }
             }
        });
    }
</script>     
</asp:Content>
