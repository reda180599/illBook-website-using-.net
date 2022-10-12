<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    String date;
    String time;
    protected void Button1_Click(object sender, EventArgs e)
    {
        Timer1.Enabled = true;

    }
protected void  Timer1_Tick(object sender, EventArgs e)
{
    Label2.Text = DateTime.Now.ToString("dd-mm-yyyy");
    Label3.Text = DateTime.Now.ToString("HH tt");
    Label1.Text = Session["emailreglogin"].ToString();
    w.rundml("insert into remind(dateremind,timeremind,messageremind,emailremind)values('" + TextBox1.Text + "','" + DropDownList1.SelectedItem.Value + "','" + TextBox3.Text + "','" + Label1.Text + "')");
    w.rundml("select dateremind,timeremind from remind where emailremind='" + Label1.Text + "'");
    if (w.tb.Rows.Count != 0)
    {
        date = w.tb.Rows[0]["dateremind"].ToString();
        time = w.tb.Rows[0]["timeremind"].ToString();
        if (time == Label3.Text)
        {
            w.rundml("insert into noti(fromnoti,tonoti,messagenoti)values('" + "Admin" + "','" + Label1.Text + "','" + TextBox3.Text + "')");

            //Label1.Text = "Added Successfully ";
        }
        //Label1.Text = "Your Birth Date is " + DateTime.ParseExact(TextBox1.Text, "dd-MM-yyyy", null).ToString("dd/MMM/yyyy");
    }
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <%--  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
   	<div class="page-content">
		<div class="form-v6-content">
			<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>
			<div  class="form-detail">
				<h2>Remind Me Form</h2>
                						<div class="form-row">
					
				  <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Your Date" name="old_password" class="input-text" 
                        required 
                        ></asp:TextBox>
                </div>
					<div class="dropdown">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" Height="35px" 
                      >
                        <asp:ListItem>01 AM</asp:ListItem>
                        <asp:ListItem>02 AM</asp:ListItem>
                        <asp:ListItem>03 AM</asp:ListItem>
                        <asp:ListItem>04 AM</asp:ListItem>
                        <asp:ListItem>05 AM</asp:ListItem>
                        <asp:ListItem>06 AM</asp:ListItem>
                        <asp:ListItem>07 AM</asp:ListItem>
                        <asp:ListItem>08 AM</asp:ListItem>
                        <asp:ListItem>09 AM</asp:ListItem>
                        <asp:ListItem>10 AM</asp:ListItem>
                        <asp:ListItem>11 AM</asp:ListItem>
                        <asp:ListItem>12 AM</asp:ListItem>
                        <asp:ListItem>01 PM</asp:ListItem>
                        <asp:ListItem>02 PM</asp:ListItem>
                        <asp:ListItem>03 PM</asp:ListItem>
                        <asp:ListItem>04 PM</asp:ListItem>
                        <asp:ListItem>05 PM</asp:ListItem>
                        <asp:ListItem>06 PM</asp:ListItem>
                        <asp:ListItem>07 PM</asp:ListItem>
                        <asp:ListItem>08 PM</asp:ListItem>
                        <asp:ListItem>09 PM</asp:ListItem>
                        <asp:ListItem>10 PM</asp:ListItem>
                        <asp:ListItem>11 PM</asp:ListItem>
                        <asp:ListItem>12 PM</asp:ListItem>
                    </asp:DropDownList>
				</div>
                <br/>
				<div class="form-row">
				 <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Message" name="confirm_password" class="input-text"  required></asp:TextBox>
                   
                </div>
                <div class="form-row-last">
    
                    <asp:Button ID="Button1" name="register" class="register" value="Register" 
                        runat="server" Text="Change Password" onclick="Button1_Click" />
				</div>
                <div class="form-row">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>

                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick" 
                            Enabled="False">
                        </asp:Timer>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text=""></asp:Label>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
			</div>
		</div>
	</div>
    <script type="text/javascript" language="javascript">
        $(function () {
            $("#<%=TextBox1.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd-mm-yy",
                yearRange: '1950:2021'
            });
        });
    </script>
</asp:Content>

