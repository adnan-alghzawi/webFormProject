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
            if (File.Exists(file))
            {

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
            string name="";
            string phone= "079777777777";
            string bookId = Request.QueryString["bookId"];
            string file = Server.MapPath("books.txt");
            string loggedfile = Server.MapPath("~/hazem/data/logged.txt");
            string users_file = Server.MapPath("~/hazem/data/Hazem.txt");

            if (File.Exists(file) && File.Exists(loggedfile)&& File.Exists(users_file))
            {
                string logged_user = File.ReadAllText(loggedfile);
                string[] users = File.ReadAllLines(users_file);
                string[] books = File.ReadAllLines(file);

                foreach(string user in users)
                {
                    string[] users_data = user.Split(' ');
                    if (users_data[1]== logged_user)
                    {
                        name = users_data[0];
                        Console.Write(name);
                        break;
                    }
                }

                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    if (bookData[0] == bookId)
                    {
                        if (!string.IsNullOrEmpty(startDate.Text) && !string.IsNullOrEmpty(startTime.Text) &&
                        !string.IsNullOrEmpty(endDate.Text) && !string.IsNullOrEmpty(endTime.Text))
                        {
                            string borrow_file = Server.MapPath("~/nada/borrow_book_request.txt");
                            if (!File.Exists(borrow_file))
                            {
                                File.Create(borrow_file);
                            }

                            using (StreamWriter sw = new StreamWriter(borrow_file, true))
                            {
                                sw.WriteLine($"{bookData[0]}|{bookData[1]}|{name}|{logged_user}|{phone}|{startDate.Text}|{startTime.Text}|{endDate.Text}|{endTime.Text}|\"Pending\"");
                            }
                            msg.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup",
                            "Swal.fire({ " +
                            "title: 'Success!', " +
                            "text: 'Your request has been submitted.', " +
                            "icon: 'success', " +
                            "confirmButtonColor: '#22333B', " +
                            "confirmButtonText: 'OK' " +
                            "}).then((result) => { " +
                            "    if (result.isConfirmed) { " +
                            "        window.location = 'show_books.aspx'; " +  
                            "    } " +
                            "});", true);
                            
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