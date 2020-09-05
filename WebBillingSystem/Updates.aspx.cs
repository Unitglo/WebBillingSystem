using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO.Compression;
using System.ComponentModel;
using System.Windows;
using System.IO;
namespace WebBillingSystem
{
    public partial class Updates : System.Web.UI.Page
    {
        WebClient client;
        string dir_name = "project";
        string zip_name = "project.zip";
        string download_path = @"E:\PMS download\";//zip file downlaod from link";
        string depoloy_path = "E:\\PMS System";//--extarct 
        string backup_path = @"E:\\\PMS SystemBackup\\project-";//deploy existing folder back 
        string download_zip_url = "http://www.unitglo.com/project.zip";
        protected void Page_Load(object sender, EventArgs e)
        {
            client = new WebClient();
            client.DownloadProgressChanged += Client_DownloadProgressChanged;
            client.DownloadFileCompleted += Client_DownloadFileCompleted;
            // Button1_Click(null, null);


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string url = download_zip_url;
            if (!string.IsNullOrEmpty(url))
            {

                Uri uri = new Uri(url);
                string filename = System.IO.Path.GetFileName(uri.AbsolutePath);
                // client.DownloadFileAsync(uri, Application.StartupPath + "/" + filename);

                // Response.Redirect(download_path+filename);
                client.DownloadFileAsync(new Uri(url), download_path + filename);
            }
            // Response.Write("Download complete!");
            lbdw.InnerText = "Download complete!";
        }


        private void Client_DownloadFileCompleted(object sender, AsyncCompletedEventArgs e)
        {
            extract_file();
        }
        private void Client_DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
        }
        private void extract_file()
        {
            System.IO.Compression.ZipFile.CreateFromDirectory(depoloy_path, backup_path + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + ".zip");

            if (Directory.Exists(depoloy_path + "\\" + dir_name))
            {
                System.IO.Directory.Delete(depoloy_path + "\\" + dir_name, true);
            }
            System.IO.Compression.ZipFile.ExtractToDirectory(download_path + zip_name, depoloy_path);//file name read from download url         
                                                                                                     // Response.Write("File Extracted Successfully");
            lbex.InnerText = "File Extracted Successfully";

        }
    }
}