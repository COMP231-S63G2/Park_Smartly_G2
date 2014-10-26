using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WindowLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            con.Open();
            string cmndstr_psd = "Select Password from Registration where UserName ='" + Tb_usrnm.Text + "'";
            SqlCommand getpasswrd = new SqlCommand(cmndstr_psd, con);
            string password = getpasswrd.ExecuteScalar().ToString();
            con.Close();


            if (password == Tb_psswrd.Text)
            {
                Session["user"] = Tb_usrnm.Text;
                Response.Redirect("GenerateTicket.aspx");
            }
            else { Lbl_invld.Visible = true; }
        }
        catch { Lbl_invld.Visible = true; }
    }



}