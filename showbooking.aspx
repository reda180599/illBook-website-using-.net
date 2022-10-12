<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Image Image1 = e.Item.FindControl("Image1") as Image;
        Label Label6 = e.Item.FindControl("Label6") as Label;
        Label Label3 = e.Item.FindControl("Label3") as Label;
        Label Label4 = e.Item.FindControl("Label4") as Label;
        Label Label5 = e.Item.FindControl("Label5") as Label;
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Label Label2 = e.Item.FindControl("Label2") as Label;
        w.rundml("delete from bookill where id='" + Label6.Text + "' ");
        w.rundml("insert into bookdoc (daybook,timebook,namedoc,emaildoc,spydoc,specialistdoc,imgdoc)values('" + Label3.Text + "','" + Label4.Text + "','" + Label1.Text + "','" + Label2.Text + "','" + "Surgary" + "','" + "Doctor" + "','" + Image1.ImageUrl + "')");
        Response.Redirect(Request.Url.AbsoluteUri);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content">
		<div class="form-v6-content">
			<%--<div class="form-left">
				<img src="images/bigchat.jpg" alt="form">
                
			</div>--%>
			<div  class="form-detail">
                   
                <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource1" onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                    	    <table class="w-100" border="2">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgdoc") %>' Width="60" 
                            Height="60"/>
                        </td>
                         <td>
                         &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("namedoc") %>' Font-Bold="True" 
                                 Font-Italic="True" ForeColor="#666699"></asp:Label>
                        </td>
                         <td>
                          &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("emaildoc") %>' Font-Bold="True" 
                                 Font-Italic="True" ForeColor="#666699"></asp:Label>
                        </td>
                         <td>
                          &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("dayill") %>' Font-Bold="True" 
                                 Font-Italic="True" ForeColor="#666699"></asp:Label>
                        </td>
                         <td>
                          &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label4" runat="server" Text='<%# Eval("timeill") %>' Font-Bold="True" 
                                 Font-Italic="True" ForeColor="#666699"></asp:Label>
                        </td>
                         <td>
                          &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label5" runat="server" Text='<%# Eval("dateill") %>' Font-Bold="True" 
                                 Font-Italic="True" ForeColor="#666699"></asp:Label>
                        </td>
                           <td>
                               <asp:Button ID="Button1" runat="server" Text="Cancel" BackColor="#CC0000" BorderColor="Black" ForeColor="White" />
                               <asp:Label ID="Label6" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label>
                        </td>
                         </tr>
                            </table>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [bookill] WHERE ([emailill] = @emailill)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emailill" SessionField="emailreglogin" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
			</div>
            
		</div>
	</div>

</asp:Content>

