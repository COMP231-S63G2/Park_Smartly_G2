using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenerateTicket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_gnrt_Click(object sender, EventArgs e)
    {
        String availability = null;
        try
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            con.Open();
            string cmndstr_available = "Select space from ParkingInformation where allocated = 'False'";
            SqlCommand getavail = new SqlCommand(cmndstr_available, con);
            availability = getavail.ExecuteScalar().ToString();
            con.Close();


            if (Int32.Parse(availability) > 0)
            {

                string spc = null, flr = null;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                conn.Open();
                string cmndstr_getSpace = "Select top 1 * from ParkingInformation where allocated = 'False'";
                SqlCommand getData = new SqlCommand(cmndstr_getSpace, conn);
                SqlDataReader dr = getData.ExecuteReader();

                while (dr.Read())
                {

                    spc = dr["space"].ToString();
                    flr = dr["Floor"].ToString();

                }
                dr.Close();
                conn.Close();

                SqlConnection cnc = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cnc.Open();
                string cmdstr = "update ParkingInformation Set Allocated = 'True',Date=@date,Number_Plate=@Num_Plate,Hours=@Hours,ExitTime=@exitTime where Floor=@floor and Space=@space;";

                DateTime CurntDateTime = DateTime.Now;
                string Datetime = CurntDateTime.ToString("yyyy-MM-dd HH:mm:ss");
                //for exit time
                int hours = Int32.Parse(Tb_hours.Text);
                DateTime ExitTime = CurntDateTime.AddHours(hours);
                string ExtTime = ExitTime.ToString("yyyy-MM-dd HH:mm:ss");

                SqlCommand insertData = new SqlCommand(cmdstr, cnc);
                insertData.Parameters.AddWithValue("@Num_Plate", Tb_noPlt.Text);
                insertData.Parameters.AddWithValue("@Hours", Tb_hours.Text);
                insertData.Parameters.AddWithValue("@date", Datetime);
                insertData.Parameters.AddWithValue("@floor", flr);
                insertData.Parameters.AddWithValue("@space", spc);
                insertData.Parameters.AddWithValue("@exitTime", ExtTime);

                try
                {
                    insertData.ExecuteNonQuery();
                    cnc.Close();

                }
                catch (Exception ex) { Response.Write("Something went wrong."); }

                // update into allocated_spaces table
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cn.Open();
                string cmdstrng = "update AllocatedSpace_Data Set allocated_spaces = allocated_spaces + 1 where floor_no=@floor";

                SqlCommand updtSpc = new SqlCommand(cmdstrng, cn);
                updtSpc.Parameters.AddWithValue("@floor", flr);
                updtSpc.ExecuteNonQuery();

            }
            else { Lbl_nospc.Visible = true; }
        }
        catch (NullReferenceException ex)
        {
            Lbl_nospc.Visible = true;

        }

    }
    protected void Btn_rst_Click(object sender, EventArgs e)
    {
        Tb_noPlt.Text = null;
        Tb_hours.Text = null;
    }
    protected void Btn_clr_Click(object sender, EventArgs e)
    {

    }
    protected void Btn_print_Click(object sender, EventArgs e)
    {

    }
    protected void Btn_gnrt_resrd_Click(object sender, EventArgs e)
    {

    }
}