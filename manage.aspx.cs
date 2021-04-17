using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class manage : System.Web.UI.Page
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
        GridView1.Visible = true;
        GridView2.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchquery = "select bookCover, bookName, genreName, bookAuthor, bookDate, bookCount, bookBorrowed ";
        searchquery += "from tblBooks ";
        searchquery += "where bookName like '%" + txtSearch.Text + "%'";
        searchquery += "OR bookAuthor like '%" + txtSearch.Text + "%'";

        SqlDataAdapter searchadapter = new SqlDataAdapter(searchquery, con); //read data based on command 
        DataSet searchset = new DataSet(); //store read records 
        searchadapter.Fill(searchset, "searchresult"); //"dept" is new name for the current dataset
        GridView2.DataSource = searchset.Tables["searchresult"]; //give values in "dept" onto gridview
        GridView2.DataBind();

        GridView1.Visible = false;
        GridView2.Visible = true;
    }

    protected void btnAll_Click(object sender, EventArgs e)
    {
        GridView2.Visible = false;
        GridView1.Visible = true;
        txtSearch.Text = "";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        string bookName = GridView1.Rows[index].Cells[1].Text.ToString();
        if (e.CommandName == "updatebook")
        {
            Session["bookName"] = bookName;
            Session["stock"] = GridView1.Rows[index].Cells[5].Text.ToString();
            Response.Redirect("updatestock.aspx");
        }

        else if (e.CommandName == "deletebook")
        {
            cmd.CommandText = "delete from tblBooks where bookName ='" + bookName + "'";
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button del = (Button)e.Row.Cells[6].Controls[0];
            del.OnClientClick = "if(!confirm('Do you want to delete this title?')) return;";
        }
    }
}