using System;
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
            string filepath2 = Server.MapPath("~/hazem/data/logged.txt");
            string emailUser = File.ReadAllText(filepath2);
            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    
                    try
                    {
                        // Split data based on provided delimiters
                        string[] parts = line.Split(new string[] { "|", " - " }, StringSplitOptions.RemoveEmptyEntries);
                        if (parts[2].Trim() == "Email: "+emailUser.Trim())
                        {
                            if (parts.Length >= 5)
                            {
                                string datePart = parts[0].Trim();
                                string statusPart = parts[1].Trim().Replace("Status:", "").Replace("Approved", "Approved ✅").Replace("Rejected", "Rejected ❌");
                                string emailPart = parts[2].Trim().Replace("Email:", "");
                                string bookIdPart = parts[3].Trim().Replace("Book ID:", "");
                                string bookNamePart = parts[4].Trim().Replace("Book name:", "");

                                // Add extracted data to the list
                                historyList.Add(new UserHistoryEntry
                                {
                                    Date = datePart,
                                    Status = statusPart,
                                    Email = emailPart,
                                    BookID = bookIdPart,
                                    BookName = bookNamePart
                                });
                            }
                            else
                            {
                                // Log warning for inconsistent lines (helps debugging)
                                System.Diagnostics.Debug.WriteLine($"[WARNING] Inconsistent line ignored: {line}");
                            }

                        }
                        // Ensure each line has at least 4 elements to avoid index errors
                        
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

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/LogIn.aspx");
        }

        protected void rigester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/registration.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/hazem/data/logged.txt");
            File.WriteAllText(filepath, "");
            Response.Redirect("~/jana/index.aspx");
        }

        protected void prof_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hazem/profile.aspx");
        }
    }
    

    public class UserHistoryEntry
    {
        public string Date { get; set; }
        public string Status { get; set; }
        public string Email { get; set; }
        public string BookID { get; set; }
        public string BookName { get; set; }
    }
    
}
