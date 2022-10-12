<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>
  
<script runat="server">
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //w.runq("select * from regadvanced where emailreg='" + Session["emailreglogin"].ToString() + "'");
            //Label1.Text = w.tb.Rows[0]["specialistreg"].ToString();
            //Label2.Text = w.tb.Rows[0]["spy"].ToString();
            if (Session["specialistreglogin"].ToString() == "Doctor")
            {
                //Session.Add("imgreglogin", Label2.Text);
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button1.Visible = true;
                Button2.Visible = true;
                DataList1.Visible = false;
            }
            else
            {
                
                DataList1.Visible = true;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Button1.Visible = false;
                Button2.Visible = false;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        w.rundml("insert into bookdoc (daybook,timebook,namedoc,emaildoc,spydoc,specialistdoc,imgdoc)values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList2.SelectedItem.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["spyreglogin"].ToString() + "','" + Session["specialistreglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "')");
        Label3.Visible = true;
    }

protected void  DataList1_ItemCommand(object source, DataListCommandEventArgs e)
{
    ImageButton ImageButton1 = e.Item.FindControl("ImageButton1") as ImageButton;
    Session.Add("imgdocbook", ImageButton1.ImageUrl);
    Label Label4 = e.Item.FindControl("Label4") as Label;
    Session.Add("namedocbook", Label4.Text);
    Label Label5 = e.Item.FindControl("Label5") as Label;
    Session.Add("emaildocbook", Label5.Text);
    Response.Redirect("addbooking1.aspx");
}

protected void Button2_Click(object sender, EventArgs e)
{
    Response.Redirect("showbookingdoc.aspx");
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="page-content">
		<div class="form-v6-content">
			<div class="form-left">
			<%--	<img src="images/bigchat.jpg" alt="form">--%>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
			</div>
			<div  class="form-detail">
                
                     
			    <table class="w-100">
                    <tr>
                        <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" 
                    Font-Bold="True" Font-Italic="True" ForeColor="Red">
                    <asp:ListItem>Saturday</asp:ListItem>
                    <asp:ListItem>Sunnday</asp:ListItem>
                    <asp:ListItem>Monday</asp:ListItem>
                    <asp:ListItem>Tuesday</asp:ListItem>
                    <asp:ListItem>Winsday</asp:ListItem>
                    <asp:ListItem>Thersday</asp:ListItem>
                    <asp:ListItem>Friday</asp:ListItem>
                </asp:DropDownList> 
                           
                        </td>
                        <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="200px" 
                    Font-Bold="True" Font-Italic="True" ForeColor="Red">
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
                        
                           </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                                <asp:Button ID="Button1" runat="server" Text="Add" ForeColor="White" 
                                    BackColor="Red" onclick="Button1_Click" BorderColor="Black" 
                                    Font-Bold="True" Font-Italic="True" />
                            </td>
                    </tr> 
                         <tr>
                        <td colspan="2">
                            <asp:Label ID="Label3" runat="server" Text="Add Inserted Successfully" 
                                Visible="False" ForeColor="#CC0000"></asp:Label>
                            </td>
                    </tr>
                         <tr>
                        <td colspan="2">
                                <asp:Button ID="Button2" runat="server" Text="Show Booking" ForeColor="White" 
                                    BackColor="Red"  BorderColor="Black" 
                                    Font-Bold="True" Font-Italic="True" onclick="Button2_Click" />
                            </td>
                    </tr> 
                </table>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    RepeatColumns="2" RepeatDirection="Horizontal" 
                    onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <table class="w-100">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgreg") %>' Width="80" 
                            Height="80"/>
                          </td>

             </tr>
                      <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("namereg") %>' 
                            ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("emailreg") %>' Visible="False"></asp:Label>
                          </td>

             </tr>
              </table>
         </ItemTemplate>
                </asp:DataList>  
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT *  FROM [regadvanced] WHERE ([specialistreg] = @specialistreg)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Doctor" Name="specialistreg" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
			</div>
            
		</div>
	</div>
</asp:Content>

