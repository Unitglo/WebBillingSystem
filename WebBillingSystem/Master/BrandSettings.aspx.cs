using MySql.Data.MySqlClient;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.IO;
using Newtonsoft.Json.Linq;

namespace WebBillingSystem
{
    public partial class BrandSettings : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;

        public string logo   = "";
        public string slider1 = "";
        public string slider2 = "";
        public string slider3 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                breadcrumb_title.InnerHtml = "Add Master Settings";
                baseHealpare = new DataBaseHealpare();
                hdnroleval_id.Value = Session["page_role"].ToString();

                string json = File.ReadAllText(Server.MapPath("~/Base/configuration.json"));
                var myJObject = JObject.Parse(json);
                company_name_Id.Value = myJObject.SelectToken("$.branding_data.login_page_name").Value<string>();

                hdn_logo_id.Value = myJObject.SelectToken("$.branding_data.login_page_logo").Value<string>();
                hdn_SliderOne_ID.Value = myJObject.SelectToken("$.branding_data.login_page_slider1").Value<string>();
                hdn_Slider_Image_two_Id.Value = myJObject.SelectToken("$.branding_data.login_page_slider2").Value<string>();
                hdn_Slider_Image_three_Id.Value = myJObject.SelectToken("$.branding_data.login_page_slider3").Value<string>();

                Header_Message_one_Id.Value = myJObject.SelectToken("$.branding_data.login_page_header_msg1").Value<string>();
                Header_Message_two_Id.Value = myJObject.SelectToken("$.branding_data.login_page_header_msg2").Value<string>();
                Header_Message_three_Id.Value = myJObject.SelectToken("$.branding_data.login_page_header_msg3").Value<string>();
                Description_Message_one_Id.Value = myJObject.SelectToken("$.branding_data.login_page_description1").Value<string>();
                Description_Message_two_Id.Value = myJObject.SelectToken("$.branding_data.login_page_description2").Value<string>();
                Description_Message_three_Id.Value = myJObject.SelectToken("$.branding_data.login_page_description3").Value<string>();

                logo = myJObject.SelectToken("$.branding_data.login_page_logo").Value<string>();
                slider1 = myJObject.SelectToken("$.branding_data.login_page_slider1").Value<string>();
                slider2 = myJObject.SelectToken("$.branding_data.login_page_slider2").Value<string>();
                slider3 = myJObject.SelectToken("$.branding_data.login_page_slider3").Value<string>();
            }
        }
        protected void button_Click(object sender, EventArgs e)
        {
            JObject myJObject = JObject.Parse(txthdnJson.Value.ToString());

            //logo File Upload
            if (hdn_logo_id.Value.ToString() == "")
            {
                HttpPostedFile postedFileLogo = logo_Id.PostedFile;
                if (postedFileLogo != null && postedFileLogo.ContentLength > 0)
                {
                    //Save the File.
                    string filePath = Server.MapPath("/images/") + Path.GetFileName(postedFileLogo.FileName);
                    postedFileLogo.SaveAs(filePath);
                    myJObject["branding_data"]["login_page_logo"] = "/images/" + Path.GetFileName(postedFileLogo.FileName);
                }
            }
            else {
                myJObject["branding_data"]["login_page_logo"] = hdn_logo_id.Value.ToString();
            }
            
            //First Slider File Upload
            if (hdn_SliderOne_ID.Value.ToString() == "")
            {
                HttpPostedFile postedFileLogo = Slider_Image_one_Id.PostedFile;
                if (postedFileLogo != null && postedFileLogo.ContentLength > 0)
                {
                    //Save the File.
                    string filePath = Server.MapPath("/images/") + Path.GetFileName(postedFileLogo.FileName);
                    postedFileLogo.SaveAs(filePath);
                    myJObject["branding_data"]["login_page_slider1"] = "/images/" + Path.GetFileName(postedFileLogo.FileName);
                }
            }
            else {
                myJObject["branding_data"]["login_page_slider1"] = hdn_SliderOne_ID.Value.ToString();
            }
            //Second Slider File Upload
            if (hdn_Slider_Image_two_Id.Value.ToString() == "")
            {
                HttpPostedFile postedFileLogo = Slider_Image_two_Id.PostedFile;
                if (postedFileLogo != null && postedFileLogo.ContentLength > 0)
                {
                    //Save the File.
                    string filePath = Server.MapPath("/images/") + Path.GetFileName(postedFileLogo.FileName);
                    postedFileLogo.SaveAs(filePath);
                    myJObject["branding_data"]["login_page_slider2"] = "/images/" + Path.GetFileName(postedFileLogo.FileName);
                }
            }
            else {
                myJObject["branding_data"]["login_page_slider2"] = hdn_Slider_Image_two_Id.Value.ToString();
            }
            //Three Slider File Upload
            if (hdn_Slider_Image_three_Id.Value.ToString() == "")
            {
                HttpPostedFile postedFileLogo = Slider_Image_three_Id.PostedFile;
                if (postedFileLogo != null && postedFileLogo.ContentLength > 0)
                {
                    //Save the File.
                    string filePath = Server.MapPath("/images/") + Path.GetFileName(postedFileLogo.FileName);
                    postedFileLogo.SaveAs(filePath);
                    myJObject["branding_data"]["login_page_slider3"] = "/images/" + Path.GetFileName(postedFileLogo.FileName);
                }
            }
            else {
                myJObject["branding_data"]["login_page_slider3"] = hdn_Slider_Image_three_Id.Value.ToString();
            }
            
            myJObject["installation_type"] = ""+Session["installation_type"];
            myJObject["pmslogo"] = "" + Session["pmslogo"];
            myJObject["default_database"] = "" + Session["default_database"];
            File.WriteAllText(Server.MapPath("~/Base/configuration.json"), myJObject.ToString());
        }
       
    }
}