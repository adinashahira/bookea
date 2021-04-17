using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class browse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblBrowse.Text = Request.QueryString["genreName"];

        GridView3.Visible = false;
        GridView4.Visible = true;
        if (lblBrowse.Text.Length == 0)
        {
            lblBrowse.Text = "Browse all content";
            GridView3.Visible = true;
            GridView4.Visible = false;
        }
    }
}