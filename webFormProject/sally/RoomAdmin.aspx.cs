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
                Load();
            }
        }

        private void Load( string fileName = "rooms.txt")
        {
            string filePath = Server.MapPath(fileName);
            if (File.Exists(filePath))
            {
                var fileContent = File.ReadAllLines(filePath);
                StringBuilder card = new StringBuilder();


                foreach (var line in fileContent)
                {
                    string[] columns = line.Split(',');
                    string imgPath = "imgs/" + columns[4];

                    if (columns.Length >= 7)
                    {
                        if (columns[6].Trim() == "true")
                        {
                            card.Append("<div class=\"card\" style=\"width: 18rem;\">");
                            card.AppendFormat("<img class=\"card-img-top\" src=\"{0}\" alt=\"Card image cap\">", imgPath);
                            card.Append("<div class=\"card-body\">");
                            card.AppendFormat("<h5 class=\"card-title\">{0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{1} person</h5>", columns[1], columns[3]);
                            card.AppendFormat("<p class=\"card-text\">" +
                                "ID:{0}<br/>" +
                                "Type: {1}<br/>" +
                                "Description: {2}<br/>" +

                                "Available: {3}</p>",columns[0], columns[2], columns[5], columns[6]);
                            card.Append(" <asp:Button ID=\"EditRooms\" runat=\"server\" Text=\"Edit Rooms\" CssClass=\"btn btn-green1 my-2 my-sm-0 \"></asp:Button>");
                            card.Append("</div>");
                            card.Append("</div>");
                        }
                        else
                        {
                            card.Append("<div class=\"card\" style=\"width: 18rem;  border: 2px solid red !important; background-color: \">");
                            card.AppendFormat("<img class=\"card-img-top\" src=\"{0}\" alt=\"Card image cap\">", imgPath);
                            card.Append("<div class=\"card-body\">");
                            card.AppendFormat("<h5 class=\"card-title text-muted\">{0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{1} person</h5>", columns[1], columns[3]);
                            card.AppendFormat("<p class=\"card-text text-muted\">" +
                                "ID:{0}<br/>" +
                                "Type: {1}<br/>" +
                                "Description: {2}<br/>" +
                                "Available: {3}</p>", columns[0], columns[2], columns[5], columns[6]);
                            card.Append("</div>");
                            card.Append("</div>");
                        }
                    }
                }

                Cards.InnerHtml = card.ToString();
            }
            else
            {
                Cards.InnerHtml = "<tr><td colspan='4'>File not found.</td></tr>";
            }
        }

        protected void homeTab_Click(object sender, EventArgs e)
        {

        }

        protected void EditRoom_Click(object sender, EventArgs e)
        {

            Response.Redirect("edit.aspx");
        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click(object sender, EventArgs e)
        {

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
                Load("request.txt");
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
                string[] details = line.Split(',');
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