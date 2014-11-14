using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CancelTicket : System.Web.UI.Page
{
    static string date, id, spc, flr, l_plt, hrs, amt;



    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Cancel_Click(object sender, EventArgs e)
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
                    amt = dr["Amount"].ToString();

                }
                dr.Close();
                conn.Close();
            }
            else if (!String.IsNullOrEmpty(Tb_Tid.Text))
            {
                SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cnn.Open();
                string cmndstr_getDtls = "Select * from ParkingInformation where id = '" + Tb_Tid.Text + "'";
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
                    amt = dr["Amount"].ToString();
                }
                dr.Close();
                cnn.Close();

            }
            else { Lbl_ntfnd.Text = "Licence Plate OR Ticket Id must be provided"; Lbl_ntfnd.Visible = true; }

            if (!String.IsNullOrEmpty(id) || !String.IsNullOrEmpty(l_plt))
            {
                DateTime time = DateTime.Parse(date);
                DateTime CurntDateTime = DateTime.Now;
                TimeSpan span = CurntDateTime.Subtract(time);

                if (span.Minutes < 2 && span.Hours != 0)
                {
                    lbl_msg.Visible = true;
                    lbl_Lplate.Text = "Licence Plate: " + l_plt + ""; lbl_Lplate.Visible = true;
                    lbl_flr.Text = "Floor No: " + flr + ""; lbl_flr.Visible = true;
                    lbl_spc.Text = "Space No: " + spc + ""; lbl_spc.Visible = true;
                    lbl_hrs.Text = "Hours: " + hrs + ""; lbl_hrs.Visible = true;
                    lbl_rf_amt.Text = "Refunded Amount:-" + amt + ""; lbl_rf_amt.Visible = true;

                    SqlConnection cnctn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cnctn.Open();
                    string cmstr = "Insert into CancelTicket (floor,space,licence_plate,date,amount,hours) values (@floor,@space,@licence_plate,@date,@amount,@hours) ";



                    SqlCommand insertUser = new SqlCommand(cmstr, cnctn);
                    insertUser.Parameters.AddWithValue("@floor", flr);
                    insertUser.Parameters.AddWithValue("@space", spc);
                    insertUser.Parameters.AddWithValue("@date", date);
                    insertUser.Parameters.AddWithValue("@licence_plate", l_plt);
                    insertUser.Parameters.AddWithValue("@hours", hrs);
                    insertUser.Parameters.AddWithValue("@amount", amt);

                    try
                    {
                        insertUser.ExecuteNonQuery();
                        cnctn.Close();
                    }
                    catch (Exception ex)
                    {
                        Lbl_ntfnd.Text = "Data Not Matching, Try Again";
                        Lbl_ntfnd.Visible = true;
                    }


                    SqlConnection cnc = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cnc.Open();
                    string cmdstr = "update ParkingInformation Set Allocated = 'False',Date=Null,Number_Plate=Null,Hours=Null,ExitTime=Null,Amount=Null where Floor=@floor and Space=@space;";

                    SqlCommand insertData = new SqlCommand(cmdstr, cnc);

                    insertData.Parameters.AddWithValue("@floor", flr);
                    insertData.Parameters.AddWithValue("@space", spc);

                    try
                    {

                        insertData.ExecuteNonQuery();
                        cnc.Close();

                    }
                    catch (Exception ex)
                    {
                        Lbl_ntfnd.Text = "Data Not Matching, Try Again";
                        Lbl_ntfnd.Visible = true;
                    }



                }
                else
                {
                    Lbl_ntfnd.Text = "Ticket issued more than 2 min ago.";
                    Lbl_ntfnd.Visible = true;
                }
            }

        }
        catch (NullReferenceException)
        {

            Lbl_ntfnd.Text = "Data Not Matching, Try Again";
            Lbl_ntfnd.Visible = true;
        }

    }
}
