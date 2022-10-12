using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgetpass1 : System.Web.UI.Page
{
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.rundml("update regadvanced set passreg='" + TextBox1.Text + "' where emailreg='" + Session["emailreglogin"].ToString() + "'");
        Response.Redirect("illlogin.aspx");
    }
}