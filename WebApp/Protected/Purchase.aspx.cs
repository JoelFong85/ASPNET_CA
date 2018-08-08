using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Protected
{
    public partial class Purchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> allTitles = new List<string>();
            ListItem[] titles = (ListItem[])Session["buyTitles"];

            List<Int32> allQty = new List<Int32>();
            ListItem[] quan = (ListItem[])Session["buyQty"];

            List<double> amount = new List<double>();
            double cost = 0.0;

            for (int idx = 0; idx < quan.Length; idx++)
            {
                string titleStr = titles[idx].ToString();
                allTitles.Add(titleStr);
                int quantity = Int32.Parse(quan[idx].ToString());
                allQty.Add(quantity);
                Mybooks b = new Mybooks();
                Book resultedBook = b.Books.Where(a => a.Title == titleStr).FirstOrDefault();
                double price = Decimal.ToDouble(resultedBook.Price);
                double amt = price * quantity;
                cost += amt;
                amount.Add(amt);
            }
            GridView1.DataSource = allTitles;
            GridView1.DataBind();

            GridView2.DataSource = allQty;
            GridView2.DataBind();

            GridView3.DataSource = amount;
            GridView3.DataBind();

            Label1.Text = "Total Cost is $" + cost;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListItem[] titles = (ListItem[])Session["buyTitles"];
            ListItem[] quan = (ListItem[])Session["buyQty"];
            for (int i = 0; i < titles.Length; i++)
            {
                string title = titles[i].Text;
                string qty = quan[i].Text;
                Mybooks b = new Mybooks();
                Book book = b.Books.Where(x => x.Title == title).First();
                int buyAmount = Convert.ToInt32(qty);
                book.Stock = book.Stock - buyAmount;
                b.SaveChanges();
            }
            Response.Redirect("BooksUser.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("BooksUser.aspx");
        }
    }
}