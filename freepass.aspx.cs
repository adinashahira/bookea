using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class freepass : System.Web.UI.Page
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    string borrower;
    string bookName;
    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        borrower = GridView1.Rows[index].Cells[0].Text.ToString();
        bookName = GridView1.Rows[index].Cells[1].Text.ToString();
        if (e.CommandName == "verifyreturn")
        {
            SqlCommand status = new SqlCommand("DELETE from freepass WHERE borrower = '" + borrower + "' AND bookName='" + bookName + "'", con);
            status.ExecuteNonQuery();
            GridView1.DataBind();
        }


    }
}