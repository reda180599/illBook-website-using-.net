<%@ Page Language="C#" AutoEventWireup="true" CodeFile="illregister.aspx.cs" Inherits="illregister" %>

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
				<img src="images/iii1.jpg" alt="form">
			</div>
			<form runat="server" class="form-detail" action="#" method="post">
				<h2 style="color: #0000FF; font-style: italic; font-weight: bold;">Register Form In iLLBook</h2>
				<div class="form-row">
					<%--<input type="text" name="full-name" id="full-name" class="input-text" placeholder="Your Name" required>--%>
                     <asp:TextBox ID="TextBox1" runat="server" name="full_name" class="input-text" placeholder="ex: Mohammed Mohammed Ali Ali" required pattern="[a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*$"></asp:TextBox>
				</div>
				<div class="form-row">
					<%--<input type="text" name="your-email" id="your-email" class="input-text" placeholder="Email Address" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">--%>
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Your Email" name="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}"></asp:TextBox>
				</div>
          
				<div class="form-row">
					<%--<input type="password" name="password" id="password" class="input-text" placeholder="Password" required>--%>
				  <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter  Password" name="password" class="input-text" 
                        required 
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" 
                        TextMode="Password"></asp:TextBox>
                </div>
				<div class="form-row">
					<%--<input type="password" name="comfirm-password" id="comfirm-password" class="input-text" placeholder="Comfirm Password" required>--%>
				 <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Confirm Password" name="confirm_password" class="input-text" TextMode="Password" required></asp:TextBox>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Not Match With Password" ControlToCompare="TextBox3" 
                        ControlToValidate="TextBox4" ForeColor="Red"></asp:CompareValidator>
                </div>
				<div class="form-row-last">
                   <%-- <input type="submit" name="register" class="register" value="Register">--%>
                    <asp:Button ID="Button1" name="register" class="register" value="Register" runat="server" Text="Next" onclick="Button1_Click" />
				</div>
			</form>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
