using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExitTimeChecking : System.Web.UI.Page
{
    static string date, id, spc, flr, l_plt, hrs, amt, E_tm = null;
    static int Exc_hours = '0';
    protected void Page_Load(object sender, EventArgs e)
    {

        Exc_hours = '0';
    }
    protected void Btn_check_Click(object sender, EventArgs e)
    {


        try
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
            else if (!String.IsNullOrEmpty(Tb_tId.Text))
            {
                SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cnn.Open();
                string cmndstr_getDtls = "Select * from ParkingInformation where id = '" + Tb_tId.Text + "'";
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
            else { Lbl_nt_fnd.Text = "Licence Plate OR Ticket Id must be provided"; Lbl_nt_fnd.Visible = true; }
        }
        catch (NullReferenceException)
        {

            Lbl_nt_fnd.Text = "Data Not Matching, Try Again";
            Lbl_nt_fnd.Visible = true;
        }

        DateTime time = DateTime.Parse(E_tm);
        DateTime CurntDateTime = DateTime.Now;
        bool greater = (CurntDateTime > time);

        if (greater == true)
        {
            lbl_excd.Attributes.Add("style", "Color:Red;");
            lbl_excd.Text = "Time Exceeded";
            lbl_excd.Visible = true;
            TimeSpan span = CurntDateTime.Subtract(time);
            Console.WriteLine("Time Difference (days): " + span.Days);
            String timediff = String.Format("{0}:{1}", span.Hours, span.Minutes);
            lbl_excd_by.Visible = true;
            if (span.Hours == 0)
            {
                Exc_hours = '1';
            }
            else { Exc_hours = span.Hours; }
            if (span.Minutes != 0) { Exc_hours = Exc_hours + 1; }
            if (span.Days == 0)
            {
                lbl_excd_by.Text = "Time exceeded by " + timediff + " Hours";

                String excd_amt = (Exc_hours).ToString();
                lbl_exc_amt.Visible = true;

                lbl_exc_amt.Text = "Charged Amount : " + (Int32.Parse((excd_amt).ToString()) * 10).ToString() + "$";
            }
            else
            {
                lbl_excd_by.Text = String.Format("Time exceeded by {0} days and {1} Hours ", span.Days, timediff);

                String excd_amt = (Exc_hours).ToString();
                lbl_exc_amt.Visible = true;

                lbl_exc_amt.Text = "Charged Amount : " + ((Int32.Parse((span.Days).ToString()) * 240) + (Int32.Parse((excd_amt).ToString()) * 10)).ToString() + "$";
            }
        }
        else
        {
            lbl_excd.Attributes.Add("style", "Color:Green;");
            lbl_excd.Text = "Time Not Exceeded";
            lbl_excd.Visible = true;


        }
    }
    protected void Btn_clr_Click(object sender, EventArgs e)
    {

    }
    protected void Btn_print_Click(object sender, EventArgs e)
    {

    }
    protected void Btn_check_out_Click(object sender, EventArgs e)
    {
        //Clear data into parinfo table 
        try
        {
            SqlConnection cnc = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cnc.Open();
            string cmdstr = "update ParkingInformation Set Allocated = 'False',Date=Null,Number_Plate=Null,Hours=Null,ExitTime=Null,Amount=Null where Floor=@floor and Space=@space;";

            SqlCommand insertData = new SqlCommand(cmdstr, cnc);

            insertData.Parameters.AddWithValue("@floor", flr);
            insertData.Parameters.AddWithValue("@space", spc);


            insertData.ExecuteNonQuery();
            cnc.Close();

        }
        catch (Exception ex) { Response.Write("Something went wrong."); }

        SqlConnection cnctn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        cnctn.Open();
        string cmstr = "Insert into ParkingHistory (floor,space,entryTime,exitTime,realExitTime,number_Plate,hours,amount) values (@floor,@space,@entryTime,@exitTime,@realExitTime,@number_Plate,@hours,@amount) ";

        DateTime CurntDateTime = DateTime.Now;
        string Datetime = CurntDateTime.ToString("yyyy-MM-dd HH:mm:ss");



        SqlCommand insertUser = new SqlCommand(cmstr, cnctn);
        insertUser.Parameters.AddWithValue("@floor", flr);
        insertUser.Parameters.AddWithValue("@space", spc);
        insertUser.Parameters.AddWithValue("@entryTime", date);
        insertUser.Parameters.AddWithValue("@exitTime", E_tm);
        insertUser.Parameters.AddWithValue("@realExitTime", Datetime);
        insertUser.Parameters.AddWithValue("@number_Plate", l_plt);
        insertUser.Parameters.AddWithValue("@hours", hrs);
        insertUser.Parameters.AddWithValue("@amount", amt);

        try
        {
            insertUser.ExecuteNonQuery();
            cnctn.Close();
        }
        catch (Exception ex) { Response.Write("Something went wrong....Better luck next time"); }



    }
}