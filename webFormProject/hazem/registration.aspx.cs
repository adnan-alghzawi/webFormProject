using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace task1_webForm_27_1_2025
{
    public partial class register_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("~/hazem/data/Hazem.txt");

            if (!File.Exists(file))
            {

                using (StreamWriter sw = File.CreateText(file))
                {
                    string gender = Male.Checked ? "Male" : "Female";
                    sw.WriteLine($"{name.Text} {email.Text} {password.Text} {repeat_password.Text} {gender} {dob.Text}");

                }
            }
            else
            {
                using (StreamWriter sw = new StreamWriter(file, true))
                {
                    string gender = Male.Checked ? "Male" : "Female";
                    sw.WriteLine($"{name.Text} {email.Text} {password.Text} {repeat_password.Text} {gender} {dob.Text}");
                }
            }

            Response.Redirect("login.aspx");
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