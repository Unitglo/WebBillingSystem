<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="WebBillingSystem.Updates" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;
        
    <asp:Label runat="server" ID="lbdw" ></asp:Label>
        <asp:Label runat="server" ID="lbex" ></asp:Label>

&nbsp;<header>
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
        <script src="/Assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
               <script src="/Assets/vendors/jquery/dist/jquery.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".button").click(function () {
                    $(this).addClass("active1");
                })
            })
        </script>
    </header>
   
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



     
&nbsp;
        <asp:Button ID="Button2" class="button" runat="server" Text="Updates Available" OnClick="Button2_Click" />

    
<script>
    $(document).ready(function () {
        
        setTimeout(function () {
            console.log($("version").html());
            display();
          
        }, 500);
    });
    function display() {
        $.ajax({
            url: 'http://pms.unitglo.com/version.php',
            method: 'post',
            data:JSON.stringify(status),
            contentType: 'application/json',
            success: function (status) {
                if (status == 1) {
                    //    $('input [id="#Button2"]').attr('disabled', false);
                    alert("Update required")
                $('#Button2').prop('disabled', false);
            
               // window.location("Update required");
                }
                else (status == 0)
                $('#Button2').prop('disabled', true);
                alert("Update not required")
             }
        });
    }
</script>     
</asp:Content>
