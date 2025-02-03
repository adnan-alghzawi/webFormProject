using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace webFormProject.hazem
{
    public partial class editProfile2 : System.Web.UI.Page
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
            string filePath = Server.MapPath("~/hazem/data/Hazem.txt");
            string filePath2 = Server.MapPath("~/hazem/data/logged.txt");

            if (!File.Exists(filePath) || !File.Exists(filePath2))
            {
                Response.Write("<script>alert('Profile data not found.');</script>");
                return;
            }

            string[] userData = File.ReadAllLines(filePath);
            string email1 = File.ReadAllText(filePath2).Trim();

            foreach (string line in userData)
            {
                if (string.IsNullOrWhiteSpace(line)) continue; // تخطي الأسطر الفارغة

                string[] user = line.Split(',');

                if (user.Length < 6) continue; // التأكد أن السطر يحتوي على البيانات المطلوبة

                if (user[1].Trim() == email1)
                {
                    name.Text = user[0];
                    name2.Text = user[0];
                    email2.Text = user[1];
                    dob2.Text = user[5];
                    return;
                }
            }

            Response.Write("<script>alert('User profile not found.');</script>");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Profile updated successfully!');</script>");
        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            if (profileImageUpload.HasFile)
            {
                string fileName = Path.GetFileName(profileImageUpload.FileName);
                string filePath = Server.MapPath("~/data/images/") + fileName;

                if (!Directory.Exists(Server.MapPath("~/data/images/")))
                {
                    Directory.CreateDirectory(Server.MapPath("~/data/images/"));
                }

                profileImageUpload.SaveAs(filePath);
                profileImage.ImageUrl = "~/data/images/" + fileName;
            }
        }

        protected void ResetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/reset Password.aspx");
        }

        protected void rigester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/logIn.aspx");
        }

        protected void homeTab_Click(object sender, EventArgs e)
        {

        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click(object sender, EventArgs e)
        {

        }

        protected void books_Click(object sender, EventArgs e)
        {

        }

        protected void rooms_Click(object sender, EventArgs e)
        {

        }
    }
}
