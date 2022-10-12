<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<script runat="server">
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            w.runq("select rat from rat where emailreg='" + Session["emaildocenter"].ToString() + "'");
            if (w.tb.Rows.Count < 1)
            {
                Label1.Text = "0";
                Label2.Text = "0";
            }
            else
            {
                Label1.Visible = true;
                Label2.Visible = true;
                w.runq("select COUNT(rat) from rat where emailreg='" + Session["emaildocenter"].ToString() + "'");
                Label1.Text = "Your Count Of Users :" + w.tb.Rows[0][0].ToString();
                w.runq("select AVG(rat) from rat where emailreg='" + Session["emaildocenter"].ToString() + "'");
                Label2.Text = "Your Average Of Rating :" + w.tb.Rows[0][0].ToString();
                
                Rating1.CurrentRating = Convert.ToInt32((Convert.ToDouble(w.tb.Rows[0][0].ToString())));
                //Rating1.CurrentRating = Convert.ToInt32((Convert.ToDouble(Label2.Text)));
            }
        }

    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
       
            w.rundml("insert into rat (rat,review,emailreg,namereg,spy,imgreg,namereglogin,imgreglogin)values('" + Rating1.CurrentRating.ToString() + "','" + TextBox1.Text + "','" + Session["emaildocenter"].ToString() + "','" + Session["namedocenter"].ToString() + "','" + Session["spydocenter"].ToString() + "','" + Session["imgdocenter"].ToString() + "','" + Session["namereglogin"].ToString() + "','" + Session["imgreglogin"].ToString() + "')");
        Response.Redirect(Request.Url.AbsoluteUri);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content">
		<div class="form-v6-content">
		<%--	<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>--%>
			<div  class="form-detail">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                       
                        <table class="w-100">
                            <tr>
                                <td>
                                    <asp:Image ID="Image4" runat="server"  class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgreg") %>' Width="200" 
                            Height="200"/>
                               
                                </td>
                               
                                <td>
                                     &nbsp;
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("namereg") %>'></asp:Label>
                                </td>
                                
                                <td style="color: #800000">
                                     &nbsp;   &nbsp;   Email: &nbsp;
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("emailreg") %>'></asp:Label>
                                </td>
                                     <td style="color: #800000">
                                     &nbsp;   &nbsp;   Department: &nbsp;
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("spy") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                       
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [imgreg], [namereg], [emailreg],[spy] FROM [regadvanced] WHERE ([emailreg] = @emailreg)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emailreg" SessionField="emaildocenter" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
			    <table class="w-100">
                    <tr>
                        <td colspan="2">
                            <ajaxToolkit:Rating ID="Rating1" runat="server" MaxRating="5"  CurrentRating="1"  StarCssClass="starempty" 
FilledStarCssClass="starfilled"  WaitingStarCssClass="starwaiting"  EmptyStarCssClass="starempty"   AutoPostBack="true">>
                            </ajaxToolkit:Rating>

                         </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" 
                                ForeColor="Red"></asp:Label>
                           </td>
                        <td>
                              <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" 
                                  ForeColor="Red"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        </td>
                        <td >
                            <asp:Button ID="Button1" runat="server" Text="Rating" BorderColor="Black" 
                                Width="90" BackColor="Red" onclick="Button1_Click1" />
                        </td>
                    </tr>
                </table>
                 <br/>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                      <table>
                       <tr>
                        <td rowspan="2" >
                            <asp:Image ID="Image1" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("imgreglogin") %>' Width="100" 
                            Height="100"/>
                           </td>
                            <td >
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("namereglogin") %>'></asp:Label>
                           </td>
                    </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("review") %>'></asp:Label>
                              </td>
                          </tr>
                      </table>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [review], [namereglogin], [imgreglogin] FROM [rat] WHERE ([emailreg] = @emailreg)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emailreg" SessionField="emaildocenter" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
			</div>
            
		</div>
	</div>
</asp:Content>

