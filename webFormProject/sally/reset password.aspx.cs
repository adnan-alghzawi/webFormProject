using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.sally
{
    public partial class reset_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void check_Click(object sender, EventArgs e)
        {
            EmailLabel.Visible = false;
            string filepath = Server.MapPath("users.txt");
            string[] users = File.ReadAllLines(filepath);
            foreach (string line in users)
            {

                string[] user = line.Split(',');
                if (Email.Text == user[0])
                {
                    resetForm.Visible = true;
                    return;
                }
            }
            EmailLabel.Text = "user not found ";
            EmailLabel.Visible = true;
            resetForm.Visible = false;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            resetForm.Visible = false;
            return;
        }

        protected void saveCanghes_Click(object sender, EventArgs e)
        {

            if (newPass.Text == Confirm.Text)
            {
                pass.Visible = false;
                string filePath = Server.MapPath("users.txt");
                if (File.Exists(filePath))
                {
                    string[] content = File.ReadAllLines(filePath);
                    string userEmail = Email.Text;

                    for (int i = 0; i < content.Length; i++)
                    {
                        string[] user = content[i].Split(',');
                        if (user[0] == userEmail)
                        {
                            user[1] = newPass.Text;
                            content[i] = $"{user[0]},{user[1]}";

                            Response.Write("<script>alert('information changed!');</script>");
                            resetForm.Visible = false;
                            Email.Text = "";
                            break;
                        }
                    }
                    File.WriteAllLines(filePath, content);
                }
                //Response.Redirect("profile.aspx");
            }

            else
            {
                pass.Text = "Password not match ";
                pass.Visible = true;

            }
        }

        protected void oldpass_TextChanged(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("users.txt");
            if (File.Exists(filePath))
            {
                string[] content = File.ReadAllLines(filePath);
                string userEmail = Email.Text;

                foreach (string line in content)
                {
                    string[] user = line.Split(',');

                    if (user[0] == userEmail)
                    {
                        if (user[1] == oldpass.Text)
                        {
                            oldPassLabel.Visible = true;
                            oldPassLabel.Text = "Old password is correct.";
                            oldPassLabel.CssClass = "text-success";
                        }
                        else
                        {
                            oldPassLabel.Visible = true;
                            oldPassLabel.Text = "Old password is incorrect.";
                            oldPassLabel.CssClass = "text-danger";
                        }
                        return;
                    }
                }

                oldPassLabel.Text = "User not found.";
                oldPassLabel.Visible = true;
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {

        }
    }
}