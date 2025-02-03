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
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            string s = File.ReadAllText(filepath);
            if (s == "\"\"")
            {
                buttons.Visible = true;
                buttons2.Visible = false;
                books.Visible = false;
                rooms.Visible = false;
            }
            else
            {
                buttons.Visible = false;
                buttons2.Visible = true;
                books.Visible = true;
                rooms.Visible = true;
            }

            if (Request.QueryString["bookId"] != null)
            {
                string bookId = Request.QueryString["bookId"];
                LoadBookDetails(bookId);
            }
        }
        private void LoadBookDetails(string bookId)
        {
            string file = Server.MapPath("~/adnan/App_Data/Books.txt");
            string borrowFile = Server.MapPath("~/nada/borrow_book_request.txt");
            bool isPending = IsBorrowRequestPending(bookId, borrowFile);
            if (File.Exists(file))
            {
                string[] books = File.ReadAllLines(file);
                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    if (bookData[0] == bookId)
                    {
                        bool isAvailable = bookData[6].Equals("Available", StringComparison.OrdinalIgnoreCase);
                        string buttonText = isPending ? "Pending" : "Borrow Book";
                        string buttonDisabled = isPending || !isAvailable
                            ? "disabled style='cursor: not-allowed; background-color: #EAE0D6;padding: 10px 20px;border: none;border-radius: 5px;font-size: 0.9rem;'"
                            : "";

                        div_book_details.InnerHtml = $@"
                        <img src={bookData[4].Replace("~", "")} alt=""Book Cover"">
                        <div class=""book-content"">
                            <h1>{bookData[1]}</h1>
                            <p>{bookData[5]}</p>
                            <div class=""details"">
                                <p><strong>Type:</strong> {bookData[2]}</p>
                                <p><strong>First Publish:</strong> December 30th 2014</p>
                                <p><strong>Language:</strong> English</p>
                                <p><strong>Pages:</strong> 240</p>
                                <p class='{(isAvailable ? "availability-badge available" : "availability-badge not-available")}'>
                                    {(isAvailable ? "Available" : "Not available")}
                                </p>
                            </div>
                            <div class=""buttons"">
                                <a href='{(isPending || !isAvailable ? "#" : "borrow_book.aspx?bookId=" + bookData[0])}' 
                                   class='borrow-button' 
                                   style='{(isPending || !isAvailable ? "cursor: not-allowed; background-color: #EAE0D6; padding: 10px 20px; border: none; border-radius: 5px; font-size: 0.9rem;" : "")}'>
                                   {buttonText}
                                </a>

                            </div>
                        </div>
                    ";
                        return;
                    }
                }
            }
        }

        private bool IsBorrowRequestPending(string bookId, string borrowFile)
        {
            if (File.Exists(borrowFile))
            {
                string[] requests = File.ReadAllLines(borrowFile);
                foreach (string request in requests)
                {
                    string[] requestData = request.Split('|');
                    if (requestData[0] == bookId && requestData[9].Trim('"') == "Pending")
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        protected void homeTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/jana/index.aspx");
        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/about.aspx");
        }

        protected void contactTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/suleiman/contactUs.aspx");
        }

        protected void books_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/nada/show_books.aspx");
        }

        protected void rooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/jana/ViewRooms.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/LogIn.aspx");
        }

        protected void rigester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");

        }
        protected void prof_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/profile.aspx");

        }
        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            buttons.Visible = true;
            buttons2.Visible = false;
            books.Visible = false;
            rooms.Visible = false;
        }

    }
}