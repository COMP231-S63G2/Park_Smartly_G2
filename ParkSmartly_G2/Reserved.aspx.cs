using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reserved : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedMonth = ddlMonth.SelectedValue.ToString();
        string selectedYear = ddlYear.SelectedValue.ToString();

        if (!string.IsNullOrEmpty(selectedMonth) && !string.IsNullOrEmpty(selectedYear))
        {
            gvData.Visible = true;

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cn.Open();
            string ADDStr = "SELECT [name],[email_id],[contact_no],[date],[amount] FROM Registration_Data where YEAR([Date])=" + selectedYear + " and MONTH([Date])=" + selectedMonth;
            SqlCommand ADDCmd = new SqlCommand(ADDStr, cn);
            DataTable table = new DataTable();


            SqlDataAdapter adapter = new SqlDataAdapter(ADDCmd);

            adapter.Fill(table);

            gvData.DataSource = table;
            gvData.DataBind();
        }
        else
        {
            gvData.Visible = false;
        }

    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedMonth = ddlMonth.SelectedValue.ToString();
        string selectedYear = ddlYear.SelectedValue.ToString();

        if (!string.IsNullOrEmpty(selectedMonth) && !string.IsNullOrEmpty(selectedYear))
        {
            gvData.Visible = true;

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cn.Open();
            string ADDStr = "SELECT [name] as 'Customer Name',[email_id] as 'Email Id',[contact_no] as 'Contact No',[date] as 'Date',[amount] as 'Amount' FROM Registration_Data where YEAR([Date])=" + selectedYear + " and MONTH([Date])=" + selectedMonth;
            SqlCommand ADDCmd = new SqlCommand(ADDStr, cn);
            DataTable table = new DataTable();


            SqlDataAdapter adapter = new SqlDataAdapter(ADDCmd);

            adapter.Fill(table);

            gvData.DataSource = table;
            gvData.DataBind();
        }
        else
        {
            gvData.Visible = false;
        }
    }
}