using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
public partial class forgetpass : System.Web.UI.Page
{
    string txtsend = "mohamednageh769@gmail.com";
    string rrmd1;
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Random rmd = new Random();
        //int rmd1 = rmd.Next(100110, 307645);
        //rrmd1 = rmd1.ToString();
        //Session.Add("msg", rrmd1);
        //MailMessage mail = new MailMessage();

        //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        ////  var emil = txtEmail.Text;


        //mail.From = new MailAddress(txtsend);

        //mail.To.Add(TextBox1.Text);

        //mail.Subject = txtsend;

        //mail.Body = rrmd1;

        //mail.IsBodyHtml = true;

        //SmtpServer.Port = 587;

        //SmtpServer.Credentials = new System.Net.NetworkCredential("mohamednageh769", "Moh_01288685705");

        //SmtpServer.EnableSsl = true;


        //SmtpServer.Send(mail);
        Response.Redirect("forgetpass1.aspx");
    }
}