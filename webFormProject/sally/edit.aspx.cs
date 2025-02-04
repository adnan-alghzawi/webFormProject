using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;

namespace webFormProject.sally
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string roomId = Request.QueryString["roomId"];
                if (!string.IsNullOrEmpty(roomId))
                {
                    LoadRoomData(roomId);
                }
            }
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

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomAdmin.aspx");
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

        protected void LoadRoomData(string roomid)
        {
            string filePath = Server.MapPath("rooms.txt");

            if (!File.Exists(filePath))
            {
                lblMessage.Text = "⚠️ No rooms available.";
                return;
            }

            search.Text = roomid;

            string[] rooms = File.ReadAllLines(filePath);
            bool roomFound = false;

            foreach (string room in rooms)
            {

                string[] details = room.Split('|');
                if (roomid == details[0])
                {
                    image.Src = "imgs/" + details[4];
                    image.Visible = true;
                    roomName.Text = details[1];
                    type.SelectedValue = details[2].Trim();
                    Capacity.Text = details[3];
                    description.Text = details[5];
                    Available.SelectedValue = details[6];
                    roomFound = true;
                    lblMessage2.Visible = false;
                    break;
                }

            }
            if (!roomFound)
            {

                lblMessage2.Text = "⚠️ No room with this id.";
                lblMessage2.Visible = true;
                image.Src = "";
                image.Visible = false;
                roomName.Text = "";
                type.SelectedIndex = 0;
                Capacity.Text = "";
                description.Text = "";
                Available.SelectedIndex = 0;

            }
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string roomId = Request.QueryString["roomId"];
            string filePath = Server.MapPath("rooms.txt");

            if (File.Exists(filePath))
            {
                var fileContent = File.ReadAllLines(filePath).ToList();

                for (int i = 0; i < fileContent.Count; i++)
                {
                    string[] columns = fileContent[i].Split('|');
                    if (columns[0].Trim() == roomId)
                    {
                        columns[1] = roomName.Text;
                        columns[2] = type.SelectedValue;
                        columns[3] = Capacity.Text;
                        columns[5] = description.Text;
                        columns[6] = Available.SelectedValue;

                        fileContent[i] = string.Join("|", columns);
                        break;
                    }
                }

                File.WriteAllLines(filePath, fileContent);
                lblMessage.Text = "Room updated successfully!";
            }
        }


        protected void delete_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("rooms.txt");
            if (File.Exists(filePath))
            {
                string[] rooms = File.ReadAllLines(filePath);
                List<string> list = new List<string>();

                for (int i = 0; i < rooms.Length; i++)
                {
                    string[] room = rooms[i].Split('|');
                    if (room[0].Trim() == search.Text.Trim())
                    {
                        continue;
                    }
                    else
                    {
                        list.Add(rooms[i]);
                    }
                }
                File.WriteAllText(filePath, "");
                File.WriteAllLines(filePath, list.ToArray());
                lblMessage.Text = "✅ Book Deleted successfully!";
                lblMessage2.Visible = true;
                image.Src = "";
                image.Visible = false;
                roomName.Text = "";
                type.SelectedIndex = 0;
                Capacity.Text = "";
                description.Text = "";
                Available.SelectedIndex = 0;
                // تحديث الصفحة بعد الحذف
            }

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

        protected void Capacity_TextChanged(object sender, EventArgs e)
        {
            if (int.Parse(Capacity.Text) > 1)
            {
                type.SelectedIndex = 1;
            }
        }
    }
}