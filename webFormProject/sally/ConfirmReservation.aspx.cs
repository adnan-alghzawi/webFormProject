using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.sally
{
    public partial class ConfirmReservation : System.Web.UI.Page
    {
        private string requestsFilePath;
        private string notificationsFilePath;
        protected void Page_Load(object sender, EventArgs e)
        {
            requestsFilePath = Server.MapPath("~/sally/reservations.txt");
            notificationsFilePath = Server.MapPath("~/adnan/App_Data/UserNotifications.txt");

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
                string[] details = line.Split(',');
                if (details.Length < 8) continue;

                requests.Add(new
                {
                    Email = details[3],
                    UserName = details[2],
                    RoomID = details[0],
                    RoomType = details[1],
                    BorrowDate = details[5]+" "+ details[6],
                    Duration = details[7],
                    Status = details[8]  // Pending, Approved, Rejected
                });
            }

            gvRequests.DataSource = requests.Where(r => r.Status == "Pending").ToList();
            gvRequests.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Button btnApprove = (Button)sender;
            string[] args = btnApprove.CommandArgument.Split('|');
            string email = args[0];
            string RoomID = args[1];

            UpdateRequestStatus(email, RoomID, "Approved");
            SendNotification(email, "✅ Your borrow request has been approved!");

            LoadRequests();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btnReject = (Button)sender;
            string[] args = btnReject.CommandArgument.Split('|');
            string email = args[0];
            string RoomID = args[1];

            UpdateRequestStatus(email, RoomID, "Rejected");
            SendNotification(email, "❌ Your borrow request has been rejected.");

            LoadRequests();
        }
        private void UpdateRequestStatus(string email, string RoomID, string status)
        {
            if (!File.Exists(requestsFilePath)) return;

            string[] lines = File.ReadAllLines(requestsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] details = line.Split(',');
                if (details.Length < 8) continue;

                if (details[3] == email && details[0] == RoomID)
                {
                    details[8] = status;
                }

                updatedLines.Add(string.Join(",", details));
            }

            File.WriteAllLines(requestsFilePath, updatedLines);
        }
        private void SendNotification(string email, string message)
        {
            string notification = email + "|" + message + "|" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            File.AppendAllText(notificationsFilePath, notification + Environment.NewLine);
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomAdmin.aspx");
        }
    }
}