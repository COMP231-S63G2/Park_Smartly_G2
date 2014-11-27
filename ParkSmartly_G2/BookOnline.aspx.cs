using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookOnline : System.Web.UI.Page
{
    static String date;
    String availability;

    protected void Page_Load(object sender, EventArgs e)
    {
        Cb_mor.Visible = true;
        Cb_aft.Visible = true;
        Cb_nig.Visible = true;
        Lbl_mor.Text = "";
        Lbl_aft.Text = "";
        Lbl_nig.Text = "";
        Lbl_err.Text = "";
    }


    protected void datepicker_TextChanged(object sender, EventArgs e)
    {

        date = datepicker.Text;

        try
        {


            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);

                con.Open();
                string cmndstr_available = "select count(*) from ONlineRegistration_plot where date = '" + date + "'";
                SqlCommand getavail = new SqlCommand(cmndstr_available, con);
                availability = getavail.ExecuteScalar().ToString();
                con.Close();

                if (availability == "0")
                {
                    throw new NullReferenceException();

                }
                else { }
            }
            catch (NullReferenceException)
            {

                SqlConnection cntn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cntn.Open();
                for (int i = 1; i <= 10; i++)
                {
                    string cmndstr_ins = "Insert Into ONlineRegistration_plot(date) values ('" + date + "')";
                    SqlCommand insert = new SqlCommand(cmndstr_ins, cntn);
                    insert.ExecuteNonQuery();
                }

                cntn.Close();
                availability = "10";

            }


            if (Int32.Parse(availability) > 0 && Int32.Parse(availability) <= 10)
            {
                try
                {

                    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cn.Open();
                    string cmndstr_mor = "select count(*) from ONlineRegistration_plot where mor_time='false' and date  = '" + date + "'";
                    SqlCommand getmor = new SqlCommand(cmndstr_mor, cn);
                    string availability_mor = getmor.ExecuteScalar().ToString();
                    cn.Close();

                    if (Int32.Parse(availability_mor) > 0 && Int32.Parse(availability_mor) <= 10)
                    {
                        Lbl_mor.Attributes.Add("style", "Color:Green;");
                        Lbl_mor.Text = "Slot is Available";
                        Lbl_mor.Visible = true;

                    }
                    else
                    {
                        Lbl_mor.Attributes.Add("style", "Color:Red;");
                        Lbl_mor.Text = "Slot is Not Available";
                        Lbl_mor.Visible = true;
                        Cb_mor.Visible = false;

                    }
                }
                catch (NullReferenceException)
                {
                    Lbl_mor.Attributes.Add("style", "Color:Red;");
                    Lbl_mor.Text = "Slot is Not Available";
                    Lbl_mor.Visible = true;
                    Cb_mor.Visible = false;

                }
                try
                {

                    SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cn1.Open();
                    string cmndstr_aft = "select count(*) from ONlineRegistration_plot where aft_time='false' and date  = '" + date + "'";
                    SqlCommand getaft = new SqlCommand(cmndstr_aft, cn1);
                    string availability_aft = getaft.ExecuteScalar().ToString();
                    cn1.Close();

                    if (Int32.Parse(availability_aft) > 0 && Int32.Parse(availability_aft) <= 10)
                    {
                        Lbl_aft.Attributes.Add("style", "Color:Green;");
                        Lbl_aft.Text = "Slot is Available";
                        Lbl_aft.Visible = true;
                    }
                    else
                    {
                        Lbl_aft.Attributes.Add("style", "Color:Red;");
                        Lbl_aft.Text = "Slot is Not Available";
                        Lbl_aft.Visible = true;
                        Cb_aft.Visible = false;
                    }
                }
                catch (NullReferenceException)
                {
                    Lbl_aft.Attributes.Add("style", "Color:Red;");
                    Lbl_aft.Text = "Slot is Not Available";
                    Lbl_aft.Visible = true;
                    Cb_aft.Visible = false;

                }

                try
                {

                    SqlConnection cn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cn2.Open();
                    string cmndstr_nit = "select count(*) from ONlineRegistration_plot where nig_time='false' and date  = '" + date + "'";
                    SqlCommand getnit = new SqlCommand(cmndstr_nit, cn2);
                    string availability_nit = getnit.ExecuteScalar().ToString();
                    cn2.Close();

                    if (Int32.Parse(availability_nit) > 0 && Int32.Parse(availability_nit) <= 10)
                    {
                        Lbl_nig.Attributes.Add("style", "Color:Green;");
                        Lbl_nig.Text = "Slot is Available";
                        Lbl_nig.Visible = true;
                    }
                    else
                    {
                        Lbl_nig.Attributes.Add("style", "Color:Red;");
                        Lbl_nig.Text = "Slot is Not Available";
                        Lbl_nig.Visible = true;
                        Cb_nig.Visible = false;
                    }
                }
                catch (NullReferenceException)
                {
                    Lbl_nig.Attributes.Add("style", "Color:Red;");
                    Lbl_nig.Text = "Slot is Not Available";
                    Lbl_nig.Visible = true;
                    Cb_nig.Visible = false;
                }

            }
            else
            {

                Lbl_err.Attributes.Add("style", "Color:Red;");
                Lbl_err.Text = "Sorry,Data not available";

            }

        }
        catch (NullReferenceException)
        {
            Lbl_err.Attributes.Add("style", "Color:Red;");
            Lbl_err.Text = "Sorry,Data not available";



        }

    }

    protected void Btn_book_Click(object sender, EventArgs e)
    {
        try
        {
            string morTime = "0", aftTime = "0", nigTime = "0";


            if (Cb_mor.Checked == true) { morTime = "1"; }
            else { morTime = "0"; }
            if (Cb_aft.Checked == true) { aftTime = "1"; }
            else { aftTime = "0"; }
            if (Cb_nig.Checked == true) { nigTime = "1"; }
            else { nigTime = "0"; }

            SqlConnection cnctn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
            cnctn.Open();

            string cmstr = "Insert into Registration_temporary (mor_time,aft_time,nig_time,allocated,name,email_id,contact_no,date) values (@mor_time,@aft_time,@nig_time,@allocated,@name,@email_id,@contact_no,@date) ";

            SqlCommand insert_regi_data = new SqlCommand(cmstr, cnctn);
            insert_regi_data.Parameters.AddWithValue("@mor_time", morTime);
            insert_regi_data.Parameters.AddWithValue("@aft_time", aftTime);
            insert_regi_data.Parameters.AddWithValue("@nig_time", nigTime);
            insert_regi_data.Parameters.AddWithValue("@allocated", 1);
            insert_regi_data.Parameters.AddWithValue("@name", Tb_name.Text);
            insert_regi_data.Parameters.AddWithValue("@email_id", Tb_eml.Text);
            insert_regi_data.Parameters.AddWithValue("@contact_no", Tb_cont_no.Text);
            insert_regi_data.Parameters.AddWithValue("@date", datepicker.Text);


            try
            {
                insert_regi_data.ExecuteNonQuery();
                cnctn.Close();

                if (Cb_mor.Checked == true)
                {
                    SqlConnection cnc = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cnc.Open();
                    string cstr = "update top(1) ONlineRegistration_plot Set mor_time = '1' where mor_time = '0' and date='" + date + "'";
                    SqlCommand insert_MorData = new SqlCommand(cstr, cnc);
                    insert_MorData.ExecuteNonQuery();
                    cnc.Close();

                }
                else { }
                if (Cb_aft.Checked == true)
                {
                    SqlConnection cnc2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cnc2.Open();
                    string cstr2 = "update top(1) ONlineRegistration_plot Set aft_time = '1' where aft_time = '0' and date='" + date + "'";
                    SqlCommand insert_AftData = new SqlCommand(cstr2, cnc2);
                    insert_AftData.ExecuteNonQuery();
                    cnc2.Close();
                }
                else { }
                if (Cb_nig.Checked == true)
                {
                    SqlConnection cnc3 = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                    cnc3.Open();
                    string cstr3 = "update top(1) ONlineRegistration_plot Set nig_time = '1' where nig_time = '0' and date='" + date + "'";
                    SqlCommand insert_NigData = new SqlCommand(cstr3, cnc3);
                    insert_NigData.ExecuteNonQuery();
                    cnc3.Close();
                }
                else { }



                SqlConnection cntn = new SqlConnection(ConfigurationManager.ConnectionStrings["Park_smartly_conStr"].ConnectionString);
                cntn.Open();
                string cmndstr_id = "Select id from Registration_temporary where date ='" + datepicker.Text + "' and email_id='" + Tb_eml.Text + "' ";
                SqlCommand getid = new SqlCommand(cmndstr_id, cntn);
                string id_id = getid.ExecuteScalar().ToString();
                cntn.Close();
                if (id_id != null)
                {

                    Response.Redirect("Confirmation.aspx?id=" + id_id);
                }
                else
                {

                    Response.Redirect("BookOnline.aspx");

                }





            }
            catch (Exception ex) { Response.Write("Something went wrong....Better luck next time"); }
        }
        catch { }

    }
}