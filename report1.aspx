<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<script runat="server">
    mywork w = new mywork();
    //string pass;
 
    protected void Button1_Click1(object sender, EventArgs e)
    {

        string pass;


        if (FileUpload1.HasFile)
        {
            w.runq("select id from report");
            if (w.tb.Rows.Count < 1)
            {
                Label2.Text = "1";
                FileUpload1.SaveAs(Server.MapPath("gymy") + "\\" + Label2.Text + ".jpg");
           
                pass = "gymy/" + Label2.Text + ".jpg";
               // w.rundml("insert into report (img)values('" + pass + "')");
                w.rundml("insert into report (imgreport,postreport,fromreport,toreport,fromimgreport,toimgreport,fromemailreport,toemailreport,spyreport,datereport)values('" + pass + "','" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgreg"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emailreg"].ToString() + "','" + Session["spyreglogin"].ToString() + "','" + DateTime.Now.ToString() + "')");
                w.rundml("insert into notireport (fromnotireport,tonotireport,imgfromnotireport,imgtonotireport,fromemailnotireport,toemailnotireport,message,count,spyreport)values('" + Session["namereglogin"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgreg"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emailreg"].ToString() + "','" + "you should evaluate this doc" + "','" + "1" + "','" + Session["spyreglogin"].ToString() + "')");
                DataList1.EditItemIndex = -1;
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }
            else
            {
                w.runq("select MAX(id) from report");
                Label2.Text = w.tb.Rows[0][0].ToString();
                int a = Convert.ToInt32(Label2.Text);
                a = a + 1;
                Label2.Text = a.ToString();
                FileUpload1.SaveAs(Server.MapPath("gymy") + "\\" + Label2.Text + ".jpg");
             
                pass = "gymy/" + Label2.Text + ".jpg";
                w.rundml("insert into report (imgreport,postreport,fromreport,toreport,fromimgreport,toimgreport,fromemailreport,toemailreport,spyreport,datereport)values('" + pass + "','" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgreg"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emailreg"].ToString() + "','" + Session["spyreglogin"].ToString() + "','" + DateTime.Now.ToString() + "')");
                w.rundml("insert into notireport (fromnotireport,tonotireport,imgfromnotireport,imgtonotireport,fromemailnotireport,toemailnotireport,message,count,spyreport)values('" + Session["namereglogin"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgreg"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emailreg"].ToString() + "','" + "you should evaluate this doc" + "','" + "1" + "','" + Session["spyreglogin"].ToString() + "')");
                DataList1.EditItemIndex = -1;
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }


        }
        //w.rundml("insert into report (imgreport,postreport,fromreport,toreport,fromimgreport,toimgreport,fromemailreport,toemailreport)values('" + FileUpload1 + "','" + TextBox1.Text + "','" + Session["namereglogin"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["imgreglogin"].ToString() + "','" + Session["imgreg"].ToString() + "','" + Session["emailreglogin"].ToString() + "','" + Session["emailreg"].ToString() + "')");
        
    }
    //public string File1 { get; set; }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label Label5 = e.Item.FindControl("Label5") as Label;
        if (e.CommandName == "Delete")
        {
            w.rundml("delete from report where (fromemailreport='" + Session["emailreglogin"].ToString() + "')AND(id='" + Label5.Text + "') ");
            DataList1.EditItemIndex = -1;
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }

        if (e.CommandName == "Update")
        {
            //w.rundml("update report set postreport='" + TextBox1.Text + "',imgreport='" + pass + "'  where (fromemailreport='" + Session["emailreglogin"].ToString() + "')AND(id='" + Label5.Text + "') ");
            //DataList1.EditItemIndex = -1;
            //SqlDataSource1.DataBind();
            //DataList1.DataBind();

            string pass;


            if (FileUpload1.HasFile)
            {
                w.runq("select id from report");
                if (w.tb.Rows.Count < 1)
                {
                    Label2.Text = "1";
                    FileUpload1.SaveAs(Server.MapPath("gymy") + "\\" + Label2.Text + ".jpg");

                    pass = "gymy/" + Label2.Text + ".jpg";
                    // w.rundml("insert into report (img)values('" + pass + "')");
                    w.rundml("update report set postreport='" + TextBox1.Text + "',imgreport='" + pass + "'  where (fromemailreport='" + Session["emailreglogin"].ToString() + "')AND(id='" + Label5.Text + "') ");
                    DataList1.EditItemIndex = -1;
                    SqlDataSource1.DataBind();
                    DataList1.DataBind();
                }
                else
                {
                    w.runq("select MAX(id) from report");
                    Label2.Text = w.tb.Rows[0][0].ToString();
                    int a = Convert.ToInt32(Label2.Text);
                    a = a + 1;
                    Label2.Text = a.ToString();
                    FileUpload1.SaveAs(Server.MapPath("gymy") + "\\" + Label2.Text + ".jpg");

                    pass = "gymy/" + Label2.Text + ".jpg";
                    w.rundml("update report set postreport='" + TextBox1.Text + "',imgreport='" + pass + "'  where (fromemailreport='" + Session["emailreglogin"].ToString() + "')AND(id='" + Label5.Text + "') ");
                    DataList1.EditItemIndex = -1;
                    SqlDataSource1.DataBind();
                    DataList1.DataBind();
                }


            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"  >
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
                    </tr>
                    <tr>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                          </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Post" BackColor="#3399FF" 
                                BorderColor="Black" onclick="Button1_Click1" Width="250" />
                           </td>
                    </tr>
                       <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#3399FF" 
                                AutoPostBack="True" Width="200px">
                                <asp:ListItem>Surgary</asp:ListItem>
                                <asp:ListItem>eyes</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="Label2" runat="server" BackColor="Red" Visible="False"></asp:Label>
                           </td>
                    </tr>
                </table>  
                     
			   
	
                
                <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
                    DataSourceID="SqlDataSource1" onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
          	    <table class="w-100">
                <%--<center>--%>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("fromimgreport") %>' Width="50" Height="50" />
                           </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Image ID="Image2" runat="server"  ImageUrl='<%# Eval("imgreport") %>' Width="300" Height="300" />
                          </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("fromreport") %>' ForeColor="#000099"></asp:Label>
                           </td>
                           <td>
                           &nbsp;   &nbsp;   &nbsp;
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("datereport") %>' ForeColor="#000099"></asp:Label>
                           </td>
                    </tr>
                    

                  
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("postreport") %>' ForeColor="Black"></asp:Label>
                           <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>' ForeColor="Black" Visible="False"></asp:Label>
                           </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Delete" BackColor="Red" ForeColor="White" CommandName="Delete" Width="150" />
                           </td>
                            <td>
                            <asp:Button ID="Button3" runat="server" Text="Update" BackColor="Red" ForeColor="White" CommandName="Update" Width="150" />
                           </td>
                    </tr>
                    <%--</center>--%>
                     <hr style="background-color: #000000" size="10">
                </table>
                    </ItemTemplate>
                </asp:DataList>      
			   
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                                SelectCommand="SELECT * FROM [report] WHERE (([toemailreport] = @toemailreport) AND ([spyreport] = @spyreport)) ORDER BY [id] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="toemailreport" SessionField="emailreg" 
                            Type="String" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="spyreport" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
			   
			</div>
            
		</div>
	</div>
</asp:Content>

