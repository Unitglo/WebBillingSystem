using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBillingSystem
{
    public partial class ProfitLoss : System.Web.UI.Page
    {
        DataBaseHealpare baseHealpare;
        public System.Collections.ArrayList main_group_arrylist;
        public System.Collections.ArrayList sub_group_arrylist;
        public System.Collections.ArrayList acc_head_arrylist;
        public string json_main_group_obj;
        public string openi_amt_cnt = "0.00";
        public string close_amt_cnt = "0.00";
        public string json_sub_group_obj;
        public string json_acc_head_obj;
        double main_group_cl_bal = 0.00;
        double sub_group_cl_bal = 0.00;
        string main_group_dr_cl_bal = "";
        string main_group_cr_cl_bal = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            baseHealpare = new DataBaseHealpare();

            if (!Page.IsPostBack)
            {
                comp_name_id.InnerHtml = Session["company_name"].ToString();
                from_date_id.InnerHtml = Convert.ToDateTime(Session["start_date"].ToString()).ToString("dd-MM-yyyy");
                to_date_id.InnerHtml = Convert.ToDateTime(Session["end_date"].ToString()).ToString("dd-MM-yyyy");
            }

            //MySqlDataReader reader = baseHealpare.SelectAllValues(baseHealpare.TableAccountMainGroup, " where status != 2");
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT main_group_name, (SELECT COALESCE(sum(account_opening_balance),0.00) FROM pms_account_master WHERE account_master_main_group_id = account_main_group AND account_opening_balance_type = 'Credit') opening_cr_tot, (SELECT COALESCE(sum(account_opening_balance),0.00) FROM pms_account_master WHERE account_master_main_group_id = account_main_group AND account_opening_balance_type = 'Debit') opening_dr_tot FROM pms_account_master right JOIN pms_account_master_main_group ON account_master_main_group_id = account_main_group WHERE pms_account_master.status != 2 GROUP BY main_group_name ORDER BY account_master_main_group_id");
            //MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT pms_account_master_main_group.main_group_name, COALESCE(SUM( if( jv.account_opening_balance_type = 'Credit',jv.account_opening_balance,0.00 )),0.00 ) main_group_cr_open_bal, COALESCE(SUM( if( jv.account_opening_balance_type = 'Debit',jv.account_opening_balance,0.00 )),0.00 ) main_group_dr_open_bal ,sum(jv.dr_tot) main_group_dr_tran_tot,sum(jv.cr_tot) main_group_cr_tran_tot from (SELECT pms_account_master.account_main_group, pms_account_master.account_sub_group,pms_account_master.account_head,pms_account_master.account_opening_balance,pms_account_master.account_opening_balance_type,COALESCE(sum(dr_total),0.00) as dr_tot, COALESCE(sum(cr_total),0.00) as cr_tot from pms_journal_entry_dtl RIGHT join pms_account_master ON pms_journal_entry_dtl.name = pms_account_master.account_head left join pms_journal_entry_mst ON pms_journal_entry_dtl.jv_dtl_id = pms_journal_entry_mst.journal_id and pms_journal_entry_mst.status !=2 group by pms_account_master.account_main_group , pms_account_master.account_sub_group,pms_account_master.account_head ) jv left join pms_account_master_main_group on jv.account_main_group = pms_account_master_main_group.account_master_main_group_id group by jv.account_main_group");
            MySqlDataReader reader = baseHealpare.SelectManualQuery("SELECT pms_account_master_main_group.main_group_name, COALESCE(SUM( if( jv.account_opening_balance_type = 'Credit',jv.account_opening_balance,0.00 )),0.00 ) main_group_cr_open_bal, COALESCE(SUM( if( jv.account_opening_balance_type = 'Debit',jv.account_opening_balance,0.00 )),0.00 ) main_group_dr_open_bal ,sum(jv.dr_tot) main_group_dr_tran_tot,sum(jv.cr_tot) main_group_cr_tran_tot from (SELECT pms_account_master.account_main_group, pms_account_master.account_sub_group,pms_account_master.account_head,pms_account_master.account_opening_balance,pms_account_master.account_opening_balance_type,COALESCE(sum(debit_amount),0.00) as dr_tot, COALESCE(sum(credit_amount),0.00) as cr_tot from pms_journal_entry_dtl RIGHT join pms_account_master ON pms_journal_entry_dtl.name = pms_account_master.account_head left join pms_journal_entry_mst ON pms_journal_entry_dtl.jv_dtl_id = pms_journal_entry_mst.journal_id and pms_journal_entry_mst.status !=2 group by pms_account_master.account_main_group , pms_account_master.account_sub_group,pms_account_master.account_head ) jv left join pms_account_master_main_group on jv.account_main_group = pms_account_master_main_group.account_master_main_group_id group by jv.account_main_group");
            main_group_arrylist = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                string edit_button = "<a class='btn btn-xs btn-warning details-control fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";

                double cr_tot = Convert.ToDouble(reader["main_group_cr_tran_tot"].ToString());
                double dr_tot = Convert.ToDouble(reader["main_group_dr_tran_tot"].ToString());
                string dr_op_bal = Math.Round(Convert.ToDouble(reader["main_group_dr_open_bal"])).ToString("0.00");
                if (dr_op_bal == "0.00")
                {
                    main_group_cl_bal = Convert.ToDouble(reader["main_group_cr_open_bal"]);
                } else //if (""+Convert.ToDouble(reader["main_group_cr_tran_tot"].ToString()) == "0.00")
                {
                    main_group_cl_bal = Convert.ToDouble(reader["main_group_dr_open_bal"]) * -1;
                 }
                //else 
                //{
                //    main_group_cl_bal = 0.00;
                // }
                main_group_cl_bal = (main_group_cl_bal + cr_tot);
                main_group_cl_bal = (main_group_cl_bal - dr_tot);
                //main_group_cl_bal = (main_group_cl_bal + (cr_tot - dr_tot);

                if (main_group_cl_bal < 0)
                {
                    main_group_dr_cl_bal = ""+System.Math.Abs(main_group_cl_bal);
                    main_group_cr_cl_bal = "0.00";
                }
                else
                {
                    main_group_dr_cl_bal = "0.00";
                    main_group_cr_cl_bal = ""+main_group_cl_bal;
                }

                main_group_arrylist.Add(new
                {
                    edit_button_main = edit_button,
                    perticulars_main = reader["main_group_name"],
                    open_Bal_debit_main =  reader["main_group_dr_open_bal"],
                    open_Bal_credit_main = reader["main_group_cr_open_bal"],
                    transaction_debit_main =  reader["main_group_dr_tran_tot"],
                    transaction_credit_main = reader["main_group_cr_tran_tot"],
                    close_Bal_debit_main = main_group_dr_cl_bal,
                    close_Bal_credit_main = main_group_cr_cl_bal
                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_main_group_obj = serializer.Serialize(main_group_arrylist);
            }

              main_group_dr_cl_bal = "";
              main_group_cr_cl_bal = "";
             //reader = baseHealpare.SelectManualQuery("select * from pms_account_master_sub_group left join pms_account_master_main_group on pms_account_master_sub_group.account_master_main_group_id = pms_account_master_main_group.account_master_main_group_id where pms_account_master_sub_group.status != 2");
             //reader = baseHealpare.SelectManualQuery("SELECT main_group_name, account_master_sub_group_name, (SELECT COALESCE(sum(account_opening_balance),0.00) FROM pms_account_master WHERE pms_account_master_sub_group.account_master_main_group_id = account_main_group AND account_sub_group = account_master_sub_group_id AND account_opening_balance_type = 'Credit') sub_group_cr_open_bal, (SELECT COALESCE(sum(account_opening_balance),0.00) FROM pms_account_master WHERE pms_account_master_sub_group.account_master_main_group_id = account_main_group AND account_sub_group = account_master_sub_group_id AND account_opening_balance_type = 'Debit') AS sub_group_dr_open_bal FROM pms_account_master_sub_group RIGHT join pms_account_master_main_group ON pms_account_master_sub_group.account_master_main_group_id = pms_account_master_main_group.account_master_main_group_id AND pms_account_master_main_group.status != 2 WHERE pms_account_master_sub_group.status != 2 GROUP BY main_group_name, account_master_sub_group_name ORDER BY pms_account_master_main_group.account_master_main_group_id");
             //reader = baseHealpare.SelectManualQuery("select COALESCE(sum(sub_group_cr_open_bal),0.00) sub_group_cr_open_bal, COALESCE(sum(sub_group_dr_open_bal),0.00) sub_group_dr_open_bal, COALESCE(sum(heads.dr_tot),0.00) sub_group_dr_tran_tot, COALESCE(sum(heads.cr_tot),0.00) sub_group_cr_tran_tot, pms_account_master_main_group.main_group_name, pms_account_master_sub_group.account_master_sub_group_name sub_group_name from (select jv.account_main_group as account_master_main_group_id, jv.account_sub_group as account_master_sub_group_id  ,jv.account_head, COALESCE( if( jv.account_opening_balance_type = 'Credit',jv.account_opening_balance,0.00 ),0.00 ) sub_group_cr_open_bal, COALESCE( if( jv.account_opening_balance_type = 'Debit',jv.account_opening_balance,0.00 ),0.00 ) sub_group_dr_open_bal ,(jv.dr_tot) as dr_tot,(jv.cr_tot) as cr_tot from (SELECT pms_account_master.account_main_group, pms_account_master.account_sub_group,pms_account_master.account_head,pms_account_master.account_opening_balance,pms_account_master.account_opening_balance_type,COALESCE(sum(dr_total),0.00) as dr_tot, COALESCE(sum(cr_total),0.00) as cr_tot from pms_journal_entry_dtl RIGHT join pms_account_master ON pms_journal_entry_dtl.name = pms_account_master.account_head left join pms_journal_entry_mst ON pms_journal_entry_dtl.jv_dtl_id = pms_journal_entry_mst.journal_id and pms_journal_entry_mst.status !=2 group by pms_account_master.account_main_group , pms_account_master.account_sub_group,pms_account_master.account_head ) jv GROUP by jv.account_main_group, jv.account_sub_group,jv.account_head)heads right join pms_account_master_sub_group on pms_account_master_sub_group.account_master_main_group_id = heads.account_master_main_group_id and pms_account_master_sub_group.account_master_sub_group_id = heads.account_master_sub_group_id left join pms_account_master_main_group on pms_account_master_sub_group.account_master_main_group_id = pms_account_master_main_group.account_master_main_group_id group by pms_account_master_sub_group.account_master_sub_group_id,pms_account_master_sub_group.account_master_main_group_id");
             reader = baseHealpare.SelectManualQuery("select COALESCE(sum(sub_group_cr_open_bal),0.00) sub_group_cr_open_bal, COALESCE(sum(sub_group_dr_open_bal),0.00) sub_group_dr_open_bal, COALESCE(sum(heads.dr_tot),0.00) sub_group_dr_tran_tot, COALESCE(sum(heads.cr_tot),0.00) sub_group_cr_tran_tot, pms_account_master_main_group.main_group_name, pms_account_master_sub_group.account_master_sub_group_name sub_group_name from (select jv.account_main_group as account_master_main_group_id, jv.account_sub_group as account_master_sub_group_id  ,jv.account_head, COALESCE( if( jv.account_opening_balance_type = 'Credit',jv.account_opening_balance,0.00 ),0.00 ) sub_group_cr_open_bal, COALESCE( if( jv.account_opening_balance_type = 'Debit',jv.account_opening_balance,0.00 ),0.00 ) sub_group_dr_open_bal ,(jv.dr_tot) as dr_tot,(jv.cr_tot) as cr_tot from (SELECT pms_account_master.account_main_group, pms_account_master.account_sub_group,pms_account_master.account_head,pms_account_master.account_opening_balance,pms_account_master.account_opening_balance_type, COALESCE(sum(debit_amount),0.00) as dr_tot, COALESCE(sum(credit_amount),0.00) as cr_tot from pms_journal_entry_dtl RIGHT join pms_account_master ON pms_journal_entry_dtl.name = pms_account_master.account_head left join pms_journal_entry_mst ON pms_journal_entry_dtl.jv_dtl_id = pms_journal_entry_mst.journal_id and pms_journal_entry_mst.status !=2 group by pms_account_master.account_main_group , pms_account_master.account_sub_group,pms_account_master.account_head ) jv GROUP by jv.account_main_group, jv.account_sub_group,jv.account_head)heads right join pms_account_master_sub_group on pms_account_master_sub_group.account_master_main_group_id = heads.account_master_main_group_id and pms_account_master_sub_group.account_master_sub_group_id = heads.account_master_sub_group_id left join pms_account_master_main_group on pms_account_master_sub_group.account_master_main_group_id = pms_account_master_main_group.account_master_main_group_id group by pms_account_master_sub_group.account_master_sub_group_id,pms_account_master_sub_group.account_master_main_group_id");
             sub_group_arrylist = new System.Collections.ArrayList();

            while (reader != null && reader.Read())
            {
                string edit_button = "<a sub_group_name='" + reader["sub_group_name"] + "' onclick='accntHead_details(this)' class='btn btn-xs btn-warning details-control-subGroup fa fa-angle-right' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";

                double cr_tot = Convert.ToDouble(reader["sub_group_cr_tran_tot"].ToString());
                double dr_tot = Convert.ToDouble(reader["sub_group_dr_tran_tot"].ToString());

                if (Math.Round(Convert.ToDouble(reader["sub_group_dr_open_bal"])).ToString("0.00") == "0.00")
                {
                    sub_group_cl_bal = Convert.ToDouble(reader["sub_group_cr_open_bal"]);
                }
                else //if (""+Convert.ToDouble(reader["main_group_cr_tran_tot"].ToString()) == "0.00")
                {
                    sub_group_cl_bal = Convert.ToDouble(reader["sub_group_dr_open_bal"]) * -1;
                }
                
                sub_group_cl_bal = (sub_group_cl_bal + cr_tot);
                sub_group_cl_bal = (sub_group_cl_bal - dr_tot);
                //sub_group_cl_bal = (sub_group_cl_bal + (cr_tot - dr_tot));

                if (sub_group_cl_bal < 0)
                {
                    main_group_dr_cl_bal = ""+System.Math.Abs(sub_group_cl_bal);
                    main_group_cr_cl_bal = "0.00";
                }
                else
                {
                    main_group_dr_cl_bal = "0.00";
                    main_group_cr_cl_bal = ""+sub_group_cl_bal;
                }

                sub_group_arrylist.Add(new
                {
                    edit_button_sub = edit_button,
                    main_group_name_sub = reader["main_group_name"],
                    perticulars_sub = reader["sub_group_name"],                    
                    open_Bal_debit_sub = reader["sub_group_dr_open_bal"],
                    open_Bal_credit_sub = reader["sub_group_cr_open_bal"],
                    transaction_debit_sub =  reader["sub_group_dr_tran_tot"],
                    transaction_credit_sub = reader["sub_group_cr_tran_tot"],
                    close_Bal_debit_sub = main_group_dr_cl_bal,
                    close_Bal_credit_sub = main_group_cr_cl_bal

                });
            }
            if (reader != null)
            {
                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_sub_group_obj = serializer.Serialize(sub_group_arrylist);
            }

            main_group_dr_cl_bal = "";
            main_group_cr_cl_bal = "";
            reader = baseHealpare.SelectManualQuery("select pms_account_master_main_group.main_group_name ,pms_account_master_sub_group.account_master_sub_group_name sub_group_name, jv.account_head, COALESCE( if( jv.account_opening_balance_type = 'Credit',jv.account_opening_balance,0.00 ),0.00 ) acc_head_cr_open_bal, COALESCE( if( jv.account_opening_balance_type = 'Debit',jv.account_opening_balance,0.00 ),0.00 ) acc_head_dr_open_bal, jv.sub_group_dr_tran_tot, jv.sub_group_cr_tran_tot from (SELECT pms_account_master.account_main_group, pms_account_master.account_sub_group,pms_account_master.account_head,pms_account_master.account_opening_balance,pms_account_master.account_opening_balance_type, COALESCE(sum(dr_total),0.00) as sub_group_dr_tran, COALESCE(sum(cr_total),0.00) as sub_group_cr_tran, COALESCE(sum(debit_amount),0.00) as sub_group_dr_tran_tot, COALESCE(sum(credit_amount),0.00) as sub_group_cr_tran_tot from pms_journal_entry_dtl RIGHT join pms_account_master ON pms_journal_entry_dtl.name = pms_account_master.account_head left join pms_journal_entry_mst ON pms_journal_entry_dtl.jv_dtl_id = pms_journal_entry_mst.journal_id and pms_journal_entry_mst.status !=2 group by pms_account_master.account_main_group , pms_account_master.account_sub_group,pms_account_master.account_head ) jv left join pms_account_master_main_group on jv.account_main_group = pms_account_master_main_group.account_master_main_group_id left join pms_account_master_sub_group on pms_account_master_sub_group.account_master_main_group_id = jv.account_main_group and jv.account_sub_group = pms_account_master_sub_group.account_master_sub_group_id GROUP by jv.account_main_group, jv.account_sub_group,jv.account_head order by jv.account_sub_group");

            acc_head_arrylist = new System.Collections.ArrayList();
            while (reader != null && reader.Read())
            {
                string edit_button = "<a href='/Reports/AccountLedger.aspx?value="+ baseHealpare.EncodeUrl(this, "" + reader["account_head"]) + "' class='btn btn-xs btn-light details-control-accHead fa fa-share' data-toggle='tooltip-dark' data-placement='top' title='Expand'></>";


                double cr_tot = Convert.ToDouble(reader["sub_group_cr_tran_tot"].ToString());
                double dr_tot = Convert.ToDouble(reader["sub_group_dr_tran_tot"].ToString());

                if (Math.Round(Convert.ToDouble(reader["acc_head_dr_open_bal"])).ToString("0.00") == "0.00")
                {
                    sub_group_cl_bal = Convert.ToDouble(reader["acc_head_cr_open_bal"]);
                }
                else //if (""+Convert.ToDouble(reader["main_group_cr_tran_tot"].ToString()) == "0.00")
                {
                    sub_group_cl_bal = Convert.ToDouble(reader["acc_head_dr_open_bal"]) * -1;
                }

                sub_group_cl_bal = (sub_group_cl_bal + (cr_tot - dr_tot));

                if (sub_group_cl_bal < 0)
                {
                    main_group_dr_cl_bal = ""+System.Math.Abs(sub_group_cl_bal);
                    main_group_cr_cl_bal = "0.00";
                }
                else
                {
                    main_group_dr_cl_bal = "0.00";
                    main_group_cr_cl_bal = ""+sub_group_cl_bal;
                }

                acc_head_arrylist.Add(new
                {
                    edit_button_acc = edit_button,
                    sub_group_name_acc = reader["sub_group_name"],
                    perticulars_acc = reader["account_head"],
                    open_Bal_debit_acc =  reader["acc_head_dr_open_bal"],
                    open_Bal_credit_acc = reader["acc_head_cr_open_bal"],
                    transaction_debit_acc =  reader["sub_group_dr_tran_tot"],
                    transaction_credit_acc = reader["sub_group_cr_tran_tot"],
                    close_Bal_debit_acc = main_group_dr_cl_bal,
                    close_Bal_credit_acc = main_group_cr_cl_bal

                });
            }
            if(reader != null)
            {

                reader.Close();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                json_acc_head_obj = serializer.Serialize(acc_head_arrylist);
            }
            reader = baseHealpare.SelectManualQuery("SELECT sum(stock_opening_amt) openi_amt_cnt,sum(valuation_close_amt) close_amt_cnt  FROM pms_stock WHERE status = 0");
            while (reader != null && reader.Read())
            {
                openi_amt_cnt = reader["openi_amt_cnt"].ToString();
                close_amt_cnt = reader["close_amt_cnt"].ToString();
            }
            if (reader != null)
            {
                reader.Close();
            }
        }
    }
}