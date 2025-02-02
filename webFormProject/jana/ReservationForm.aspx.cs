using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace webFormProject.jana
{
    public partial class ReservationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // فقط عند تحميل الصفحة لأول مرة
            {
                if (Request.QueryString["roomID"] != null)
                {
                    roomID.Text = Request.QueryString["roomID"]; // وضع Room ID في التكست بوكس
                }
                if (Request.QueryString["roomType"] != null)
                {
                    roomType.Text = Request.QueryString["roomType"]; // وضع Room Type في التكست بوكس
                }
            }

        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            // Get data from form
            string roomId = roomID.Text;
            string RoomType = roomType.Text;
            string FullName = fullName.Text;
            string Email = email.Text;
            string PhoneNumber = phoneNumber.Text;
            string Date = reservationDate.Text;
            string StartTime = startTime.Text;

            // Calculate end time (2 hours later)
            DateTime startDateTime = DateTime.Parse(StartTime);
            string endTime = startDateTime.AddHours(2).ToString("HH:mm");

            // Save to reservations.txt
            string filePath = Server.MapPath("reservations.txt");
            if (!File.Exists(filePath))
            {
                using (File.Create(filePath)) { }
            }
            string reservationData = $"{roomId}|{RoomType}|{FullName}|{Email}|{PhoneNumber}|{Date}|{StartTime}|{endTime}|Pending";
            
                File.AppendAllText(filePath, reservationData + Environment.NewLine);

                // Mark room as "Not Available"
                UpdateRoomAvailability(roomId, false);

                // Show confirmation message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Reservation request sent. Waiting for admin approval.');", true);
            Response.Redirect("ViewRooms.aspx");
            
        }

        private void UpdateRoomAvailability(string roomId, bool isAvailable)
        {
            string filePath = Server.MapPath("../sally/rooms.txt");
            string[] lines = File.ReadAllLines(filePath);

            for (int i = 0; i < lines.Length; i++)
            {
                string[] columns = lines[i].Split(',');
                if (columns[0] == roomId)
                {
                    columns[columns.Length - 1] = isAvailable ? "true" : "false";
                    lines[i] = string.Join(",", columns);
                    break;
                }
            }

            File.WriteAllLines(filePath, lines);
        }


        protected void startTime_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(startTime.Text))
            {
                // Parse the input time
                DateTime startTimeValue;
                if (DateTime.TryParse(startTime.Text, out startTimeValue))
                {
                    // Add 2 hours to the start time
                    DateTime endTimeValue = startTimeValue.AddHours(2);

                    // Set the end time textbox value
                    endTime.Text = endTimeValue.ToString("HH:mm");
                }
            }
        }
    }
}