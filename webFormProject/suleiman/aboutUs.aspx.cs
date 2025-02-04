using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.suleiman
{
    public partial class about : Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
        }

        // Navigation methods
        protected void homeTab_Click(object sender, EventArgs e) => Response.Redirect("home.aspx");
        protected void aboutTab_Click(object sender, EventArgs e) => Response.Redirect("about.aspx");
        protected void contactTab_Click(object sender, EventArgs e) => Response.Redirect("contactUs.aspx");
        protected void books_Click(object sender, EventArgs e) => Response.Redirect("books.aspx");
        protected void rooms_Click(object sender, EventArgs e) => Response.Redirect("rooms.aspx");
        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/LogIn.aspx");
        }

        protected void rigester_Click(object sender, EventArgs e)
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