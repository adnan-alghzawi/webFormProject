using System;
using System.Collections.Generic;
using System.Web.Services;
using System.IO;

namespace webFormProject.sally
{
    public partial class AdminDash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path1 = Server.MapPath("~/adnan/App_Data/Books.txt");
            string path2 = Server.MapPath("~/hazem/data/Hazem.txt");
            string path3 = Server.MapPath("~/sally/rooms.txt");
            string[] books = File.ReadAllLines(path1);
            booksNum.Text = books.Length.ToString();
            string[] users = File.ReadAllLines(path2);
            usersNum.Text = users.Length.ToString();
            string[] Rooms = File.ReadAllLines(path3);
            RoomsNum.Text = Rooms.Length.ToString();

            int avaConut=0 , unavaCount =0;

            for (int i = 0; i < Rooms.Length; i++)
            {
                string[] room = Rooms[i].Split(',');
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

        protected void editB_Click(object sender, EventArgs e)
        {

        }

        protected void editR_Click(object sender, EventArgs e)
        {

        }

        protected void Reservations_Click(object sender, EventArgs e)
        {

        }

        protected void Borrow_Click(object sender, EventArgs e)
        {

        }
    }
}
