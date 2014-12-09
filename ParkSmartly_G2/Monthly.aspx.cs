using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Monthly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
   
    protected void bindDepartments()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        cn.Open();
        string ADDStr = "Select distinct YEAR([Date]) as 'year' from ParkingInformation";
        SqlCommand ADDCmd = new SqlCommand(ADDStr, cn);
        DataTable table = new DataTable();


        SqlDataAdapter adapter = new SqlDataAdapter(ADDCmd);

        adapter.Fill(table);

        ddlYear.DataSource = table;
        ddlYear.DataValueField = "year"; //The Value of the DropDownList, to get it you should call DropDownList1.SelectedValue;
        ddlYear.DataTextField = "year"; //The Name shown of the DropDownList.
        ddlYear.DataBind();

    }
   
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sel_year = ddlYear.SelectedValue.ToString();
        if (!string.IsNullOrEmpty(sel_year))
        {
            GridView1.Visible = true;

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cn.Open();
            string ADDStr = "SELECT  MONTH(Date) as '____month_____',SUM (CONVERT(int,[Allocated])) as 'No of Cars', SUM (CONVERT(int,[Hours])) as 'Total Hours',SUM (CONVERT(int,[Amount])) as 'Total Amount'  FROM ParkingInformation  where YEAR([Date])=" + sel_year + " group by MONTH([Date])";
            SqlCommand ADDCmd = new SqlCommand(ADDStr, cn);
            DataTable table = new DataTable();


            SqlDataAdapter adapter = new SqlDataAdapter(ADDCmd);

            adapter.Fill(table);

            GridView1.DataSource = table;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;
        }
    }
}