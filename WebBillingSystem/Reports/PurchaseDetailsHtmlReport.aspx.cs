using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;



namespace WebBillingSystem
{
    public partial class PurchaseDetailsHtmlReport : System.Web.UI.Page
    {
        StringBuilder strBody = new StringBuilder();
        string strNI_HRCPD_COMPCD = "";
        string strNI_DEFUNCT = "";
        DataSet dsResult;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {

                    WEBAPI_CommonFunctions comm = new WEBAPI_CommonFunctions();
                    DataTable newdt = new DataTable();


                    string str = Request.QueryString.ToString();

                    strNI_HRCPD_COMPCD = comm.nipl_GetQueryStringValues(str, "COMPCD");
                    strNI_DEFUNCT = comm.nipl_GetQueryStringValues(str, "DEFUNCT");
                    Session[NI_SessionClass.NI_SS_AUTH_TOKEN] = System.Configuration.ConfigurationManager.AppSettings["auth_token"];

                    strBody.Append(NI_SessionClass.HeaderTable(this.Page, Session[NI_SessionClass.NI_SS_COMPNAME].ToString(), Session[NI_SessionClass.NI_SS_USERNAME].ToString(), "EMPLOYEEWISE PERK REPORT"));
                    loadReport();
                    reporttd.InnerHtml = strBody.ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }

        }

        void loadReport()
        {
            strBody.Append("<table id='tblMain' class='table table-bordered' runat='server' border='1' width='100%'>");
            strBody.Append("<tr>");
            strBody.Append("<td>Sr. No.</td>");
            strBody.Append("<td> EMPLOYEE Name</td>");
            //strBody.Append("<td>EMPLOYEE Name</td>");
            strBody.Append("<td>Perk ID</td>");
            strBody.Append("<td>Perk Name</td>");
            strBody.Append("<td>Perk Type</td>");
            //strBody.Append("<td>CATEGORI TYPE</td>");
            strBody.Append("<td>CAT_PERK_AMT</td>");
            strBody.Append("<td>FORMULA_ID</td>");
            strBody.Append("<td>FORMULA_NAME</td>");
            strBody.Append("<td>ACTIVE</td>");
            strBody.Append("</tr>");
            dsResult = new DataSet();
            dsResult = (DataSet)HttpContext.Current.Session["key"];

            dynamic obj = new System.Dynamic.ExpandoObject();

            var aimsapi = System.Configuration.ConfigurationManager.AppSettings["aimsNetwebapi"];
            var url = aimsapi;
            obj.chubspname = "[nipl].[NI_HRFM_PAYROLL_REPORT_SP1]";
            obj.p_NI_HRCPD_COMPCD = strNI_HRCPD_COMPCD;
            obj.p_NI_DEFUNCT = strNI_DEFUNCT;
            obj.p_TYPE = "EMPWISE_PAYROLL";

            COMMON_MenuModule objWebApi = new COMMON_MenuModule();
            dsResult = objWebApi.getWebAPIDSResponse(url, obj);
            int srno = 1;
            if (dsResult.Tables[0].Rows.Count > 0)
            {


                for (int i = 0; i < dsResult.Tables[0].Rows.Count; i++)
                {
                    strBody.Append("<tr>");
                    strBody.Append("<td>" + srno + "</td>");
                   // strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["CATEGORY_ID"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["EMPLOYEE_NAME"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["PERK_ID"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["PERK_NAME"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["PERK_TYPE"] + "</td>");
                   // strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["CATEGORY_TYPE"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["PERK_AMT"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["FORMULA_ID"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["FORMULA_NAME"] + "</td>");
                    strBody.Append("<td>" + dsResult.Tables[0].Rows[i]["NI_DEFUNCT"] + "</td>");
                    strBody.Append("</tr>");
                    srno++;
                }


            }
            else
            {
                strBody.Append("<tr><td colspan=9 style='text-align:center'>Record Not Found</td></tr>");
            }
            strBody.Append("</table>");
        }
    }
}