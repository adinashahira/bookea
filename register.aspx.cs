using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

public partial class register : System.Web.UI.Page
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

    protected void btnReg_Click(object sender, EventArgs e)
    {
        string Name = txtName.Text.Trim();
        string userName = txtUser.Text.Trim();
        string email = txtEmail.Text.Trim();
        string pass = txtPass.Text.Trim();
        string acctype = "";
        int limit = 0;

        //account type
        if (DropDownList1.Text == "Educator/Researcher" || DropDownList1.Text == "Entrepreneur" || DropDownList1.Text == "Officer")
        {
            acctype = "Full Access";
            limit = 5;
        }
        else
        {
            acctype = "Basic";
            limit = 3;
        }


        string strSql = "Insert into tbluserinfo ([userRealName], [userName], [userEmail], [userPassword], [userType], [limit]) ";
        strSql += "Values('" + Name + "','" + userName + "','" + email + "','" + pass + "','" + acctype + "','" + limit + "')";

        cmd.CommandText = strSql;

        try
        {
            cmd.ExecuteNonQuery();
            Session["username"] = txtUser.Text;
            Session["password"] = txtPass.Text;
            Response.Redirect("home.aspx");
        }

        catch
        {
            Literal txtMsg = new Literal();
            txtMsg.Text = "<script>alert('Your registration does not succeed. Please try again')</script>";
            Page.Controls.Add(txtMsg);
        }

        finally
        {
            con.Close();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx? &keyword=" + txtSearch.Text.Trim());
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}