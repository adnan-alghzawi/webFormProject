using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.jana
{
    public partial class ViewAndCancelReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string reservationsPath = Server.MapPath("reservations.txt");
            string roomsPath = Server.MapPath("../sally/rooms.txt");

            if (File.Exists(reservationsPath) && File.Exists(roomsPath))
            {
                var reservations = File.ReadAllLines(reservationsPath);
                var rooms = File.ReadAllLines(roomsPath);
                StringBuilder reservationsHtml = new StringBuilder();

                reservationsHtml.Append("<div class='reservations-container'>");

                foreach (var line in reservations)
                {
                    string[] columns = line.Split('|');

                    if (columns.Length >= 9)
                    {
                        string roomID = columns[0];
                        string roomType = columns[1];
                        string name = columns[2];
                        string email = columns[3];
                        string phone = columns[4];
                        string date = columns[5];
                        string startTime = columns[6];
                        string endTime = columns[7];
                        string status = columns[8];

                        // Find room image
                        string imageUrl = "../sally/imgs/default.jpg"; // Default image
                        var room = rooms.FirstOrDefault(r => r.StartsWith(roomID + ","));
                        if (room != null)
                        {
                            string[] roomData = room.Split(',');
                            if (roomData.Length >= 6)
                            {
                                imageUrl = $"../sally/imgs/{roomData[4].Trim()}"; // Room image
                            }
                        }

                        reservationsHtml.AppendFormat(@"
                        <div class='reservation-card'>
                            <div class='room-photo'>
                                <img src='{0}' alt='Room {1}' />
                            </div>
                            <div class='reservation-info'>
                                <h3>{2}</h3>
                                <p><b>Room Type:</b> {3}</p>
                                <p><b>Name:</b> {4}</p>
                                <p><b>Email:</b> {5}</p>
                                <p><b>Phone:</b> {6}</p>
                                <p><b>Date:</b> {7}</p>
                                <p><b>Time:</b> {8} - {9}</p>
                                <p><b>Status:</b> {10}</p>
                                <a href='CancelReservation.aspx?roomID={1}&email={5}' class='cancel-btn'>Cancel</a>
                            </div>
                        </div>
                    ", imageUrl, roomID, roomType, roomType, name, email, phone, date, startTime, endTime, status);
                    }
                }

                reservationsHtml.Append("</div>");
                ReservationsContent.Text = reservationsHtml.ToString();
            }
            else
            {
                ReservationsContent.Text = "<p>No reservations found.</p>";
            }
        }
    
}
}