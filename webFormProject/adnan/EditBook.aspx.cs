using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace webFormProject.adnan
{
    public partial class EditBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string bookID = Request.QueryString["bookID"];
                if (!string.IsNullOrEmpty(bookID))
                {
                    LoadBookDetails(bookID);
                }
                else
                {
                    lblMessage.Text = "⚠️ No book selected for editing.";
                }
            }
        }

        private void LoadBookDetails(string bookID)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");

            if (!File.Exists(filePath))
            {
                lblMessage.Text = "⚠️ No books available.";
                return;
            }

            string[] books = File.ReadAllLines(filePath);

            foreach (string book in books)
            {
                string[] details = book.Split('|');
                if (details.Length < 7) continue;

                if (details[0] == bookID)
                {
                    txtBookID.Text = details[0];
                    txtBookName.Text = details[1];
                    txtType.Text = details[2];
                    txtLevel.Text = details[3];
                    txtDescription.Text = details[5];
                    ddlAvailability.SelectedValue = details[6];
                    break;
                }
            }
        }

        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            string selectedBookID = txtBookID.Text.Trim();

            if (!File.Exists(filePath)) return;

            string[] books = File.ReadAllLines(filePath);
            bool bookUpdated = false;

            List<string> updatedBooks = new List<string>();

            foreach (string book in books)
            {
                string[] details = book.Split('|');
                if (details.Length < 7) continue;

                if (details[0] == selectedBookID)
                {
                    string newImagePath = details[4];

                    if (fuImage.HasFile)
                    {
                        string[] validExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
                        string fileExtension = Path.GetExtension(fuImage.FileName).ToLower();

                        if (!validExtensions.Contains(fileExtension))
                        {
                            lblMessage.Text = "⚠️ Please upload a valid image.";
                            return;
                        }

                        string imageFolder = Server.MapPath("~/adnan/Images/Books/");
                        if (!Directory.Exists(imageFolder))
                        {
                            Directory.CreateDirectory(imageFolder);
                        }

                        string fileName = Path.GetFileName(fuImage.FileName);
                        string savePath = Path.Combine(imageFolder, fileName);
                        fuImage.SaveAs(savePath);

                        newImagePath = "~/adnan/Images/Books/" + fileName;
                    }

                    updatedBooks.Add(string.Join("|", new string[]
                    {
                        selectedBookID,
                        txtBookName.Text.Trim(),
                        txtType.Text.Trim(),
                        txtLevel.Text.Trim(),
                        newImagePath,
                        txtDescription.Text.Trim(),
                        ddlAvailability.SelectedValue
                    }));

                    bookUpdated = true;
                }
                else
                {
                    updatedBooks.Add(book);
                }
            }

            File.WriteAllLines(filePath, updatedBooks);

            lblMessage.Text = bookUpdated ? "✅ Book updated successfully!" : "⚠️ Book not found.";
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            string selectedBookID = txtBookID.Text.Trim();

            if (!File.Exists(filePath))
            {
                lblMessage.Text = "⚠️ No books available.";
                return;
            }

            List<string> updatedBooks = new List<string>();
            string[] books = File.ReadAllLines(filePath);
            bool bookDeleted = false;

            foreach (string book in books)
            {
                string[] details = book.Split('|');
                if (details.Length < 7) continue;

                if (details[0] == selectedBookID)
                {
                    bookDeleted = true;
                    continue; // Skip adding this book to the new list (delete it)
                }

                updatedBooks.Add(book);
            }

            File.WriteAllLines(filePath, updatedBooks);

            lblMessage.Text = bookDeleted ? "✅ Book deleted successfully!" : "⚠️ Book not found.";
            if (bookDeleted)
            {
                ClearFields(); // Clear form fields
            }
        }
        protected void ddlBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            string selectedBookID = ddlBooks.SelectedValue;

            if (!File.Exists(filePath)) return;

            string[] books = File.ReadAllLines(filePath);

            foreach (string book in books)
            {
                string[] details = book.Split('|');
                if (details.Length < 7) continue;

                if (details[0] == selectedBookID)
                {
                    txtBookID.Text = details[0];
                    txtBookName.Text = details[1];
                    txtType.Text = details[2];
                    txtLevel.Text = details[3];
                    txtDescription.Text = details[5];
                    ddlAvailability.SelectedValue = details[6];
                    break;
                }
            }
        }


        private void ClearFields()
        {
            txtBookID.Text = "";
            txtBookName.Text = "";
            txtType.Text = "";
            txtLevel.Text = "";
            txtDescription.Text = "";
            ddlAvailability.SelectedIndex = 0;
        }

        protected void editB_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ShowBooks.aspx");
        }

        protected void editR_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/RoomAdmin.aspx");
        }

        protected void Reservations_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/ConfirmReservation.aspx");
        }

        protected void Borrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ConfirmBorrow.aspx");
        }
        protected void dash_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/AdminDash.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            Response.Redirect("~/jana/index.aspx");
        }
    }
}
