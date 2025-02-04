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
        private string historyFilePath = HttpContext.Current.Server.MapPath("~/adnan/App_Data/UserHistory.txt"); // Path for the history file

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
            string[] lines = File.ReadAllLines(requestsFilePath);

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length >= 10) // Ensuring there are enough elements in the split array
                {
                    requests.Add(new
                    {
                        Email = details[3],
                        UserName = details[2],
                        BookID = details[0],
                        BookName = details[1],
                        BorrowDate = $"{details[5]} at {details[6]}",
                        Duration = $"{details[7]} at {details[8]}",
                        Status = details[9].Trim('"')  // Removing any potential extra quotes
                    });
                }
            }

            gvRequests.DataSource = requests.Where(r => r.Status == "Pending").ToList();
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
            string BookName = args[2];

            string[] lines = File.ReadAllLines(requestsFilePath);
            for (int i = 0; i < lines.Length; i++)
            {
                string[] details = lines[i].Split('|');
                if (details[0] == bookId && details[3] == email)
                {
                    details[9] = $"\"{newStatus}\""; // Update the status, ensuring to maintain the format
                    lines[i] = string.Join("|", details);
                    LogHistory(BookName,email, bookId, newStatus); // Log the action in the history file
                }
            }

            File.WriteAllLines(requestsFilePath, lines);
            LoadRequests(); // Refresh the GridView
            SendNotification(BookName, email, newStatus == "Approved" ? "✅ Your reservation request has been approved!" : "❌ Your reservation request has been rejected.");
        }

        private void LogHistory(string BookName,string email, string bookId, string status)
        {
            string logEntry = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} - Status: {status} | Email: {email} | Book ID: {bookId}| Book Name: {BookName}";
            File.AppendAllText(historyFilePath, logEntry + Environment.NewLine);
        }

        private void SendNotification(string BookName,string email, string message )
        {
            string notification = $"{BookName}|{email}|{message}|{DateTime.Now:yyyy-MM-dd HH:mm:ss}";
            File.AppendAllText(notificationsFilePath, notification + Environment.NewLine);
        }
        protected void editB_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ShowBooks.aspx");
        }

        protected void editR_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/RoomAdmin.aspx");
        }

        protected void Reservations_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/ConfirmReservation.aspx");
        }

        protected void Borrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ConfirmBorrow.aspx");
        }
        protected void dash_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/AdminDash.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            Response.Redirect("~/jana/index.aspx");
        }
    }
}
