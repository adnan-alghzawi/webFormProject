using System;
using System.Web.UI;

namespace webFormProject.suleiman
{
    public partial class about : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Navigation methods
        protected void homeTab_Click(object sender, EventArgs e) => Response.Redirect("home.aspx");
        protected void aboutTab_Click(object sender, EventArgs e) => Response.Redirect("about.aspx");
        protected void contactTab_Click(object sender, EventArgs e) => Response.Redirect("contactUs.aspx");
        protected void books_Click(object sender, EventArgs e) => Response.Redirect("books.aspx");
        protected void rooms_Click(object sender, EventArgs e) => Response.Redirect("rooms.aspx");
        protected void login_Click(object sender, EventArgs e) => Response.Redirect("login.aspx");
        protected void register_Click(object sender, EventArgs e) => Response.Redirect("register.aspx");
    }
}