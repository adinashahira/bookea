using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class unlogged : System.Web.UI.MasterPage
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        //define sql command
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
    }

    private bool check() //login check function
    {
        bool test = false;

        using (SqlCommand strsql = new SqlCommand("SELECT userName, userPassword, limit FROM tbluserinfo", con))
        {
            using (SqlDataReader reader = strsql.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (reader["userName"].ToString() == txtUser.Text && reader["userPassword"].ToString() == txtPass.Text)
                    {
                        test = true;
                        Session["limit"] = reader[2].ToString();
                        int count = 0;
                        Session["count"] = count;

                        break;
                    }
                }
                return test;
            }
        }
    }

    private bool checkadmin() //login check function
    {
        bool test = false;
        if (txtUser.Text == "admin" && txtPass.Text == "bookeaadmin123")
        {
            test = true;
        }
        return test;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (check())
        {
            Session["username"] = txtUser.Text;
            Session["password"] = txtPass.Text;
            Response.Redirect("cart.aspx");
        }
        else if (checkadmin())
        {
            Session["username"] = txtUser.Text;
            Response.Redirect("manage.aspx");
        }
        else
        {
            Literal txtMsg = new Literal();
            txtMsg.Text = "<script>alert('Your credentials are incorrect')</script>";
            Page.Controls.Add(txtMsg);
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx? &keyword=" + txtSearch.Text.Trim());
    }
}
