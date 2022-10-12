using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
public partial class signup1 : System.Web.UI.Page
{
    string txtsend = "wmam158@gmail.com";
    string rrmd1;
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Random rmd = new Random();
        int rmd1 = rmd.Next(100110, 307645);
        rrmd1 = rmd1.ToString();
        Session.Add("msg", rrmd1);
        MailMessage mail = new MailMessage();

        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        //  var emil = txtEmail.Text;


        mail.From = new MailAddress(txtsend);

        mail.To.Add(TextBox1.Text);

        mail.Subject = txtsend;

        mail.Body = rrmd1;

        mail.IsBodyHtml = true;

        SmtpServer.Port = 587;

        SmtpServer.Credentials = new System.Net.NetworkCredential("wmam158", "tar01273444382");

        SmtpServer.EnableSsl = true;


        SmtpServer.Send(mail);


        // Response.Write("<script>alert('Enter Your Code')</script>");
        Label3.Visible = true;
        rrmd1 = txtsend = string.Empty;
        Button1.Visible = false;
        TextBox1.Visible = false;
        Label2.Visible = false;
        Button2.Visible = true;
        Button3.Visible = true;
        TextBox2.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //if (TextBox2.Text == Session["msg"].ToString())
       // {
            //w.rundml("insert into regadvanced(userreg,passreg,namereg,addressreg,specialistreg,emailreg,lockedlogin,spy,sid)values('" + Session["userreg"].ToString() + "','" + Session["passreg"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["addressreg"].ToString() + "','" + Session["specialistreg"].ToString() + "','" + TextBox1.Text + "','" + "0" + "','" + Session["spy"].ToString() + "','" + Session["sid"].ToString() + "')");
            //Session.Add("emailreg", TextBox1.Text);
            //TextBox2.Text = "";
            //Response.Redirect("signup2.aspx");

       // }
        //else
        //{
        //    Label1.Text = "This OTP Isn Not Correct,Please Click On Resend Button To Resend The OTP";
        //}

        if (TextBox2.Text == Session["msg"].ToString())
        {
            if (Session["specialistreg"].ToString() == "Doctor")
            {
                w.rundml("insert into regadvanced(userreg,passreg,namereg,addressreg,specialistreg,emailreg,lockedlogin,spy)values('" + Session["userreg"].ToString() + "','" + Session["passreg"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["addressreg"].ToString() + "','" + Session["specialistreg"].ToString() + "','" + TextBox1.Text + "','" + "0" + "','" + Session["spy"].ToString() + "')");
                Session.Add("emailreg", TextBox1.Text);
                TextBox2.Text = "";
                Response.Redirect("signup2.aspx");
            }
            if (Session["specialistreg"].ToString() == "Patient")
            {
                w.rundml("insert into regadvanced(userreg,passreg,namereg,addressreg,specialistreg,emailreg,lockedlogin,sid)values('" + Session["userreg"].ToString() + "','" + Session["passreg"].ToString() + "','" + Session["namereg"].ToString() + "','" + Session["addressreg"].ToString() + "','" + Session["specialistreg"].ToString() + "','" + TextBox1.Text + "','" + "0" + "','" + Session["sid"].ToString() + "')");
                Session.Add("emailreg", TextBox1.Text);
                TextBox2.Text = "";
                Response.Redirect("signup2.aspx");
            }
    }
        else
        {
            Label1.Text = "This OTP Isn Not Correct,Please Click On Resend Button To Resend The OTP";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Random rmd = new Random();
        int rmd1 = rmd.Next(100110, 307645);
        rrmd1 = rmd1.ToString();
        Session.Add("msg", rrmd1);
        MailMessage mail = new MailMessage();

        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        //  var emil = txtEmail.Text;


        mail.From = new MailAddress(txtsend);

        mail.To.Add(TextBox1.Text);

        mail.Subject = txtsend;

        mail.Body = rrmd1;

        mail.IsBodyHtml = true;

        SmtpServer.Port = 587;

        SmtpServer.Credentials = new System.Net.NetworkCredential("wmam158", "tar01273444382");

        SmtpServer.EnableSsl = true;


        SmtpServer.Send(mail);


        // Response.Write("<script>alert('Enter Your Code')</script>");

        rrmd1 = txtsend = string.Empty;
        Button1.Visible = false;
        TextBox1.Visible = false;
        Label2.Visible = false;
        Button2.Visible = true;
        Button3.Visible = true;
        TextBox2.Visible = true;
    }
}