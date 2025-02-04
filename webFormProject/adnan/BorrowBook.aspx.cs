using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace webFormProject.adnan
{
    public partial class BorrowBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }
        private void LoadBooks()
        {
            string filePath = Server.MapPath("~/adnan/App_Data/Books.txt");
            if (!File.Exists(filePath)) return;

            string[] books = File.ReadAllLines(filePath);
            foreach (string book in books)
            {
                string[] details = book.Split('|');
                if (details.Length < 7) continue;

                ddlBooks.Items.Add(new ListItem(details[1], details[0])); // Book Name as text, Book ID as value
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/adnan/App_Data/BorrowRequests.txt");

            string request = txtEmail.Text + "|" +
                             txtUserName.Text + "|" +
                             ddlBooks.SelectedValue + "|" +
                             ddlBooks.SelectedItem.Text + "|" +
                             txtBorrowDate.Text + "|" +
                             txtDuration.Text + "|Pending";

            File.AppendAllText(filePath, request + Environment.NewLine);
            Response.Write("<script>alert('✅ Your request has been sent!');</script>");
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