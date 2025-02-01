using System;
using System.IO;
using System.Web.UI;

namespace task1_webForm_27_1_2025
{
    public partial class profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            string filePath = Server.MapPath("~/data/Hazem.txt");
            string filePath2 = Server.MapPath("~/data/logged.txt");

            // تحقق من وجود الملفات
            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                // إذا كانت الملفات غير موجودة، قم بإعادة تعيين الحقول
                ResetFields();
                lblMessage.Text = "Error: Required files are missing.";
                return;
            }

            // قراءة بيانات المستخدم من الملف
            string[] userData = File.ReadAllLines(filePath);
            string email1 = File.ReadAllText(filePath2).Trim();

            // البحث عن المستخدم بناءً على البريد الإلكتروني
            bool userFound = false;
            foreach (string line in userData)
            {
                string[] user = line.Split(',');

                if (user.Length >= 6 && user[1].Trim().Equals(email1, StringComparison.OrdinalIgnoreCase))
                {
                    name.Text = user[0];
                    email2.Text = user[1];
                    name2.Text = user[0];

                    // تحديد الجنس بناءً على القيمة المخزنة
                    if (user[4].Equals("Male", StringComparison.OrdinalIgnoreCase))
                    {
                        Male.Checked = true;
                    }
                    else if (user[4].Equals("Female", StringComparison.OrdinalIgnoreCase))
                    {
                        Female.Checked = true;
                    }

                    dob2.Text = user[5];
                    userFound = true;
                    break;
                }
            }

            // إذا لم يتم العثور على المستخدم، قم بإعادة تعيين الحقول
            if (!userFound)
            {
                ResetFields();
                lblMessage.Text = "User not found.";
            }
        }

        private void ResetFields()
        {
            name.Text = string.Empty;
            email2.Text = string.Empty;
            name2.Text = string.Empty;
            dob2.Text = string.Empty;
            Male.Checked = false;
            Female.Checked = false;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/data/Hazem.txt");
            string filePath2 = Server.MapPath("~/data/logged.txt");

            // تحقق من وجود الملفات
            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                lblMessage.Text = "Error: Required files are missing.";
                return;
            }

            // قراءة بيانات المستخدم من الملف
            string[] userData = File.ReadAllLines(filePath);
            string email1 = File.ReadAllText(filePath2).Trim();

            // البحث عن المستخدم وتحديث البيانات
            bool userFound = false;
            for (int i = 0; i < userData.Length; i++)
            {
                string[] user = userData[i].Split(',');

                if (user.Length >= 6 && user[1].Trim().Equals(email1, StringComparison.OrdinalIgnoreCase))
                {
                    user[0] = name.Text;
                    user[1] = email2.Text;
                    email1 = email2.Text;

                    // تحديث قيمة الجنس بناءً على الزر المحدد
                    user[4] = Male.Checked ? "Male" : Female.Checked ? "Female" : user[4];
                    user[5] = dob2.Text;

                    userData[i] = string.Join(",", user);
                    File.WriteAllLines(filePath, userData);
                    File.WriteAllText(filePath2, email1);
                    userFound = true;
                    break;
                }
            }

            // إظهار رسالة بناءً على نتيجة العملية
            if (userFound)
            {
                lblMessage.Text = "Profile updated successfully!";
            }
            else
            {
                lblMessage.Text = "User not found.";
            }
        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            if (profilePicture.HasFile)
            {
                string uploadsFolder = Server.MapPath("~/uploads/");

                // تأكد من وجود مجلد uploads
                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }

                string fileName = Path.GetFileName(profilePicture.PostedFile.FileName);
                string filePath = Path.Combine(uploadsFolder, fileName);

                // حفظ الصورة
                profilePicture.SaveAs(filePath);

                // تحديث صورة الملف الشخصي في الصفحة
                profileImage.Src = "~/uploads/" + fileName;

                lblMessage.Text = "Photo uploaded successfully!";
            }
            else
            {
                lblMessage.Text = "Please select a photo to upload.";
            }
        }
    }
}