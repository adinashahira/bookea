using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class ereader_99DaysofRoses : System.Web.UI.Page
{
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime visit = DateTime.Now;

        con.Open();
        using (SqlCommand getborrowdate = new SqlCommand("SELECT borroweremail, borrowdate FROM freepass", con))
        {
            using (SqlDataReader reader = getborrowdate.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (reader["borroweremail"].ToString() == Session["freepassemail"].ToString())
                    {
                        DateTime nowtime = DateTime.Today;
                        DateTime borrowtime = Convert.ToDateTime(reader[1].ToString());

                        TimeSpan timediff = visit - borrowtime;

                        if (timediff.TotalSeconds > 180)
                        {
                            Response.Redirect("http://localhost:50672/Default.aspx");
                        }

                        break;
                    }
                }
            }
        }
    }
}