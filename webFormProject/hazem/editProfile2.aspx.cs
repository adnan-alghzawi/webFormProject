using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.hazem
{
    public partial class editProfile2 : System.Web.UI.Page
    {
        protected void page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadprofile();
            }
        }

        private void loadprofile()
        {
            string filePath = Server.MapPath("~/hazem/data/Hazem.txt");
            string filePath2 = Server.MapPath("~/hazem/data/logged.txt");

            // التحقق من وجود الملفات
            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                Response.Write("<script>alert('Profile data not found.');</script>");
                return;
            }

            string[] userData = File.ReadAllLines(filePath);
            string email1 = File.ReadAllText(filePath2);

            foreach (string line in userData)
            {
                string[] user = line.Split(' ');
                if ( user[1].Trim() == email1.Trim())
                {
                    name.Text = user[0];
                    name2.Text = user[0];
                    email2.Text = user[1];
                    dob2.Text = user[5];
                  //  profileImage.ImageUrl = "~/images/" + user[6];
                    return;
                }
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/data/Hazem.txt");
            string[] userData = File.ReadAllLines(filePath);
            string filePath2 = Server.MapPath("~/data/logged.txt");
            string email1 = File.ReadAllText(filePath2);
            string imageName = "default.png";

            // التحقق من رفع صورة جديدة
            if (profileImageUpload.HasFile)
            {
                imageName = Path.GetFileName(profileImageUpload.FileName);
                string imagePath = Server.MapPath("~/images/" + imageName);

                // التحقق من وجود المجلد
                if (!Directory.Exists(Server.MapPath("~/images")))
                {
                    Directory.CreateDirectory(Server.MapPath("~/images"));
                }

                profileImageUpload.SaveAs(imagePath);
            }

            // تحديث بيانات المستخدم في الملف
            for (int i = 0; i < userData.Length; i++)
            {
                string[] user = userData[i].Split(',');
                if (user.Length >= 7 && user[1].Trim() == email1.Trim())
                {
                    user[0] = name2.Text;
                    user[1] = email2.Text;
                    user[5] = dob2.Text;
                    user[6] = imageName; // تحديث الصورة
                    userData[i] = string.Join(",", user);
                    File.WriteAllLines(filePath, userData);
                    break;
                }
            }

            Response.Write("<script>alert('Profile updated successfully!');</script>");
            Response.Redirect("profile.aspx");
        }


        protected void UploadImage_Click(object sender, EventArgs e)
        {
            // رفع الصورة وتحميلها
            if (profileImageUpload.HasFile)
            {
                string fileName = Path.GetFileName(profileImageUpload.FileName);

                // تحديد المسار الكامل للمجلد
                string directoryPath = Server.MapPath("~/data/images/");

                // التحقق من وجود المجلد وإذا لم يكن موجودًا يتم إنشاؤه
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                // تحديد المسار الكامل لحفظ الصورة
                string filePath = Path.Combine(directoryPath, fileName);

                // حفظ الصورة
                profileImageUpload.SaveAs(filePath);

                // تحديث المسار في عنصر الصورة
                profileImage.ImageUrl = "~/data/images/" + fileName;
            }
            else
            {
                Response.Write("https://localhost:44356/hazem/profile.aspx");
            }




        }


    }
}

