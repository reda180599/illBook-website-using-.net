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
        Label Label3 = e.Item.FindControl("Label3") as Label;
        Session.Add("emaildocenter", Label3.Text);
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Session.Add("namedocenter", Label1.Text);
        Label Label4 = e.Item.FindControl("Label4") as Label;
        Session.Add("spydocenter", Label4.Text);
        ImageButton ImageButton1 = e.Item.FindControl("ImageButton1") as ImageButton;
        Session.Add("imgdocenter", ImageButton1.ImageUrl);
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        w.rundml("delete from notireport where (fromemailnotireport='" + Label3.Text + "')AND(toemailnotireport='" + Session["emailreglogin"].ToString() + "') ");
        Response.Redirect("rating1.aspx");
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
                
                <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource1" onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                    <table class="w-100">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgfromnotireport") %>' Width="80" 
                            Height="80"  />
                           </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("fromnotireport") %>' ForeColor="#CC3300"></asp:Label>
                           </td>
                            <td>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("message") %>' ForeColor="#CC3300"></asp:Label>
                           </td>
                            <td>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("fromemailnotireport") %>' ForeColor="#CC3300" Visible="False"></asp:Label>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Eval("spyreport") %>' ForeColor="#CC3300" Visible="False"></asp:Label>
                           </td>
                    </tr>
                       </table>
                    </ItemTemplate>
                </asp:DataList>  
			   
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [notireport] WHERE ([toemailnotireport] = @toemailnotireport)">
                    <SelectParameters>
                        <asp:SessionParameter Name="toemailnotireport" SessionField="emailreglogin" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
			        <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
             
                <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
			</div>
            
		</div>
	</div>
</asp:Content>

