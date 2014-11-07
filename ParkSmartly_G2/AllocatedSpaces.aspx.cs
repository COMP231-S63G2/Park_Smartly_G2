using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AllocatedSpaces : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        cnn.Open();
        string queryStrng = "SELECT * FROM AllocatedSpace_Data";
        SqlDataAdapter adapter = new SqlDataAdapter(queryStrng, cnn);

        DataSet dset = new DataSet();
        adapter.Fill(dset, "Spaces");
        string Flr1 = dset.Tables[0].Rows[0]["allocated_spaces"].ToString();
        string Flr2 = dset.Tables[0].Rows[1]["allocated_spaces"].ToString();
        string Flr3 = dset.Tables[0].Rows[2]["allocated_spaces"].ToString();
        string Flr4 = dset.Tables[0].Rows[3]["allocated_spaces"].ToString();
        string Flr5 = dset.Tables[0].Rows[4]["allocated_spaces"].ToString();
        string Flr6 = dset.Tables[0].Rows[5]["allocated_spaces"].ToString();
        string resd = dset.Tables[0].Rows[6]["reserved_spaces"].ToString();

        string ttl1 = dset.Tables[0].Rows[0]["total_space"].ToString();
        string ttl2 = dset.Tables[0].Rows[1]["total_space"].ToString();
        string ttl3 = dset.Tables[0].Rows[2]["total_space"].ToString();
        string ttl4 = dset.Tables[0].Rows[3]["total_space"].ToString();
        string ttl5 = dset.Tables[0].Rows[4]["total_space"].ToString();
        string ttl6 = dset.Tables[0].Rows[5]["total_space"].ToString();
        string ttlres = dset.Tables[0].Rows[6]["total_space"].ToString();

        Lbl_all1.Text = Flr1;
        Lbl_all2.Text = Flr2;
        Lbl_all3.Text = Flr3;
        Lbl_all4.Text = Flr4;
        Lbl_all5.Text = Flr5;
        Lbl_all6.Text = Flr6;
        Lbl_res.Text = resd;

        int per1 = (100 * (Int32.Parse(Flr1))) / Int32.Parse(ttl1);
        int per2 = (100 * (Int32.Parse(Flr2))) / Int32.Parse(ttl2);
        int per3 = (100 * (Int32.Parse(Flr3))) / Int32.Parse(ttl3);
        int per4 = (100 * (Int32.Parse(Flr4))) / Int32.Parse(ttl4);
        int per5 = (100 * (Int32.Parse(Flr5))) / Int32.Parse(ttl5);
        int per6 = (100 * (Int32.Parse(Flr6))) / Int32.Parse(ttl6);
        int per_res = (100 * (Int32.Parse(resd))) / Int32.Parse(ttlres);

        lbl_per1.Text = per1.ToString() + "%";
        lbl_per2.Text = per2.ToString() + "%";
        lbl_per3.Text = per3.ToString() + "%";
        lbl_per4.Text = per4.ToString() + "%";
        lbl_per5.Text = per5.ToString() + "%";
        lbl_per6.Text = per6.ToString() + "%";
        Lbl_re_ttl.Text = per_res.ToString() + "%";

        progress1.Style.Add("width", per1 + "%");
        progress2.Style.Add("width", per2 + "%");
        progress3.Style.Add("width", per3 + "%");
        progress4.Style.Add("width", per4 + "%");
        progress5.Style.Add("width", per5 + "%");
        progress6.Style.Add("width", per6 + "%");
        progress7.Style.Add("width", per_res + "%");
        cnn.Close();
    }
    protected void Btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("GenerateTicket.aspx");
    }
}