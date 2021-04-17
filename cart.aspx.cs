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

public partial class cart : System.Web.UI.Page
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    int count, limit;
    DateTime returntime;
    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;

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
        int quantity = GridView2.Rows.Count;
        returntime = DateTime.Today.AddDays(7);
        txtReturn.Text = returntime.ToString();

        Label lblcartcount = (Label)Master.FindControl("lblCart");
        lblcartcount.Text = GridView2.Rows.Count.ToString();
        Session["cartquantity"] = GridView2.Rows.Count.ToString();
    }

    protected void GridView2_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        string borrower = Session["username"].ToString();
        string bookName = GridView2.Rows[index].Cells[1].Text.ToString();
        if (e.CommandName == "removebook")
        {
            cmd.CommandText = "delete from tbllogs where borrower ='" + borrower + "' AND bookName ='" + bookName + "'";
            cmd.ExecuteNonQuery();
            GridView2.DataBind();
            Response.Redirect("cart.aspx");
        }
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        int length = GridView2.Rows.Count;
        int needtoRemove = 0;
        //string borrower = Session["username"].ToString();

        if (length > limit)
        {
            needtoRemove = length - limit;
            Literal txtMsg = new Literal();
            txtMsg.Text = "<script>alert('You have exceeded the borrowing limit. Please remove some books')</script>";
            Page.Controls.Add(txtMsg);
        }

        else
        {
            for (int i = 0; i < length; i++)
            {
                SqlCommand borrowdate = new SqlCommand("update tbllogs set borrowDate= GETDATE(), returnStatus = 'NOT RETURNED', returnDate = '" + returntime + "' where bookName = '" + GridView2.Rows[i].Cells[1].Text + "' AND borrower = '" + Session["username"].ToString() + "'", con);
                borrowdate.ExecuteNonQuery();

                updatebb();
                updatelimit();
                //clearCart();
                Response.Write("<script language='javascript'>window.alert('You have succesfully borrowed books from bookea.com. Enjoy reading');window.location='cart.aspx';</script>");
            }
        }
    }

    private void updatebb()
    {
        int length = GridView2.Rows.Count;
        for (int i = 0; i < length; i++)
        {
            SqlCommand updateborrow = new SqlCommand("UPDATE tblBooks SET bookBorrowed=bookBorrowed+1 WHERE bookName='" + GridView2.Rows[i].Cells[1].Text + "'", con);
            updateborrow.ExecuteNonQuery();
        }
    }

    private void updatelimit()
    {
        int newlimit = limit - GridView2.Rows.Count;
        SqlCommand reduceLimit = new SqlCommand("UPDATE tbluserinfo SET limit='" + newlimit + "' WHERE userName='" + txtName.Text + "'", con);
        reduceLimit.ExecuteNonQuery();
    }

    //private void clearCart()
    //{
    //    SqlCommand clearthis = new SqlCommand("DELETE tblCart where borrower = '" + Session["username"].ToString() + "'");
    //}

}