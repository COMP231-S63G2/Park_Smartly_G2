using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MakeAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_succs.Visible = false;
        lbl_us_exists.Visible = false;
    }

    protected void Btn_sbmt_Click(object sender, EventArgs e)
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        con.Open();
        string cmndstr = "Select count(*) from Registration where UserName ='" + Tb_usnm.Text + "'";
        SqlCommand userExist = new SqlCommand(cmndstr, con);
        int temp = Convert.ToInt32(userExist.ExecuteScalar().ToString());
        con.Close();
        if (temp == 1)
        {
            lbl_us_exists.Visible = true;
        }

        else
        {
            SqlConnection cnctn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cnctn.Open();
            string cmdstr = "Insert into Registration (FirstName,LastName,Gender,Address,City,PostalCode,ContactNo,UserName,Password,EmailID,Birthdate,BloodGroup) values (@FirstName,@LastName,@Gender,@Address,@City,@PostalCode,@ContactNo,@UserName,@Password,@EmailID,@Birthdate,@BloodGroup) ";

            SqlCommand insertUser = new SqlCommand(cmdstr, cnctn);
            insertUser.Parameters.AddWithValue("@FirstName", Tb_fname.Text);
            insertUser.Parameters.AddWithValue("@LastName", Tb_lname.Text);
            insertUser.Parameters.AddWithValue("@Gender", DropDown_gen.SelectedItem.ToString());
            insertUser.Parameters.AddWithValue("@Address", tb_adrs.Text);
            insertUser.Parameters.AddWithValue("@City", tb_city.Text);
            insertUser.Parameters.AddWithValue("@PostalCode", Tb_pocd.Text);
            insertUser.Parameters.AddWithValue("@ContactNo", tb_conmr.Text);
            insertUser.Parameters.AddWithValue("@UserName", Tb_usnm.Text);
            insertUser.Parameters.AddWithValue("@Password", Tb_lname.Text + Tb_pocd.Text);
            insertUser.Parameters.AddWithValue("@EmailID", tb_email.Text);
            insertUser.Parameters.AddWithValue("@Birthdate", Tb_bdate.Text);
            insertUser.Parameters.AddWithValue("@BloodGroup", DropDown_blgr.SelectedItem.ToString());


            try
            {
                insertUser.ExecuteNonQuery();
                cnctn.Close();
                lbl_succs.Visible = true;
            }
            catch (Exception ex) { Response.Write("Something went wrong....Better luck next time"); }

        }
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Adminhome.aspx");
    }
    protected void Btn_reset_Click(object sender, EventArgs e)
    {
        Tb_fname.Text = null;
        Tb_lname.Text = null;
        tb_adrs.Text = null;
        tb_city.Text = null;
        tb_conmr.Text = null;
        tb_email.Text = null;
        Tb_usnm.Text = null;
        Tb_pocd.Text = null;
        Tb_bdate.Text = null;

        DropDown_pro.SelectedIndex = 0;
        DropDown_gen.SelectedIndex = 0;
        DropDown_blgr.SelectedIndex = 0;
    }
}