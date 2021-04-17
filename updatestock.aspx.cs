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

public partial class updatestock : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            txtTitle.Text = Session["bookName"].ToString();
            txtTitle.Enabled = false;
            searchlink();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        link();
        Response.Write("<script language='javascript'>window.alert('Update succeed');window.location='manage.aspx';</script>");
    }

    private void searchlink()
    {
        SqlCommand searchforlink = new SqlCommand("SELECT bookName, bookLink FROM tblBooks", con);
        SqlDataReader readdata = searchforlink.ExecuteReader();
        while (readdata.Read())
        {
            if (readdata["bookName"].ToString() == txtTitle.Text)
            {
                Session["booklink"] = readdata[1];
            }
        }

        txtLink.Text = Session["booklink"].ToString();
    }

    private void link()
    {
        string bookCover = "~\\img\\";
        string bookCover2;

        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentType == "image/jpeg")
            {
                bookCover += Path.GetFileName(FileUpload1.FileName);
                bookCover2 = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("img\\" + FileUpload1.FileName));
                SqlCommand repair = new SqlCommand("UPDATE tblBooks SET bookLink='" + txtLink.Text + "', bookCover='" + bookCover + "' WHERE bookName='" + txtTitle.Text + "'", con);
                repair.ExecuteNonQuery();
            }
            else
            {
                Label1.Text = "Image extension must be .jpeg/.jpg";
                Label1.Visible = true;
            }
        }
        else
        {
            SqlCommand repairLink = new SqlCommand("UPDATE tblBooks SET bookLink='" + txtLink.Text + "' WHERE bookName='" + txtTitle.Text + "'", con);
            repairLink.ExecuteNonQuery();
        }
    }
}
