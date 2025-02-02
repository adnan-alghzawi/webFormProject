﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.nada
{
    public partial class show_books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks("", "all"); //Show all books
            }
        }

        private void LoadBooks(string searchQuery, string filterOption)
        {
            string file = Server.MapPath("books.txt");
            booksContainer.InnerHtml = "";
            if (File.Exists(file))
            {
                string[] books = File.ReadAllLines(file);
                foreach (string book in books)
                {
                    string[] bookData = book.Split('|');
                    bool isAvailable = bookData[6].Equals("true", StringComparison.OrdinalIgnoreCase);
                    if (!string.IsNullOrEmpty(searchQuery) && bookData[1].IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase).Equals(-1))
                    {
                        continue;
                    }

                    if (filterOption == "available" && !isAvailable)
                    {
                        continue;
                    }

                    if (filterOption == "notAvailable" && isAvailable)
                    {
                        continue;
                    }

                    booksContainer.InnerHtml += $@"
                        <div class='card p-2 mb-3' style='width: 14rem;'>
                            <img src='{bookData[4]}' class='card-img-top' alt='Book Image' height='280' />
                            <div class='card-body'>
                                <h5 class='card-title'>{bookData[1]}</h5>
                                <p class='card-text'>{bookData[2]}</p>
                                <p class='{(isAvailable ? "availability-badge available" : "availability-badge not-available")}'>
                                    {(isAvailable ? "Available" : "Not available")}
                                </p>
                                <a href='book_details.aspx?bookId={bookData[0]}' class='btn btn-primary' style='background-color: #22333B; border: none;'>
                                Read More
                                </a>
                            </div>
                        </div>
                    ";
                }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextBox.Text.Trim();
            string filterOption = filterOptions.SelectedValue;
            LoadBooks(searchQuery, filterOption);
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