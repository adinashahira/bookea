using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class userhistory : System.Web.UI.Page
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    int count, limit, resetLimit;
    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
        count = int.Parse(Session["count"].ToString());

        txtName.Text = Session["username"].ToString();

        using (SqlCommand checklimit = new SqlCommand("SELECT userName, limit FROM tblUserInfo", con))
        {
            using (SqlDataReader readerchecklimit = checklimit.ExecuteReader())
            {
                while (readerchecklimit.Read())
                {
                    if (readerchecklimit["userName"].ToString() == txtName.Text.Trim())
                    {
                        txtLimit.Text = readerchecklimit[1].ToString();
                    }
                }
            }
        }

        Session["limit"] = txtLimit.Text;
        limit = Convert.ToInt16(txtLimit.Text);
        resetLimit = Convert.ToInt16(txtLimit.Text);

        if ((Convert.ToInt16(Session["cartquantity"].ToString())) < 1)
        {
            if (GridView3.Rows.Count == 0)
            {
                txtLimit.Text = resetLimit.ToString();
                SqlCommand resetaccount = new SqlCommand("delete tbllogs where borrower = '" + Session["username"].ToString() + "'", con);
                resetaccount.ExecuteNonQuery();
            }
        }
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        string borrower = Session["username"].ToString();
        string bookName = GridView3.Rows[index].Cells[1].Text.ToString();
        if (e.CommandName == "returnbook")
        {

            //cmd.CommandText = "update tbllogs set returnDate = getdate(), returnStatus='RETURNED' where borrower ='" + borrower + "' AND bookName ='" + bookName + "'";
            cmd.CommandText = "delete tbllogs where borrower ='" + borrower + "' AND bookName ='" + bookName + "'";
            cmd.ExecuteNonQuery();
            GridView3.DataBind();
            count = count - 1;
            Session["count"] = count;
            updatelimit();
            Response.Redirect("userhistory.aspx");
        }

    }

    protected void GridView3_DataBound(object sender, EventArgs e)
    {
        
    }

    private void updatelimit()
    {
        int newlimit = limit + 1;
        if (newlimit == 0 || newlimit < 0)
        {
            newlimit = resetLimit;
        }
        SqlCommand reduceLimit = new SqlCommand("UPDATE tbluserinfo SET limit='" + newlimit + "' WHERE userName='" + txtName.Text + "'", con);
        reduceLimit.ExecuteNonQuery();
    }
}