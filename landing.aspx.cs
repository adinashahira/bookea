using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class landing : System.Web.UI.Page
{
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    string email, booklink;
    //Uri booklink;
    
    

    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
        Label1.Text = "Be reminded that if you have borrowed the book for more than 7 days, you will not be able to view the reading page";
    }

    protected void btnRead_Click(object sender, EventArgs e)
    {
        using (SqlCommand findfreepass = new SqlCommand("SELECT borroweremail, booklink FROM freepass", con))
        {
            using (SqlDataReader reader = findfreepass.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (reader["borroweremail"].ToString() == txtFreepassEmail.Text)
                    {
                        email = txtFreepassEmail.Text;
                        Session["freepassemail"] = email;
                        booklink = reader[1].ToString();
                        Response.Redirect(booklink);
                        //Label1.Text = booklink;

                        break;
                    }
                    else
                    {
                        //Response.Write("<script language='javascript'>window.alert('This email hasn't borrowed anything on Bookea. Please browse.');window.location='Default.aspx';</script>");
                        Label1.Text = "This email is not associated with any records.";
                    }
                }
            }
        }

    }
}