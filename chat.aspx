<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
   
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        ImageButton ImageButton1 = e.Item.FindControl("ImageButton1") as ImageButton;
        Session.Add("imgdocchat", ImageButton1.ImageUrl);
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Session.Add("namedocchat", Label1.Text);
        Label Label2 = e.Item.FindControl("Label2") as Label;
        Session.Add("emaildocchat", Label2.Text);
        Response.Redirect("chat1.aspx");
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    DataList2.Visible = true;
    //}

protected void  DataList2_ItemCommand(object source, DataListCommandEventArgs e)
{
    //ImageButton ImageButton3 = e.Item.FindControl("ImageButton3") as ImageButton;
    //Session.Add("imgdocchat", ImageButton3.ImageUrl);
    //Label Label5 = e.Item.FindControl("Label5") as Label;
    //Session.Add("namedocchat", Label5.Text);
    //Label Label6 = e.Item.FindControl("Label6") as Label;
    //Session.Add("emaildocchat", Label6.Text);
    ImageButton ImageButton2 = e.Item.FindControl("ImageButton2") as ImageButton;
    Session.Add("imgdocchat", ImageButton2.ImageUrl);
    Label Label3 = e.Item.FindControl("Label3") as Label;
    Session.Add("namedocchat", Label3.Text);
    Label Label7 = e.Item.FindControl("Label7") as Label;
    Session.Add("emaildocchat", Label7.Text);
    Label Label8 = e.Item.FindControl("Label8") as Label;
    Session.Add("iddocchat", Label8.Text);
    w.rundml("delete from notichat where (fromchat='" + Label3.Text + "')AND(toemailchat='" + Session["emailreglogin"].ToString() + "') ");
    Response.Redirect("chat1.aspx");
}

protected void Button1_Click(object sender, EventArgs e)
{
    DataList1.Visible = true;
    DataList2.Visible = false;
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content">
		<div class="form-v6-content">
		<%--	<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>--%>
			<div  class="form-detail">
        <%--        <asp:Button ID="Button1" runat="server"  Text="Show Messages" BackColor="Red" Width="200px" 
                                ForeColor="White" onclick="Button1_Click"/>--%>
                                <br/>
                <asp:DataList ID="DataList2" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource2" onitemcommand="DataList2_ItemCommand">
                    <ItemTemplate>
          <table class="w-100">
                            <tr>
                              <td>
                                  <asp:ImageButton ID="ImageButton2" runat="server"   class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgfromchat") %>' Width="80" 
                            Height="80"/>
                                </td>
                                 <td>
                                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("fromchat") %>' ForeColor="#CC3300"></asp:Label>
                                </td>
                                 <td>
                                   <asp:Label ID="Label4" runat="server" Text="Send You Message" ForeColor="#CC3300"></asp:Label>
                                     <asp:ImageButton ID="ImageButton3" runat="server" Visible="False" ImageUrl='<%# Eval("imgtochat") %>'/>
                                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("tochat") %>' Visible="False"></asp:Label>
                                     <asp:Label ID="Label6" runat="server" Text='<%# Eval("toemailchat") %>' Visible="False"></asp:Label>
                                      <asp:Label ID="Label7" runat="server" Text='<%# Eval("fromemailchat") %>' Visible="False"></asp:Label>
                              <asp:Label ID="Label8" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label>
                                </td>
                                  </tr>

                        </table>
                    </ItemTemplate>
                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [notichat] WHERE ([toemailchat] = @toemailchat)ORDER BY id DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="toemailchat" SessionField="emailreglogin" 
                                            Type="String" />
                                    </SelectParameters>
                </asp:SqlDataSource>
                                <br/>
                                 <asp:TextBox ID="TextBox1" placeholder="Search For Members" runat="server" 
                        Width="440px"></asp:TextBox>
                <asp:Button
                    ID="Button1" runat="server" Text="Search" BackColor="Red" Width="90px" 
                                ForeColor="White" onclick="Button1_Click"  />
                                 <br/>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    RepeatColumns="4" RepeatDirection="Horizontal" 
                    onitemcommand="DataList1_ItemCommand" Visible="False">
                    <ItemTemplate>
                        <table class="w-100">
                            <tr>
                                <td>
                             
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgreg") %>' Width="100" 
                            Height="100" />
                                   
                                   </td>
                                <td>
                                 
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("namereg") %>' ForeColor="#CC3300"></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("emailreg") %>' Visible="False"></asp:Label>
                                   
                                    </td>
                            </tr>
                        </table>
                    
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT * FROM [regadvanced] WHERE(([emailreg]&lt;&gt;@emailreglogin)AND (([emailreg] LIKE '%' + @emailreg + '%') OR([namereg] LIKE '%' + @namereg + '%') OR([specialistreg] LIKE '%' + @specialistreg + '%')))">
                    <SelectParameters>
                        <asp:SessionParameter Name="emailreglogin" SessionField="emailreglogin" />
                        <asp:ControlParameter ControlID="TextBox1" Name="emailreg" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox1" Name="namereg" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox1" Name="specialistreg" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
			</div>
            
		</div>
	</div>
</asp:Content>

