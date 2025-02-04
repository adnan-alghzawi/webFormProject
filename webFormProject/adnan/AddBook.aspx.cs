using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.adnan
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeBookId();
            }
        }

        private void InitializeBookId()
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            if (File.Exists(filePath))
            {
                string lastLine = File.ReadLines(filePath).LastOrDefault();
                if (lastLine != null)
                {
                    string[] parts = lastLine.Split('|');
                    int lastId = int.Parse(parts[0]); // Assuming the ID is the first part
                    txtBookID.Text = (lastId + 1).ToString(); // Set next ID
                }
                else
                {
                    txtBookID.Text = "1"; // Start from 1 if file is empty
                }
            }
            else
            {
                txtBookID.Text = "1"; // Start from 1 if file doesn't exist
            }
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/adnan/App_Data/");
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close();
            }

            string bookID = txtBookID.Text.Trim();
            string bookName = txtBookName.Text.Trim();
            string type = txtType.Text.Trim();
            string level = txtLevel.Text.Trim();
            string description = txtDescription.Text.Trim();
            string availability = ddlAvailability.SelectedValue;
            string imagePath = "";

            if (fuImage.HasFile)
            {
                string[] validExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
                string fileExtension = Path.GetExtension(fuImage.FileName).ToLower();

                if (!validExtensions.Contains(fileExtension))
                {
                    lblMessage.Text = "⚠️ Please upload a photo in JPG, PNG, GIF, or WEBP format only!";
                    return;
                }

                if (fuImage.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    lblMessage.Text = "⚠️ The size of the image should be less than 2MB!";
                    return;
                }

                string imageFolder = Server.MapPath("~/adnan/Images/Books/");
                if (!Directory.Exists(imageFolder))
                {
                    Directory.CreateDirectory(imageFolder);
                }

                string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                string savePath = Path.Combine(imageFolder, fileName);
                fuImage.SaveAs(savePath);

                imagePath = "~/adnan/Images/Books/" + fileName;
            }

            string bookData = $"{bookID}|{bookName}|{type}|{level}|{imagePath}|{description}|{availability}";

            try
            {
                using (StreamWriter sw = new StreamWriter(filePath, true))
                {
                    sw.WriteLine(bookData);
                }

                lblMessage.Text = "✅ Book added successfully!";
                InitializeBookId(); // Update ID for the next book
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error adding book: " + ex.Message;
            }

            ClearFields();
        }

        void ClearFields()
        {
            txtBookName.Text = "";
            txtType.Text = "";
            txtLevel.Text = "";
            txtDescription.Text = "";
            ddlAvailability.SelectedIndex = -1;
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
        //range 50-100
        //output: even numbers
        // structure : function
        //public void even()
        //{
        //    for(int i = 50;i<=100; i += 2)
        //    {
        //        Console.Write(i + " , ");
        //    }
        //}
        //event();

        
    }
}

