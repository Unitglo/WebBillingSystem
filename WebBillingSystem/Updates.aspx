<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainPage.Master" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="WebBillingSystem.Updates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;<Label ID="lbdw" runat="server" Text=""></Label>
        <Label ID="lbex" runat="server" Text=""></Label>
&nbsp;<header>
        <style>
             
        .button{
            outline:none;
          
        }
        .active{
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
                    $(this).addClass("active");
                })
            })
        </script>
    </header>
   
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <Button runat="server" Text="Updates Available " class="button" ID="Button1" OnClick="Button1_Click" >Updates Available</Button>


     
</asp:Content>
