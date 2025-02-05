using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.hazem
{
    public partial class editProfile2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filepath = Server.MapPath("~/hazem/data/logged.txt");
                string s = File.ReadAllText(filepath);
                if (s == "\"\"" || s=="")
                {
                    buttons.Visible = true;
                    buttons2.Visible = false;
                    books.Visible = false;
                    rooms.Visible = false;
                }
                else
                {
                    buttons.Visible = false;
                    buttons2.Visible = true;
                    books.Visible = true;
                    rooms.Visible = true;
                }
                LoadProfile();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/hazem/data/logged.txt");
            string file = File.ReadAllText(path);
            if (file == "\"\"" || file == "")
            {
                Response.Redirect("~/hazem/LogIn.aspx");
            }
            else
            {
                Response.Redirect("~/jana/ViewRooms.aspx");
            }

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            //Response.Redirect("~/nada/show_books.aspx");
            string path = Server.MapPath("~/hazem/data/logged.txt");
            string file = File.ReadAllText(path);
            if (file == "\"\"" || file == "")
            {
                Response.Redirect("~/hazem/LogIn.aspx");
            }
            else
            {
                Response.Redirect("~/jana/ViewRooms.aspx");
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            buttons.Visible = true;
            buttons2.Visible = false;
            books.Visible = false;
            rooms.Visible = false;
        }

        protected void prof_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/profile.aspx");

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

                string[] user = line.Split(' ');

                if (user.Length < 6) continue; // التأكد أن السطر يحتوي على البيانات المطلوبة

                if (user[1].Trim() == email1)
                {
                    name.Text = user[0];
                    name2.Text = user[0];
                    if (user[4]== "Male")
                    {
                        Male.Text = "Male";
                        Male.Checked = true;

                    }
                    else
                    {
                        Female.Text = "FeMale";
                        Female.Checked = true;
                    }
                    email2.Text = user[1];
                    dob2.Text = user[5];
                    return;
                }
            }

            //Response.Write("<script>alert('User profile not found.');</script>");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/hazem/data/Hazem.txt");
            if (File.Exists(filePath))
            {
                string[] content = File.ReadAllLines(filePath);
                string fileLoged = Server.MapPath("~/hazem/data/logged.txt");
                string userEmail = File.ReadAllText(fileLoged);

                for (int i = 0; i < content.Length; i++)
                {
                    string[] user = content[i].Split(' ');
                    if (user[1] == userEmail)
                    {
                        user[0] = name2.Text;
                        user[1] = email2.Text;
                        if (Male.Checked)
                        {
                            user[4] = Male.Text;
                        }
                        else
                        {
                            user[4] = Female.Text;
                        }
                      //  user[3] = gender.SelectedValue;
                        user[5] = dob2.Text;
                        File.WriteAllText(fileLoged, email2.Text);
                        content[i] = $"{user[0]} {user[1]} {user[2]} {user[3]} {user[4]} {user[5]}";

                        Response.Write("<script>alert('information changed!');</script>");

                        break;
                    }
                }
                File.WriteAllLines(filePath, content);
            }
            Response.Redirect("profile.aspx");
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
