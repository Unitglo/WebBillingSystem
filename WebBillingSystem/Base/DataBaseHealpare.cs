using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBillingSystem.Base;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;
using WebBillingSystem;
using System.Text;
using System.Net;
using static WebBillingSystem.company_file_upload_code;
using System.Collections.Specialized;
using System.Globalization;

/// <summary>
/// Summary description for Class1
/// </summary>
public class DataBaseHealpare : TableBase, IDisposable
{
    public string Name = "";

    // Free managed and unmanaged resources.
    public void Dispose()
    {

        FreeResources(true);
    }

    internal void UpdateValue(string new_update_table, string[] v1, string[] v2)
    {
        throw new NotImplementedException();
    }

    // Destructor to clean up unmanaged resources
    // but not managed resources.
    ~DataBaseHealpare()
    {
        FreeResources(false);
    }

    // Keep track if whether resources are already freed.
    private bool ResourcesAreFreed = false;

    // Free resources.
    private void FreeResources(bool freeManagedResources)
    {
        Console.WriteLine(Name + ": FreeResources");
        if (!ResourcesAreFreed)
        {
            // Dispose of managed resources if appropriate.
            if (freeManagedResources)
            {
                // Dispose of managed resources here.
                Console.WriteLine(Name + ": Dispose of managed resources");
            }

            // Dispose of unmanaged resources here.
            Console.WriteLine(Name + ": Dispose of unmanaged resources");

            // Remember that we have disposed of resources.
            ResourcesAreFreed = true;

            // We don't need the destructor because
            // our resources are already freed.
            GC.SuppressFinalize(this);
        }
    }

    public MySqlConnection con = null;
    public DataBaseHealpare()
    {
        if (HttpContext.Current.Session["role_code"] == null && !HttpContext.Current.Request.CurrentExecutionFilePath.Contains("Login"))
        {
            //string sessionID = HttpContext.Current.Session["role_code"].ToString();
            HttpContext.Current.Response.Redirect("~/Login");
        }
        this.openConnection();

    }
    public void createSession(Page page,string role,string uid,string company_name,string db,string state_name,string state_code)
    {
        page.Session["role_code"] = role;
        page.Session["company"] = uid;
        page.Session["company_name"] = company_name;
        page.Session["pms_db"] = db;
        page.Session["statename"] = state_name;
        page.Session["statecode"] = state_code;
    }

    public string ApprovalCheckStatus()
    {
        string ca_status_condition = "";
        if (HttpContext.Current.Session["role_code"].ToString() == "CA")
        {
            ca_status_condition = "and ca_approved_status != 3";
        }
        else if (HttpContext.Current.Session["role_code"].ToString() == "company")
        {
            ca_status_condition = "and ca_approved_status NOT IN(2,3)";
        }
        return ca_status_condition;
    }

    public string DecodeUrl(Page page,string pram)
    {
        return System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(page.Server.UrlDecode(pram)));
        
    }

    public string EncodeUrl(Page page, string pram)
    {
        return page.Server.UrlEncode(System.Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(pram)));
    }

    public string LoginCheck(string Uname, string password)
    {
        try
        {
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;
            msqlCommand.CommandText = "select * from user where name='" + Uname + "' and password='" + password + "'";
            MySqlDataReader reader = msqlCommand.ExecuteReader();
            while (reader.Read())
            {
                return "" + reader["role"];
            }
            return "Faild";
        }
        catch (Exception e)
        {
            return e.Message;
        }
    }
    public string DatabaseBackup(string file)
    {
        try { 
        using (MySqlCommand cmd = new MySqlCommand())
        {
            using (MySqlBackup mb = new MySqlBackup(cmd))
            {
                    cmd.Connection = con;
                    if (con != null && con.State == ConnectionState.Open)
                    {

                        mb.ExportToFile(file);
                    }
                    else {
                        con.Open();
                        mb.ExportToFile(file);
                        con.Close();
                    }
                }
        }
            return "Done";
        }
            catch (Exception e) {
            return e.Message;
        }
    }

    public string DatabaseRestore(string file)
    {
        try
        {
            using (MySqlCommand cmd = new MySqlCommand())
            {
                using (MySqlBackup mb = new MySqlBackup(cmd))
                {
                    cmd.Connection = con;
                    if (con != null && con.State == ConnectionState.Open)
                    {

                        mb.ImportFromFile(file);
                    }
                    else
                    {
                        con.Open();
                        mb.ExportToFile(file);
                        con.Close();
                    }
                }
            }
            return "Done";
        }
        catch (Exception e)
        {
            return e.Message;
        }
    }

    public void closeConnection() {
        if (con != null && con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }

    public MySqlConnection openConnection()
    {
        try { 
        string obj = (string)HttpContext.Current.Session["pms_db"];
            if (obj == null)
            {
                obj = (string)HttpContext.Current.Session["default_database"];
            }

            if (obj == null) {
                return null;
            }
        string pms = obj;
 if (obj!=null) {
     pms = (string)obj;
 }
 if (!HttpContext.Current.Request.IsLocal)
 {
 
    pms = "pms_system";
     if (obj != null)
     {
         pms = (string)obj;
     }
 }
        if (con != null && con.State == ConnectionState.Open)
        {
            con.Close();
        }
        else {
        }
        //con = new MySqlConnection("server=pms.smart-hotel.unitglo.com; user id=pms_root;Password=Proot123!@#;database=pms_system;persist security info=False; convert zero datetime=True");        //con = new MySqlConnection("server=localhost;user id=root;Password=;database=pms;persist security info=False");
        // con = new MySqlConnection("server=localhost;user id=root;Password=;database=pms_db;persist security info=False");
        // con = new MySqlConnection("server=localhost;user id=root;Password=;database=pms;persist security info=False");

        if (HttpContext.Current.Request.IsLocal)
        {
           con = new MySqlConnection("server=localhost;user id=root;Password=;database=" + pms + ";persist security info=False; convert zero datetime=True");
        }
        else
        {
                //if (pms.Equals("pms"))
                //{
                //    pms = "pms_system";
                //}
                con = new MySqlConnection("server=localhost; user id=pms_root;Password=Proot123!@#;database=" + pms + ";persist security info=False; convert zero datetime=True");
        }
        con.Open();
        return con;
        }
        catch (Exception e)
        {
            return null;
        }
    }

    public string InsertIntoTableGetID(string TableName, string[] TableFields, string[] TableValues)
    {
        try
        {
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;
            string TempString = "insert into " + TableName + " (";
            for (int i = 0; i < TableFields.Length; i++)
            {
                TempString += "" + TableFields[i] + ",";
            }
            TempString = TempString.Substring(0, TempString.Length - 1);
            TempString += ") VALUES (";
            for (int i = 0; i < TableValues.Length; i++)
            {
                TempString += "'" + TableValues[i] + "',";
            }
            TempString = TempString.Substring(0, TempString.Length - 1);
            TempString += ")";
            msqlCommand.CommandText = TempString;

            int temp = msqlCommand.ExecuteNonQuery();
            long id = msqlCommand.LastInsertedId;       // Get the ID of the inserted item
            this.closeConnection();
            if (temp > 0)
            {
                return ""+ id;
            }
        }
        catch (Exception e)
        {
            this.closeConnection();
            System.Diagnostics.Debug.WriteLine("your message here" + e);
            return e.Message;

        }
        return "ERROR";
    }

    public string InsertIntoTable(string TableName, string[] TableFields, string[] TableValues)
    {
        try
        {
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;
            string TempString = "insert into " + TableName + " (";
            for (int i = 0; i < TableFields.Length; i++)
            {
                TempString += "" + TableFields[i] + ",";
            }
            TempString = TempString.Substring(0, TempString.Length - 1);
            TempString += ") VALUES (";
            for (int i = 0; i < TableValues.Length; i++)
            {
                TempString += "'" + TableValues[i] + "',";
            }
            TempString = TempString.Substring(0, TempString.Length - 1);
            TempString += ")";
            msqlCommand.CommandText = TempString;
                
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }
        }
        catch (Exception e)
        {
            this.closeConnection();
            System.Diagnostics.Debug.WriteLine("your message here" + e);
                return e.Message;
        }
        return "ERROR";
    }

    public string UpdateValue(string TableName, string[] Fields, string[] FieldsValues, string Condition)
    {
        try
        {
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            msqlCommand.Connection = con;
            string tempString = "UPDATE " + TableName + " set ";
            for (int i = 0; i < Fields.Length && FieldsValues.Length > i; i++)
            {
                tempString += "" + Fields[i] + "='" + FieldsValues[i] + "' ,";
            }
            tempString = tempString.Substring(0, tempString.Length - 1);
            tempString += " where " + Condition;
            msqlCommand.CommandText = tempString;
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }

        }
        catch (Exception e)
        {
            this.closeConnection();
            return e.Message;
        }
        return "Error";
    }

    public string CreateDataBase(string file, string databases_name)
    {
        try
        {
            if (con.ConnectionString == "")
                this.openConnection();
            else
                con.Open();
            MySqlCommand msqlCommand = new MySqlCommand();
            msqlCommand.Connection = con;

            string db_sql = "create database " + databases_name +"; ";
            db_sql += "use "+databases_name+"; ";
            string tempString = db_sql+file;
            msqlCommand.CommandText = tempString;
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }

        }
        catch (Exception e)
        {
            this.closeConnection();
            return e.Message;
        }
        return "Error";
    }
    public string DropDataBase(string databases_name)
    {
        try
        {
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            msqlCommand.Connection = con;

            string db_sql = "drop database " + databases_name +"; ";
            string tempString = db_sql;
            msqlCommand.CommandText = tempString;
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }

        }
        catch (Exception e)
        {
            this.closeConnection();
            return e.Message;
        }
        return "Error";
    }

    public string UpdateValue(string TableName, string[] Fields, string Condition)
    {
        try
        {
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            msqlCommand.Connection = con;
            string tempString = "UPDATE " + TableName + " set ";
            for (int i = 0; i < Fields.Length; i++)
            {
                tempString += "" + Fields[i] + ",";
            }
            tempString = tempString.Substring(0, tempString.Length - 1);
            tempString += " where " + Condition;
            msqlCommand.CommandText = tempString;
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }

        }
        catch (Exception e)
        {
            this.closeConnection();
            return e.Message;
        }
        return "Error";
    }

    public MySqlDataReader SelectAllValues(string TableName)
    {
        try
        {
            this.closeConnection();
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;

            msqlCommand.CommandText = "select * from " + TableName;
            return msqlCommand.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }

    public MySqlDataReader SelectManualQuery(string query)
    {
        try
        {
            this.closeConnection();
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;

            msqlCommand.CommandText = query;
            return msqlCommand.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }


    public string updateIds(string TableName,string StatNumber,string ColumnName,string OrderByColums) {

        try
        {
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            msqlCommand.Connection = con;
            string tempString = "set @`i`="+ StatNumber + "; UPDATE " + TableName + " SET " + ColumnName + " = (@`i`:=@`i` + 1) ORDER BY " + OrderByColums + "; ";
            msqlCommand.CommandText = tempString;
            //msqlCommand.Parameters.Add("@i", MySqlDbType.Int32);
            //msqlCommand.Parameters["@i"].Value = int.Parse(StatNumber);
//            msqlCommand.
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }

        }
        catch (Exception e)
        {
            this.closeConnection();
            return e.Message;
        }
        return "Error";



    }
    public MySqlDataReader SelectAllValues(string TableName, string Condition)
    {
        try
        {
            this.closeConnection();
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;
            msqlCommand.CommandText = "select * from " + TableName + " " + Condition;
            return msqlCommand.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }

    public MySqlDataReader SelectAllValues(string Fields, string TableName, string Condition)
    {
        try
        {
            this.closeConnection();
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = con;
            msqlCommand.CommandText = "select " + Fields + " from " + TableName + " " + Condition;
            return msqlCommand.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }
    public MySqlDataReader SelectAllValues(string TableName, string[] Fields)
    {
        try
        {
            this.closeConnection();
            this.openConnection();
            string TempString = "select ";
            for (int i = 0; i < Fields.Length; i++)
            {
                TempString += "" + Fields[i] + ",";
            }
            TempString = TempString.Substring(0, TempString.Length - 1);
            TempString += " from " + TableName;
            MySqlCommand command = new MySqlCommand(TempString, con);
            return command.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }
    public MySqlDataReader SelectAllValues(string TableName, string[] Fields, string[] Condition)
    {
        try
        {
            this.closeConnection();
            this.openConnection();
            string TempString = "select ";
            for (int i = 0; i < Fields.Length; i++)
            {
                TempString += "" + Fields[i] + ",";
            }
            TempString = TempString.Substring(0, TempString.Length - 1);
            TempString += " from " + TableName + " where ";
            for (int i = 0; i < Condition.Length; i++)
            {
                TempString += " " + Condition[i] + " and";
            }
            TempString = TempString.Substring(0, TempString.Length - 4);
            MySqlCommand command = new MySqlCommand(TempString, con);
            return command.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }
    public void CreateList(DropDownList MainDropDownList, string TableName, string[] Fields)
    {
        try
        {
            MySqlDataReader reader = this.SelectAllValues(TableName, Fields);
            while (reader.Read())
            {
                ListItem newItem = new ListItem();
                newItem.Value = "" + reader[Fields[0]];
                newItem.Text = "" + reader[Fields[1]];
                MainDropDownList.Items.Add(newItem);
            }
            reader.Close();
            MainDropDownList.DataBind();
        }
        catch (Exception e)
        {
            // e.Message;
        }

    }

    public void CreateList(DropDownList MainDropDownList, string TableName, string[] Fields, string[] Condition)
    {
        try
        {
            MySqlDataReader reader = this.SelectAllValues(TableName, Fields, Condition);
            while (reader.Read())
            {
                ListItem newItem = new ListItem();
                newItem.Value = "" + reader[Fields[0]];
                newItem.Text = "" + reader[Fields[1]];
                MainDropDownList.Items.Add(newItem);
            }
            reader.Close();
            MainDropDownList.DataBind();
        }
        catch (Exception e)
        {
            //return e.Message;
        }

    }

    public string SelectAllValues1(string TableName, string[] Condition, string Field)
    {
        string Values = "";
        try
        {
            this.closeConnection();
            this.openConnection();
            string TempString = "select * from " + TableName + " where ";
            for (int i = 0; i < Condition.Length; i++)
            {
                TempString += " " + Condition[i] + " and ";
            }
            TempString = TempString.Substring(0, TempString.Length - 4);
            MySqlCommand command = new MySqlCommand(TempString, con);
            MySqlDataReader reader = command.ExecuteReader(); ;
            while (reader.Read())
            {
                Values = "" + reader[Field];
            }
            reader.Close();
            return Values;
        }
        catch (Exception e)
        {
            return e.Message;
        }
    }
    public void MessageBox(Page Page, string Message)
    {
        Page.ClientScript.RegisterStartupScript(
           Page.GetType(),
           "MessageBox",
           "<script language='javascript'>" +
           "$.toast({ heading: '" + Message + "', text: '<p>You have successfully completed .</p>', position: 'top-right', loaderBg: '#6640b2', class: 'jq-toast-primary', hideAfter:4000, stack: 6, showHideTransition: 'fade' });" +
           "</script>"
        );
    }
    public void MessageBox(Page Page, string Message, string position)
    {
        string pos = "top-right";
        string additionalScript = "";
        if (position == "center")
        {
            additionalScript = "$('.jq-toast-wrap').css('top','50%');";
            pos = "top-center";
        }
        Page.ClientScript.RegisterStartupScript(
           Page.GetType(),
           "MessageBox",
           "<script language='javascript'>" +
           "$.toast({ heading: '" + Message + "', text: '<p>You have successfully completed .</p>', position: '"+ pos + "', loaderBg: '#6640b2', class: 'jq-toast-primary', hideAfter:4000, stack: 6, showHideTransition: 'fade' });" +
           additionalScript+
           "</script>"
        );

    }

    public MySqlDataAdapter SelectValuForGriadRow(string TableName)
    {
        try
        {
            MySqlCommand msc = new MySqlCommand(" select * from " + TableName, con);
            return new MySqlDataAdapter(msc);
        }
        catch (Exception e)
        {
            return null;
        }
        
    }
    public string GetNo(string TableName, string Id)
    {
        string Values = "0";
        try
        {
            this.closeConnection();
            this.openConnection();
            string TempString = "SELECT * FROM  `" + TableName + "` ORDER BY  `" + TableName + "`.`" + Id + "` DESC LIMIT 1 ";
            MySqlCommand command = new MySqlCommand(TempString, con);
            MySqlDataReader reader = command.ExecuteReader(); ;
            while (reader.Read())
            {
                Values = "" + reader[Id];
            }
            reader.Close();
            return Values;
        }
        catch (Exception e) {
            return e.Message;
        }
       
    }

    public void controlDefaultValueCheck(System.Web.UI.HtmlControls.HtmlControl genericControl, string defaultValue)
    {

        switch (genericControl.GetType().Name)
        {
            case "HtmlGenericControl":
                using (HtmlGenericControl genericControl1 = (HtmlGenericControl)genericControl)
                {
                    if (genericControl1.InnerHtml.ToString().Equals(""))
                    {
                        genericControl1.InnerText = defaultValue;
                    }
                }
                break;

            case "HtmlInputText":
                using (HtmlInputText genericControl1 = (HtmlInputText)genericControl)
                {
                    if (genericControl1.Value.ToString().Equals(""))
                    {
                        genericControl1.Value = defaultValue;
                    }
                }
                break;

            case "HtmlInputGenericControl":
                using (HtmlInputGenericControl genericControl1 = (HtmlInputGenericControl)genericControl)
                {
                    if (genericControl1.Value.ToString().Equals(""))
                    {
                        genericControl1.Value = defaultValue;
                    }
                }
                break; 
            default:
                System.Diagnostics.Debug.WriteLine("your message here"+ genericControl.GetType().Name);
                break;
        }

    }
    public void controlDefaultValueCheck(Control genericControl, string defaultValue)
    {

        switch (genericControl.GetType().Name)
        {
            case "Label":
                using (Label genericControl1 = (Label)genericControl)
                {
                    if (genericControl1.Text.ToString().Equals(""))
                    {
                        genericControl1.Text = defaultValue;
                    }
                }
                break;
            case "TextBox":
                using (TextBox genericControl1 = (TextBox)genericControl)
                {
                    if (genericControl1.Text.ToString().Equals(""))
                    {
                        genericControl1.Text = defaultValue;
                    }
                }
                break;
            default:
                System.Diagnostics.Debug.WriteLine("your message here");
                break;
        }

    }

    public string DeleteValue(string TableName, string Condition)
    {
        try
        {
            string Fields = "status = 2";
            this.openConnection();
            MySqlCommand msqlCommand = new MySqlCommand();
            msqlCommand.Connection = con;
            string tempString = "UPDATE " + TableName + " set " + Fields;
            if (Condition != "")
            tempString += " where " + Condition;
            msqlCommand.CommandText = tempString;
            int temp = msqlCommand.ExecuteNonQuery();
            this.closeConnection();
            if (temp > 0)
            {
                return "DONE";
            }

        }
        catch (Exception e)
        {
            this.closeConnection();
            return e.Message;
        }
        return "Error";
    }
    public byte[] UploadFiles(string address, IEnumerable<UploadFile> files, NameValueCollection values)
    {
        var request = WebRequest.Create(address);
        request.Method = "POST";
        var boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x", NumberFormatInfo.InvariantInfo);
        request.ContentType = "multipart/form-data; boundary=" + boundary;
        boundary = "--" + boundary;

        using (var requestStream = request.GetRequestStream())
        {
            // Write the values
            foreach (string name in values.Keys)
            {
                var buffer = Encoding.ASCII.GetBytes(boundary + Environment.NewLine);
                requestStream.Write(buffer, 0, buffer.Length);
                buffer = Encoding.ASCII.GetBytes(string.Format("Content-Disposition: form-data; name=\"{0}\"{1}{1}", name, Environment.NewLine));
                requestStream.Write(buffer, 0, buffer.Length);
                buffer = Encoding.UTF8.GetBytes(values[name] + Environment.NewLine);
                requestStream.Write(buffer, 0, buffer.Length);
            }

            // Write the files
            foreach (var file in files)
            {
                var buffer = Encoding.ASCII.GetBytes(boundary + Environment.NewLine);
                requestStream.Write(buffer, 0, buffer.Length);
                buffer = Encoding.UTF8.GetBytes(string.Format("Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"{2}", file.Name, file.Filename, Environment.NewLine));
                requestStream.Write(buffer, 0, buffer.Length);
                buffer = Encoding.ASCII.GetBytes(string.Format("Content-Type: {0}{1}{1}", file.ContentType, Environment.NewLine));
                requestStream.Write(buffer, 0, buffer.Length);
                file.Stream.CopyTo(requestStream);
                buffer = Encoding.ASCII.GetBytes(Environment.NewLine);
                requestStream.Write(buffer, 0, buffer.Length);
            }

            var boundaryBuffer = Encoding.ASCII.GetBytes(boundary + "--");
            requestStream.Write(boundaryBuffer, 0, boundaryBuffer.Length);
        }

        using (var response = request.GetResponse())
        using (var responseStream = response.GetResponseStream())
        using (var stream = new MemoryStream())
        {
            responseStream.CopyTo(stream);
            return stream.ToArray();
        }
    }

}