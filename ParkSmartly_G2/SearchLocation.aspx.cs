using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Lbl_err_msg.Visible = false;
    }
    protected void Btn_search_Click(object sender, EventArgs e)
    {
        string date, id, spc=null, flr=null, l_plt, hrs, amt, E_tm = null;
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

            lbl_msg.Attributes.Add("style", "Color:Green;");
            lbl_msg.Text = "You have parked your car at:";
            lbl_msg.Visible = true;

            lbl_floor.Text ="Floor: "+flr;
            lbl_floor.Visible = true;

            lbl_space.Text ="Space: "+spc;
            lbl_space.Visible = true;

            Lbl_remnder.Attributes.Add("style", "Color:Red;");
            Lbl_remnder.Text="Please,remember your exit time is "+E_tm;
            Lbl_remnder.Visible = true;


        }
        catch (NullReferenceException)
        {

            Lbl_err_msg.Text = "Data Not Matching, Try Again";
            Lbl_err_msg.Visible = true;
        }


    }
}