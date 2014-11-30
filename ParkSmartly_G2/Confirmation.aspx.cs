using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
{
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
           id  = Request.QueryString["id"];
        }
        else
        {
            //lblDefaultData.Text = "Sorry,Data not found";
        }
        string r_id = "", mor_time = "", aft_time = "", nig_tm = "", name = "", ema_id = "", co_no = "", date = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        conn.Open();
        string cmndstr_getDtls = "Select * from Registration_temporary where id = '" + id + "'";
        SqlCommand getData = new SqlCommand(cmndstr_getDtls, conn);
        SqlDataReader dr = getData.ExecuteReader();

        while (dr.Read())
        {



           

            r_id = dr["id"].ToString();
            mor_time = dr["mor_time"].ToString();
            aft_time = dr["aft_time"].ToString();
            nig_tm = dr["nig_time"].ToString();
            name = dr["name"].ToString();
            ema_id = dr["email_id"].ToString();
            co_no = dr["contact_no"].ToString();
            date = dr["date"].ToString();

        }
        dr.Close();
        //conn.Close();
        string par_time="",amnt="";
        if (mor_time == "true") { par_time = "morning"; amnt = "30"; }
        else if (aft_time == "true") { par_time = par_time + " afternoon"; amnt = (amnt + 30).ToString(); }
        else if (nig_tm == "true") { par_time = par_time + " night"; amnt = (amnt + 25).ToString(); } 




        Lbl_date.Text = date;
        lbl_name.Text = name;
        Lbl_co_name.Text = co_no;
        Lbl_emai.Text = ema_id;
        Lbl_par_time.Text = par_time;
        Lbl_amt.Text = amnt;
    }

    protected void Btn_confirm_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        cnn.Open();
        string cmndstr_getDtls = "Select * from Registration_Data where reference_id = '" + id + "'";
        SqlCommand getData = new SqlCommand(cmndstr_getDtls, cnn);
        SqlDataReader dr = getData.ExecuteReader();

        string mtm, atm, ntm, name, e_id, c_no, dt, amt, r_id;
        while (dr.Read())
        {


            mtm = dr["mor_time"].ToString();
            atm = dr["aft_time"].ToString();
            ntm = dr["nig_time"].ToString();
            name = dr["name"].ToString();
            e_id = dr["email_id"].ToString();
            c_no = dr["contact_no"].ToString();
            dt = dr["date"].ToString();
            amt = dr["amount"].ToString();
            r_id = dr["reference_id"].ToString();

        }
        dr.Close();
        cnn.Close();

    }
}