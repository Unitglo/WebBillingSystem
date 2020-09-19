using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class ParchesOrder : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            dbobject = new DataBaseHealpare();
            if (DropDownList1.Items.Count < 2)
            {
                PONo.Text = "" + (Convert.ToInt32(dbobject.GetNo(dbobject.TablePurchaseOrder, "purchase_order_id")) + 1);
                dbobject.CreateList(SupplierNameList, dbobject.TableSupplier, new String[] { "supplier_id", "supplier_name" });
                dbobject.CreateList(DropDownList1, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList2, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList3, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList4, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList5, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList6, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList7, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList8, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList9, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
                dbobject.CreateList(DropDownList10, dbobject.TableItems, new String[] { "item_id", "item_names" }, new String[] { "item_type_id=1" });
            }
            Rate.Clear();
            Amount.Clear();
            VatAmount.Clear();
            Rate.Add(Rate1);
            Amount.Add(Amount1);
            Rate.Add(Rate2);
            Amount.Add(Amount2);
            Rate.Add(Rate3);
            Amount.Add(Amount3);
            Rate.Add(Rate4);
            Amount.Add(Amount4);
            Rate.Add(Rate5);
            Amount.Add(Amount5);
            Rate.Add(Rate6);
            Amount.Add(Amount6);
            Rate.Add(Rate7);
            Amount.Add(Amount7);
            Rate.Add(Rate8);
            Amount.Add(Amount8);
            Rate.Add(Rate9);
            Amount.Add(Amount9);
            Rate.Add(Rate10);
            Amount.Add(Amount10);
            VatAmount.Add(Label1);
            VatAmount.Add(Label2);
            VatAmount.Add(Label3);
            VatAmount.Add(Label4);
            VatAmount.Add(Label5);
            VatAmount.Add(Label6);
            VatAmount.Add(Label7);
            VatAmount.Add(Label8);
            VatAmount.Add(Label9);
            VatAmount.Add(Label10);
            CalculateTotalAmount();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList myDropDownList = (DropDownList)sender;
            int i = Convert.ToInt32(myDropDownList.ID.Replace("DropDownList", ""));
            Rate.ElementAt(i - 1).Text = dbobject.SelectAllValues1(dbobject.TableItems, new String[] { "item_id=" + myDropDownList.SelectedValue }, "rate");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox myTextBox = (TextBox)sender;
            int i = Convert.ToInt32(myTextBox.ID.Replace("TextBox", ""));
            Double TempAmount = Convert.ToDouble(Rate.ElementAt(i - 1).Text) * Convert.ToDouble(myTextBox.Text);
            VatAmount.ElementAt(i - 1).Text = "" + (TempAmount * Convert.ToDouble(VatTypeList.SelectedValue));
            Amount.ElementAt(i - 1).Text = "" + ((TempAmount * Convert.ToDouble(VatTypeList.SelectedValue)) + TempAmount);
            CalculateTotalAmount();
        }

        protected void SupplierNameList_SelectedIndexChanged(object sender, EventArgs e)
        {
            VatNumber.Text = dbobject.SelectAllValues1(dbobject.TableSupplier, new String[] { "supplier_id=" + SupplierNameList.SelectedValue }, "vat_no");
        }

        private void CalculateTotalAmount()
        {
            double tempTotal = 0.00;
            double tempvatTotal = 0.00;
            for (int i = 0; i < Amount.Count; i++)
            {
                tempTotal = tempTotal + Convert.ToDouble(Amount.ElementAt(i).Text);
                tempvatTotal = tempvatTotal + Convert.ToDouble(VatAmount.ElementAt(i).Text);
            }
            TotalAmount.Text = "" + tempTotal;
            VatTotal.Text = "" + tempvatTotal;
        }


        protected void PrintBill_Click(object sender, EventArgs e)
        {
            if (SupplierNameList.SelectedValue != "0" && TotalAmount.Text != "0")
            {
                if (DropDownList1.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList1.SelectedValue, Rate1.Text, VatAmount.ElementAt(0).Text, TextBox1.Text });
                }
                if (DropDownList2.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList2.SelectedValue, Rate2.Text, VatAmount.ElementAt(2).Text, TextBox2.Text });
                }
                if (DropDownList3.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList3.SelectedValue, Rate3.Text, VatAmount.ElementAt(3).Text, TextBox3.Text });
                }
                if (DropDownList4.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList4.SelectedValue, Rate4.Text, VatAmount.ElementAt(4).Text, TextBox4.Text });
                }
                if (DropDownList5.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList5.SelectedValue, Rate5.Text, VatAmount.ElementAt(5).Text, TextBox5.Text });
                }
                if (DropDownList6.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList6.SelectedValue, Rate6.Text, VatAmount.ElementAt(6).Text, TextBox6.Text });
                }
                if (DropDownList7.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList7.SelectedValue, Rate7.Text, VatAmount.ElementAt(7).Text, TextBox7.Text });
                }
                if (DropDownList8.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList8.SelectedValue, Rate8.Text, VatAmount.ElementAt(8).Text, TextBox8.Text });
                }
                if (DropDownList9.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList9.SelectedValue, Rate9.Text, VatAmount.ElementAt(9).Text, TextBox9.Text });
                }
                if (DropDownList10.SelectedIndex != 0)
                {
                    dbobject.InsertIntoTable(dbobject.TablePurchaseItems, new String[] { "purchase_order_id", "item_id", "rate", "vat", "qty" }, new String[] { PONo.Text, DropDownList10.SelectedValue, Rate10.Text, VatAmount.ElementAt(10).Text, TextBox10.Text });
                }
                if (!dates.Value.Equals(""))
                    dbobject.MessageBox(this, "Data Adding " + dbobject.InsertIntoTable(dbobject.TablePurchaseOrder, new String[] { "purchase_order_id", "supplier_id", "vat", "total", "status", "purchase_date" }, new String[] { PONo.Text, SupplierNameList.SelectedValue, VatTotal.Text, TotalAmount.Text, "0", "" + dates.Value }));
                else
                {
                    dbobject.MessageBox(this, "Select Date");
                }
            }
            else
            {
                dbobject.MessageBox(this, "Select Supplier Name");
            }
        }
        List<Label> Rate = new List<Label>();
        List<Label> Amount = new List<Label>();
        List<Label> VatAmount = new List<Label>();
        DataBaseHealpare dbobject;

    }

}