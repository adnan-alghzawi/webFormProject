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
                            card.AppendFormat("<p class=\"card-text\">Type: {0}<br/>" +
                                "Description: {1}<br/>" +

                                "Available: {2}</p>", columns[2], columns[5], columns[6]);
                            card.Append("</div>");
                            card.Append("</div>");
                        }
                        else
                        {
                            card.Append("<div class=\"card\" style=\"width: 18rem;  border: 2px solid red !important; background-color: \">");
                            card.AppendFormat("<img class=\"card-img-top\" src=\"{0}\" alt=\"Card image cap\">", imgPath);
                            card.Append("<div class=\"card-body\">");
                            card.AppendFormat("<h5 class=\"card-title text-muted\">{0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{1} person</h5>", columns[1], columns[3]);
                            card.AppendFormat("<p class=\"card-text text-muted\">Type: {0}<br/>" +
                                "Description: {1}<br/>" +

                                "Available: {2}</p>", columns[2], columns[5], columns[6]);
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

        protected void aboutTab_Click(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click(object sender, EventArgs e)
        {

        }

        protected void SearchRoom_Click(object sender, EventArgs e)
        {
            string request = search.Text;
            string filePath = Server.MapPath("rooms.txt");
            if (File.Exists(filePath))
            {
                string filePath2 = Server.MapPath("~/sally/request.txt");
                if (!File.Exists(filePath2)) {
                    using (File.Create(filePath2)) { }
                    filePath2 = Server.MapPath("~/sally/request.txt");
                }

                string[] rooms = File.ReadAllLines(filePath);

                foreach (string line in rooms)
                {
                    string[] room = line.Split(',');

                    if (request == room[0] || request == room[1].Trim().ToLower())
                    {
                        string content = $"{room[0]},{room[1]},{room[2]},{room[3]},{room[4]},{room[5]},{room[6]}";
                        File.WriteAllText(filePath2, content);
                        break;
                    }
                }
                Load("request.txt");
            }
           
           
        }
    }
}