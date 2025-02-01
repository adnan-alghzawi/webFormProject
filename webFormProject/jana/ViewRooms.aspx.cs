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
    public partial class ViewRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("../sally/rooms.txt");
            if (File.Exists(filePath))
            {
                var fileContent = File.ReadAllLines(filePath);
                StringBuilder card = new StringBuilder();


                foreach (var line in fileContent)
                {
                    string[] columns = line.Split(',');
                    string imgPath = "../sally/imgs/" + columns[4];
                    bool isAvailable = false;

                    if (columns.Length >= 7)
                    {
                        isAvailable = columns[6].Trim().ToLower() == "true";
                        card.Append("<div class='card' style='width: 18rem;'>"); // Keeps same width
                        card.AppendFormat("<img class='card-img-top' src='{0}' alt='Room Image'>", imgPath);
                        card.Append("<div class='card-body'>");
                        card.AppendFormat("<h5 class='card-title'>{0} &nbsp;&nbsp;&nbsp;&nbsp; {1} person</h5>", columns[1].Trim(), columns[3].Trim());
                        card.AppendFormat("<p class='card-text'><b>Type:</b> {0}<br/>" +
                            "<b>Description:</b> {1}<br/>" +
                            "<b>Available:</b> {2}</p>", columns[2].Trim(), columns[5].Trim(), columns[6].Trim().ToLower() == "true" ? "Yes" : "No");

                        if (isAvailable)
                        {
                            // Button is enabled and links to reservation form
                            card.AppendFormat("<a href='ReservationForm.aspx?roomID={0}&roomType={1}' class='btn' style='background-color: #22333B; color: white;'>Reserve</a>", columns[0].Trim(), columns[2].Trim(), isAvailable ? "Yes" : "No");
                        }
                        else
                        {
                            // Button is disabled and shows "Not Available"
                            card.Append("<button class='btn' style='background-color: #ccc; color: white;' disabled>Reserve</button>");
                        }

                        card.Append("</div>");
                        card.Append("</div>"); // Ends the card
                    }
                }

                Cards.InnerHtml = card.ToString();
            }
           
        }

        
        protected void SearchRoom_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("../sally/rooms.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                StringBuilder card = new StringBuilder();
                string searchQuery = search.Text.Trim().ToLower();

                bool showAllRooms = string.IsNullOrEmpty(searchQuery) || searchQuery == "all rooms";
                bool found = false;

                card.Append("<div class='d-flex gap-2 flex-wrap'>"); // Keeps the same structure

                foreach (var line in lines)
                {
                    string[] columns = line.Split(',');
                    if (columns.Length >= 7) // Ensure valid data
                    {
                        string roomType = columns[2].Trim().ToLower();
                        string roomName = columns[1].Trim().ToLower();
                        string imgPath = "../sally/imgs/" + columns[4].Trim();

                        // ✅ Correctly set isAvailable based on column 6
                        bool isAvailable = columns[6].Trim().ToLower() == "true";

                        // Show all rooms or filter based on type or name
                        if (showAllRooms || roomType.Equals(searchQuery) || roomName.Equals(searchQuery))
                        {
                            found = true;

                            card.Append("<div class='card' style='width: 18rem;'>"); // Keeps same width
                            card.AppendFormat("<img class='card-img-top' src='{0}' alt='Room Image'>", imgPath);
                            card.Append("<div class='card-body'>");
                            card.AppendFormat("<h5 class='card-title'>{0} &nbsp;&nbsp;&nbsp;&nbsp; {1} person</h5>", columns[1].Trim(), columns[3].Trim());
                            card.AppendFormat("<p class='card-text'><b>Type:</b> {0}<br/>" +
                                "<b>Description:</b> {1}<br/>" +
                                "<b>Available:</b> {2}</p>", columns[2].Trim(), columns[5].Trim(), isAvailable ? "Yes" : "No");

                            if (isAvailable)
                            {
                                // ✅ Button is enabled if available
                                card.AppendFormat("<a href='ReservationForm.aspx?roomID={0}&roomType={1}' class='btn' style='background-color: #22333B; color: white;'>Reserve</a>",
                                    columns[0].Trim(), columns[2].Trim());
                            }
                            else
                            {
                                // ❌ Button is disabled if unavailable
                                card.Append("<button class='btn' style='background-color: #ccc; color: white;' disabled>Not Available</button>");
                            }

                            card.Append("</div>");
                            card.Append("</div>"); // Ends the card
                        }
                    }
                }

                card.Append("</div>"); // Ends the flex container

                // Replace content, keeping the same structure
                Cards.InnerHtml = found ? card.ToString() : "<p>No matching rooms found.</p>";
            }
            else
            {
                Cards.InnerHtml = "<p>Rooms file not found.</p>";
            }


        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void homeTab_Click(object sender, EventArgs e)
        {

        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click(object sender, EventArgs e)
        {

        }

        protected void books_Click(object sender, EventArgs e)
        {

        }

        protected void rooms_Click(object sender, EventArgs e)
        {

        }
    }
}