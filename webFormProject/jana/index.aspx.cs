using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.jana
{
    public partial class index : System.Web.UI.Page
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


        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/LogIn.aspx");
        }

        protected void rigester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

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

        protected void read_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/about.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/hazem/data/logged.txt");
            string file = File.ReadAllText(path);
            if (file == "\"\"" || file=="")
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
    }
}