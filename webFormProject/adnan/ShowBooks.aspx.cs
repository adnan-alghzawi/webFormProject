using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.adnan
{
    public partial class ShowBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks("All");
            }
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            LoadBooks(ddlFilter.SelectedValue);
        }

        private void LoadBooks(string filter)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            if (!File.Exists(filePath))
            {
                return;
            }

            var booksData = File.ReadAllLines(filePath).Select(book =>
            {
                var details = book.Split('|');
                return (dynamic)new
                {
                    BookID = details[0],
                    BookName = details[1],
                    Type = details[2],
                    Level = details[3],
                    ImagePath = details[4].Replace("~", ""),
                    Description = details[5],
                    Availability = details[6],
                    AvailabilityClass = details[6] == "Available" ? "text-success" : "text-danger"
                };
            }).Where(b => filter == "All" || b.Availability == filter).ToList();

            rptBooks.DataSource = booksData;
            rptBooks.DataBind();
        }

        protected void export_Click(object sender, EventArgs e)
        {
            ExportBooks("Available");
            ExportBooks("Unavailable");
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Data exported successfully!');", true);
        }

        private void ExportBooks(string availability)
        {
            string filePath = Server.MapPath($"~/adnan/App_Data/{availability}Books.txt");
            var booksData = GetBooksData(availability);

            List<string> lines = booksData.Select(book => $"{book.BookID}|{book.BookName}|{book.Type}|{book.Level}|{book.ImagePath}|{book.Description}|{book.Availability}").ToList();
            File.WriteAllLines(filePath, lines);
        }

        private List<dynamic> GetBooksData(string filter)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            if (!File.Exists(filePath))
            {
                return new List<dynamic>();
            }

            return File.ReadAllLines(filePath).Select(book =>
            {
                var details = book.Split('|');
                return (dynamic)new
                {
                    BookID = details[0],
                    BookName = details[1],
                    Type = details[2],
                    Level = details[3],
                    ImagePath = details[4].Replace("~", ""),
                    Description = details[5],
                    Availability = details[6],
                    AvailabilityClass = details[6] == "Available" ? "text-success" : "text-danger"
                };
            }).Where(b => filter == "All" || b.Availability == filter).ToList();
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditBook.aspx");
        }
    }
}
