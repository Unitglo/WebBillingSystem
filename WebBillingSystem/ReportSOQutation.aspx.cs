﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ReportSOQutation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack){
            dbObject.CreateList(DropDownList1,dbObject.TableSalesOrderQuotation,new String[]{"sales_order_quotation_id","sales_order_quotation_id"});
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            dbObject.MessageBox(this,"Print Not Working");
        }

       protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
       {
           MySqlDataReader reader = dbObject.SelectAllValues(dbObject.TableSalesOrderQuotation + "," + dbObject.TableVendor, " where " + dbObject.TableVendor + ".vendor_id=" + dbObject.TableSalesOrderQuotation + ".vendor_id and "+dbObject.TableSalesOrderQuotation+".sales_order_quotation_id="+DropDownList1.SelectedValue);
           while (reader.Read())
           {
               Name.Text = "" + reader["customer_name"];
               ContactNo.Text = "" + reader["contactno"];
               Address.Text = "" + reader["address"];
               Email.Text = "" + reader["email"];
               Dates.Text = "" + reader["sales_date"];
               TotalVat.Text = "" + reader["vat"];
               TotalAmount.Text = "" + reader["total"];
           }
           reader.Close();
           GridView1.DataSource = dbObject.SelectAllValues(dbObject.TableSalesItemsQuotation, " where sales_order_quotation_id=" + DropDownList1.SelectedValue);
           GridView1.DataBind();
       }
       DataBaseHealpare dbObject = new DataBaseHealpare();

    }
}