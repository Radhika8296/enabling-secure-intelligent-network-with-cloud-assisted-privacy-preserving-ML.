using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Superman_Web
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Reset(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            string un = string.Empty, pwd = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
            try
            {
                con.Open();
                string query = "Select * from Userdata where Email='" + email.Value + "';";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        un = dr.GetValue(0).ToString();
                        pwd = dr.GetValue(1).ToString();
                    }
                }
                try
                {
                    MailMessage m = new MailMessage("amrutha3012000@gmail.com", email.Value, "Password Recovery Mail !!!", "​Your Username is: " + un + "\n Your Password is: " + pwd + "");
                    SmtpClient s = new SmtpClient("smtp.gmail.com", 587);
                    s.Credentials = new System.Net.NetworkCredential("amrutha3012000@gmail.com", "mdsceduehmfwdjet");
                    s.EnableSsl = true;
                    s.Send(m);
                    Response.Write("<script>alert('Mail sent successfully !!!');</script>");
                }
                catch
                {
                }
                //Resetter();
            }
            catch
            {
            }
            finally
            {
                con.Close();
            }

        }
    }
}