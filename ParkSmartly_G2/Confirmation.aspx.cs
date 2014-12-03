using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
{
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
           id  = Request.QueryString["id"];
        }
        else
        {
            //lblDefaultData.Text = "Sorry,Data not found";
        }
        string r_id = "", mor_time = "", aft_time = "", nig_tm = "", name = "", ema_id = "", co_no = "", date = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        conn.Open();
        string cmndstr_getDtls = "Select * from Registration_temporary where id = '" + id + "'";
        SqlCommand getData = new SqlCommand(cmndstr_getDtls, conn);
        SqlDataReader dr = getData.ExecuteReader();

        while (dr.Read())
        {



           

            r_id = dr["id"].ToString();
            mor_time = dr["mor_time"].ToString();
            aft_time = dr["aft_time"].ToString();
            nig_tm = dr["nig_time"].ToString();
            name = dr["name"].ToString();
            ema_id = dr["email_id"].ToString();
            co_no = dr["contact_no"].ToString();
            date = dr["date"].ToString();

        }
        dr.Close();
        //conn.Close();
        string par_time="",amnt="";
        if (mor_time == "true") { par_time = "morning"; amnt = "30"; }
        else if (aft_time == "true") { par_time = par_time + " afternoon"; amnt = (amnt + 30).ToString(); }
        else if (nig_tm == "true") { par_time = par_time + " night"; amnt = (amnt + 25).ToString(); } 




        Lbl_date.Text = date;
        lbl_name.Text = name;
        Lbl_co_name.Text = co_no;
        Lbl_emai.Text = ema_id;
        Lbl_par_time.Text = par_time;
        Lbl_amt.Text = amnt;
    }

    protected void Btn_confirm_Click(object sender, EventArgs e)
    {
        SqlConnection cnctn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
        cnctn.Open();

        string cmstr = "Insert into Registration_Data (mor_time,aft_time,nig_time,allocated,name,email_id,contact_no,date,amount,reference_id) values (@mor_time,@aft_time,@nig_time,@allocated,@name,@email_id,@contact_no,@date,@amount,@reference_id) ";

        SqlCommand insert_regi_data = new SqlCommand(cmstr, cnctn);
        insert_regi_data.Parameters.AddWithValue("@mor_time", mor_time);
        insert_regi_data.Parameters.AddWithValue("@aft_time", aft_time);
        insert_regi_data.Parameters.AddWithValue("@nig_time", nig_tm);
        insert_regi_data.Parameters.AddWithValue("@allocated", 1);
        insert_regi_data.Parameters.AddWithValue("@name", name);
        insert_regi_data.Parameters.AddWithValue("@email_id", ema_id);
        insert_regi_data.Parameters.AddWithValue("@contact_no", co_no);
        insert_regi_data.Parameters.AddWithValue("@date", date);
        insert_regi_data.Parameters.AddWithValue("@amount", amnt);
        insert_regi_data.Parameters.AddWithValue("@reference_id", r_id);


        try
        {
            insert_regi_data.ExecuteNonQuery();
            cnctn.Close();

        }
        catch (NullReferenceException ex) { }

        try
        {


            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", name);
            body = body.Replace("{Rnum}", r_id);
            body = body.Replace("{Date}", date);
            body = body.Replace("{Amt}", amnt);




            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("parksmartly2@gmail.com");
            mail.To.Add("gkgaurav74@gmail.com");
            mail.Subject = "Online Parking Confirmatiion";

            mail.IsBodyHtml = true;
            mail.Body = body;

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("parksmartly2@gmail.com", "smartlyparkg2");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            // MessageBox.Show("mail Send");
                     

        }
        catch (Exception ex)
        {
            //  MessageBox.Show(ex.ToString());
        }

    }
}