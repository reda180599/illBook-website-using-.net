<%@ Page Language="C#" AutoEventWireup="true" CodeFile="illregister1.aspx.cs" Inherits="illregister1" %>

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
				<h2>Register Form</h2>
				<div class="dropdown">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" Height="35px" 
                        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Doctor</asp:ListItem>
                        <asp:ListItem>Patient</asp:ListItem>
                    </asp:DropDownList>
				</div>
                <br />
             
                	<div class="dropdown">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="200px" Height="35px">
                        <asp:ListItem>Surgary</asp:ListItem>
                        <asp:ListItem>eyes</asp:ListItem>
                    </asp:DropDownList>
				</div>
                 	<div >
                         <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Your SID" required 
                             Visible="False" ></asp:TextBox>
				</div>
                 <br />
                   	<div>
                           <asp:FileUpload ID="FileUpload1" runat="server" />
				</div>
				<div class="form-row-last">
                   <%-- <input type="submit" name="register" class="register" value="Register">--%>
                    <asp:Button ID="Button1" name="register" class="register" value="Register" 
                        runat="server" Text="Register Now" onclick="Button1_Click" />
				</div>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
			</form>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
