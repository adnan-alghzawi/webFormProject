using System;
using System.Collections.Generic;
using System.Web.Services;
using System.IO;
using System.Globalization;

namespace webFormProject.sally
{
    public partial class AdminDash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path1 = Server.MapPath("~/adnan/App_Data/Books.txt");
            string path2 = Server.MapPath("~/hazem/data/Hazem.txt");
            string path3 = Server.MapPath("~/sally/rooms.txt");
            string path4 = Server.MapPath("~/jana/reservations.txt");
            string path5 = Server.MapPath("~/nada/borrow_book_request.txt");
            string[] books = File.ReadAllLines(path1);
            booksNum.Text = books.Length.ToString();
            string[] users = File.ReadAllLines(path2);
            usersNum.Text = users.Length.ToString();
            string[] Rooms = File.ReadAllLines(path3);
            RoomsNum.Text = Rooms.Length.ToString();

            string[] reservation = File.ReadAllLines(path4);
            string[] boroow = File.ReadAllLines(path5);
            int avaConut = 0, unavaCount = 0;

            for (int i = 0; i < reservation.Length; i++)
            {
                string[] req = reservation[i].Split('|');
                if (req[8] == "Approved")
                {
                    string requestDateTimeStr = req[5] + ' ' + req[6];
                    DateTime requestDateTime;

                    if (DateTime.TryParseExact(requestDateTimeStr, "yyyy-MM-dd HH:mm",
                                               CultureInfo.InvariantCulture,
                                               DateTimeStyles.None, out requestDateTime))
                    {
                        if (requestDateTime == DateTime.Now)
                        {
                            for (int j = 0; j < Rooms.Length; j++)
                            {
                                string[] room = Rooms[i].Split('|');
                                if (room[0].Trim() == req[0])
                                {
                                    room[6] = "true";
                                    string newRoom = $"{room[0]}|{room[1]}|{room[2]}|{room[3]}|{room[4]}|{room[5]}|{room[6]}";
                                    Rooms[i] = newRoom;
                                }
                            }
                        }
                        File.WriteAllLines(path3, Rooms);

                    }
                }
            }

            for (int i = 0; i < Rooms.Length; i++)
            {
                string[] room = Rooms[i].Split('|');
                if (room[6].Trim().ToLower() == "true")
                {
                    avaConut++;
                }
                else
                {
                    unavaCount++;
                }
            }
            avaRoom.Text = avaConut.ToString();
            unavaroom.Text = unavaCount.ToString();

            int avaConut1 = 0, unavaCount2 = 0;

            for (int i = 0; i < books.Length; i++)
            {
                string[] book = books[i].Split('|');
                if (book[6].Trim() == "Available")
                {
                    avaConut1++;
                }
                else
                {
                    unavaCount2++;
                }
            }

            avaBooks.Text = avaConut1.ToString();
            Borrow1.Text = unavaCount2.ToString();



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

        protected void goToBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ShowBooks.aspx");
        }

        protected void goToRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomAdmin.aspx");
        }

        protected void feedbacks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/suleiman/feedbackAdmin.aspx");
        }
    }
}
