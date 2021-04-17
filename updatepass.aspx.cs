using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class updatepass : System.Web.UI.Page
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
        txtUser.Text = Session["username"].ToString();
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (checkpass())
        {
            cmd.CommandText = "update tbluserinfo set userPassword='" + txtNPass.Text + "' where userName='" + txtUser.Text + "'";
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script language='javascript'>window.alert('Password change succeeds');window.location='home.aspx';</script>");
        }

        else
        {
            Literal txtMsg = new Literal();
            txtMsg.Text = "<script>alert('Your old password does not match our record')</script>";
            Page.Controls.Add(txtMsg);
        }
    }

    protected void btnDelAcc_Click(object sender, EventArgs e)
    {
        if (checkpass())
        {
            cmd.CommandText = "delete from tbluserinfo where userName ='" + txtUser.Text + "'";
            cmd.ExecuteNonQuery();
            Response.Write("<script language='javascript'>window.alert('This account will be deleted and this action cannot be undone');window.location='Default.aspx';</script>");
        }
        else
        {
            Literal txtMsg = new Literal();
            txtMsg.Text = "<script>alert('Your old password does not match our record')</script>";
            Page.Controls.Add(txtMsg);
        }
    }

    private bool checkpass()
    {
        bool check = false;
        if (txtOPass.Text == Session["password"].ToString())
        {
            check = true;
        }
        return check;
    }
}