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
            string filePath = Server.MapPath("rooms.txt");
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
                }

                Cards.InnerHtml = card.ToString();
            }
            else
            {
                File.Create(filePath);
                //Cards.InnerHtml = "<tr><td colspan='4'>File not found.</td></tr>";

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void SearchRoom_Click(object sender, EventArgs e)
        {

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