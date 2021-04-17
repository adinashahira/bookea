using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

public partial class detailslogged : System.Web.UI.Page
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    int limit;
    int count=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
        limit = int.Parse(Session["limit"].ToString());
        count = int.Parse(Session["count"].ToString());
    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }

    protected void btnBorrow_Click(object sender, EventArgs e)
    {
        //if (count < limit)
        //{
            keylog();
            count++;
            Session["count"] = count;
            Response.Write("<script language='javascript'>window.alert('You have successfully added the book to your cart. If you are done, please visit the borrow page to checkout');window.location='cart.aspx';</script>");
        //}
        //else
        //{
        //    Response.Write("<script language='javascript'>window.alert('You have reached the account limit of borrowing books at once. You will be redirected to checkout page');window.location='cart.aspx';</script>");
        //}
    }

    private void keylog()
    {
        string borrower = Session["username"].ToString();
        string bookName = Request.QueryString["bookName"];

        if (!borrowonlyone())
        {
            SqlCommand log = new SqlCommand("insert into tbllogs ([borrower], [bookName]) values (@borrower, @bookName)", con);
            log.Parameters.AddWithValue("@borrower", borrower);
            log.Parameters.AddWithValue("@bookName", bookName);
            log.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            Response.Write("<script language='javascript'>window.alert('The book is already in your cart or borrowed');window.location='cart.aspx';</script>");
        }

        
    }

    private bool borrowonlyone() 
    {
        bool exist = false;

        using (SqlCommand checkexistence = new SqlCommand("SELECT borrower, bookName, returnStatus FROM tbllogs", con))
        {
            using (SqlDataReader reader = checkexistence.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (reader["borrower"].ToString() == Session["username"].ToString() && reader["bookName"].ToString() == Request.QueryString["bookName"])
                    {
                        exist = true;

                        break;
                    }

                }
                return exist;
            }
        }
    }
}