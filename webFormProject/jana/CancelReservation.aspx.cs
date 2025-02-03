using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.jana
{
    public partial class CancelReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string reservationsPath = Server.MapPath("reservations.txt");
            string roomsPath = Server.MapPath("../sally/rooms.txt");

            string roomID = Request.QueryString["roomID"];
            string email = Request.QueryString["email"];

            if (!string.IsNullOrEmpty(roomID) && !string.IsNullOrEmpty(email))
            {
                if (File.Exists(reservationsPath) && File.Exists(roomsPath))
                {
                    var reservations = File.ReadAllLines(reservationsPath).ToList();
                    var rooms = File.ReadAllLines(roomsPath).ToList();

                    // Remove reservation
                    reservations.RemoveAll(r => r.StartsWith(roomID + "|") && r.Contains(email));

                    // Update room availability in rooms.txt
                    for (int i = 0; i < rooms.Count; i++)
                    {
                        string[] roomData = rooms[i].Split('|');
                        if (roomData[0] == roomID)
                        {
                            roomData[6] = "true"; // Set availability to true
                            rooms[i] = string.Join(",", roomData);
                            break;
                        }
                    }

                    // Save updated files
                    File.WriteAllLines(reservationsPath, reservations);
                    File.WriteAllLines(roomsPath, rooms);

                    Response.Redirect("ViewAndCancelReservation.aspx"); // Refresh reservations page
                }
            }
            else
            {
                Response.Write("<p>Invalid request.</p>");
            }
        }
    }
}