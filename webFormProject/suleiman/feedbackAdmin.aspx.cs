﻿using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace webFormProject.suleiman
{
    public partial class feedbackAdmin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadFeedback();
        }

        private void LoadFeedback()
        {
            var filePath = Server.MapPath("feedback.txt");
            if (!File.Exists(filePath)) return;

            var tableHtml = @"
            <table class='feedback-table'>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>";

            foreach (var line in File.ReadAllLines(filePath))
            {
                var parts = line.Split(',');
                if (parts.Length < 4) continue;

                tableHtml += $@"
                <tr>
                    <td>{parts[0]}</td>
                    <td>{parts[1]}</td>
                    <td>{parts[2]}</td>
                    <td>{parts[3]}</td>
                    <td>
                        <a href='mailto:{parts[1]}?subject=Re: Your Feedback&body=Response to: {HttpUtility.UrlEncode(parts[2])}' 
                           class='btn'>Reply</a>
                    </td>
                </tr>";
            }

            tableHtml += "</table>";
            litFeedbackTable.Text = tableHtml;
            pnlNoFeedback.Visible = litFeedbackTable.Text == "</table>";
        }

        protected void aboutTab_Click(object sender, EventArgs e)
        {

        }

        protected void contactTab_Click(object sender, EventArgs e)
        {

        }

        protected void homeTab_Click(object sender, EventArgs e)
        {

        }
    }
}