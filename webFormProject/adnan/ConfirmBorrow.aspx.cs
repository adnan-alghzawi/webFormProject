using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.adnan
{
    public partial class ConfirmBorrow : System.Web.UI.Page
    {
        private string requestsFilePath = HttpContext.Current.Server.MapPath("~/nada/borrow_book_request.txt");
        private string notificationsFilePath = HttpContext.Current.Server.MapPath("~/adnan/App_Data/UserNotifications.txt");
        private string historyFilePath = HttpContext.Current.Server.MapPath("~/adnan/App_Data/UserHistory.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            List<dynamic> requests = new List<dynamic>();
            string[] lines = File.Exists(requestsFilePath) ? File.ReadAllLines(requestsFilePath) : new string[0];

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length >= 10)
                {
                    requests.Add(new
                    {
                        Email = details[3],
                        UserName = details[2],
                        BookID = details[0],
                        BookName = details[1],
                        BorrowDate = details[5] + " at " + details[6],
                        ReturnDate = details[7] + " at " + details[8],
                        Status = details[9]
                    });
                }
            }

            gvRequests.DataSource = requests.Where(r => r.Status == "Pending").ToList();
            gvRequests.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateStatus(sender, "Approved");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateStatus(sender, "Rejected");
        }

        private void UpdateStatus(object sender, string status)
        {
            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split('|');
            string email = args[0];
            string bookID = args[1];

            UpdateRequestStatus(email, bookID, status);
            SendNotification(email, status == "Approved" ? "✅ Your borrow request has been approved!" : "❌ Your borrow request has been rejected.");
            LogHistory(email, bookID, status);

            LoadRequests();
        }

        private void UpdateRequestStatus(string email, string bookID, string status)
        {
            string[] lines = File.ReadAllLines(requestsFilePath);
            for (int i = 0; i < lines.Length; i++)
            {
                string[] details = lines[i].Split('|');
                if (details[0] == bookID && details[3] == email)
                {
                    details[9] = status; // Update the status
                    lines[i] = string.Join("|", details);
                }
            }

            File.WriteAllLines(requestsFilePath, lines);
        }

        private void SendNotification(string email, string message)
        {
            string notification = $"{email}|{message}|{DateTime.Now:yyyy-MM-dd HH:mm:ss}";
            File.AppendAllText(notificationsFilePath, notification + Environment.NewLine);
        }

        private void LogHistory(string email, string bookID, string status)
        {
            string message = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss}: {status} | Email: {email} | Book ID: {bookID}";
            File.AppendAllText(historyFilePath, message + Environment.NewLine);
        }
    }
}
