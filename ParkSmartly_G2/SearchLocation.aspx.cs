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
          static string date, id, spc, flr, l_plt, hrs, amt, E_tm = null;
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
}