using System;
using System.IO;
using System.Web.UI;

namespace webFormProject.suleiman
{
    public partial class contactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSuccess.Visible = false;
            }
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
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string feedbackEntry = $"{txtName.Text},{txtEmail.Text},{txtMessage.Text},{DateTime.Now:yyyy-MM-dd}";
                    string filePath = Server.MapPath("feedback.txt");

                    File.AppendAllText(filePath, feedbackEntry + Environment.NewLine);

                    // Clear form and show success message
                    txtName.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtMessage.Text = string.Empty;
                    pnlSuccess.Visible = true;
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error submitting form: {ex.Message}');</script>");
                }
            }
        }

        // Navigation methods matching feedbackAdmin.aspx
        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/LogIn.aspx");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");
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
    }
}