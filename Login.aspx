<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- //bootstrap-css -->
    <!-- Custom CSS -->
    <link href="src/css/style.css" rel='stylesheet' type='text/css' />
    <link href="src/css/style-responsive.css" rel="stylesheet" />
    <!-- font CSS -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
        rel='stylesheet' type='text/css'>
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="src/css/font.css" type="text/css" />
    <link href="src/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <script src="src/js/jquery2.0.3.min.js"></script>
</head>
<body>
    <div class="log-w3">
        <div class="w3layouts-main">
            <h2>
                Sign In Now</h2>
            <form id="form1" runat="server">
            <asp:TextBox ID="TextBox1" runat="server" class="ggg" placeholder="E-MAIL"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Please enter name" ControlToValidate="TextBox1" Display="Dynamic" 
                ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox2" runat="server" class="ggg" name="Password" 
                placeholder="PASSWORD" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Please enter password" ControlToValidate="TextBox2" 
                Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <span>
                <input type="checkbox" />Remember Me</span>
            <h6>
                <a href="#">Forgot Password?</a></h6>
            <div class="clearfix">
            </div>
            <asp:Button ID="Button1" runat="server" Text="SIGN IN" 
                OnClick="Button1_Click" />
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <p>
                Don't Have an Account ?<a href="Registration.aspx">Create an account</a></p>
            </form>
        </div>
    </div>
    <script src="src/js/bootstrap.js"></script>
    <script src="src/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="src/js/scripts.js"></script>
    <script src="src/js/jquery.slimscroll.js"></script>
    <script src="src/js/jquery.nicescroll.js"></script>
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="src/js/flot-chart/excanvas.min.js"></script><![endif]-->
    <script src="src/js/jquery.scrollTo.js"></script>
</body>
</html>
