using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    GridView1.DataSource = TransLogic.ListAllBook();
            //    GridView1.DataBind();
            //}
            if (!IsPostBack)
            {
                GridBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = TransLogic.Searched(TextBox1.Text);
            GridView1.DataBind();
        }
        private void GridBind()
        {
            GridView1.DataSource = TransLogic.ListAllBook();
            GridView1.DataBind();
        }
    }
}