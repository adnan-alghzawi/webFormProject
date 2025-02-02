using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.nada
{
    public partial class borrow_book : System.Web.UI.Page
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
            string loggedfile = Server.MapPath("logged.txt");

            if (File.Exists(file))
            {
                string user = File.ReadAllText(loggedfile);
                string[] userData = user.Split('|');

                string[] books = File.ReadAllLines(file);
                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    if (bookData[0] == bookId)
                    {
                        bool isAvailable = bookData[6].Equals("true", StringComparison.OrdinalIgnoreCase);
                        string buttonDisabled = isAvailable ? "" : "disabled style='cursor: not-allowed; background-color: #EAE0D6;padding: 10px 20px;border: none;border-radius: 5px;font-size: 0.9rem;'";
                        bookImage.ImageUrl = bookData[4];
                        bookName.Text = bookData[1];
                        bookType.Text = bookData[2];
                        bookLevel.Text = bookData[3];

                        return;
                    }
                }
            }
        }


        protected void submitButton_Click(object sender, EventArgs e)
        {
            string bookId = Request.QueryString["bookId"];
            string file = Server.MapPath("books.txt");
            string loggedfile = Server.MapPath("logged.txt");

            if (File.Exists(file) && File.Exists(loggedfile))
            {
                string user = File.ReadAllText(loggedfile);
                string[] userData = user.Split('|');
                string[] books = File.ReadAllLines(file);
                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    if (bookData[0] == bookId)
                    {
                        if (!string.IsNullOrEmpty(startDate.Text) && !string.IsNullOrEmpty(startTime.Text) &&
                        !string.IsNullOrEmpty(endDate.Text) && !string.IsNullOrEmpty(endTime.Text))
                        {
                            string borrow_file = Server.MapPath("borrow_book_request.txt");
                            if (!File.Exists(borrow_file))
                            {
                                File.Create(borrow_file);
                            }

                            using (StreamWriter sw = new StreamWriter(borrow_file, true))
                            {
                                string cleanedUserData2 = userData[2].Trim();
                                sw.WriteLine($"{bookData[0]}|{bookData[1]}|{userData[0]}|{userData[1]}|{cleanedUserData2}|{startDate.Text}|{startTime.Text}|{endDate.Text}|{endTime.Text}|\"Pending\"");
                            }
                            Response.Write("<script>$(document).ready(function() { $('#borrowRequestModal').modal('show'); });</script>");
                        }
                        else
                        {
                            msg.Visible = true;
                        }
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
    }
}