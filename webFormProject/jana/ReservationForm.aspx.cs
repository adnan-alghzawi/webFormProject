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
            string filePath = Server.MapPath("reservations.txt");
            string roomId = roomID.Text.Trim();
            string roomTypeText = roomType.Text.Trim();
            string fullNameText = fullName.Text.Trim();
            string emailText = email.Text.Trim();
            string phoneNumberText = phoneNumber.Text.Trim();
            string reservationDateText = reservationDate.Text.Trim();
            string startTimeText = startTime.Text.Trim();
            string endTimeText = endTime.Text.Trim();

            if (string.IsNullOrEmpty(roomId) || string.IsNullOrEmpty(roomTypeText) ||
                string.IsNullOrEmpty(fullNameText) || string.IsNullOrEmpty(emailText) ||
                string.IsNullOrEmpty(phoneNumberText) || string.IsNullOrEmpty(reservationDateText) ||
                string.IsNullOrEmpty(startTimeText) || string.IsNullOrEmpty(endTimeText))
            {
                ShowAlert("Please fill in all fields!");
                return;
            }

            bool isAvailable = true;

            if (File.Exists(filePath))
            {
                string[] reservations = File.ReadAllLines(filePath);
                foreach (var reservation in reservations)
                {
                    string[] details = reservation.Split('|');

                    if (details.Length >= 8)
                    {
                        string existingRoomId = details[0].Trim();
                        string existingDate = details[5].Trim();
                        string existingStartTime = details[6].Trim();
                        string existingEndTime = details[7].Trim();

                        if (existingRoomId == roomId && existingDate == reservationDateText)
                        {
                            TimeSpan newStart = TimeSpan.Parse(startTimeText);
                            TimeSpan newEnd = TimeSpan.Parse(endTimeText);
                            TimeSpan existingStart = TimeSpan.Parse(existingStartTime);
                            TimeSpan existingEnd = TimeSpan.Parse(existingEndTime);

                            if ((newStart >= existingStart && newStart < existingEnd) ||
                                (newEnd > existingStart && newEnd <= existingEnd) ||
                                (newStart <= existingStart && newEnd >= existingEnd))
                            {
                                isAvailable = false;
                                break;
                            }
                        }
                    }
                }
            }

            if (isAvailable)
            {
                string newReservation = $"{roomId}|{roomTypeText}|{fullNameText}|{emailText}|{phoneNumberText}|{reservationDateText}|{startTimeText}|{endTimeText}|Pending";
                File.AppendAllText(filePath, newReservation + Environment.NewLine);

                ShowAlert("Reservation successful!", true);
            }
            else
            {
                ShowAlert("The selected time is already booked. Please choose another time.");
            }
            Response.Redirect("ViewRooms.aspx");
            
        }

        private void ShowAlert(string message, bool isSuccess = false)
        {
            string script = $@"
        Swal.fire({{
            title: '{(isSuccess ? "Success!" : "Error!")}',
            text: '{message}',
            icon: '{(isSuccess ? "success" : "error")}',
            confirmButtonText: 'OK'
        }});
    ";

            if (isSuccess)
            {
                script += "setTimeout(function(){ window.location.href=window.location.href; }, 2000);"; // Reload page after 2 seconds
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
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
            buttons.Visible = true;
            buttons2.Visible = false;
            books.Visible = false;
            rooms.Visible = false;
        }

    }
}