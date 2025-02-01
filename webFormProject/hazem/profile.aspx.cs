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

            // التأكد من وجود الملفات
            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                Response.Write("<script>alert('One or both of the files do not exist.');</script>");
                ResetFields();
                return;
            }

            // قراءة البيانات من الملفات
            string[] userData = File.ReadAllLines(filePath);
            string email1 = File.ReadAllText(filePath2);

            // التأكد من وجود بيانات في الملف النصي
            if (userData.Length == 0 || string.IsNullOrWhiteSpace(email1))
            {
                Response.Write("<script>alert('The files are empty or have no valid data.');</script>");
                ResetFields();
                return;
            }

            foreach (string line in userData)
            {
                string[] user = line.Split(',');
                if (user.Length >= 6 && user[1].Trim() == email1.Trim())
                {
                    name.Text = user[0];
                    email2.Text = user[1];
                    name2.Text = user[0];

                    // تحديد الجنس بناءً على القيمة المخزنة
                    if (user[4] == "Male")
                    {
                        Male.Checked = true;
                    }
                    else if (user[4] == "Female")
                    {
                        Female.Checked = true;
                    }

                    dob2.Text = user[5];
                    return;
                }
            }

            // إذا لم يتم العثور على المستخدم
            Response.Write("<script>alert('No matching user found in the data file.');</script>");
            ResetFields();
        }

        private void ResetFields()
        {
            name.Text = "";
            Male.Checked = false;
            Female.Checked = false;
            name2.Text = "";
            email2.Text = "";
            dob2.Text = "";
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/data/Hazem.txt");
            string[] userData = File.ReadAllLines(filePath);
            string filePath2 = Server.MapPath("~/data/logged.txt");
            string email1 = File.ReadAllText(filePath2);

            for (int i = 0; i < userData.Length; i++)
            {
                string[] user = userData[i].Split(',');

                if (user.Length >= 6 && user[1].Trim() == email1.Trim())
                {
                    user[0] = name.Text;
                    user[1] = email2.Text;
                    email1 = email2.Text;

                    // تحديث قيمة الجنس بناءً على الزر المحدد
                    if (Male.Checked)
                    {
                        user[4] = "Male";
                    }
                    else if (Female.Checked)
                    {
                        user[4] = "Female";
                    }

                    user[5] = dob2.Text;
                    userData[i] = $"{user[0]},{user[1]},{user[2]},{user[3]},{user[4]},{user[5]}";
                    File.WriteAllLines(filePath, userData);
                    File.WriteAllText(filePath2, email1);
                    break;
                }
            }

            Response.Write("<script>alert('Profile updated successfully!');</script>");
        }
    }
}
