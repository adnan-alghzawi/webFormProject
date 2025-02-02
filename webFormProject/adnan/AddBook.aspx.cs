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

        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {

            // تحديد مسار المجلد والملف
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

            // التحقق من رفع الصورة
            if (fuImage.HasFile)
            {
                string[] validExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
                string fileExtension = Path.GetExtension(fuImage.FileName).ToLower();

                // التحقق من نوع الصورة
                if (!validExtensions.Contains(fileExtension))
                {
                    lblMessage.Text = "⚠️  please uploade photo like JPG or PNG or GIF or WEBP only!";
                    return;
                }

              
                if (fuImage.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    lblMessage.Text = "⚠️  the size of image should be less than 2MB!";
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

                lblMessage.Text = "✅    Book added!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Rewrite the data : " + ex.Message;
            }

            ClearFields();
        }

        void ClearFields()
        {
            txtBookID.Text = "";
            txtBookName.Text = "";
            txtType.Text = "";
            txtLevel.Text = "";
            txtDescription.Text = "";
            ddlAvailability.SelectedIndex = 0;
        }

        //protected void btnShowBooks_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("ShowBooks");
        //}
    }
}
