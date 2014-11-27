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
        Lbl_nospc.Visible = false;
        Lbl_rid_rq.Text = "";
    }
    protected void Btn_gnrt_Click(object sender, EventArgs e)
    {

        int hors = Int32.Parse(Tb_hours.Text);

        String amt = ((hors) * 8).ToString();
        Label10.Text = amt + " CAD";
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

                string spc = null, flr = null, tid = null;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                conn.Open();
                string cmndstr_getSpace = "Select top 1 * from ParkingInformation where allocated = 'False'";
                SqlCommand getData = new SqlCommand(cmndstr_getSpace, conn);
                SqlDataReader dr = getData.ExecuteReader();

                while (dr.Read())
                {

                    spc = dr["space"].ToString();
                    flr = dr["Floor"].ToString();
                    tid = dr["id"].ToString();


                }
                dr.Close();
                conn.Close();

                SqlConnection cnc = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cnc.Open();
                string cmdstr = "update ParkingInformation Set Allocated = 'True',Date=@date,Number_Plate=@Num_Plate,Hours=@Hours,ExitTime=@exitTime,Amount=@amount where Floor=@floor and Space=@space;";

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
                insertData.Parameters.AddWithValue("@amount", amt);
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

                Lbl_dt.Text = CurntDateTime.ToString("dd/MM/yyyy").ToString();
                Lbl_t_id.Text = "Ticket Id: " + tid;
                lbl_flor.Text = "Floor " + flr;
                Lbl_spc.Text = spc;

                Lbl_amount.Text = ((hors) * 8).ToString() + " CAD";
                Lbl_Lplate.Text = (Tb_noPlt.Text).ToString();
                Lbl_timeIn.Text = (((CurntDateTime.Hour + 11) % 12) + 1).ToString() + ":" + CurntDateTime.ToString("mm tt").ToString();
                Lbl_timeOut.Text = (((ExitTime.Hour + 11) % 12) + 1).ToString() + ":" + ExitTime.ToString("mm tt").ToString();
                Lbl_hrs.Text = hors.ToString();

                printDiv.Attributes.Add("style", "visibility:visible;");
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
        table1.Visible = false; lblTitle.Visible = false; Lbl_dt.Visible = false;
        Lbl_t_id.Visible = false; lbl_flor.Visible = false; Lbl_spc.Visible = false;
        Lbl_amount.Visible = false; Lbl_Lplate.Visible = false; Lbl_timeIn.Visible = false;
        Lbl_timeOut.Visible = false; Lbl_hrs.Visible = false; Label11.Visible = false;
        Label12.Visible = false; Label19.Visible = false; Label20.Visible = false;
        Label21.Visible = false; Label22.Visible = false; Label4.Visible = false;
        Label5.Visible = false; Label6.Visible = false; Label7.Visible = false;
        Label9.Visible = false;

    }

    protected void Btn_gnrt_resrd_Click(object sender, EventArgs e)
    {
        try
        {
            if (!String.IsNullOrEmpty(TB_reference_no.Text))
            {

                SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cn1.Open();
                string cmndstr_exists = "Select email_id from Registration_Data where reference_id = '" + TB_reference_no.Text + "'";
                SqlCommand geteid = new SqlCommand(cmndstr_exists, cn1);
                string exists = geteid.ExecuteScalar().ToString();
                cn1.Close();
            }
            else
            {
                Lbl_rid_rq.Attributes.Add("style", "Color:Red;");
                Lbl_rid_rq.Text = "Enter Valid Email Id";

            }
        }
        catch (NullReferenceException)
        {
            Lbl_rid_rq.Attributes.Add("style", "Color:Red;");
            Lbl_rid_rq.Text = "Enter Valid Email Id";

        }
    }
}