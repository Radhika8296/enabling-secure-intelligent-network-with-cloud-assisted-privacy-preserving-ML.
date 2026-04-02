using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Superman_Web
{
    public partial class addserver : System.Web.UI.Page
    {
        string filename = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Image1.Visible = false;
            }
        }



        protected void Upload(object sender, EventArgs e)
        {
            // Validate server size
            if (string.IsNullOrEmpty(serverSize.Value))
            {
                Response.Write("<script>alert('Please enter server size in MB!');</script>");
                return;
            }

            int size;
            if (!int.TryParse(serverSize.Value, out size) || size <= 0)
            {
                Response.Write("<script>alert('Please enter a valid server size (greater than 0 MB)!');</script>");
                return;
            }

            // Create directory for the server
            string serverDirectory = Server.MapPath(@".\upload\" + sname.Value);
            try
            {
                if (!System.IO.Directory.Exists(serverDirectory))
                {
                    System.IO.Directory.CreateDirectory(serverDirectory);
                }
                else
                {
                    Response.Write("<script>alert('A server with this name already exists!');</script>");
                    return;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error creating server directory: " + ex.Message.Replace("'", "\\'") + "');</script>");
                return;
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
            try
            {
                con.Open();
                string query = "insert into server(ServerName,url,total_conn,available_conn,status,location,path,total_size_mb,available_size_mb) values('" 
                    + sname.Value + "','" 
                    + surl.Value + "','3','3','Normal','" 
                    + DropDownList1.SelectedValue + "','" 
                    + serverDirectory + "','" 
                    + size + "','" 
                    + size + "');";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // If database insert fails, try to clean up the directory
                try
                {
                    if (System.IO.Directory.Exists(serverDirectory))
                    {
                        System.IO.Directory.Delete(serverDirectory, true);
                    }
                }
                catch { }
                Response.Write("<script>alert('Error adding server to database: " + ex.Message.Replace("'", "\\'") + "');</script>");
                return;
            }
            finally
            {
                con.Close();
                Response.Write("<script>alert('Server added successfully !!!');</script>");
                Response.Write("<script>window.location='addserver.aspx';</script>");
            }
        }

        protected void Reset(object sender, EventArgs e)
        {
            Response.Redirect("addserver.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            filename = FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(@".\images\") + (FileUpload1.FileName));
            Image1.Visible = true;
            Image1.ImageUrl = @"./images/" + (FileUpload1.FileName);
        }
    }
}