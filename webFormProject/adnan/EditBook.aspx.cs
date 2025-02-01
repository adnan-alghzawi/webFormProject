using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.adnan
{
    public partial class EditBook : System.Web.UI.Page
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

            if (!File.Exists(filePath))
            {
                lblMessage.Text = "⚠️ No books available.";
                return;
            }

            ddlBooks.Items.Clear();
            string[] books = File.ReadAllLines(filePath);

            foreach (string book in books)
            {
                string[] details = book.Split('|');
                if (details.Length < 7) continue;

                ddlBooks.Items.Add(new ListItem(details[1], details[0])); // Book Name as text, Book ID as value
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

        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            string selectedBookID = txtBookID.Text.Trim();

            if (!File.Exists(filePath)) return;

            string[] books = File.ReadAllLines(filePath);
            File.WriteAllText(filePath, ""); // Clear the file

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

                    details = new string[]
                    {
                        selectedBookID,
                        txtBookName.Text.Trim(),
                        txtType.Text.Trim(),
                        txtLevel.Text.Trim(),
                        newImagePath,
                        txtDescription.Text.Trim(),
                        ddlAvailability.SelectedValue
                    };
                }

                File.AppendAllText(filePath, string.Join("|", details) + Environment.NewLine);
            }

            lblMessage.Text = "✅ Book updated successfully!";
            LoadBooks();
        }

        protected void show_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44356/adnan/ShowBooks.aspx");
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

            if (bookDeleted)
            {
                lblMessage.Text = "✅ Book deleted successfully!";
                LoadBooks(); // Reload books to update the dropdown
                ClearFields(); // Clear form fields
            }
            else
            {
                lblMessage.Text = "⚠️ Book not found.";
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
    }
}