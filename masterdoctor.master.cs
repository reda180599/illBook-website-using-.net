using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.IO;
public partial class masterdoctor : System.Web.UI.MasterPage
{
    mywork w = new mywork();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            w.runq("select namereg,imgreg,specialistreg,spy from regadvanced where emailreg='" + Session["emailreglogin"].ToString() + "'");
            Label8.Text = w.tb.Rows[0]["namereg"].ToString();
            Label9.Text = w.tb.Rows[0]["imgreg"].ToString();
            Label10.Text = w.tb.Rows[0]["specialistreg"].ToString();
            Label11.Text = w.tb.Rows[0]["spy"].ToString();
            Session.Add("namereglogin", Label8.Text);
            Session.Add("imgreglogin", Label9.Text);
            if (Label10.Text == "Patient") {
                ImageButton6.Visible = false;
            }
        }
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("rating.aspx");
    }

    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    { 
        Label Label7 = e.Item.FindControl("Label7") as Label;
        Session.Add("emaildocenter", Label7.Text);
        Label Label5 = e.Item.FindControl("Label5") as Label;
        Session.Add("namedocenter", Label5.Text);
        Label Label6 = e.Item.FindControl("Label6") as Label;
        Session.Add("spydocenter", Label6.Text);
        ImageButton ImageButton4 = e.Item.FindControl("ImageButton4") as ImageButton;
        Session.Add("imgdocenter", ImageButton4.ImageUrl);
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Response.Redirect("rating1.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        w.rundml("delete from countchat where toemailchat='" + Session["emailreglogin"].ToString() + "'");
        Response.Redirect("chat.aspx");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Session.Add("specialistreglogin", Label10.Text);
        Session.Add("spyreglogin", Label11.Text);
        Response.Redirect("addbooking.aspx");
    }

    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        Session.Add("spyreglogin", Label11.Text);
        Response.Redirect("report.aspx");
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        Session.Add("namereglogin", Label8.Text);
        Session.Add("imgreglogin", Label9.Text);
        w.runq("select count from notireport where toemailnotireport='" + Session["emailreglogin"].ToString() + "'");
       if (w.tb.Rows.Count > 0)
            {
                w.rundml("update notireport set count='" + "0" + "'  where toemailnotireport='" + Session["emailreglogin"].ToString() + "' ");
                Response.Redirect("noti.aspx");

            }
    }
}
