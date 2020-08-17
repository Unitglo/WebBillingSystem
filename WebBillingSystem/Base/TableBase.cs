using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBillingSystem.Base
{
    public class TableBase 
    {     
        
        public string TableAddAccount = "pms_account_master";
        public string TableAccountMainGroup = "pms_account_master_main_group";
        public string TableAccountsubGroup = "pms_account_master_sub_group";
        public string TableAccountstate = "pms_account_state";

        public string TableNatureofOpration = "pms_stock_nature_of_opration";
        public string TableStockGroup = "pms_stock_addgroup";
        public string TableUnitofmeasurment = "pms_unit_of_measuremt";
        public string TableAddStock = "pms_stock";

        public string TableCompanypersontype = "pms_company_person_type";
        public string TableAddCompany = "pms_company";
        public string TableAddCA = "pms_ca_tbl";

        public string TableAddStockPuchaseMst = "pms_purchase_invoice_mst";
        public string TableAddStockPuchaseDtl = "pms_purchase_invoice_dtl";
        public string TableAddStockDtl = "pms_stock_batch_expdate";

        public string TableAddSaleMst = "pms_sale_invoice_mst";
        public string TableAddSaleDtl = "pms_sale_invoice_dtl";

        public string TableAddDebitCreditMst = "pms_voucher_dr_cr_note_mst";
        public string TableAddDebitCreditDtl = "pms_voucher_dr_cr_note_dtl";

        public string TableAddJournalEntryMst = "pms_journal_entry_mst";
        public string TableAddJournalEntryDtl = "pms_journal_entry_dtl";

        public string master_settings_table = "pms_master_settings";
        public string master_settings_series_table = "pms_master_setting_all_prefix_series_number";

        public string expenses_voucher_mst = "pms_expenses_voucher_mst";
        public string expenses_voucher_dtl = "pms_expenses_voucher_dtl";
        public string expenses_voucher_product_name = "pms_expenses_product_name";

        public string news_and_update_table = "pms_news_and_update";
                     
        public string gstin_report_one = "1. Invoice number can contain only 0-9,A-Z , ‘/’ and ‘-‘ . No space between two digits. Maximum 16 digits.	";

        public Dictionary<string, string> RedirectURLS = new Dictionary<string, string> {
            {"purchase","~/Vouchers/Purchaseinvoice.aspx"},
            {"purchaseDetails","~/Vouchers/PurchaseDetails.aspx"},
            {"sales","~/Vouchers/SaleInvoice.aspx"}, 
            {"salesDetails","~/Vouchers/SaleDetails.aspx"},
            {"debit","~/Vouchers/DebitNote.aspx"},
            {"debitDetails","~/Vouchers/DebitDetails.aspx"},
            {"credit","~/Vouchers/CreditNote.aspx"},
            {"creditDetails","~/Vouchers/CreditDetails.aspx"},
            {"SaleReturn","~/Vouchers/SaleReturn.aspx"},
            {"PurchaseReturn","~/Vouchers/PurchaseReturn.aspx"},
            {"expenses","~/Vouchers/ExpensesVoucher.aspx"},
            {"expensesDetails","~/Vouchers/ExpensesDetails.aspx"},
            {"journalVouchers","~/Vouchers/JournalEntry.aspx"}
        };
        public string Table_SQL = "";
    }

}