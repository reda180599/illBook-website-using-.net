<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            w.runq("select namereg,imgreg,specialistreg,spy from regadvanced where emailreg='" + Session["emailreglogin"].ToString() + "'");
            Label8.Text = w.tb.Rows[0]["namereg"].ToString();
            Label9.Text = w.tb.Rows[0]["imgreg"].ToString();
         
            Session.Add("namereglogin", Label8.Text);
            Session.Add("imgreglogin", Label9.Text);
        
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        w.rundml("insert into post (post,namepost,imgpost,emailpost,typepost)values('" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + "Posts" + "')");
        DataList1.EditItemIndex = -1;
        SqlDataSource1.DataBind();
        DataList1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string pass;


        if (FileUpload1.HasFile)
        {
            w.runq("select id from photopost");
            if (w.tb.Rows.Count < 1)
            {
                Label2.Text = "1";
                FileUpload1.SaveAs(Server.MapPath("gymy") + "\\" + Label2.Text + ".jpg");

                pass = "gymy/" + Label2.Text + ".jpg";
                // w.rundml("insert into report (img)values('" + pass + "')");
                w.rundml("insert into photopost (photo,namepost,imgpost,emailpost,typepost)values('" + pass + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + "Photos" + "')");

                DataList2.EditItemIndex = -1;
                SqlDataSource2.DataBind();
                DataList2.DataBind();
            }
            else
            {
                w.runq("select MAX(id) from photopost");
                Label2.Text = w.tb.Rows[0][0].ToString();
                int a = Convert.ToInt32(Label2.Text);
                a = a + 1;
                Label2.Text = a.ToString();
                FileUpload1.SaveAs(Server.MapPath("gymy") + "\\" + Label2.Text + ".jpg");

                pass = "gymy/" + Label2.Text + ".jpg";
                w.rundml("insert into photopost (photo,namepost,imgpost,emailpost,typepost)values('" + pass + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + "Photos" + "')");

                DataList2.EditItemIndex = -1;
                SqlDataSource2.DataBind();
                DataList2.DataBind();
            }


        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string path = System.IO.Path.GetFileName(FileUpload2.FileName);
        path = path.Replace(" ", "");
        FileUpload2.SaveAs(Server.MapPath("~/ved/") + path);
        String link = "ved/" + path;
        Literal2.Text = "<Video width=400 Controls><Source src=" + link + " type=video/mp4></video>";
        //w.rundml("insert into post (video,description,username)values('" + Literal2.Text + "','" + TextBox1.Text + "','" + Session["user"].ToString() + "')");
        w.rundml("insert into videopost (video,namepost,imgpost,emailpost,typepost)values('" + Literal2.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + "Videos" + "')");
        //TextBox1.Text = "";
        DataList3.EditItemIndex = -1;
        SqlDataSource3.DataBind();
        DataList3.DataBind();
        //Label2.Text = "Video Uploaded Successfully";
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Image Image1 = e.Item.FindControl("Image1") as Image;
        Session.Add("imgpost", Image1.ImageUrl);
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Session.Add("namepost", Label1.Text);
        Label Label3 = e.Item.FindControl("Label3") as Label;
        Session.Add("emailpost", Label3.Text);
        Label Label4 = e.Item.FindControl("Label4") as Label;
        Session.Add("post", Label4.Text);
        Label Label5 = e.Item.FindControl("Label5") as Label;
        Session.Add("id", Label5.Text);
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Response.Redirect("commentlike.aspx");
      
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Image Image1 = e.Item.FindControl("Image1") as Image;
        Session.Add("imgpost", Image1.ImageUrl);
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Session.Add("namepost", Label1.Text);
        Label Label3 = e.Item.FindControl("Label3") as Label;
        Session.Add("emailpost", Label3.Text);
        Image Image2 = e.Item.FindControl("Image2") as Image;
        Session.Add("photo", Image2.ImageUrl);
        Label Label5 = e.Item.FindControl("Label5") as Label;
        Session.Add("id", Label5.Text);
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Response.Redirect("commentlike.aspx");

    }

    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Image Image1 = e.Item.FindControl("Image1") as Image;
        Session.Add("imgpost", Image1.ImageUrl);
        Label Label1 = e.Item.FindControl("Label1") as Label;
        Session.Add("namepost", Label1.Text);
        Label Label3 = e.Item.FindControl("Label3") as Label;
        Session.Add("emailpost", Label3.Text);
        Literal Literal1 = e.Item.FindControl("Literal1") as Literal;
        Session.Add("video", Literal1.Text);
        Label Label5 = e.Item.FindControl("Label5") as Label;
        Session.Add("id", Label5.Text);
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Response.Redirect("commentlike.aspx");
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
                            <asp:TextBox ID="TextBox1" runat="server" Width="300" TextMode="MultiLine"></asp:TextBox>
                           </td>

                           <td>
                               <asp:FileUpload ID="FileUpload1" runat="server" />
                           </td>

                           <td>
                              <asp:FileUpload ID="FileUpload2" runat="server" />
                           </td>
                    </tr>

                            <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Post" BackColor="#0066FF" 
                                BorderColor="#CC0000" ForeColor="White" onclick="Button1_Click" />
                           </td>

                           <td>
                               <asp:Button ID="Button3" runat="server" Text="Photo" BackColor="#0066FF" 
                                   BorderColor="#CC0000" ForeColor="White" onclick="Button3_Click" />
                           </td>

                           <td>
                          <asp:Button ID="Button4" runat="server" Text="Video" BackColor="#0066FF" 
                                   BorderColor="#CC0000" ForeColor="White" onclick="Button4_Click" />
                               <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                               <asp:Literal ID="Literal2" runat="server" Visible="False"></asp:Literal>
                           </td>
                    </tr>
                     </table>   

			    	    <table class="w-100" align="center">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                Width="200px">
                                <asp:ListItem>Posts</asp:ListItem>
                                <asp:ListItem>Photos</asp:ListItem>
                                <asp:ListItem>Videos</asp:ListItem>
                            </asp:DropDownList>
                           </td>

              
                    </tr>
                     </table>  
                <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
                            DataSourceID="SqlDataSource1" onitemcommand="DataList1_ItemCommand">
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
                            <asp:Button ID="Button2" runat="server" Text="Comment/Like" BackColor="#0066FF" BorderColor="#CC0000" ForeColor="White" Width="300" />
                                </td>

              
                    </tr>
                     </table> 
                    </ItemTemplate>
                </asp:DataList> 
			            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [post] WHERE ([typepost] = @typepost)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="typepost" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <asp:DataList ID="DataList2" runat="server" DataKeyField="id" 
                            DataSourceID="SqlDataSource2" onitemcommand="DataList2_ItemCommand">
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
                              <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>' ForeColor="#000099" Visible="False"></asp:Label>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                             <asp:Image ID="Image2" runat="server"  ImageUrl='<%# Eval("photo") %>' Width="200" Height="200"/>
                                </td>

              
                    </tr>
                      <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Comment/Like" BackColor="#0066FF" BorderColor="#CC0000" ForeColor="White" Width="300" />
                                </td>

              
                    </tr>
                     </table> 
                    </ItemTemplate>
                </asp:DataList>
			            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [photopost] WHERE ([typepost] = @typepost)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="typepost" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <asp:DataList ID="DataList3" runat="server" DataKeyField="id" 
                            DataSourceID="SqlDataSource3" onitemcommand="DataList3_ItemCommand">
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
                              <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>' ForeColor="#000099" Visible="False"></asp:Label>
                                </td>

              
                    </tr>
                            <tr>
                        <td>
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("video") %>' ></asp:Literal>
                                </td>

              
                    </tr>
                      <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Comment/Like" BackColor="#0066FF" BorderColor="#CC0000" ForeColor="White" Width="300" />
                                </td>

              
                    </tr>
                     </table> 
                    </ItemTemplate>
                </asp:DataList>
			            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [videopost] WHERE ([typepost] = @typepost)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="typepost" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
			  <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
            
		</div>
	</div>
</asp:Content>

