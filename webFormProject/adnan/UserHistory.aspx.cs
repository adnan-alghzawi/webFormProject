﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class UserHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserHistory();
            }
        }

        private void LoadUserHistory()
        {
            string filePath = Server.MapPath("~/adnan/App_Data/UserHistory.txt"); // Ensure the file exists in this directory
            List<UserHistoryEntry> historyList = new List<UserHistoryEntry>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    try
                    {
                        // Split data based on provided delimiters
                        string[] parts = line.Split(new string[] { "|", " - " }, StringSplitOptions.RemoveEmptyEntries);

                        // Ensure each line has at least 4 elements to avoid index errors
                        if (parts.Length >= 4)
                        {
                            string datePart = parts[0].Trim();
                            string statusPart = parts[1].Trim().Replace("Status:", "").Replace("Approved", "Approved ✅").Replace("Rejected", "Rejected ❌");
                            string emailPart = parts[2].Trim().Replace("Email:", "");
                            string bookIdPart = parts[3].Trim().Replace("Book ID:", "");

                            // Add extracted data to the list
                            historyList.Add(new UserHistoryEntry
                            {
                                Date = datePart,
                                Status = statusPart,
                                Email = emailPart,
                                BookID = bookIdPart
                            });
                        }
                        else
                        {
                            // Log warning for inconsistent lines (helps debugging)
                            System.Diagnostics.Debug.WriteLine($"[WARNING] Inconsistent line ignored: {line}");
                        }
                    }
                    catch (Exception ex)
                    {
                        // Log errors that might occur while processing data
                        System.Diagnostics.Debug.WriteLine($"[ERROR] Processing line failed: {line} - {ex.Message}");
                    }
                }
            }

            // Bind data to GridView
            gvUserHistory.DataSource = historyList;
            gvUserHistory.DataBind();
        }
    }

    public class UserHistoryEntry
    {
        public string Date { get; set; }
        public string Status { get; set; }
        public string Email { get; set; }
        public string BookID { get; set; }
    }
}
