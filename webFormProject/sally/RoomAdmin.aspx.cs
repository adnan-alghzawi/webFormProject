using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Remoting.Contexts;

namespace webFormProject.sally
{
    public partial class RoomAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRooms();
            }
        }

        public class Room
        {
            public int ID { get; set; }
            public string Name { get; set; }
            public string RoomType { get; set; }
            public int Capacity { get; set; }
            public string Description { get; set; }
            public string ImagePath { get; set; }
            public bool IsAvailable { get; set; }
        }

        private const string FilePath = "~/sally/rooms.txt";

        private void LoadRooms(string FilePath= "~/sally/rooms.txt")
        {
            string filePath = Server.MapPath(FilePath);
            if (File.Exists(filePath))
            {
                var fileContent = File.ReadAllLines(filePath);
                var rooms = new List<Room>();

                foreach (var line in fileContent)
                {
                    var columns = line.Split('|');
                    if (columns.Length >= 7)
                    {
                        rooms.Add(new Room
                        {
                            ID = int.Parse(columns[0]),
                            Name = columns[1],
                            RoomType = columns[2],
                            Capacity = int.Parse(columns[3]),
                            Description = columns[5],
                            ImagePath = "imgs/" + columns[4],
                            IsAvailable = columns[6].Trim().ToLower() == "true"
                        });
                    }
                }

                gvRooms.DataSource = rooms;
                gvRooms.DataBind();
            }
        }

        protected void gvRooms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int roomId = Convert.ToInt32(gvRooms.DataKeys[rowIndex].Value);

            if (e.CommandName == "EditRoom")
            {
                Response.Redirect($"edit.aspx?roomId={roomId}");
            }
            else if (e.CommandName == "DeleteRoom")
            {
                DeleteRoom(roomId);
            }
        }

        private void DeleteRoom(int roomId)
        {
            string filePath = Server.MapPath(FilePath);
            var lines = new List<string>(File.ReadAllLines(filePath));
            lines.RemoveAll(line => line.StartsWith(roomId.ToString() + "|"));

            File.WriteAllLines(filePath, lines);
            LoadRooms();
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
        protected void EditRoom_Click(object sender, EventArgs e)
        {

            Response.Redirect("edit.aspx");
        }

        protected void SearchRoom_Click(object sender, EventArgs e)
        {
            string selectedValue = ddlSearchRoom.SelectedValue;
            string filePath = Server.MapPath("rooms.txt");
            if (File.Exists(filePath))
            {
                string filePath2 = Server.MapPath("~/sally/request.txt");
                if (!File.Exists(filePath2)) {
                    using (File.Create(filePath2)) { }
                    filePath2 = Server.MapPath("~/sally/request.txt");
                }
                File.WriteAllText(filePath2, "");
                string[] rooms = File.ReadAllLines(filePath);

                foreach (string line in rooms)
                {
                    string[] room = line.Split('|');

                    if (selectedValue == room[6] || selectedValue == room[6].Trim().ToLower())
                    {
                        string content = $"{room[0]}|{room[1]}|{room[2]}|{room[3]}|{room[4]}|{room[5]}|{room[6]}";
                        File.AppendAllText(filePath2, content + "\n");
                    }

                    if (selectedValue == room[2].Substring(0, room[2].IndexOf(" ")).ToLower()|| selectedValue == room[2].Trim())
                    {
                        
                        string content = $"{room[0]}|{room[1]}|{room[2]}|{room[3]}|{room[4]}|{room[5]}|{room[6]}";
                        File.AppendAllText(filePath2, content + "\n");

                    }
                    if(selectedValue== "")
                    {
                        string content = $"{room[0]}|{room[1]}|{room[2]}|{room[3]}|{room[4]}|{room[5]}|{room[6]}";
                        File.AppendAllText(filePath2, content + "\n");
                    }
                }
                LoadRooms("request.txt");
            }
           
            
        }

        protected void AddRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("add.aspx");
        }

        protected void ReservationConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmReservation.aspx");
        }

        protected void Export_Click(object sender, EventArgs e)
        {
        
            string filePath = Server.MapPath("~/sally/request.txt"); // Path to your file
            if (!File.Exists(filePath))
            {
                Response.Write("File not found.");
                return;
            }

            // Read file content
            string[] lines = File.ReadAllLines(filePath);

            // Start building the HTML table
            string html = "<table border='1' style='width:100%; border-collapse:collapse;'>";
            html += "<tr><th>ID</th><th>Room Name</th><th>Type</th><th>Capacity</th><th>Image</th><th>Description</th><th>Availability</th></tr>";

            foreach (string line in lines)
            {
                string[] details = line.Split('|');
                if (details.Length < 7) continue;

                html += "<tr>";
                foreach (var detail in details)
                {
                    html += $"<td>{detail}</td>";
                }
                html += "</tr>";
            }
            html += "</table>";

            // Export as an HTML file
            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel"; // Excel export
            Response.AddHeader("content-disposition", "attachment;filename=RoomExport.xls");
            Response.Write(html);
            Response.End();
        }

        

        protected void backtodash_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDash.aspx");
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
    }
}