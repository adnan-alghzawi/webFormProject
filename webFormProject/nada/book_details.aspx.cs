using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.nada
{
    public partial class book_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["bookId"] != null)
            {
                string bookId = Request.QueryString["bookId"];
                LoadBookDetails(bookId);
            }
        }
        private void LoadBookDetails(string bookId)
        {
            string file = Server.MapPath("books.txt");
            if (File.Exists(file))
            {
                string[] books = File.ReadAllLines(file);
                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    if (bookData[0] == bookId)
                    {
                        bool isAvailable = bookData[6].Equals("true", StringComparison.OrdinalIgnoreCase);
                        string buttonDisabled = isAvailable ? "" : "disabled style='cursor: not-allowed; background-color: #EAE0D6;padding: 10px 20px;border: none;border-radius: 5px;font-size: 0.9rem;'onclick='return false;'";
                        div_book_details.InnerHtml = $@"
                        <img src={bookData[4]} alt=""Book Cover"">
                        <div class=""book-content"">
                            <h1>{bookData[1]}</h1>
                            <p>{bookData[5]}</p>
                            <div class=""details"">
                                <p><strong>Type:</strong>{bookData[2]}</p>
                                <p><strong>First Publish:</strong> December 30th 2014</p>
                                <p><strong>Language:</strong> English</p>
                                <p><strong>Pages:</strong> 240</p>
                                <p class='{(isAvailable ? "availability-badge available" : "availability-badge not-available")}'>
                                    {(isAvailable ? "Available" : "Not available")}
                                </p>
                            </div>
                            <div class=""buttons"">
                                <a href='borrow_book.aspx?bookId={bookData[0]}' {buttonDisabled}>Borrow Book</a>
                            </div>
                        </div>
                    ";
                        return;
                    }
                }
            }
        }

        protected void homeTab_Click(object sender, EventArgs e)
        {

        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click(object sender, EventArgs e)
        {

        }

        protected void books_Click(object sender, EventArgs e)
        {

        }

        protected void rooms_Click(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {

        }

        protected void rigester_Click(object sender, EventArgs e)
        {

        }
    }
}