using System;
using System.IO;
using System.Web.UI;

namespace task1_webForm_27_1_2025
{
    public partial class profile : Page
    {
        private string filePath;
        private string filePath2;

        protected void Page_Load(object sender, EventArgs e)
        {
            filePath = Server.MapPath("~/hazem/data/Hazem.txt");
            filePath2 = Server.MapPath("~/hazem/data/logged.txt");

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                Response.Write("<script>alert('One or both of the files do not exist.');</script>");
                return;
            }

            string email1 = File.ReadAllText(filePath2).Trim();
            string[] userData = File.ReadAllLines(filePath);

            if (string.IsNullOrWhiteSpace(email1))
            {
                Response.Write("<script>alert('No valid email found in logged.txt.');</script>");
                return;
            }

            foreach (string line in userData)
            {
                string[] user = line.Split(' ');
                if (user.Length >= 6 && user[1].Trim() == email1)
                {
                    name.Text = user[0];
                    email2.Text = user[1];
                    name2.Text = user[0];
                    dob2.Text = user[5];
                    Male.Checked = user[4] == "Male";
                    Female.Checked = user[4] == "Female";
                    return;
                }
            }

            // إذا لم يتم العثور على المستخدم، قم بإنشاء سجل جديد له
            Response.Write("<script>alert('User not found, creating new profile.');</script>");
            SaveNewUser(email1);
        }

        private void SaveNewUser(string email)
        {
            string defaultUser = $"New User,{email},,,,,";
            File.AppendAllText(filePath, defaultUser + Environment.NewLine);
            LoadProfile();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                Response.Write("<script>alert('One or both of the files do not exist.');</script>");
                return;
            }

            string email1 = File.ReadAllText(filePath2).Trim();
            string[] userData = File.ReadAllLines(filePath);
            bool userFound = false;

            for (int i = 0; i < userData.Length; i++)
            {
                string[] user = userData[i].Split(',');
                if (user.Length >= 6 && user[1].Trim() == email1)
                {
                    user[0] = name.Text;
                    user[1] = email2.Text;
                    user[4] = Male.Checked ? "Male" : "Female";
                    user[5] = dob2.Text;
                    userData[i] = string.Join(",", user);
                    userFound = true;
                    break;
                }
            }

            if (!userFound)
            {
                Response.Write("<script>alert('User not found, creating new profile.');</script>");
                SaveNewUser(email1);
            }
            else
            {
                File.WriteAllLines(filePath, userData);
                File.WriteAllText(filePath2, email2.Text);
                Response.Write("<script>alert('Profile updated successfully!');</script>");
            }
        }
    }
}
