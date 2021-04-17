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

public partial class upload : System.Web.UI.Page
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

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string bookName = txtTitle.Text.Trim();
        string bookContent = txtSyn.Text.Trim();
        string genreName = DropDownList1.Text;
        DateTime bookDate = DateTime.Today;
        string bookCover = "~\\img\\";
        int bookBorrowed = 0;
        string bookAuthor = txtAuthor.Text;
        string bookLink = txtLink.Text;
        string bookCover2;

        if(RadioButton1.Checked)
        {
            genreName = txtNewGenre.Text.Trim();
            string addgenre = "INSERT INTO tblGenre (genreName) VALUES ('" + genreName + "')";
            cmd.CommandText = addgenre;
            cmd.ExecuteNonQuery();
        }
        else
        {
            genreName = DropDownList1.Text;
        }

        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentType == "image/jpeg")
            {
                bookCover += Path.GetFileName(FileUpload1.FileName);
                bookCover2 = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("img\\" + FileUpload1.FileName));
                string strsql = "INSERT INTO tblBooks ([bookName], [bookContent], [genreName], [bookDate], [bookCover], [bookBorrowed], [bookAuthor], [bookLink]) ";
                strsql += "Values ('" + bookName + "','" + bookContent + "','" + genreName + "','" + bookDate + "','" + bookCover + "','" + bookBorrowed + "','" + bookAuthor + "','" + bookLink + "')";
                cmd.CommandText = strsql;
                cmd.ExecuteNonQuery();
                Response.Write("<script language='javascript'>window.alert('Book uploaded');window.location='manage.aspx';</script>");
            }
            else
            {
                Label2.Text = "Image extension must be .jpeg/.jpg";
                Label2.Visible = true;
            }
        }
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton1.Checked)
        {
            txtNewGenre.Enabled = true;
        }
    }
}