using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Public : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login1_LoggedIn(object sender, EventArgs e)

        {
            TextBox txtb = (TextBox)Login1.FindControl("UserName");
            if (Roles.IsUserInRole(txtb.Text, "user"))
            {
                Response.Redirect("Protected/BooksUser.aspx");
            }
            else if (Roles.IsUserInRole(txtb.Text, "admin"))
            {
                Response.Redirect("AdminProtected/BooksAdmin.aspx");
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string userRole = "user";

            if (!Roles.IsUserInRole(CreateUserWizard1.UserName, userRole))
            {
                Roles.AddUserToRole(CreateUserWizard1.UserName, userRole);
            }
            Response.Redirect("Protected/Books.aspx");
        }
    }
}