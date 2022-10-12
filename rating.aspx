<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            w.runq("select namereg,imgreg from regadvanced where emailreg='" + Session["emailreglogin"].ToString() + "'");
            Label8.Text = w.tb.Rows[0]["namereg"].ToString();
            Label9.Text = w.tb.Rows[0]["imgreg"].ToString();
        }
    }
 
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Session.Add("emaildocenter", Label1.Text);
        Label Label5 = e.Item.FindControl("Label5") as Label;
        Session.Add("namedocenter", Label5.Text);
        Label Label2 = e.Item.FindControl("Label2") as Label;
        Session.Add("spydocenter", Label2.Text);
        ImageButton ImageButton1 = e.Item.FindControl("ImageButton1") as ImageButton;
        Session.Add("imgdocenter", ImageButton1.ImageUrl);
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Response.Redirect("rating1.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataList2.Visible = true;
        DataList1.Visible = false;
    }

protected void  DataList2_ItemCommand(object source, DataListCommandEventArgs e)
{
    Label Label1 = e.Item.FindControl("Label1") as Label;
    Session.Add("emaildocenter", Label1.Text);
    Label Label5 = e.Item.FindControl("Label5") as Label;
    Session.Add("namedocenter", Label5.Text);
    Label Label2 = e.Item.FindControl("Label2") as Label;
    Session.Add("spydocenter", Label2.Text);
    ImageButton ImageButton1 = e.Item.FindControl("ImageButton1") as ImageButton;
    Session.Add("imgdocenter", ImageButton1.ImageUrl);
    Session.Add("namereglogin", Label8.Text);
    Session.Add("imgreglogin", Label9.Text);
    Response.Redirect("rating1.aspx");
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="page-content">
		<div class="form-v6-content">
		<%--	<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>--%>
			<div  class="form-detail">
                            <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                <asp:Button
                    ID="Button1" runat="server" Text="Search" BackColor="blue" Width="90px" 
                                ForeColor="White" onclick="Button1_Click" />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    RepeatDirection="Horizontal" RepeatColumns="5" onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                       <%-- <asp:Image ID="Image1" class="img-fluid rounded-circle" runat="server" ImageUrl='<%# Eval("imgreg") %>' Width="100" Height="100"/>--%>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgreg") %>' Width="200" 
                            Height="200" />
                        <br />
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("namereg") %>'></asp:Label>
                             <br />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("emailreg") %>' Visible="False"></asp:Label>
                         <br />
                          <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("spy") %>' Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                                SelectCommand="SELECT [imgreg], [namereg], [emailreg], [spy], [specialistreg] FROM [regadvanced] WHERE ([specialistreg] = @specialistreg)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Doctor" Name="specialistreg" Type="String" />
                    </SelectParameters>
                            </asp:SqlDataSource>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" Visible="False" 
                                onitemcommand="DataList2_ItemCommand">
                    <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                            class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgreg") %>' Width="200" 
                            Height="200" />
                        <br />
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("namereg") %>'></asp:Label>
                             <br />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("emailreg") %>' Visible="False"></asp:Label>
                         <br />
                          <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("spy") %>' Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT [imgreg], [namereg], [emailreg], [spy] FROM [regadvanced] WHERE ([emailreg] LIKE '%' + @emailreg + '%')OR ([namereg] LIKE '%' + @namereg + '%')OR ([spy] LIKE '%' + @spy + '%')OR ([imgreg] LIKE '%' + @imgreg + '%')">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="emailreg" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TextBox1" Name="namereg" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TextBox1" Name="spy" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TextBox1" Name="imgreg" PropertyName="Text" />
                                    </SelectParameters>
                            </asp:SqlDataSource>
                                <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
             
                <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
			</div>
            
		</div>
	</div>
</asp:Content>

