using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Superman_Web
{
    public partial class filerequest : System.Web.UI.Page
    {
        static string content = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Username"] = "192.168.10.121";
            if (Session["Username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Random r = new Random();
                int a = r.Next(1234, 999999);
                string uploadedby = Session["Username"].ToString();
                SqlDataSource1.SelectCommand = "SELECT * FROM Docdata where UploadedBy!='" + uploadedby + "' and Published='Yes' and DocId NOT IN(Select DocId from Request where RequestedBy='" + uploadedby + "')";
            }
        }
        protected void Reset(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Request")
            {
                int x = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[x];
                string reqid = "Req";
                Random r = new Random();
                reqid = reqid + r.Next(123, 999).ToString();
                Random r1 = new Random();
                string skey = r1.Next(12345, 99999).ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
                try
                {
                    con.Open();
                    string query = "insert into Request values('" +reqid + "','" + row.Cells[0].Text + "','" + row.Cells[1].Text + "','" + row.Cells[2].Text + "','" + Session["Username"].ToString() + "','Pending','"+skey+"');";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                }
                finally
                {
                    con.Close();
                    Response.Redirect("filerequest.aspx");
                }
            }
        }

        protected void RowDelete(Object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                GridView1.EmptyDataText = "Row deleted successfully.";
            }

        }
    }
}