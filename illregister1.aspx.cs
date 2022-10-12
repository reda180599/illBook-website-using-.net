using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class illregister1 : System.Web.UI.Page
{
    mywork w = new mywork();
    string pass;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value == "Doctor")
        {
            TextBox1.Visible = false;
            DropDownList2.Visible = true;
        }
        else
        {
            TextBox1.Visible = true;
            DropDownList2.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            w.runq("select idreg from regadvanced");
            if (w.tb.Rows.Count < 1)
            {
                Label1.Text = "1";
                FileUpload1.SaveAs(Server.MapPath("regimage") + "\\" + Label1.Text + ".jpg");
                pass = "regimage/" + Label1.Text + ".jpg";
                if (DropDownList1.SelectedItem.Value == "Doctor"){
                    w.rundml("update regadvanced set imgreg='" + pass + "',specialistreg='" + DropDownList1.SelectedItem.Value + "',spy='" + DropDownList2.SelectedItem.Value + "' where idreg='" + Label1.Text + "'");
                    Session.Add("imgreg", pass);
                    Session.Add("specialistreg", DropDownList1.SelectedItem.Value);
                    Session.Add("spy", DropDownList2.SelectedItem.Value);
                    Session.Add("idreg", Label1.Text);
                    Response.Redirect("illregister2.aspx");
                }
                else {
                    w.rundml("update regadvanced set imgreg='" + pass + "',specialistreg='" + DropDownList1.SelectedItem.Value + "',sid='" + TextBox1.Text + "' where idreg='" + Label1.Text + "'");
                    Session.Add("imgreg", pass);
                    Session.Add("specialistreg", DropDownList1.SelectedItem.Value);
                    Session.Add("sid", TextBox1.Text);
                    Session.Add("idreg", Label1.Text);
                    Response.Redirect("illregister2.aspx");
                }
         
            }
            else
            {
                w.runq("select MAX(idreg) from regadvanced");
                Label1.Text = w.tb.Rows[0][0].ToString();
                FileUpload1.SaveAs(Server.MapPath("regimage") + "\\" + Label1.Text + ".jpg");
                pass = "regimage/" + Label1.Text + ".jpg";
                if (DropDownList1.SelectedItem.Value == "Doctor")
                {
                    w.rundml("update regadvanced set imgreg='" + pass + "',specialistreg='" + DropDownList1.SelectedItem.Value + "',spy='" + DropDownList2.SelectedItem.Value + "' where idreg='" + Label1.Text + "'");
                    Session.Add("imgreg", pass);
                    Session.Add("specialistreg", DropDownList1.SelectedItem.Value);
                    Session.Add("spy", DropDownList2.SelectedItem.Value);
                    Session.Add("idreg", Label1.Text);
                    Response.Redirect("illregister2.aspx");
                }
                else
                {
                    w.rundml("update regadvanced set imgreg='" + pass + "',specialistreg='" + DropDownList1.SelectedItem.Value + "',sid='" + TextBox1.Text + "' where idreg='" + Label1.Text + "'");
                    Session.Add("imgreg", pass);
                    Session.Add("specialistreg", DropDownList1.SelectedItem.Value);
                    Session.Add("sid", TextBox1.Text);
                    Session.Add("idreg", Label1.Text);
                    Response.Redirect("illregister2.aspx");
                }

            }
        }
    }
}