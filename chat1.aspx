<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.rundml("insert into chat (message,fromchat,tochat,date,imgfromchat,imgtochat,fromemailchat,toemailchat)values('" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["namedocchat"].ToString() + "','" + DateTime.Now.ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgdocchat"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emaildocchat"].ToString() + "')");
        w.rundml("insert into notichat (message,fromchat,tochat,imgfromchat,imgtochat,fromemailchat,toemailchat)values('" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["namedocchat"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgdocchat"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emaildocchat"].ToString() + "')");
        w.runq("select * from countchat where (fromemailchat='" + Session["emailreglogin"].ToString() + "')AND (toemailchat='" + Session["emaildocchat"].ToString() + "')");
        if (w.tb.Rows.Count < 1)
        {
            w.rundml("insert into countchat (count,fromemailchat,toemailchat)values('" + "0" + "','" + Session["emailreglogin"].ToString() + "','" + Session["emaildocchat"].ToString() + "')");
            w.rundml("update countchat set count=count+1 where (fromemailchat='" + Session["emailreglogin"].ToString() + "')AND (toemailchat='" + Session["emaildocchat"].ToString() + "')");
     
        }
        else
        {
            w.rundml("update countchat set count=count+1 where (fromemailchat='" + Session["emailreglogin"].ToString() + "')AND (toemailchat='" + Session["emaildocchat"].ToString() + "')");
        }
        
        
       
        Response.Redirect(Request.Url.AbsoluteUri);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="page-content">
		<div class="form-v6-content">
			<div class="form-left">
				<img src="images/bigchat.jpg" alt="form">

			</div>
			<div  class="form-detail">
                     <center>
                         <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                             <ItemTemplate>
                                 <asp:Image ID="Image2" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgtochat") %>' Width="50" 
                            Height="50"/>
        

                      </ItemTemplate>
                         </asp:DataList>
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                             
                             
                             SelectCommand="SELECT DISTINCT [toemailchat],[imgtochat] FROM [chat] WHERE ([toemailchat] = @toemailchat)">
                             <SelectParameters>
                                 <asp:SessionParameter Name="toemailchat" SessionField="emaildocchat" 
                                     Type="String" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                          <br/>
                     </center>
                <asp:DataList ID="DataList1" class="fff" runat="server" DataKeyField="id" 
                        DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                    <table class="w-100" border="2" bgcolor="Black">
                            <tr>
                                <td rowspan="2">
                                    <asp:Image ID="Image1" runat="server"  class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgfromchat") %>' Width="50" 
                            Height="50"/>
                           
                                   </td>
                                <td>
                                &nbsp;  &nbsp;
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fromchat") %>' ForeColor="#990000"></asp:Label>
                           
                                    </td>
                                        <td rowspan="2">
                                  &nbsp;  &nbsp;
                                    </td>
                                    <td rowspan="2">
                                     &nbsp;  &nbsp;
                                        <br />
                                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("date") %>' ForeColor="White"></asp:Label>
                           
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" ForeColor="White" 
                                        Text='<%# Eval("message") %>'></asp:Label>
                                </td>
                            </tr>

                        </table>

                <%-- <hr style="background-color: #000000" size="10" />--%>
      
                    </ItemTemplate>
                </asp:DataList>
			        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        
                    SelectCommand="SELECT * FROM [chat] WHERE (([fromemailchat] = @fromemailchat) AND ([toemailchat] = @toemailchat)OR([fromemailchat] = @tochat) AND ([toemailchat] = @fromchat))ORDER BY [id] ASC">
                        <SelectParameters>
                            <asp:SessionParameter Name="fromemailchat" SessionField="emailreglogin" 
                                Type="String" />
                            <asp:SessionParameter Name="toemailchat" SessionField="emaildocchat" 
                                Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="tochat" 
                                SessionField="emaildocchat" />
                            <asp:SessionParameter DefaultValue="" Name="fromchat" 
                                SessionField="emailreglogin" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:TextBox ID="TextBox1" placeholder="Enter Your Message" runat="server" 
                        Width="440px"></asp:TextBox>
                <asp:Button
                    ID="Button1" runat="server" Text="Chat" BackColor="Red" Width="90px" 
                                ForeColor="White" onclick="Button1_Click"  />
			</div>
            
		</div>
	</div>
</asp:Content>

