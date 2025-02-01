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

        protected void SearchRoom_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("rooms.txt");

            if (!File.Exists(filePath))
            {
                lblMessage.Text = "⚠️ No books available.";
                return;
            }


            string[] rooms = File.ReadAllLines(filePath);
            bool roomFound = false;

            foreach (string room in rooms)
            {

                string[] details = room.Split(',');
                if (search.Text == details[0])
                {
                    image.Src = "imgs/" + details[4];
                    image.Visible = true;
                    roomName.Text = details[1];
                    type.SelectedValue = details[2].Trim();
                    Capacity.Text = details[3];
                    description.Text = details[5];
                    Available.SelectedValue = details[6];
                    roomFound = true;
                    lblMessage2.Visible=false;
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
            string filePath = Server.MapPath("rooms.txt");
            if (File.Exists(filePath))
            {
                string[] content = File.ReadAllLines(filePath);


                for (int i = 0; i < content.Length; i++)
                {
                    string[] room = content[i].Split(',');
                    if (room[0] == search.Text)
                    {
                        room[1] = roomName.Text;
                        room[2] = type.SelectedValue;
                        room[3] = Capacity.Text;
                        room[5] = description.Text;
                        room[6] = Available.SelectedValue;

                        content[i] = $"{room[0]},{room[1]},{room[2]},{room[3]},{room[4]},{room[5]},{room[6]}";

                        Response.Write("<script>alert('information changed!');</script>");

                        break;
                    }
                }
                File.WriteAllLines(filePath, content);
            }
            lblMessage.Text = "✅ Book updated successfully!";
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
                    string[] room = rooms[i].Split(',');
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
    }
}