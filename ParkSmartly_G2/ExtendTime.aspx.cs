using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExtendTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Lbl_err_msg.Text = "";
    }
    protected void Btn_extd_Click(object sender, EventArgs e)
    {
        string date, id, spc, flr, l_plt, hrs, amt, E_tm = null, ex_amt;
        int txt_hrs;


        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            con.Open();
            string cmndstr_id = "Select id from ParkingInformation where Number_Plate ='" + Tb_noPlt.Text + "'";
            SqlCommand getid = new SqlCommand(cmndstr_id, con);
            string gid = getid.ExecuteScalar().ToString();
            con.Close();
            if (!String.IsNullOrEmpty(gid))
            {
                if (!String.IsNullOrEmpty(Tb_noPlt.Text))
                {

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    conn.Open();
                    string cmndstr_getDtls = "Select * from ParkingInformation where Number_Plate = '" + Tb_noPlt.Text + "'";
                    SqlCommand getData = new SqlCommand(cmndstr_getDtls, conn);
                    SqlDataReader dr = getData.ExecuteReader();

                    while (dr.Read())
                    {


                        id = dr["id"].ToString();
                        spc = dr["space"].ToString();
                        flr = dr["Floor"].ToString();
                        date = dr["Date"].ToString();
                        l_plt = dr["Number_Plate"].ToString();
                        hrs = dr["Hours"].ToString();
                        E_tm = dr["ExitTime"].ToString();
                        amt = dr["Amount"].ToString();

                    }
                    dr.Close();
                    conn.Close();
                }
                else if (!String.IsNullOrEmpty(Tb_id.Text))
                {
                    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cnn.Open();
                    string cmndstr_getDtls = "Select * from ParkingInformation where id = '" + Tb_id.Text + "'";
                    SqlCommand getData = new SqlCommand(cmndstr_getDtls, cnn);
                    SqlDataReader dr = getData.ExecuteReader();

                    while (dr.Read())
                    {


                        id = dr["id"].ToString();
                        spc = dr["space"].ToString();
                        flr = dr["Floor"].ToString();
                        date = dr["Date"].ToString();
                        l_plt = dr["Number_Plate"].ToString();
                        hrs = dr["Hours"].ToString();
                        E_tm = dr["ExitTime"].ToString();
                        amt = dr["Amount"].ToString();
                    }
                    dr.Close();
                    cnn.Close();

                }
                else { Lbl_err_msg.Text = "Licence Plate OR Ticket Id must be provided"; Lbl_err_msg.Visible = true; }

            }
            else { Lbl_err_msg.Text = "Data Not Matching, Try Again"; }


            txt_hrs = Int32.Parse(Tb_hrs.Text);

            if (txt_hrs != null)
            {


                DateTime ext_time = Convert.ToDateTime(E_tm);
                DateTime nw_ext_tm = ext_time.AddHours(txt_hrs);
                ex_amt = (txt_hrs * 4).ToString();

            }
        }
        catch (NullReferenceException)
        {

            Lbl_err_msg.Text = "Data Not Matching, Try Again";

        }
    }
}