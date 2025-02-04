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
        private string roomFilePath;
        private string historyFilePath = HttpContext.Current.Server.MapPath("~/adnan/App_Data/UserHistory.txt");
        protected void Page_Load(object sender, EventArgs e)
        {
            requestsFilePath = Server.MapPath("~/jana/reservations.txt");
            notificationsFilePath = Server.MapPath("~/adnan/App_Data/UserNotifications.txt");
            roomFilePath = Server.MapPath("rooms.txt");

            

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
            string RoomType = args[2];


            UpdateRequestStatus(RoomType,email, RoomID, "Approved");
            SendNotification(RoomType,RoomID, email, "✅ Your borrow request has been approved!");
            string[] rooms = File.ReadAllLines(roomFilePath);
            for (int i = 0; i < rooms.Length; i++)
            {
                string[] room = rooms[i].Split('|');
                if (room[0] == RoomID)
                {
                    room[6] = "false";
                    rooms[i] = $"{room[0]}|{room[1]}|{room[2]}|{room[3]}|{room[4]}|{room[5]}|{room[6]}";
                }

            }
            File.WriteAllLines(roomFilePath, rooms);
            LoadRequests();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btnReject = (Button)sender;
            string[] args = btnReject.CommandArgument.Split('|');
            string email = args[0];
            string RoomID = args[1];
            string RoomType = args[2];

            UpdateRequestStatus(RoomType, email, RoomID, "Rejected");
            SendNotification(RoomType,RoomID, email, "❌ Your borrow request has been rejected.");

            LoadRequests();
        }
        protected void logout_Click(object sender, EventArgs e)
        {

            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            Response.Redirect("~/jana/index.aspx");

        }

        protected void Dashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/AdminDash.aspx");
        }
        private void UpdateRequestStatus(string RoomType,string email, string RoomID, string status)
        {
            if (!File.Exists(requestsFilePath)) return;

            string[] lines = File.ReadAllLines(requestsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length < 8) continue;

                if (details[3] == email && details[0] == RoomID)
                {
                    details[8] = status;
                    LogHistory(RoomType,email,RoomID , status);
                }

                updatedLines.Add(string.Join("|", details));
            }

            File.WriteAllLines(requestsFilePath, updatedLines);
        }
        private void SendNotification(string RoomType,string RoomID , string email, string message)
        {
            string notification = RoomType+"|"+ email + "|" + message + "|" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            File.AppendAllText(notificationsFilePath, notification + Environment.NewLine);
        }
        private void LogHistory(string RoomType, string email, string RoomID, string status)
        {
            string logEntry = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} - Status: {status} | Email: {email} | Room ID: {RoomID}| Room Name: {RoomType}";
            File.AppendAllText(historyFilePath, logEntry + Environment.NewLine);
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomAdmin.aspx");
        }

        protected void editB_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ShowBooks.aspx");
        }

        protected void editR_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomAdmin.aspx");
        }

        protected void Reservations_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmReservation.aspx");
        }

        protected void Borrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ConfirmBorrow.aspx");
        }
    }
}