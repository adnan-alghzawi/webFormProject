using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.adnan
{
    public partial class ConfirmBorrow : System.Web.UI.Page
    {
        private string requestsFilePath;
        private string notificationsFilePath;
        private string historyFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            requestsFilePath = Server.MapPath("~/adnan/App_Data/BorrowRequests.txt");
            notificationsFilePath = Server.MapPath("~/adnan/App_Data/UserNotifications.txt");
            historyFilePath = Server.MapPath("~/adnan/App_Data/UserHistory.txt");

            if (!IsPostBack)
            {
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            if (!File.Exists(requestsFilePath)) return;

            List<dynamic> requests = new List<dynamic>();
            string[] lines = File.ReadAllLines(requestsFilePath);

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length < 7) continue;

                requests.Add(new
                {
                    Email = details[0],
                    UserName = details[1],
                    BookID = details[2],
                    BookName = details[3],
                    BorrowDate = details[4],
                    Duration = details[5],
                    Status = details[6]  // Pending, Approved, Rejected
                });
            }

            gvRequests.DataSource = requests.Where(r => r.Status == "Pending").ToList();
            gvRequests.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split('|');
            string email = args[0];
            string bookID = args[1];

            UpdateRequestStatus(email, bookID, "Approved");
            SendNotification(email, "✅ Your borrow request has been approved!");
            LogHistory(email, bookID, "Approved");

            LoadRequests();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split('|');
            string email = args[0];
            string bookID = args[1];

            UpdateRequestStatus(email, bookID, "Rejected");
            SendNotification(email, "❌ Your borrow request has been rejected.");
            LogHistory(email, bookID, "Rejected");

            LoadRequests();
        }

        private void UpdateRequestStatus(string email, string bookID, string status)
        {
            if (!File.Exists(requestsFilePath)) return;

            string[] lines = File.ReadAllLines(requestsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length < 7) continue;

                if (details[0] == email && details[2] == bookID)
                {
                    details[6] = status;
                }

                updatedLines.Add(string.Join("|", details));
            }

            File.WriteAllLines(requestsFilePath, updatedLines);
        }

        private void SendNotification(string email, string message)
        {
            string notification = email + "|" + message + "|" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            File.AppendAllText(notificationsFilePath, notification + Environment.NewLine);
        }

        private void LogHistory(string email, string bookID, string status)
        {
            string message = $"{DateTime.Now}: {status} | Email: {email} | Book ID: {bookID}";
            File.AppendAllText(historyFilePath, message + Environment.NewLine);
        }
    }
}
