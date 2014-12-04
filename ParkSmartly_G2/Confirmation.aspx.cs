using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
{
    static string id;
    static string r_id = "", mor_time = "", aft_time = "", nig_tm = "", name = "", ema_id = "", co_no = "", date = "";
    static string par_time = "", amnt = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            id = Request.QueryString["id"];
        }
        else
        {
            //lblDefaultData.Text = "Sorry,Data not found";
        }
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

        if (mor_time == "True") { par_time = "morning"; amnt = "20"; }
        if (aft_time == "True") { par_time = par_time + ", afternoon"; amnt = (Convert.ToInt32(amnt) + 20).ToString(); }
        if (nig_tm == "True") { par_time = par_time + ", night"; amnt = (Convert.ToInt32(amnt) + 15).ToString(); }


        Lbl_date.Text = date;
        lbl_name.Text = name;
        Lbl_co_name.Text = co_no;
        Lbl_emai.Text = ema_id;
        Lbl_par_time.Text = par_time;
        Lbl_amt.Text = amnt + " CAD";
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
            mail.To.Add(ema_id);
            mail.Subject = "Online Parking Confirmatiion";

            mail.IsBodyHtml = true;
            mail.Body = body;

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("parksmartly2@gmail.com", "smartlyparkg2");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            // MessageBox.Show("mail Send");

            Lbl_date.Visible = false;
            lbl_name.Visible = false;
            Lbl_co_name.Visible = false;
            Lbl_emai.Visible = false;
            Lbl_par_time.Visible = false;
            Lbl_amt.Visible = false;
            Label1.Visible = false;
            Label11.Visible = false;
            Label2.Visible = false;
            Label7.Visible = false;
            Label5.Visible = false;
            Label9.Visible = false;
            Btn_confirm.Visible = false;
            lbl_1.Visible = true;
            lbl_1.Text = "You have successfully Reserved your parking space.";
            Lbl_2.Visible = true;
            Lbl_2.Text = "We sent you a confirmation mail.your reference number is " + r_id;

            Btn_dn.Visible = true;

        }
        catch (Exception ex)
        {
            //  MessageBox.Show(ex.ToString());
        }

    }


    protected void Btn_dn_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }
}