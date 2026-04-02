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
using SqlConnectionValidator;

namespace Superman_Web
{
    public partial class fileupload : System.Web.UI.Page
    {
        static string content = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Random r = new Random();
                int a = r.Next(1234, 999999);
                docid.Value = "DOC" + a.ToString();
                uploadeddate.Value = DateTime.Now.ToString("dd/MM/yyyy");
                uploadedby.Value = Session["Username"].ToString();
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
           /* Connection connector = new Connection();
            if (connector.isChecker())
            {*/
                Random r = new Random();
                int publickey = r.Next(1234, 999999);
                string s = DateTime.Now.ToString("dd");
                Random r1 = new Random(Convert.ToInt32(s));
                int aggregatekey = r1.Next(123, 999999);
                
                // Get the file size in MB
                double fileSizeMB = Math.Ceiling((double)FileUpload1.PostedFile.ContentLength / (1024 * 1024));
                
                // Temporary save the file to get its size
                string tempPath = Server.MapPath(@".\upload\temp_" + FileUpload1.FileName);
                FileUpload1.SaveAs(tempPath);
                
                SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
                string serverPath = "";
                string serverName = "";
                
                try
                {
                    con.Open();
                    
                    // Check if the server table has the new columns
                    bool hasNewColumns = false;
                    try
                    {
                        string checkQuery = "SELECT TOP 1 available_size_mb FROM server";
                        SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                        checkCmd.ExecuteScalar();
                        hasNewColumns = true;
                    }
                    catch
                    {
                        // The column doesn't exist yet
                    }
                    
                    string query;
                    SqlCommand cmd;
                    SqlDataReader dr;
                    
                    if (hasNewColumns)
                    {
                        // Find servers with enough space
                        query = "SELECT ServerName, path, available_size_mb FROM server WHERE available_size_mb >= " + fileSizeMB + " AND available_conn > 0 ORDER BY available_size_mb DESC";
                        cmd = new SqlCommand(query, con);
                        dr = cmd.ExecuteReader();
                        
                        if (!dr.HasRows)
                        {
                            dr.Close();
                            System.IO.File.Delete(tempPath);
                            Response.Write("<script>alert('No server has enough space to store this file. Please try a smaller file or add more server space.');</script>");
                            return;
                        }
                    }
                    else
                    {
                        // Fall back to the old method if the new columns don't exist
                        query = "SELECT ServerName, path FROM server WHERE available_conn > 0";
                        cmd = new SqlCommand(query, con);
                        dr = cmd.ExecuteReader();
                        
                        if (!dr.HasRows)
                        {
                            dr.Close();
                            System.IO.File.Delete(tempPath);
                            Response.Write("<script>alert('No server is available to store this file. Please try again later.');</script>");
                            return;
                        }
                    }
                    
                    // Get the server information
                    dr.Read();
                    serverName = dr.GetValue(0).ToString();
                    serverPath = dr.GetValue(1).ToString();
                    double availableSize = 0;
                    
                    // Get available size if the column exists
                    if (hasNewColumns && dr.FieldCount > 2)
                    {
                        availableSize = dr.GetValue(2) != DBNull.Value ? Convert.ToDouble(dr.GetValue(2)) : 0;
                    }
                    dr.Close();
                    
                    // Make sure the server directory exists
                    if (!System.IO.Directory.Exists(serverPath))
                    {
                        try
                        {
                            System.IO.Directory.CreateDirectory(serverPath);
                        }
                        catch (Exception ex)
                        {
                            System.IO.File.Delete(tempPath);
                            Response.Write("<script>alert('Error creating server directory: " + ex.Message.Replace("'", "\\'") + "');</script>");
                            return;
                        }
                    }
                    
                    // Move the file to the server directory
                    string finalPath = Path.Combine(serverPath, FileUpload1.FileName);
                    try
                    {
                        System.IO.File.Move(tempPath, finalPath);
                    }
                    catch (Exception ex)
                    {
                        System.IO.File.Delete(tempPath);
                        Response.Write("<script>alert('Error moving file to server: " + ex.Message.Replace("'", "\\'") + "');</script>");
                        return;
                    }
                    
                    // Encrypt the file
                    EncryptFile(finalPath, aggregatekey);
                    
                    // Create encrypted copy in Data folder
                    string dataPath = Server.MapPath(@".\upload\Data\" + FileUpload1.FileName);
                    System.IO.File.Copy(finalPath, dataPath, true);
                    
                    System.Diagnostics.Process.Start(Server.MapPath(@".\DataMarker.exe"));
                    System.Threading.Thread.Sleep(25000);
                    
                    // Update server information
                    if (hasNewColumns)
                    {
                        // Update server available space
                        double newAvailableSize = availableSize - fileSizeMB;
                        query = "UPDATE server SET available_size_mb = " + newAvailableSize + ", available_conn = available_conn - 1 WHERE ServerName = '" + serverName + "'";
                    }
                    else
                    {
                        // Just update the connection count if the size columns don't exist
                        query = "UPDATE server SET available_conn = available_conn - 1 WHERE ServerName = '" + serverName + "'";
                    }
                    cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    
                    // Check if the Docdata table has the new columns
                    bool docDataHasNewColumns = false;
                    try
                    {
                        string checkQuery = "SELECT TOP 1 ServerName FROM Docdata";
                        SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                        checkCmd.ExecuteScalar();
                        docDataHasNewColumns = true;
                    }
                    catch
                    {
                        // The column doesn't exist yet
                    }
                    
                    // Insert document record
                    if (docDataHasNewColumns)
                    {
                        query = "INSERT INTO Docdata VALUES('" + docname.Value + "','" + docid.Value + "','" + uploadedby.Value + "','" 
                            + uploadeddate.Value + "','" + FileUpload1.FileName + "','" + finalPath + "','" + author.Value + "','Yes','" + serverName + "','" + fileSizeMB + "')";
                    }
                    else
                    {
                        query = "INSERT INTO Docdata VALUES('" + docname.Value + "','" + docid.Value + "','" + uploadedby.Value + "','" 
                            + uploadeddate.Value + "','" + FileUpload1.FileName + "','" + finalPath + "','" + author.Value + "','Yes')";
                    }
                    cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                }
                catch(Exception ex)
                {
                    // Clean up the temp file if it exists
                    try
                    {
                        if (System.IO.File.Exists(tempPath))
                            System.IO.File.Delete(tempPath);
                    }
                    catch { }
                    
                    Response.Write("<script>alert('Error uploading file: " + ex.Message.Replace("'", "\\'") + "');</script>");
                    return;
                }
                finally
                {
                    con.Close();
                    Response.Write("<script>alert('File has been uploaded successfully !!!');</script>");
                    Response.Write("<script>window.location='fileupload.aspx';</script>");
                }
            //}
        }

        protected void Reset(object sender, EventArgs e)
        {
            Response.Redirect("fileupload.aspx");
        }


        protected void EncryptFile(string inputFile, int pkey)
        {
            if (System.IO.Path.GetExtension(inputFile).Equals(".txt")|| System.IO.Path.GetExtension(inputFile).Equals(".jpg")|| System.IO.Path.GetExtension(inputFile).Equals(".pdf")|| System.IO.Path.GetExtension(inputFile).Equals(".mp4")|| System.IO.Path.GetExtension(inputFile).Equals(".exe")|| System.IO.Path.GetExtension(inputFile).Equals(".zip"))
            {
                content = System.IO.File.ReadAllText(inputFile);
            }
            else
            {
                content = "Storing of file information";
                FileInfo oFileInfo = new FileInfo(inputFile);
                //Console.WriteLine("My File's Name: \"" + oFileInfo.Name + "\"");
                //DateTime dtCreationTime = oFileInfo.CreationTime;
                //Console.WriteLine("Date and Time File Created: " + dtCreationTime.ToString());
                //Console.WriteLine("myFile Extension: " + oFileInfo.Extension);
                //Console.WriteLine("myFile total Size: " + oFileInfo.Length.ToString());
                //Console.WriteLine("myFile filepath: " + oFileInfo.DirectoryName);
                //Console.WriteLine("My File's Full Name: \"" + oFileInfo.FullName + "\"");
                content = content + oFileInfo.Name;
                content = content + oFileInfo.CreationTime;
                content = content + oFileInfo.Extension;
                content = content + oFileInfo.Length.ToString();
                content = content + oFileInfo.DirectoryName;
                content = content + oFileInfo.FullName;
            }
            string outputFile = Server.MapPath(@"\upload\Data\" + FileUpload1.FileName);//
            DESCryptoServiceProvider DESalg = new DESCryptoServiceProvider();

            // Create a string to encrypt.
            // string sData = "Here is some data to encrypt.";
            //string FileName = "CText.txt";

            // Encrypt text to a file using the file name, key, and IV.
            EncryptTextToFile(content, outputFile, DESalg.Key, DESalg.IV);


        }


        public static void EncryptTextToFile(String Data, String FileName, byte[] Key, byte[] IV)
        {
            try
            {
                // Create or open the specified file.
                FileStream fStream = File.Open(FileName, FileMode.OpenOrCreate);

                // Create a CryptoStream using the FileStream 
                // and the passed key and initialization vector (IV).
                CryptoStream cStream = new CryptoStream(fStream, new DESCryptoServiceProvider().CreateEncryptor(Key, IV), CryptoStreamMode.Write);

                // Create a StreamWriter using the CryptoStream.
                StreamWriter sWriter = new StreamWriter(cStream);

                // Write the data to the stream 
                // to encrypt it.
                sWriter.WriteLine(Data);

                // Close the streams and
                // close the file.
                sWriter.Close();
                cStream.Close();
                fStream.Close();
            }
            catch (CryptographicException e)
            {
                Console.WriteLine("A Cryptographic error occurred: {0}", e.Message);
            }
            catch (UnauthorizedAccessException e)
            {
                Console.WriteLine("A file error occurred: {0}", e.Message);
            }

        }


    }
}