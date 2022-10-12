<%@ Page Language="C#" AutoEventWireup="true" CodeFile="illlogin.aspx.cs" Inherits="illlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<meta charset="utf-8">
	<title>Form-v6 by Colorlib</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="illass/css/nunito-font.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="illass/css/style.css"/>
</head>
<body class="form-v6">
	<div class="page-content">
		<div class="form-v6-content">
			<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>
			<form id="Form1" runat="server" class="form-detail" action="#" method="post">
				<h2>Login Form</h2>
						<div class="form-row">
					
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Your Email" name="your_email" class="input-text" required></asp:TextBox>
				</div>
               			<div class="form-row">
					
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Password" name="password" class="input-text" 
                        required TextMode="Password"></asp:TextBox>
				</div>
                   <div>
                <asp:CheckBox ID="chme" runat="server" Text="Remember Me" ForeColor="#3399FF" />
                </div>
             				<div class="form-row-last">
                   <%-- <input type="submit" name="register" class="register" value="Register">--%>
                    <asp:Button ID="Button1" name="register" class="register" value="Register" runat="server" 
                                    Text="Login" onclick="Button1_Click" />  
                                 
				</div>
                  <div>
                <a href="forgetpass.aspx" style="color: #0000FF">Forget Your Password ?</a>
                </div>
     			<div class="form-row">
					
                     <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                         ForeColor="Red"></asp:Label>
				</div>
			</form>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
