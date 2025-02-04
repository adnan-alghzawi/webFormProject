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

            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            string s = File.ReadAllText(filepath);
            if (s == "\"\"")
            {
                buttons.Visible = true;
                buttons2.Visible = false;
                books.Visible = false;
                rooms.Visible = false;
            }
            else
            {
                buttons.Visible = false;
                buttons2.Visible = true;
                books.Visible = true;
                rooms.Visible = true;
            }


            string filePath = Server.MapPath("../sally/rooms.txt");
            string reservationPath = Server.MapPath("reservations.txt");

            if (File.Exists(filePath))
            {
                var fileContent = File.ReadAllLines(filePath);
                StringBuilder card = new StringBuilder();

                foreach (var line in fileContent)
                {
                    string[] columns = line.Split('|');
                    string roomID = columns[0].Trim();
                    string imgPath = "../sally/imgs/" + columns[4];

                    bool hasApprovedReservation = false;
                    bool hasOnlyPendingReservation = false;
                    bool hasAnyReservation = false;

                    if (File.Exists(reservationPath))
                    {
                        var reservations = File.ReadAllLines(reservationPath);
                        foreach (var res in reservations)
                        {
                            string[] resData = res.Split('|');
                            if (resData[0].Trim() == roomID)
                            {
                                hasAnyReservation = true; // The room has at least one reservation

                                if (resData[8].Trim().ToLower() == "approved")
                                {
                                    hasApprovedReservation = true;
                                    break; // No need to check further, the room is confirmed as reserved
                                }
                                else if (resData[8].Trim().ToLower() == "pending")
                                {
                                    hasOnlyPendingReservation = true;
                                }
                            }
                        }
                    }

                    card.Append("<div class='card' style='width: 18rem;'>"); // Keeps same width
                    card.AppendFormat("<img class='card-img-top' src='{0}' alt='Room Image'>", imgPath);
                    card.Append("<div class='card-body'>");
                    card.AppendFormat("<h5 class='card-title'>{0} &nbsp;&nbsp;&nbsp;&nbsp; {1} person</h5>", columns[1].Trim(), columns[3].Trim());
                    card.AppendFormat("<p class='card-text'><b>Type:</b> {0}<br/>" +
                     "<b>Description:</b> {1} </br></br> "
                    , columns[2].Trim(), columns[5].Trim());

                    if (hasApprovedReservation)
                    {
                        // If at least one "Approved" reservation exists, show "Reserved" and "Cancel"
                        card.Append("<button class='btn btn-secondary' disabled>Reserved</button>");
                        card.AppendFormat("<a href='CancelReservation.aspx?roomID={0}' class='btn btn-danger'>Cancel</a>", columns[0].Trim());
                    }
                    else if ((hasAnyReservation || hasOnlyPendingReservation))
                    {
                        // If all reservations for this room are "Pending", allow reservation
                        card.AppendFormat("<a href='ReservationForm.aspx?roomID={0}&roomType={1}' class='btn' style='background-color: #22333B; color: white;'>Reserve</a>", columns[0].Trim(), columns[2].Trim());
                    }
                    else if (!hasAnyReservation)
                    {
                        // No reservations exist, allow reservation
                        card.AppendFormat("<a href='ReservationForm.aspx?roomID={0}&roomType={1}' class='btn' style='background-color: #22333B; color: white;'>Reserve</a>", columns[0].Trim(), columns[2].Trim());
                    }

                    card.Append("</div>");
                    card.Append("</div>");
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
                    string[] columns = line.Split('|');
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
                             "<b>Description:</b> {1} </br></br> "
                            , columns[2].Trim(), columns[5].Trim());


                            // Button is enabled and links to reservation form
                            card.AppendFormat("<a href='ReservationForm.aspx?roomID={0}&roomType={1}' class='btn' style='background-color: #22333B; color: white;'>Reserve</a>", columns[0].Trim(), columns[2].Trim());



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
            Response.Redirect("../jana/index.aspx");
        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("../sally/aboutUs.aspx");
        }

        protected void contactTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("../suleiman/contactUs.aspx");
        }

        protected void books_Click(object sender, EventArgs e)
        {
            Response.Redirect("../nada/show_books.aspx");
        }

        protected void rooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("../jana/ViewRooms.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/LogIn.aspx");
        }

        protected void rigester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");

        }
        protected void prof_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/profile.aspx");

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            Response.Redirect("~/jana/index.aspx");

        }


        protected void homeTab_Click1(object sender, EventArgs e)
        {

        }

        protected void aboutTab_Click1(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click1(object sender, EventArgs e)
        {

        }

        protected void books_Click1(object sender, EventArgs e)
        {

        }

        protected void rooms_Click1(object sender, EventArgs e)
        {

        }

        

        

        
    }
}