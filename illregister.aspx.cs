using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class illregister : System.Web.UI.Page
{
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Add("namereg", TextBox1.Text);
        Session.Add("emailreg", TextBox2.Text);
        Session.Add("passreg", TextBox3.Text);
        w.rundml("insert into regadvanced(namereg,emailreg,passreg,lockedlogin)values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + "0" + "')");
        Response.Redirect("illregister1.aspx");
    }
}