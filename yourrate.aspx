<%@ Page Title="" Language="C#" MasterPageFile="~/masterdoctor.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script runat="server">
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            w.runq("select rat from rat where emailreg='" + Session["emailreglogin"].ToString() + "'");
            if (w.tb.Rows.Count < 1)
            {
                Label1.Text = "0";
                Label2.Text = "0";
            }
            else
            {
                Label1.Visible = true;
                Label2.Visible = true;
                w.runq("select COUNT(rat) from rat where emailreg='" + Session["emailreglogin"].ToString() + "'");
                Label1.Text = "Your Count Of Users :" + w.tb.Rows[0][0].ToString();
                w.runq("select AVG(rat) from rat where emailreg='" + Session["emailreglogin"].ToString() + "'");
                Label2.Text = "Your Average Of Rating :" + w.tb.Rows[0][0].ToString();
                //Rating1.CurrentRating = Convert.ToInt32(w.tb.Rows[0][0].ToString());
                Rating1.CurrentRating = Convert.ToInt32((Convert.ToDouble(w.tb.Rows[0][0].ToString())));
            }
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="page-content">
		<div class="form-v6-content">
		<%--	<div class="form-left">
				<img src="images/iii.jpg" alt="form">
			</div>--%>
			<div  class="form-detail">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    Width="161px">
                    <ItemTemplate>
                      <table class="w-100">
                            <tr>
                                <td>
                                    <asp:Image ID="Image4" runat="server"  class="img-fluid rounded-circle" 
                                        ImageUrl='<%# Eval("imgreg") %>' Width="100px" 
                            Height="100px"/>
                               
                                </td>

                                </tr>
                                  <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
                            ForeColor="Maroon" Text='<%# Eval("namereg") %>'></asp:Label>
                    </td>

                                </tr>
                     </table>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT [imgreg], [namereg] FROM [regadvanced] WHERE ([emailreg] = @emailreg)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emailreg" SessionField="emailreglogin" 
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
                  
                </table>
			</div>
            
		</div>
	</div>
</asp:Content>

