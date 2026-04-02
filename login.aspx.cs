using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Superman_Web
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Reset(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.Clear();
            if (uname.Value.Equals(string.Empty) | pswd.Value.Equals(string.Empty))
            {
                Response.Write("<script>alert('Please enter the details!!!');</script>");
            }
            else
            {
                if (uname.Value.Equals("admin") & pswd.Value.Equals("admin"))
                {
                    Session["Username"] = uname.Value;
                    Response.Redirect("adminhome.aspx");
                }
                SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
                try
                {
                    con.Open();
                    string query = "select * from Userdata where Username='" + uname.Value + "' and Password='" + pswd.Value + "'; ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            string un = dr.GetValue(0).ToString();
                            string pd = dr.GetValue(1).ToString();
                            string us = dr.GetValue(7).ToString();
                            if (uname.Value.Equals(un) & pswd.Value.Equals(pd) & us.Equals("Approved"))
                            {
                                Session["Username"] = uname.Value;
                                Response.Redirect("userpage.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Wait for admin for approval!!!');</script>");
                            }
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid User!!!');</script>");
                    }
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
}