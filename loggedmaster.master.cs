using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loggedmaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string lblcart;
        //lblCart.Text = Session["cartquantity"].ToString();
        //Label lblcartcount = (Label)Master.FindControl("lblCart");
        lblCart.Text = Session["cartquantity"].ToString();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("searchlogged.aspx? &keyword=" + txtSearch.Text.Trim());
    }
}
