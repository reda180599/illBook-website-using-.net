using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class illlogin : System.Web.UI.Page
{
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

        }
        else
        {
            Session["invalidloginattempt"] = null;
            if (Request.Cookies["emailreg"] != null && Request.Cookies["passreg"] != null)
            {

                TextBox1.Text = Request.Cookies["emailreg"].Value;
                TextBox2.Attributes["value"] = Request.Cookies["passreg"].Value;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        w.runq("select * from regadvanced where emailreg='" + TextBox1.Text + "'");
        String uname;
        String pass;
        String spy;
        bool lockstatus;
        DateTime locktimedate = DateTime.Now;
        if (w.tb.Rows.Count == 0)
        {
            Label1.Text = "invalid username or password,relogin";
            //syn.SpeakAsync(Label1.Text);
            //syn.SpeakAsyncCancelAll();
        }
        else
        {
            uname = w.tb.Rows[0]["emailreg"].ToString();
            pass = w.tb.Rows[0]["passreg"].ToString();
            spy = w.tb.Rows[0]["specialistreg"].ToString();
            lockstatus = Convert.ToBoolean(w.tb.Rows[0]["lockedlogin"].ToString());
            if (lockstatus == true)
            {
                locktimedate = Convert.ToDateTime(w.tb.Rows[0]["datetimelocked"].ToString());
                locktimedate = Convert.ToDateTime(locktimedate.ToString("dd/MM/yyyy HH:mm:ss"));
            }
            if (lockstatus == true)
            {
                DateTime cdatetime = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
                TimeSpan ts = cdatetime.Subtract(locktimedate);
                Int32 minuteslocked = Convert.ToInt32(ts.TotalMinutes);
                Int32 pendingminutes = 15 - minuteslocked;
                if (pendingminutes <= 0)
                {
                    unlockaccount();

                }
                else { Label1.Text = "your account have been locked 15 minutes and have unlocked automatically after 15 minutes"; }
            }
            else
            {
                if (uname == TextBox1.Text && pass == TextBox2.Text && spy == "Doctor")
                {
                    if (chme.Checked)
                    {
                        Response.Cookies["emailreg"].Value = TextBox1.Text;
                        Response.Cookies["passreg"].Value = TextBox2.Text;
                        //Response.Cookies["userreg"].Expires = DateTime.Now.AddMinutes(1);
                        //Response.Cookies["passreg"].Expires = DateTime.Now.AddMinutes(1);
                        Response.Cookies["emailreg"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["passreg"].Expires = DateTime.Now.AddDays(30);
                    }
                    //else
                    //{
                    //    //Response.Cookies["userreg"].Expires = DateTime.Now.AddMinutes(-1);
                    //    //Response.Cookies["passreg"].Expires = DateTime.Now.AddMinutes(-1);
                    //    Response.Cookies["userreg"].Expires = DateTime.Now.AddDays(-30);
                    //    Response.Cookies["passreg"].Expires = DateTime.Now.AddDays(-30);
                    //}
                    Session.Add("emailreglogin", TextBox1.Text);
                    Response.Redirect("illhomedoc.aspx");
                }
                else if (uname == TextBox1.Text && pass == TextBox2.Text && spy == "Patient")
                {
                    if (chme.Checked)
                    {
                        Response.Cookies["emailreg"].Value = TextBox1.Text;
                        Response.Cookies["passreg"].Value = TextBox2.Text;
                        Response.Cookies["emailreg"].Expires = DateTime.Now.AddMinutes(30);
                        Response.Cookies["passreg"].Expires = DateTime.Now.AddMinutes(30);
                    }
                    //else
                    //{
                    //    Response.Cookies["emailreg"].Expires = DateTime.Now.AddMinutes(-1);
                    //    Response.Cookies["passreg"].Expires = DateTime.Now.AddMinutes(-1);
                    //}
                    Session.Add("emailreglogin", TextBox1.Text);
                    Response.Redirect("illhomedoc.aspx");
                }
                else if (uname == TextBox1.Text && pass == TextBox2.Text && spy == "Admin")
                {
                    if (chme.Checked)
                    {
                        Response.Cookies["emailreg"].Value = TextBox1.Text;
                        Response.Cookies["passreg"].Value = TextBox2.Text;
                        Response.Cookies["emailreg"].Expires = DateTime.Now.AddMinutes(30);
                        Response.Cookies["passreg"].Expires = DateTime.Now.AddMinutes(30);
                    }
                    //else
                    //{
                    //    Response.Cookies["emailreg"].Expires = DateTime.Now.AddMinutes(-1);
                    //    Response.Cookies["passreg"].Expires = DateTime.Now.AddMinutes(-1);
                    //}
                    Session.Add("emailreglogin", TextBox1.Text);
                    Response.Redirect("illhomedoc.aspx");
                }
                else
                {
                    int attemptaccount;
                    if (Session["invalidloginattempt"] != null)
                    {
                        attemptaccount = Convert.ToInt32(Session["invalidloginattempt"].ToString());
                        attemptaccount = attemptaccount + 1;

                    }
                    else { attemptaccount = 1; }
                    Session["invalidloginattempt"] = attemptaccount;
                    if (attemptaccount == 3)
                    {
                        Label1.Text = "your account have been locked 15 minutes and have unlocked automatically after 15 minutes";
                        changelockstatus();

                    }
                    else { Label1.Text = "invalid username or password,relogin you have" + (3 - attemptaccount) + "remining to login "; }
                }
            }

        }
    }
    void changelockstatus()
    {
        string format = "MM/dd/yyyy HH:mm:ss";
        w.rundml("update regadvanced set lockedlogin=1,datetimelocked='" + DateTime.Now.ToString(format) + "' where emailreg='" + TextBox1.Text + "'");
    }
    void unlockaccount()
    {
        w.rundml("update regadvanced set lockedlogin=0,datetimelocked=NULL where emailreg='" + TextBox1.Text + "'");
    }
}