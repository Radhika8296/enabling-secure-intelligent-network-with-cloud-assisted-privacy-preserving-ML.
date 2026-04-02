using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Superman_Web
{
    public partial class adminhome : System.Web.UI.Page
    {
        List<string> fnames = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
            try
            {
                con.Open();
                string query = "select Docdata.*,Userdata.NodeType from Docdata,Userdata where Docdata.Published='Yes' and Userdata.Username=Docdata.UploadedBy";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        string docid= dr.GetValue(1).ToString();
                        string fname = dr.GetValue(4).ToString();
                        fname = fname.ToLower();
                        string nodetype= dr.GetValue(8).ToString();
                        if (Path.GetExtension(fname).Equals(".exe") || nodetype.Equals("Unknown") || Path.GetExtension(fname).Equals(".application") || Path.GetExtension(fname).Equals(".msi") || Path.GetExtension(fname).Equals(".lnk") || Path.GetExtension(fname).Equals(".pif"))
                        {
                            string finalvalue = fname + "," + dr.GetValue(5).ToString() + "," + dr.GetValue(2).ToString() + "," + docid;
                            fnames.Add(finalvalue);
                        }
                    }
                }
                dr.Close();
                for (int i = 0; i < fnames.Count; i++)
                {
                    Random r = new Random();

                    string[] data = fnames[i].Split(',');
                    query = "insert into Logs values('" + r.Next(123, 999) + "','" + data[0] + "','" + data[1] + "','" + data[2] + "','" + DateTime.Today.ToShortDateString() + "');";
                    cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();

                    query = "update Docdata set Published='No' where DocId='" + data[3] + "';";
                    cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                }
               
                Response.Write("<script>alert('Malicious files are quarantined !!!');</script>");
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