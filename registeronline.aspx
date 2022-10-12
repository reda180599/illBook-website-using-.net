<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registeronline.aspx.cs" Inherits="registeronline" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Form-v2 by Colorlib</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="css/roboto-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/line-awesome/css/line-awesome.min.css">
	<!-- Jquery -->
	<link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="form-v2">
	<div class="page-content">
		<div class="form-v2-content">
			<div class="form-left">
				<img src="images/dd.jpg" alt="form">
                <%--<img src="gymy/27.jpg" alt="form">--%>
				<div class="text-1">
					<p>iLLBook<span>Best Website</span></p>
                    
				</div>
			<%--	<div class="text-2">
					<p><span>$9.99</span>/ Month</p>
				</div>--%>
			</div>
			<form runat="server" class="form-detail" action="#" method="post"  id="myform">
				<h2>Registration Form</h2>
				<div class="form-row">
					<label for="full-name">Full Name:</label>
					<%--<input type="text" name="full_name" id="full_name" class="input-text" placeholder="ex: Lindsey Wilson" required pattern="[a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*$">--%>
                    <asp:TextBox ID="TextBox1" runat="server" name="full_name" class="input-text" placeholder="ex: Lindsey Wilson" required pattern="[a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*$"></asp:TextBox>
				</div>
				<div class="form-row"> 
					<label for="your_email">Your Email:</label>
					<%--<input type="text" name="your_email" id="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">--%>
                    <asp:TextBox ID="TextBox2" runat="server" name="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}"></asp:TextBox>
				</div>
				<div class="form-row">
					<label for="password">Password:</label>
					<%--<input type="password" name="password" id="password" class="input-text" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}">--%>
                    <asp:TextBox ID="TextBox3" runat="server" name="password" class="input-text" 
                        required 
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" 
                        TextMode="Password"></asp:TextBox>
				</div>
				<div class="form-row">
					<label for="comfirm-password">Confirm Password:</label>
					<%--<input type="password" name="confirm_password" id="confirm_password" class="input-text" required>--%>
                    <asp:TextBox ID="TextBox4" runat="server" name="confirm_password" class="input-text" TextMode="Password" required></asp:TextBox>

				</div>
				<div class="form-checkbox">
					<label class="container"><p>By signing up, you agree to the <a href="signup1.aspx" class="text">Play Term of Service</a></p>
					  	<input type="checkbox" name="agree" id="agree">
					  	<span class="checkmark"></span>
					</label>
				</div>
			<div>
					<%--< class="form-row-last" class=registerinput type="submit" name="register" class="register" value="Register">--%>
                <asp:Button ID="Button1" runat="server"  Text="Button" onclick="Button1_Click" />
				</div>
			</form>
         
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script>
//		 just for the demos, avoids form submit
		jQuery.validator.setDefaults({
		  	debug: true,
		  	success:  function(label){
        		label.attr('id', 'valid');
   		 	}
  });
		$( "#myform" ).validate({
		  	rules: {
		    	TextBox3: "required",
		    	TextBox4: {
		      		equalTo: "#TextBox3"
		    	}
		  	},
		  	messages: {
		  		TextBox1: {
		  			required: "Please provide a Full Name"
		  		},
		  		TextBox2: {
		  			required: "Please provide an email"
		  		},
		  		TextBox3: {
	  				required: "Please provide a password"
		  		},
		  		TextBox4: {
		  			required: "Please provide a password",
		      		equalTo: "Wrong Password"
		    	}
         
		  	}
		});
	</script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
