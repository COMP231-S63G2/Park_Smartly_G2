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
        string date = "", id, spc, flr, l_plt = "", hrs = "", amt, E_tm = null, ex_amt;
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

                SqlConnection cnctn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cnctn.Open();

                string cmstr = "Insert into TimeExtendedInformation (Date,Number_Plate,Hours,ExtendedHours,ExitTime,Amount) values (@Date,@Number_Plate,@Hours,@ExtendedHours,@ExitTime,@Amount) ";

                SqlCommand insert_extd_data = new SqlCommand(cmstr, cnctn);
                insert_extd_data.Parameters.AddWithValue("@Date", date);
                insert_extd_data.Parameters.AddWithValue("@Number_Plate", l_plt);
                insert_extd_data.Parameters.AddWithValue("@Hours", hrs);
                insert_extd_data.Parameters.AddWithValue("@ExtendedHours", txt_hrs);
                insert_extd_data.Parameters.AddWithValue("@ExitTime", nw_ext_tm);
                insert_extd_data.Parameters.AddWithValue("@Amount", ex_amt);


                try
                {
                    insert_extd_data.ExecuteNonQuery();
                    cnctn.Close();

                    lbl_msg.Attributes.Add("style", "Color:Green;");
                    lbl_msg.Text = " You have successfully extended your time-limit";
                    lbl_msg.Visible = true;

                    lbl_ex_hrs.Text = " Extended Hours: " + txt_hrs + " Hours";
                    lbl_ex_hrs.Visible = true;

                    lbl_amt.Text = "Amount to pay: " + ex_amt + " CAD";
                    lbl_amt.Visible = true;

                    ;

                    lbl_nw_ext_tm.Text = "Your new exit time is  " + nw_ext_tm.ToString("hh:mm tt") + "";
                    lbl_nw_ext_tm.Visible = true;
                }
                catch { }

            }
        }
        catch (NullReferenceException)
        {

            Lbl_err_msg.Text = "Data Not Matching, Try Again";

        }
    }
}