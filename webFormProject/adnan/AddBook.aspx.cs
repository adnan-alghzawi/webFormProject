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

            // التأكد من وجود مجلد App_Data وإنشاؤه إذا لم يكن موجودًا
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            // التأكد من وجود ملف Books.txt وإنشاؤه إذا لم يكن موجودًا
            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close(); // إنشاء الملف وإغلاقه مباشرة
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
                    lblMessage.Text = "⚠️ الرجاء رفع صورة بصيغة JPG أو PNG أو GIF أو WEBP فقط!";
                    return;
                }

                // التحقق من حجم الصورة (يجب أن يكون أقل من 2MB)
                if (fuImage.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    lblMessage.Text = "⚠️ حجم الصورة يجب أن يكون أقل من 2MB!";
                    return;
                }

                // تحديد مسار حفظ الصورة
                string imageFolder = Server.MapPath("~/adnan/Images/Books/");
                if (!Directory.Exists(imageFolder))
                {
                    Directory.CreateDirectory(imageFolder);
                }

                string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                string savePath = Path.Combine(imageFolder, fileName);
                fuImage.SaveAs(savePath);

                // حفظ المسار النسبي للصورة
                imagePath = "~/adnan/Images/Books/" + fileName;
            }

            // كتابة بيانات الكتاب في ملف Books.txt
            string bookData = $"{bookID}|{bookName}|{type}|{level}|{imagePath}|{description}|{availability}";

            try
            {
                // كتابة بيانات الكتاب في ملف Books.txt
                using (StreamWriter sw = new StreamWriter(filePath, true))
                {
                    sw.WriteLine(bookData);
                }

                lblMessage.Text = "✅ تمت إضافة الكتاب بنجاح!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ خطأ في كتابة البيانات: " + ex.Message;
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
    }
}
