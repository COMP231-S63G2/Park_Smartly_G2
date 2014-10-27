using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Add_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            con.Open();
            string cmndstr_psd = "Insert Into ParkingInformation (Floor,space) values ('" + Tbox_floNo.Text + "','" + Tbox_SpaceNo.Text + "')";
            SqlCommand insert = new SqlCommand(cmndstr_psd, con);
            insert.ExecuteNonQuery();
            con.Close();

        }
        catch { Lbl_err.Visible = true; }
        Response.Redirect("UpdateData.aspx");
    }
    protected void Add_mul_Click(object sender, EventArgs e)
    {

    }
}