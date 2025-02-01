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
        protected void homeTab_Click(object sender, EventArgs e) => Response.Redirect("home.aspx");
        protected void aboutTab_Click(object sender, EventArgs e) => Response.Redirect("about.aspx");
        protected void contactTab_Click(object sender, EventArgs e) => Response.Redirect("contactUs.aspx");
        protected void books_Click(object sender, EventArgs e) => Response.Redirect("books.aspx");
        protected void rooms_Click(object sender, EventArgs e) => Response.Redirect("rooms.aspx");
        protected void login_Click(object sender, EventArgs e) => Response.Redirect("login.aspx");
        protected void register_Click(object sender, EventArgs e) => Response.Redirect("register.aspx");
    }
}