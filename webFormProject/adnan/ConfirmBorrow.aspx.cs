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
        public string requestsFilePath = HttpContext.Current.Server.MapPath("~/nada/borrow_book_request.txt");
        public string notificationsFilePath = HttpContext.Current.Server.MapPath("~/adnan/App_Data/UserNotifications.txt");
        public string historyFilePath = HttpContext.Current.Server.MapPath("~/adnan/App_Data/UserHistory.txt");

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

            if (File.Exists(requestsFilePath))
            {
                string[] lines = File.ReadAllLines(requestsFilePath);
                foreach (string line in lines)
                {
                    string[] details = line.Split('|');
                    if (details.Length >= 10 && details[9].Trim('"') == "Pending")
                    {
                        requests.Add(new
                        {
                            Email = details[3],
                            UserName = details[2],
                            BookID = details[0],
                            BookName = details[1],
                            BorrowDate = $"{details[5]} at {details[6]}",
                            Duration = $"{details[7]} at {details[8]}",
                            Status = details[9].Trim('"')
                        });
                    }
                }
            }

            gvRequests.DataSource = requests;
            gvRequests.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateRequestStatus(sender, "Approved");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateRequestStatus(sender, "Rejected");
        }

        private void UpdateRequestStatus(object sender, string newStatus)
        {
            Button btn = (Button)sender;
            string commandArgs = btn.CommandArgument;
            string[] args = commandArgs.Split('|');
            string email = args[0];
            string bookId = args[1];

            if (File.Exists(requestsFilePath))
            {
                string[] lines = File.ReadAllLines(requestsFilePath);
                for (int i = 0; i < lines.Length; i++)
                {
                    string[] details = lines[i].Split('|');
                    if (details.Length >= 10 && details[0] == bookId && details[3] == email)
                    {
                        details[9] = $"\"{newStatus}\""; // تحديث الحالة
                        lines[i] = string.Join("|", details);
                        LogHistory(email, details[1], newStatus);
                        SendNotification(email, newStatus == "Approved"
                            ? "✅ Your borrow request has been approved!"
                            : "❌ Your borrow request has been rejected.");
                        break;
                    }
                }

                File.WriteAllLines(requestsFilePath, lines);
                LoadRequests(); // تحديث الجدول بعد التعديل
            }
        }

        private void LogHistory(string email, string bookName, string status)
        {
            string logEntry = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} - Status: {status} | User: {email} | Book: {bookName}";

            if (!File.Exists(historyFilePath))
            {
                using (File.Create(historyFilePath)) { }
            }

            File.AppendAllText(historyFilePath, logEntry + Environment.NewLine);
        }

        private void SendNotification(string email, string message)
        {
            string notification = $"{email}|{message}|{DateTime.Now:yyyy-MM-dd HH:mm:ss}";

            if (!File.Exists(notificationsFilePath))
            {
                using (File.Create(notificationsFilePath)) { }
            }

            File.AppendAllText(notificationsFilePath, notification + Environment.NewLine);
        }
    }
}
