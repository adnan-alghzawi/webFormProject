using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace task1_webForm_27_1_2025
{
    public partial class login_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("~/hazem/data//Hazem.txt");

            if (email_address.Text == "admin@gmail.com" && login_password.Text == "123")
            {
                string logged = Server.MapPath("~/hazem/data/logged.txt");
                File.WriteAllText(logged, email_address.Text);
                Response.Redirect("~/sally/AdminDash.aspx");
            }

            string[] users = File.ReadAllLines(file); //["user1","user2","user3",....] array of objects
            foreach (string user in users)
            {



                string[] userData = user.Split(' ');
                if (email_address.Text.Trim() == userData[1].Trim() && login_password.Text.Trim() == userData[2].Trim())
                {
                    string logged = Server.MapPath("~/hazem/data/logged.txt");
                    File.WriteAllText(logged, email_address.Text);

                    Response.Redirect("~/jana/index.aspx");
                }
            }

        }
        protected void rigester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            
        }
       
    }
}