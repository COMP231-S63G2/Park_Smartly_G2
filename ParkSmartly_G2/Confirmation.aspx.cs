using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Payment_Click(object sender, EventArgs e)
    {
          decimal amount = 100;
         string RegistrationId = "1234234" ;
        string siteName = "Parksmartly";
         string redirect = "";
        redirect += "https://www.paypal.com/xclick/business=parksmartly@gmail.com";
        redirect += "&item_name=" + siteName + " Order " + RegistrationId;
        redirect += "&item_number=" + RegistrationId;
        redirect += "&amount=" + String.Format("{0:0.00} ", amount);
        redirect += "&currency=USD";
        redirect += "&return=http://localhost.";
        redirect += "&cancel_return=http://localhost.";
        Response.Redirect(redirect);
    }
}