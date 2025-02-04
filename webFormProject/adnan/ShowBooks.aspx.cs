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
                BindBooks("All");
            }
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            BindBooks(ddlFilter.SelectedValue);
        }

        private void BindBooks(string filter)
        {
            var booksData = LoadBooksData(filter);
            gvBooks.DataSource = booksData;
            gvBooks.DataBind();
        }

        private List<dynamic> LoadBooksData(string filter)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            if (!File.Exists(filePath))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('File not found.');", true);
                return new List<dynamic>();  // Return an empty list if the file does not exist.
            }

            var booksData = File.ReadAllLines(filePath).Select(book =>
            {
                var details = book.Split('|');
                return new
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

            return booksData.Cast<dynamic>().ToList();
        }

        protected void export_Click(object sender, EventArgs e)
        {
            ExportBooks(ddlFilter.SelectedValue);
        }

        private void ExportBooks(string filter)
        {
            var booksData = LoadBooksData(filter);

            if (!booksData.Any())
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('No data available to export.');", true);
                return;
            }

            string html = "<table border='1' style='width:100%; border-collapse:collapse;'>";
            html += "<tr><th>ID</th><th>Book Name</th><th>Type</th><th>Level</th><th>Image</th><th>Description</th><th>Availability</th></tr>";

            foreach (var book in booksData)
            {
                html += "<tr>";
                html += $"<td>{book.BookID}</td><td>{book.BookName}</td><td>{book.Type}</td><td>{book.Level}</td><td>{book.ImagePath}</td><td>{book.Description}</td><td>{book.Availability}</td>";
                html += "</tr>";
            }
            html += "</table>";

            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=BooksExport.xls");
            Response.Write(html);
            Response.End();
        }

        protected void gvBooks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string bookID = e.CommandArgument.ToString();

            if (e.CommandName == "EditBook")
            {
                Response.Redirect($"EditBook.aspx?BookID={bookID}");
            }
            else if (e.CommandName == "DeleteBook")
            {
                DeleteBook(bookID);
                BindBooks("All"); // Rebind to refresh the data
            }
        }



        private void DeleteBook(string bookID)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            if (!File.Exists(filePath))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('File not found.');", true);
                return;
            }

            var lines = File.ReadAllLines(filePath).ToList();
            var updatedLines = lines.Where(line => !line.StartsWith(bookID + "|")).ToList();

            File.WriteAllLines(filePath, updatedLines);
        }


        protected void edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditBook.aspx");
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBook.aspx");
        }
        protected void editB_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ShowBooks.aspx");
        }

        protected void editR_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/RoomAdmin.aspx");
        }

        protected void Reservations_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/ConfirmReservation.aspx");
        }

        protected void Borrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adnan/ConfirmBorrow.aspx");
        }
        protected void dash_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sally/AdminDash.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            Response.Redirect("~/jana/index.aspx");
        }
    }
}
