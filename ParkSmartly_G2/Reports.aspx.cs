﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDepartments();
    }
    protected void bindDepartments()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        cn.Open();
        string ADDStr = "Select Distinct Month([Date]) from dbo.ParkingInformation";
        SqlCommand ADDCmd = new SqlCommand(ADDStr, cn);
        DataTable table = new DataTable();


        SqlDataAdapter adapter = new SqlDataAdapter(ADDCmd);

        adapter.Fill(table);

        DropDownList1.DataSource = table;
        DropDownList1.DataValueField = "Month([Date]"; //The Value of the DropDownList, to get it you should call DropDownList1.SelectedValue;
        DropDownList1.DataTextField = "Month([Date]"; //The Name shown of the DropDownList.
        DropDownList1.DataBind();

    }
}