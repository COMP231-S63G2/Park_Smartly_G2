using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["user"] != null)
            {
                lnkLogout.Visible = true;
                wi_login.Visible = false;
                btnLogout_adm.Visible = false;
            }
            else if (Session["admin"] != null)
            {
                lnkLogout.Visible = true;
                btnLogout_adm.Visible = false;
                wi_login.Visible = false;
            }
            else
            {
                lnkLogout.Visible = false;
            }
    }

    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.ClearHeaders();
        Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
        Response.AddHeader("Pragma", "no-cache");
        Response.Redirect("HomePage.aspx");
    }
    protected void btnLogout_adm_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLogin.aspx");
    }
    protected void wi_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("WindowLogin.aspx");
    }
}
