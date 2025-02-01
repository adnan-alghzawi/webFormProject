using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.adnan
{
    public partial class ShowBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }
        private void LoadBooks()
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");

            // التحقق من وجود الملف
            if (!File.Exists(filePath))
            {
                pnlBooks.Controls.Add(new Literal { Text = "<p class='text-center text-danger'>⚠️ books unavailable .</p>" });
                return;
            }

            string[] books = File.ReadAllLines(filePath);

            foreach (string book in books)
            {
                string[] bookDetails = book.Split('|');

                if (bookDetails.Length < 7) continue; 

                string bookID = bookDetails[0];
                string bookName = bookDetails[1];
                string type = bookDetails[2];
                string level = bookDetails[3];
                string imagePath = bookDetails[4].Replace("~", ""); 
                string description = bookDetails[5];
                string availability = bookDetails[6] == "Available" ? "<span class='text-success'>Available</span>" : "<span class='text-danger'> Unavailable</span>";

                // إنشاء كارد للكتاب
                Panel card = new Panel { CssClass = "col-md-4 mb-4" };
                card.Controls.Add(new Literal
                {
                    Text = $@"
                        <div class='card shadow'>
                            <img src='{imagePath}' class='card-img-top' style='height: 250px; object-fit: cover;' alt=' book image'>
                            <div class='card-body'>
                                <h5 class='card-title'>{bookName}</h5>
                                <p class='card-text'><strong>type:</strong> {type}</p>
                                <p class='card-text'><strong>level:</strong> {level}</p>
                                <p class='card-text'><strong>description:</strong> {description}</p>
                                <p class='card-text'><strong>availability:</strong> {availability}</p>
                            </div>
                        </div>"
                });

                pnlBooks.Controls.Add(card);
            }
        }

       

        protected void edit_Click1(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44356/adnan/EditBook.aspx");
        }
    }
}
