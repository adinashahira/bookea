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
using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.Net.Mail;
using System.Net;

public partial class borrow : System.Web.UI.Page
{
    //establish connection
    static string constr = "Data source = ADGWORKSTATION\\SQLEXPRESS; Initial Catalog = bookea1; Integrated Security = True; MultipleActiveResultSets=true";
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = new SqlCommand();
    string randomNumber;
    string bookurl;

    Guid g = Guid.NewGuid();


    protected void Page_Load(object sender, EventArgs e)
    {
        cmd.Connection = con;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 15;
        txtReturn.Text = DateTime.Today.AddDays(7).ToString();

        using (SqlCommand strsql = new SqlCommand("SELECT bookName, bookLink FROM tblBooks", con))
        {
            using (SqlDataReader reader = strsql.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (reader["bookName"].ToString() == Session["confirmborrow"].ToString())
                    {
                        bookurl=reader[1].ToString();

                        break;
                    }
                }
            }
        }
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        string Name = txtName.Text.Trim();
        string Email = txtEmail.Text.Trim();
        string Phone = txtPhone.Text.Trim();
        string book = Session["confirmborrow"].ToString();
        string bdate = DateTime.Now.ToString();
        string blink = bookurl;

        if (checkOTP())
        {
            if (!checkfreepass())
            {
                con.Open();
                SqlCommand strfreeborrow = new SqlCommand("insert into freepass ([borrower], [bookName], [borroweremail], [borrowdate], [booklink]) values (@borrower, @book, @email, @bdate, @blink)", con);
                strfreeborrow.Parameters.AddWithValue("@borrower", Name);
                strfreeborrow.Parameters.AddWithValue("@book", book);
                strfreeborrow.Parameters.AddWithValue("@email", Email);
                strfreeborrow.Parameters.AddWithValue("@bdate", bdate);
                strfreeborrow.Parameters.AddWithValue("@blink", blink);

                strfreeborrow.ExecuteNonQuery();

                updatebb();
                sendMail();

                Response.Write("<script language='javascript'>window.alert('You have successfully borrowed the book. You can access the book via link sent to your email. You will be redirected to home');window.location='Default.aspx';</script>");
                con.Close();
            }
            else
            {
                Response.Write("<script language='javascript'>window.alert('Your limit for borrowing books has reached. You will be redirected to home. To borrow more books, please create an account');window.location='Default.aspx';</script>");
                con.Close();
            }
        }
        else
        {
            lblOtpInv.Text = "OTP is invalid";
            lblOtpInv.Visible = true;
        }

    }

    private void updatebb()
    {
        string book = Session["confirmborrow"].ToString();
        SqlCommand updateborrow = new SqlCommand("UPDATE tblBooks SET bookBorrowed=bookBorrowed+1 WHERE bookName='" + book + "'", con);
        updateborrow.ExecuteNonQuery();
    }

    private bool checkfreepass()
    {
        string Email = txtEmail.Text.Trim();
        bool test = false;
        SqlCommand checker = new SqlCommand("SELECT borroweremail, borrowdate FROM freepass", con);
        var checkname = checker.ExecuteReader();
        while (checkname.Read())
        {
            if (checkname["borroweremail"].ToString() == Email)
            {
                DateTime current = DateTime.Now;
                DateTime borrowdate = Convert.ToDateTime(checkname[1].ToString());
                TimeSpan timediff = current - borrowdate;

                if (checkname[0].ToString() == Email && timediff.TotalSeconds > 1800)
                {
                    SqlCommand releasefreepass = new SqlCommand("delete freepass where borroweremail = '" + Email + "'", con);
                    releasefreepass.ExecuteNonQuery();
                    test = false;
                    break;
                }
                else
                {
                    test = true;
                    break;
                }
                
            }
        }
        checkname.Close();
        con.Close();
        return test;
    }


    protected void btnOTP_Click(object sender, EventArgs e)
    {
        Random OTP = new Random();
        int otpnum;
        otpnum=OTP.Next(10000, 99999);

        
        Session["otp"] = otpnum.ToString();

        //Send OTP email
        System.Net.Mail.MailMessage otpmessage = new System.Net.Mail.MailMessage();
        otpmessage.Body = "Your OTP is " +otpnum.ToString();
        otpmessage.From = new System.Net.Mail.MailAddress("bookeabyadina@gmail.com");
        otpmessage.To.Add(txtEmail.Text);
        otpmessage.Subject = "Email verification";
        otpmessage.IsBodyHtml = true;
        System.Net.Mail.SmtpClient smt = new System.Net.Mail.SmtpClient();
        smt.UseDefaultCredentials = true;

        smt.Credentials = new System.Net.NetworkCredential("bookeabyadina@gmail.com", "bookeaFYP2020");
        smt.Host = "smtp.gmail.com";
        smt.Port = 587;
        smt.EnableSsl = true;

        smt.Send(otpmessage);
        lblOTPSent.Text = "OTP has been sent to your email";
        lblOTPSent.Visible = true;

    }

    private void sendMail()
    {
        DateTime confirm = DateTime.Today;

        string sTime = DateTime.Now.AddMinutes(2).ToString("dd MMM yyyy") + " " + DateTime.Now.ToShortTimeString() + " +0100";
        string bookslink = Session["bookLink"].ToString();
        string templink = bookslink + "?time= " + confirm;
        System.Net.Mail.MailMessage mailmessage = new System.Net.Mail.MailMessage();
        mailmessage.Body = "Hi there, thanks for choosing Bookea. Here is your <a href='http://localhost:50672/landing.aspx'>book link</a>";
        mailmessage.From = new System.Net.Mail.MailAddress("bookeabyadina@gmail.com");
        mailmessage.To.Add(txtEmail.Text);
        mailmessage.Subject = "Your book link";
        mailmessage.Headers.Add("expiry-date", sTime);
        mailmessage.IsBodyHtml = true;
        System.Net.Mail.SmtpClient smt = new System.Net.Mail.SmtpClient();
        smt.UseDefaultCredentials = true;

        smt.Credentials = new System.Net.NetworkCredential("bookeabyadina@gmail.com", "bookeaFYP2020");
        smt.Host = "smtp.gmail.com";
        smt.Port = 587;
        smt.EnableSsl = true;

        smt.Send(mailmessage);
    } 

    private bool checkOTP()
    {
        bool isOtp = false;

        if (Session["otp"].ToString() == txtPhone.Text)
        {
            isOtp = true;
        }
        else
        {
            isOtp = false;
        }

        return isOtp;
    }

    //private void searchlink()
    //{
    //    using (SqlCommand strsql = new SqlCommand("SELECT bookName, bookLink FROM tbluserinfo", con))
    //    {
    //        using (SqlDataReader reader = strsql.ExecuteReader())
    //        {
    //            while (reader.Read())
    //            {
    //                if (reader["userName"].ToString() == txtUser.Text && reader["userPassword"].ToString() == txtPass.Text)
    //                {
    //                    test = true;
    //                    Session["limit"] = reader[2].ToString();
    //                    int count = 0;
    //                    Session["count"] = count;

    //                    break;
    //                }
    //            }
    //        }
    //    }
    //}
}