using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

public partial class details : System.Web.UI.Page
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }

    protected void btnBorrow_Click(object sender, EventArgs e)
    {
        string bookname = Request.QueryString["bookName"];
        Session["confirmborrow"] = bookname;
        Response.Write("<script language='javascript'>window.alert('Book added to cart. You will be redirected to checkout page');window.location='borrow.aspx';</script>");
        getBookLink();
    }

    private void getBookLink()
    {
        string bookname = Session["confirmborrow"].ToString();
        SqlCommand fetchlink = new SqlCommand("SELECT bookLink, bookName FROM tblBooks", con);
        var fecthbook = fetchlink.ExecuteReader();
        while (fecthbook.Read())
        {
            if (fecthbook["bookName"].ToString() == bookname)
            {
                Session["booklink"] = fecthbook["bookLink"].ToString();
            }
        }
        con.Close();
    }
}