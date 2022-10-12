<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
   
    static int countdislike;
    static int countlike;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            countdislike = 0;
            countlike = 0;
      
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        TextBox TextBox1 = e.Item.FindControl("TextBox1") as TextBox;
        if (e.CommandName == "Comment")
        {
            w.rundml("insert into commentpost (comment,namecomment,imgcomment,emailcomment,datecomment,idpost)values('" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + DateTime.Now.ToString() + "','" + Session["id"].ToString() + "')");
            DataList4.EditItemIndex = -1;
            SqlDataSource4.DataBind();
            DataList4.DataBind();
        }
        if (e.CommandName == "Like")
        {
            w.runq("select email,idpost from likedislike where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
            if (w.tb.Rows.Count > 0)
            {
                if (countlike == 0 && countdislike == 0)
                {
                    w.rundml("update likedislike set likee=likee+1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
                   
                    countlike = 1;
                }
                else if (countlike == 1 && countdislike == 0)
                {
                    w.rundml("update likedislike set likee=likee-1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
                  
                    countlike = 0;
                }
                else if (countdislike == 1 && countlike == 0)
                {
                    w.rundml("update likedislike set likee=likee+1,dislikee=dislikee-1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
               
                    countlike = 1;
                    countdislike = 0;
                }

            } 
            
           else  {
            w.rundml("insert into likedislike (likee,dislikee,email,idpost)values('" + "0" + "','" + "0" + "','" + Session["emailreglogin"].ToString() + "','" + Session["id"].ToString() + "')");
            if (countlike == 0 && countdislike == 0)
            {
                w.rundml("update likedislike set likee=likee+1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");

                countlike = 1;
            }
            else if (countlike == 1 && countdislike == 0)
            {
                w.rundml("update likedislike set likee=likee-1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");

                countlike = 0;
            }
            else if (countdislike == 1 && countlike == 0)
            {
                w.rundml("update likedislike set likee=likee+1,dislikee=dislikee-1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");

                countlike = 1;
                countdislike = 0;
            }
            
            } 
       
            }
        if (e.CommandName == "Dislike")
        {
            w.runq("select email from likedislike where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
            if (w.tb.Rows.Count > 0)
            {
                if (countdislike == 0 && countlike == 0)
                {
                    w.rundml("update likedislike set dislikee=dislikee+1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
                 
                    countdislike = 1;
                }
                else if (countdislike == 1 && countlike == 0)
                {
                    w.rundml("update likedislike set dislikee=dislikee-1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
                
                    countdislike = 0;
                }
                else if (countdislike == 0 && countlike == 1)
                {
                    w.rundml("update likedislike set likee=likee-1,dislikee=dislikee+1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");
                 
                    countlike = 0;
                    countdislike = 1;
                }

            }

            else
            {
                w.rundml("insert into likedislike (likee,dislikee,email,idpost)values('" + "0" + "','" + "0" + "','" + Session["emailreglogin"].ToString() + "','" + Session["id"].ToString() + "')");
                if (countdislike == 0 && countlike == 0)
                {
                    w.rundml("update likedislike set dislikee=dislikee+1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");

                    countdislike = 1;
                }
                else if (countdislike == 1 && countlike == 0)
                {
                    w.rundml("update likedislike set dislikee=dislikee-1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");

                    countdislike = 0;
                }
                else if (countdislike == 0 && countlike == 1)
                {
                    w.rundml("update likedislike set likee=likee-1,dislikee=dislikee+1  where (email='" + Session["emailreglogin"].ToString() + "')AND(idpost='" + Session["id"].ToString() + "')");

                    countlike = 0;
                    countdislike = 1;
                }

            } 
        }   
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        TextBox TextBox1 = e.Item.FindControl("TextBox1") as TextBox;
        if (e.CommandName == "Comment")
        {
            w.rundml("insert into commentphoto (comment,namecomment,imgcomment,emailcomment,datecomment,idphoto)values('" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + DateTime.Now.ToString() + "','" + Session["id"].ToString() + "')");
            DataList5.EditItemIndex = -1;
            SqlDataSource5.DataBind();
            DataList5.DataBind();
        }
    }

    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        TextBox TextBox1 = e.Item.FindControl("TextBox1") as TextBox;
        if (e.CommandName == "Comment")
        {
            w.rundml("insert into commentvideo (comment,namecomment,imgcomment,emailcomment,datecomment,idvideo)values('" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + DateTime.Now.ToString() + "','" + Session["id"].ToString() + "')");
            DataList6.EditItemIndex = -1;
            SqlDataSource6.DataBind();
            DataList6.DataBind();
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
        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
                            DataSourceID="SqlDataSource1" 
                    onitemcommand="DataList1_ItemCommand" >
                    <ItemTemplate>

                        <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgpost") %>' Width="50" Height="50"/>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namepost") %>' ForeColor="Black"></asp:Label>
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("emailpost") %>' ForeColor="#000099" Visible="False"></asp:Label>
                               <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>' ForeColor="#000099" Visible="False"></asp:Label>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("post") %>' ForeColor="#000099"></asp:Label>
                                </td>

              
                    </tr>
                         <tr>
                       <td>
                           <asp:Button ID="Button3" runat="server" Text="Like" CommandName="Like" BackColor="#3366FF" BorderColor="Maroon" ForeColor="White" Width="200"/>
                                </td>

                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Dislike" BackColor="#3366FF" BorderColor="Maroon" ForeColor="White" Width="200" CommandName="Dislike" />
                                </td>

              
                    </tr>
     
                     <tr>
                       <td>
                           <asp:TextBox ID="TextBox1" runat="server" Width="200" TextMode="MultiLine"></asp:TextBox>
                                </td>

                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Comment" BackColor="#3366FF" BorderColor="Maroon" ForeColor="White" Width="200" CommandName="Comment" />
                                </td>

              
                    </tr>
                     </table> 
                    </ItemTemplate>
                </asp:DataList> 
			            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [post] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <asp:DataList ID="DataList4" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource4">
                    <ItemTemplate>
                                 <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgcomment") %>' Width="50" Height="50"/>
                                </td>
                                  <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namecomment") %>' ForeColor="#000099"></asp:Label>
                                </td>
              
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' ForeColor="#000099"></asp:Label>
                                </td>
                                  <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("datecomment") %>' ForeColor="#000099"></asp:Label>
                                </td>
              
                    </tr>
                    </table>
                    </ItemTemplate>
                </asp:DataList>




                                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [commentpost] WHERE ([idpost] = @idpost)">
                                       <SelectParameters>
                                           <asp:SessionParameter Name="idpost" SessionField="id" Type="Int32" />
                                       </SelectParameters>
                </asp:SqlDataSource>




                                   <asp:DataList ID="DataList2" runat="server" DataKeyField="id" 
                            DataSourceID="SqlDataSource2" 
                    onitemcommand="DataList2_ItemCommand">
                    <ItemTemplate>
                             <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgpost") %>' Width="50" Height="50"/>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namepost") %>' ForeColor="#000099"></asp:Label>
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("emailpost") %>' ForeColor="#000099" Visible="False"></asp:Label>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                             <asp:Image ID="Image2" runat="server"  ImageUrl='<%# Eval("photo") %>' Width="200" Height="200"/>
                                </td>

              
                    </tr>
                                <tr>
                       <td>
                           <asp:TextBox ID="TextBox1" runat="server" Width="200" TextMode="MultiLine"></asp:TextBox>
                                </td>

                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Comment" BackColor="#3366FF" BorderColor="Maroon" ForeColor="White" Width="200" CommandName="Comment" />
                                </td>

              
                    </tr>
                     </table> 
                    </ItemTemplate>
                </asp:DataList>
			            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [photopost] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <asp:DataList ID="DataList5" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource5">
                    <ItemTemplate>
                                        <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgcomment") %>' Width="50" Height="50"/>
                                </td>
                                  <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namecomment") %>' ForeColor="#000099"></asp:Label>
                                </td>
              
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' ForeColor="#000099"></asp:Label>
                                </td>
                                  <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("datecomment") %>' ForeColor="#000099"></asp:Label>
                                </td>
              
                    </tr>
                    </table>
                    </ItemTemplate>
                </asp:DataList>

                                  <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [commentphoto] WHERE ([idphoto] = @idphoto)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="idphoto" SessionField="id" Type="Int32" />
                                      </SelectParameters>
                </asp:SqlDataSource>

                                  <asp:DataList ID="DataList3" runat="server" DataKeyField="id" 
                            DataSourceID="SqlDataSource3" 
                    onitemcommand="DataList3_ItemCommand">
                    <ItemTemplate>
                                           <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgpost") %>' Width="50" Height="50"/>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namepost") %>' ForeColor="#000099"></asp:Label>
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("emailpost") %>' ForeColor="#000099" Visible="False"></asp:Label>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("video") %>' ></asp:Literal>
                                </td>

              
                    </tr>
                                  <tr>
                       <td>
                           <asp:TextBox ID="TextBox1" runat="server" Width="200" TextMode="MultiLine"></asp:TextBox>
                                </td>

                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Comment" BackColor="#3366FF" BorderColor="Maroon" ForeColor="White" Width="200" CommandName="Comment" />
                                </td>

              
                    </tr>
                     </table> 
                    </ItemTemplate>
                </asp:DataList>
			            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [videopost] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <asp:DataList ID="DataList6" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource6">
                    <ItemTemplate>
                                           <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgcomment") %>' Width="50" Height="50"/>
                                </td>
                                  <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("namecomment") %>' ForeColor="#000099"></asp:Label>
                                </td>
              
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' ForeColor="#000099"></asp:Label>
                                </td>
                                  <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("datecomment") %>' ForeColor="#000099"></asp:Label>
                                </td>
              
                    </tr>
                    </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [commentvideo] WHERE ([idvideo] = @idvideo)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idvideo" SessionField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            
		</div>
	</div>
</asp:Content>

