using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HubApi.NIPL.PAYROLL.REPORT
{
    public partial class API_NI_HRFM_EMPLOYEE_WISE_PERK : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                NI_SessionClass.pageSetting(this.Page);
            }
            catch (Exception ex)
            {
                Response.Redirect("~/NIPL/COMMON/NI_SessionExpire.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}