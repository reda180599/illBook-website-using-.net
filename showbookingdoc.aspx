<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="page-content">
		<div class="form-v6-content">
		<%--	<div class="form-left">--%>
			<%--	<img src="images/bigchat.jpg" alt="form">--%>
            <%--    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
			</div>--%>
			<div  class="form-detail">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                
			        	    <table class="w-100" border="2">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgill") %>' Width="60" 
                            Height="60"/>
                        </td>
                         <td>
                         &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("nameill") %>' Font-Bold="True" 
                                 Font-Italic="True" ForeColor="#666699"></asp:Label>
                        </td>
                         <td>
                          &nbsp; &nbsp; &nbsp;
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("emailill") %>' Font-Bold="True" 
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
                       <%--    <td>
                               <asp:Button ID="Button1" runat="server" Text="Cancel" BackColor="#CC0000" BorderColor="Black" ForeColor="White" />
                               <asp:Label ID="Label6" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label>
                        </td>--%>
                         </tr>
                            </table>
                    </ItemTemplate>
                </asp:DataList>
                     
			
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [bookill] WHERE ([emaildoc] = @emaildoc)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emaildoc" SessionField="emailreglogin" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                     
			
			</div>
            
		</div>
	</div>
</asp:Content>

