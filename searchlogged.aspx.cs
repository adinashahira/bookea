using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class searchlogged : System.Web.UI.Page
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
        lblKeyword.Text = Request.QueryString["keyword"];
        display();
    }

    private void display()
    {
        string strsql = "select bookCover, bookName, genreName, bookAuthor ";
        strsql += "from tblBooks ";
        strsql += "where bookName like '%" + lblKeyword.Text + "%'";
        strsql += "OR bookAuthor like '%" + lblKeyword.Text + "%'";
        SqlDataAdapter searchadapter = new SqlDataAdapter(strsql, con); //read data based on command 
        DataSet searchset = new DataSet(); //store read records 
        searchadapter.Fill(searchset, "resultbook"); //"dept" is new name for the current dataset
        GridView1.DataSource = searchset.Tables["resultbook"]; //give values in "dept" onto gridview
        GridView1.DataBind();
    }
}