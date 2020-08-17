using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Net.Http;
using System.Text;
using System.Collections.Specialized;
using System.Globalization;

namespace WebBillingSystem
{
    public partial class company_file_upload_code : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public string userFile;
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();
            string path = baseHealpare.DecodeUrl(this, Request.QueryString["value"]);
            string dumpPath = path;
            string URI = "http://pms.unitglo.com/send_data.php";
            string address = URI;
            //byte[] result = UploadFiles(myParameters, files, values);
            using (var stream = File.Open(dumpPath, FileMode.Open))
            {
                var files = new[]
                {
                    new UploadFile
                    {
                            Name = "user_file",
                            Filename = Path.GetFileName(dumpPath),
                            ContentType = "text/plain",
                            Stream = stream
                    }
                };

                    var values = new NameValueCollection
                        {
                            { "company_code", Session["company_code"].ToString() },
                            { "ca_code", Session["ca_code"].ToString() },
                            { "page_role", Session["page_role"].ToString() }
                        };
                    byte[] result = baseHealpare.UploadFiles(address, files, values);
                    string result1 = System.Text.Encoding.UTF8.GetString(result);
                    baseHealpare.MessageBox(this, result1);
                if (Session["page_role"] + "" == "CA")
                {
                    baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst,
                                   new string[] { "ca_approved_status" },
                                   new string[] { "0" },
                                   "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddSaleDtl,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseDtl,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");
                    baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditDtl,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryDtl,
                                       new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryMst,
                                      new string[] { "ca_approved_status" },
                                       new string[] { "0" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.expenses_voucher_mst,
                                          new string[] { "ca_approved_status" },
                                          new string[] { "0" },
                                            "1");
                    baseHealpare.UpdateValue(baseHealpare.expenses_voucher_dtl,
                                          new string[] { "ca_approved_status" },
                                          new string[] { "0" },
                                            "1");
                }
                else if (Session["page_role"] + "" == "COMPANY")
                    {
                    baseHealpare.UpdateValue(baseHealpare.TableAddSaleMst,
                                   new string[] { "ca_approved_status" },
                                   new string[] { "1" },
                                   "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddSaleDtl,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseMst,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddStockPuchaseDtl,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditMst,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");
                    baseHealpare.UpdateValue(baseHealpare.TableAddDebitCreditDtl,
                                  new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryDtl,
                                       new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.TableAddJournalEntryMst,
                                      new string[] { "ca_approved_status" },
                                       new string[] { "1" },
                                       "1");

                    baseHealpare.UpdateValue(baseHealpare.expenses_voucher_mst,
                                          new string[] { "ca_approved_status" },
                                          new string[] { "1" },
                                            "1");
                    baseHealpare.UpdateValue(baseHealpare.expenses_voucher_dtl,
                                          new string[] { "ca_approved_status" },
                                          new string[] { "1" },
                                            "1");
                }
            }
            Response.Redirect("~/home.aspx");
        }
    }

    public class UploadFile
    {
        public UploadFile()
        {
            ContentType = "application/octet-stream";
        }
        public string Name { get; set; }
        public string Filename { get; set; }
        public string ContentType { get; set; }
        public Stream Stream { get; set; }
    }
}