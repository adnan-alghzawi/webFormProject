using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.nada
{
    public partial class show_books : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                LoadBooks("", "all"); //Show all books
            }
        }

        private void LoadBooks(string searchQuery, string filterOption)
        {
            string file = Server.MapPath("~/adnan/App_Data/Books.txt");
            booksContainer.InnerHtml = "";
            if (File.Exists(file))
            {
                string[] books = File.ReadAllLines(file);
                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    bool isAvailable = bookData[6].Equals("Available", StringComparison.OrdinalIgnoreCase);
                    if (!string.IsNullOrEmpty(searchQuery) && bookData[1].IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase).Equals(-1))
                    {
                        continue;
                    }

                    if (filterOption == "available" && !isAvailable)
                    {
                        continue;
                    }

                    if (filterOption == "notAvailable" && isAvailable)
                    {
                        continue;
                    }
                    booksContainer.InnerHtml += $@"
                        <div class='card p-2 mb-3' style='width: 14rem;'>
                            <img src='{bookData[4].Replace("~","")}' class='card-img-top' alt='Book Image' height='280' />
                            <div class='card-body'>
                                <h5 class='card-title'>{bookData[1]}</h5>
                                <p class='card-text'>{bookData[2]}</p>
                                <p class='{(isAvailable ? "availability-badge available" : "availability-badge not-available")}'>
                                    {(isAvailable ? "Available" : "Not available")}
                                </p>
                                <a href='book_details.aspx?bookId={bookData[0]}' class='btn btn-primary' style='background-color: #22333B; border: none;'>
                                Read More
                                </a>
                            </div>
                        </div>
                    ";
                }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextBox.Text.Trim();
            string filterOption = filterOptions.SelectedValue;
            LoadBooks(searchQuery, filterOption);
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

        protected void books_Click1(object sender, EventArgs e)
        {

        }

        protected void rooms_Click1(object sender, EventArgs e)
        {

        }
    }
}