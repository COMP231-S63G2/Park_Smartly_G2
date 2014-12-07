using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Yearly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            gvData.Visible = true;

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cn.Open();
            string ADDStr = "SELECT year(Date) as '____Year_____',SUM (CONVERT(int,[Allocated])) as 'No of Cars', SUM (CONVERT(int,[Hours])) as 'Total Hours',SUM (CONVERT(int,[Amount])) as 'Total Amount'  FROM ParkingInformation group by year(Date)" ;
			;
            SqlCommand ADDCmd = new SqlCommand(ADDStr, cn);
            DataTable table = new DataTable();


            SqlDataAdapter adapter = new SqlDataAdapter(ADDCmd);

            adapter.Fill(table);

            gvData.DataSource = table;
            gvData.DataBind();
        
    }
}