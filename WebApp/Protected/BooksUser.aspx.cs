using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Protected
{
    public partial class BooksUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTable();
            }
        }

        protected void GridView_Purchase_BookList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "AddToCart")
                {
                    string[] hdnValues = Request.Params["num"].ToString().Split(',');
                    Mybooks b = new Mybooks();
                    string title = b.Books.SingleOrDefault(a => a.BookID == id).Title;
                    int stock = b.Books.SingleOrDefault(a => a.BookID == id).Stock;

                    ListBox_Cart_Title.Visible = true;

                    if (!ListBox_Cart_Title.Items.Contains(new ListItem(title)))
                    {
                        if (Int32.Parse(hdnValues[id - 1]) > stock)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Sorry for out of Stock!" + "');", true);
                        }
                        else if (Int32.Parse(hdnValues[id - 1]) != 0)
                        {
                            ListBox_Cart_Title.Items.Add(new ListItem(title));
                            ListBox_Cart_Qty.Items.Add(new ListItem(hdnValues[id - 1]));
                        }
                    }
                    else
                    {
                        int idx = ListBox_Cart_Title.Items.IndexOf(ListBox_Cart_Title.Items.FindByValue(title));
                        string quanStr = ListBox_Cart_Qty.Items[idx].ToString();
                        int oldCout = Int32.Parse(quanStr);
                        int newCount = Int32.Parse(hdnValues[id - 1]);
                        int res = oldCout + newCount;
                        if (res > stock)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Sorry for out of Stock!" + "');", true);
                        }
                        else if (res != 0)
                        {
                            ListBox_Cart_Qty.Items.RemoveAt(idx);
                            ListBox_Cart_Qty.Items.Insert(idx, res.ToString());
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        protected void btn_Checkout_Click(object sender, EventArgs e)
        {
            if (ListBox_Cart_Title.Items.Count < 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please add items to cart!" + "');", true);
            }
            else
            {
                ListItem[] x = new ListItem[ListBox_Cart_Title.Items.Count];
                ListBox_Cart_Title.Items.CopyTo(x, 0);
                Session["buyTitles"] = x;

                ListItem[] y = new ListItem[ListBox_Cart_Qty.Items.Count];
                ListBox_Cart_Qty.Items.CopyTo(y, 0);
                Session["buyQty"] = y;
                Response.Redirect("Purchase.aspx");
            }
        }

        protected void btn_Checkout_Remove_Click(object sender, EventArgs e)
        {
            if (ListBox_Cart_Title.SelectedItem == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please select one item!" + "');", true);
            }
            else
            {
                ListBox_Cart_Qty.Items.RemoveAt(ListBox_Cart_Title.SelectedIndex);
                ListBox_Cart_Title.Items.RemoveAt(ListBox_Cart_Title.SelectedIndex);
            }
        }

        protected void btn_Checkout_Clear_Click(object sender, EventArgs e)
        {
            ListBox_Cart_Title.Items.Clear();
            ListBox_Cart_Qty.Items.Clear();
        }

        protected void LoadTable()
        {
            using (Mybooks b = new Mybooks())
            {
                GridView_Purchase_BookList.DataSource = b.Books.ToList<Book>();
                GridView_Purchase_BookList.DataBind();
            }
            ListBox_Cart_Title.Items.Clear();
            ListBox_Cart_Qty.Items.Clear();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView_Purchase_BookList.DataSource = TransLogic.Searched(TextBox1.Text);
            GridView_Purchase_BookList.DataBind();
        }
    }
}
