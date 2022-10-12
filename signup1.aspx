<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup1.aspx.cs" Inherits="signup1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="signsign.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="box">
    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
    <asp:Label ID="Label3" runat="server" Text="We have sent you the one-time password to the email you entered, please add it in the rectangle below" Visible="False"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="Button" onclick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Button" onclick="Button3_Click" />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text='You Should Enter Your Email EX"example@example.com"'></asp:Label>
   
    </form>
    <asp:Image ID="Image1" class="boxform2" runat="server" ImageUrl="~/gymy/b1.jpeg" />
</body>
</html>
