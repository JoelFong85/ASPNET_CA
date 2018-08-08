using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class TransLogic
    {
        public static List<Book> ListAllBook()
        {
            using (Mybooks model = new Mybooks())
            {
                return model.Books.ToList<Book>();
            }
        }

        public static void UpdateBook(int bookID, int Stock, decimal Price)
        {
            using (Mybooks model = new Mybooks())
            {
                Book ToUpdate = model.Books.Where(a => a.BookID == bookID).First();
                ToUpdate.Stock = Stock;
                ToUpdate.Price = Price;
                model.SaveChanges();
            }
        }
        public static void DeleteBook(int bookID)
        {
            using (Mybooks model = new Mybooks())
            {
                Book ToDelete = model.Books.Where(b => b.BookID == bookID).First();
                model.Books.Remove(ToDelete);
                model.SaveChanges();
            }
        }
        public static List<Book> Searched(string search)
        {
            using (Mybooks model = new Mybooks())
            {
                List<Book> ToSearch = model.Books.Where(c => c.Title.Contains(search) || c.Author.Contains(search)).ToList<Book>();

                return ToSearch;
            }
        }
    }
}