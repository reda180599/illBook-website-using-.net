<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>



<script runat="server">
    mywork w = new mywork();
    String pass;
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.runq("select passreg from regadvanced where emailreg='" + Session["emailreglogin"].ToString() + "'");
        pass = w.tb.Rows[0]["passreg"].ToString();
        if (pass==TextBox3.Text) {
            w.rundml("update regadvanced set passreg='" + TextBox1.Text + "' where emailreg='" + Session["emailreglogin"].ToString() + "'");
            Response.Redirect("illlogin.aspx");
        }
        else { Label1.Text = "Old Password Is Not Correct"; }
      
    }
 
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<div class="page-content">
		<div class="form-v6-content">
			<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>
			<div  class="form-detail">
				<h2>Change Password Form</h2>
                						<div class="form-row">
					
				  <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Old Password" name="old_password" class="input-text" 
                        required 
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" 
                        TextMode="Password"></asp:TextBox>
                </div>
						<div class="form-row">
					
				  <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter New Password" name="password" class="input-text" 
                        required 
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" 
                        TextMode="Password"></asp:TextBox>
                </div>
				<div class="form-row">
				 <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Confirm New Password" name="confirm_password" class="input-text" TextMode="Password" required></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Not Match With Password" ControlToCompare="TextBox1" 
                        ControlToValidate="TextBox2" ForeColor="Red"></asp:CompareValidator>
                </div>
                <div class="form-row-last">
    
                    <asp:Button ID="Button1" name="register" class="register" value="Register" 
                        runat="server" Text="Change Password" onclick="Button1_Click" />
				</div>
                <div class="form-row">
                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </div>
			</div>
		</div>
	</div>
</asp:Content>

