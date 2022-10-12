using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signup : System.Web.UI.Page
{
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.runq("select userreg from regadvanced where userreg='" + TextBox1.Text + "'");
        if (w.tb.Rows.Count > 0)
        {
            Label1.Text = "username already exist ";
        }
        else
        {
            if (DropDownList1.SelectedItem.Text == "Doctor")
            {
                Session.Add("userreg", TextBox1.Text);
                Session.Add("namereg", TextBox2.Text);
                Session.Add("passreg", TextBox3.Text);
                Session.Add("addressreg", TextBox4.Text);
                //Session.Add("sid", TextBox5.Text);
                Session.Add("specialistreg", DropDownList1.SelectedItem.Text);
                Session.Add("spy", DropDownList2.SelectedItem.Text);

                Response.Redirect("signup1.aspx");
            }
            if (DropDownList1.SelectedItem.Text == "Patient")
            {
                Session.Add("userreg", TextBox1.Text);
                Session.Add("namereg", TextBox2.Text);
                Session.Add("passreg", TextBox3.Text);
                Session.Add("addressreg", TextBox4.Text);
                Session.Add("sid", TextBox5.Text);
                Session.Add("specialistreg", DropDownList1.SelectedItem.Text);
                //Session.Add("spy", DropDownList2.SelectedItem.Text);

                Response.Redirect("signup1.aspx");
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        w.runq("select userreg from regadvanced where userreg='" + TextBox1.Text + "'");
        if (w.tb.Rows.Count > 0)
        {
            Label1.Text = "username already exist ";

        }
        else
        {
            Label1.Text = "username available to choose ";


        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value == "Doctor")
        {
            TextBox5.Visible = false;
            DropDownList2.Visible = true;
        }
        else
        {
            TextBox5.Visible = true;
            DropDownList2.Visible = false;
        }
    }
}