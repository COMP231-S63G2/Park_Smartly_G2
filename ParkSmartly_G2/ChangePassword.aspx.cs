using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_nt_f.Visible = false;
        lbl_nt_mtch.Visible = false;
        lbl_succ.Visible = false;
    }
    protected void changePassword1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        con.Open();
        string cmndstr_psd = "Select count(*) from Registration where Password ='" + Tbox_pass1.Text + "'";
        SqlCommand userExist = new SqlCommand(cmndstr_psd, con);
        int temp = Convert.ToInt32(userExist.ExecuteScalar().ToString());
        if (temp != 0)
        {
            if (Tbox_passN.Text != Tbox_passCN.Text)
            {
                lbl_nt_mtch.Visible = true;
            }
            else
            {
                string change_psd = "UPDATE Registration SET Password='" + Tbox_passN.Text + "' WHERE Password='" + Tbox_pass1.Text + "'";
                SqlCommand pass_changed = new SqlCommand(change_psd, con);
                int n = Convert.ToInt32(pass_changed.ExecuteNonQuery().ToString());
                if (n != 0)
                {
                    lbl_succ.Visible = true;
                }
                con.Close();
            }
        }
        else
        {

            lbl_nt_f.Visible = true;
        }


    }
    protected void continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("GenerateTickets.aspx");
    }
}