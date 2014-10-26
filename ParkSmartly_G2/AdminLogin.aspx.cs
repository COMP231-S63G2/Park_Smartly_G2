using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        con.Open();
        string cmndstr_psd = "Select Password from Registration where UserName ='" + Tbox_un.Text + "'";
        SqlCommand getpasswrd = new SqlCommand(cmndstr_psd, con);
        string password = getpasswrd.ExecuteScalar().ToString();
        con.Close();
        
        if (password == Tbox_pass.Text)
        {
            Response.Redirect("MakeAccount.aspx");
        }
        else { Lbl_invalid.Visible = true; }
    }
}