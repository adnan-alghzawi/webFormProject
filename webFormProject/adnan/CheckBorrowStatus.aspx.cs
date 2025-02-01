using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.adnan
{
    public partial class CheckBorrowStatus : System.Web.UI.Page
    {
        private string notificationsFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            notificationsFilePath = Server.MapPath("~/adnan/App_Data/UserNotifications.txt");
        }
        protected void btnCheckStatus_Click(object sender, EventArgs e)
        {
            string userEmail = txtUserEmail.Text.Trim();
            if (string.IsNullOrEmpty(userEmail))
            {
                lblStatus.CssClass = "alert alert-danger";
                lblStatus.Text = "⚠️ Please enter your email.";
                return;
            }

            if (!File.Exists(notificationsFilePath))
            {
                lblStatus.CssClass = "alert alert-warning";
                lblStatus.Text = "⚠️ No notifications found.";
                return;
            }

            string[] lines = File.ReadAllLines(notificationsFilePath);
            List<dynamic> notifications = new List<dynamic>();

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length < 3) continue;

                if (details[0] == userEmail)
                {
                    notifications.Add(new
                    {
                        Message = details[1],
                        Date = details[2]
                    });
                }
            }

            if (notifications.Count > 0)
            {
                gvNotifications.DataSource = notifications.OrderByDescending(n => n.Date);
                gvNotifications.DataBind();
                lblStatus.CssClass = "alert alert-success";
                lblStatus.Text = "✅ Here are your borrow request updates:";
            }
            else
            {
                lblStatus.CssClass = "alert alert-info";
                lblStatus.Text = "ℹ️ No updates found for your email.";
                gvNotifications.DataSource = null;
                gvNotifications.DataBind();
            }
        }
    }
}