<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.runq("select * from regadvanced where sid='" + TextBox1.Text + "'");
        String email;
        String name;
        String sid;
        String imgreg;
        if (w.tb.Rows.Count == 0)
        {
            Label1.Text = "invalid SID,relogin";
            
        }
        
           else
        {
            email= w.tb.Rows[0]["emailreg"].ToString();
            name = w.tb.Rows[0]["namereg"].ToString();
            sid = w.tb.Rows[0]["sid"].ToString();
            imgreg = w.tb.Rows[0]["imgreg"].ToString();
            Session.Add("emailreg", email.ToString());
            Session.Add("namereg", name.ToString());
            Session.Add("sid", sid.ToString());
            Session.Add("imgreg", imgreg.ToString());
            Response.Redirect("report1.aspx");
            
            }
        
    }
  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="page-content">
		<div class="form-v6-content">
			<%--<div class="form-left">--%>
			<%--	<img src="images/bigchat.jpg" alt="form">--%>
             <%--   <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
			</div>--%>
			<div  class="form-detail">
                
                     
			   
			    <table class="w-100">
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="300" BorderColor="Black"></asp:TextBox>
                           </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Go" BackColor="#3399FF" 
                                BorderColor="Black" onclick="Button1_Click" Width="300" />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="" BackColor="#CC0000"></asp:Label>
                           </td>
                    </tr>
                </table>
                
                     
			   
			</div>
            
		</div>
	</div>
</asp:Content>

