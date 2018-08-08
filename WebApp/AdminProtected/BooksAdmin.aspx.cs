using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.AdminProtected
{
    public partial class BooksAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridBind();
            }
        }
        private void GridBind()
        {
            GridView1.DataSource = TransLogic.ListAllBook();
            GridView1.DataBind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            int stock = Convert.ToInt32((row.FindControl("TextBox1") as TextBox).Text);
            decimal price = Convert.ToDecimal((row.FindControl("TextBox2") as TextBox).Text);
            TransLogic.UpdateBook(bookId, stock, price);
            GridView1.EditIndex = -1;
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            TransLogic.DeleteBook(bookId);
            GridView1.EditIndex = -1;
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = TransLogic.Searched(TextBox3.Text);
            GridView1.DataBind();
        }
    }
}