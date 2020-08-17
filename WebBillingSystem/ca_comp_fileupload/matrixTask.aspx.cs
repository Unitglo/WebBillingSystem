using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBillingSystem
{
    public partial class matrixTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int n = 5;

            for (int row = 1; row <= n; ++row)
            {
                for (int col = 1; col <= row; ++col)
                {
                    Response.Write("*");
                }

                Response.Write("<br />");
            }

            for (int i = n; i >= 0; i--)
            {
                for (int j = 1; j <= i; j++)
                    Response.Write("*");
                Response.Write("<br />");
            }
            Response.Write("<br />");


            Response.Write("<br />");
            int[,] arr = { { 0, 2, 3, 4 },
                           { 2, 0, 4, 1 },
                           { 3, 4, 0, 2 },
                           { 4, 1, 2, 0 } };

            Response.Write("Matrix initially:\n");
            Response.Write("<br />");
            print(arr);

            find(arr);
        }

        void print(int[,] arr)
        {
            int i = 0, j = 0;

            for (i = 0; i < 4; i++)
            {
                for (j = 0; j < 4; j++)
                    Response.Write(arr[i, j] + " ");

                Response.Write("<br />");
            }
        }

        // Function to find the diagonal values  
        void find(int[,] arr)
        {
            arr[0, 0] = 10 - (arr[0, 0] + arr[0, 1] + arr[0, 2] + arr[0, 3]);
            arr[1, 1] = 10 - (arr[1, 0] + arr[1, 1] + arr[1, 2] + arr[1, 3]);
            arr[2, 2] = 10 - (arr[2, 0] + arr[2, 1] + arr[2, 2] + arr[2, 3]);
            arr[3, 3] = 10 - (arr[3, 0] + arr[3, 1] + arr[3, 2] + arr[3, 3]);

            // Print the new matrix with diagonals  
            Response.Write("Matrix with diagonals:\n");
            Response.Write("<br />");
            print(arr);
        }
    

        protected void btnPrintClick(object sender, EventArgs e)
        {
            int second_str = 0;
            int first_str = 0;
            string a = txtFirst.Value;
            string b = txtSecond.Value;
            byte[] ascii_first_str = Encoding.ASCII.GetBytes(a);
            byte[] ascii_sec_str = Encoding.ASCII.GetBytes(b);

            for (int i = 0; i < a.Length; i++)
            {
                int id = ascii_first_str[i];
                first_str = first_str + id;

            }
            Response.Write(first_str);
            Response.Write("<br/>"); 
            for (int i = 0; i < b.Length; i++)
            {
                int id = ascii_sec_str[i];
                second_str = second_str + id;

            }

            Response.Write(second_str);
            Response.Write("<br/>");

            if (first_str > second_str)
            {
                Response.Write("First String Win");
                Response.Write("<br/>");
                Response.Write("Second String Looser");
                Response.Write("<br/>");
            }
            if (first_str < second_str)
            {
                Response.Write("First String Looser");
                Response.Write("<br/>");
                Response.Write("Second String Win");
                Response.Write("<br/>");
            }
            if (first_str == second_str)
            {
                Response.Write("Draw");
                Response.Write("<br/>");
            }

        }
       
    }
}