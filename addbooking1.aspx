<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.rundml("insert into bookill (dayill,timeill,dateill,nameill,imgill,emailill,namedoc,imgdoc,emaildoc)values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList2.SelectedItem.Text + "','" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["namedocbook"].ToString() + "','" + Session["imgdocbook"].ToString() + "','" + Session["emaildocbook"].ToString() + "')");
        w.rundml("delete from bookdoc where (emaildoc='" + Session["emaildocbook"].ToString() + "')AND(daybook='" + DropDownList1.SelectedItem.Text + "')AND(timebook='" + DropDownList2.SelectedItem.Text + "') ");
        w.rundml("insert into notification (fromchat,tochat,imgfromchat,imgtochat,fromemailchat,toemailchat)values('" + Session["namereglogin"].ToString() + "','" + Session["namedocbook"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgdocbook"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emaildocbook"].ToString() + "')");
        w.runq("select * from countnotification where (fromemailchat='" + Session["emailreglogin"].ToString() + "')AND (toemailchat='" + Session["emaildocbook"].ToString() + "')");
        if (w.tb.Rows.Count < 1)
        {
            w.rundml("insert into countchat (count,fromemailchat,toemailchat)values('" + "0" + "','" + Session["emailreglogin"].ToString() + "','" + Session["emaildocbook"].ToString() + "')");
            w.rundml("update countchat set count=count+1 where (fromemailchat='" + Session["emailreglogin"].ToString() + "')AND (toemailchat='" + Session["emaildocbook"].ToString() + "')");

        }
        else
        {
            w.rundml("update countchat set count=count+1 where (fromemailchat='" + Session["emailreglogin"].ToString() + "')AND (toemailchat='" + Session["emaildocbook"].ToString() + "')");
        }



        Response.Redirect(Request.Url.AbsoluteUri);
        
        
        
        Label1.Visible = true;
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("showbooking.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="page-content">
		<div class="form-v6-content">
			<div class="form-left">
				<img src="images/bigchat.jpg" alt="form">
                
			</div>
			<div  class="form-detail">
                
                     
			
			    <table class="w-100">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" 
                    Font-Bold="True" Font-Italic="True" ForeColor="Red"  
                                DataTextField="daybook" DataValueField="daybook" AutoPostBack="True">
                                <asp:ListItem>Saturday</asp:ListItem>
                                <asp:ListItem>Sunday</asp:ListItem>
                                <asp:ListItem>Monday</asp:ListItem>
                                <asp:ListItem>Tieseday</asp:ListItem>
                                <asp:ListItem>Winsday</asp:ListItem>
                                <asp:ListItem>Therisday</asp:ListItem>
                                <asp:ListItem>Friday</asp:ListItem>
                            </asp:DropDownList>
                  <%--          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT [daybook] FROM [bookdoc] WHERE ([emaildoc] = @emaildoc)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="emaildoc" SessionField="emaildocbook" 
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>--%>
                          </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="200px" 
                    Font-Bold="True" Font-Italic="True" ForeColor="Red" DataSourceID="SqlDataSource2" 
                                DataTextField="timebook" DataValueField="timebook">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                
                                SelectCommand="SELECT [timebook] FROM [bookdoc] WHERE (([emaildoc] = @emaildoc) AND ([daybook] = @daybook))">
                                <SelectParameters>
                                    <asp:SessionParameter Name="emaildoc" SessionField="emaildocbook" 
                                        Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="daybook" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                           
                            </td>
                    </tr>
                   
                    <tr>
                        <td colspan="2">
                          <br/>
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter The Date" ></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                          <br/>
                            <asp:Button ID="Button1" runat="server" Text="Add" ForeColor="White" 
                                    BackColor="Red"  BorderColor="Black" 
                                    Font-Bold="True" Font-Italic="True" onclick="Button1_Click"  />
                         </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                           
                    <asp:Label ID="Label1" runat="server" Text="Inserted Successfully" ForeColor="Red" Visible="False"></asp:Label>
                           </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                      <asp:Button ID="Button2" runat="server" Text="Show Booking" ForeColor="White" 
                                    BackColor="Red"  BorderColor="Black" 
                                    Font-Bold="True" Font-Italic="True" onclick="Button2_Click"  />
                           </td>
                    </tr>
                </table>
                
                     
			
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

