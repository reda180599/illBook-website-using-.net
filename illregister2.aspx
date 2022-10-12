<%@ Page Language="C#" AutoEventWireup="true" CodeFile="illregister2.aspx.cs" Inherits="illregister2" %>

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
			<form id="Form1" runat="server">
            <h2>Register Form</h2>
	   <div>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td rowspan="3">
                            <asp:Image ID="Image1" runat="server" Height="200px" 
                                ImageUrl='<%# Eval("imgreg") %>' Width="200px" />
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" 
                                ForeColor="Red" Text="Full Name"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namereg") %>' 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
                                ForeColor="Red" Text="Specialist"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("specialistreg") %>' 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" 
                                ForeColor="Red" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("emailreg") %>' 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>

                       <tr>
                    
                        <td>
                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" 
             Font-Size="Larger" ForeColor="Red" 
             Text="Thanks for register in website you can Login Now"> </asp:Label>
                        </td>
                    </tr>
                          <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Login Now" name="register" 
                                class="register" value="Register" onclick="Button1_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [imgreg], [namereg], [specialistreg], [emailreg] FROM [regadvanced] WHERE ([imgreg] = @imgreg)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="imgreg" SessionField="imgreg" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
   
                </form>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>