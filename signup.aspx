<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up in iLLBook</title>
    <link href="signsign.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="Form1" runat="server" class="box" >
  <h1 style="color:White">Sign Up in </h1>
<h1 style="color:Red">iLLBook</h1>
<asp:DropDownList ID="DropDownList1" class="dr" runat="server" AutoPostBack="True" 
      onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
    <asp:ListItem>Doctor</asp:ListItem>
    <asp:ListItem>Patient</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="TextBox1" placeholder="User Name" runat="server" required></asp:TextBox>
<asp:Label ID="Label1" runat="server" Text="Label" Visible="True"></asp:Label>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
      ErrorMessage="*username only contains numbers and alphabet" 
      ValidationExpression="[a-zA-Z0-9]*$" ControlToValidate="TextBox1" 
      ForeColor="Red"></asp:RegularExpressionValidator>
<asp:Button ID="Button2" runat="server" Text="check username found?" 
      onclick="Button2_Click" />
<asp:TextBox ID="TextBox2" placeholder="Full Name" runat="server" required></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
      ErrorMessage="*invalid name" ControlToValidate="TextBox2" 
      ValidationExpression="[a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*[ ][a-zA-Z]*$" ForeColor="Red"></asp:RegularExpressionValidator>
<asp:TextBox ID="TextBox3" placeholder="Password" runat="server" TextMode="Password" required></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
      ErrorMessage="*minimum 8 charcater atleast 1 uper,1 lower, 1 number,1 speccial charater " 
      ControlToValidate="TextBox3" 
      ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" 
      ForeColor="Red"></asp:RegularExpressionValidator>
<asp:TextBox ID="TextBox4" placeholder="EX:-minia-banimazar-ebshaq" runat="server" required></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
      ErrorMessage="*invalid address" ControlToValidate="TextBox4" 
      ValidationExpression="[a-zA-Z]*[-][a-zA-Z]*[-][a-zA-Z]*$" ForeColor="Red"></asp:RegularExpressionValidator>
<asp:DropDownList class="dr" ID="DropDownList2" runat="server">
    <asp:ListItem>Bone</asp:ListItem>
    <asp:ListItem>Surgery</asp:ListItem>
    <asp:ListItem>Teeth</asp:ListItem>
    <asp:ListItem>Stomach</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="TextBox5" placeholder="YourSID" runat="server" required 
      Visible="False"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" />
</form>
<%--<form id="Form2"  class="boxform2">--%>
<%--<asp:Image ID="Image1" class="boxform2" runat="server" ImageUrl="~/gymy/b1.jpeg" />--%>
<%--</form>--%>
</body>
</html>
