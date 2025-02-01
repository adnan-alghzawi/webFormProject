﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.sally
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomAdmin.aspx");
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("rooms.txt");
            string roomId = roomID.Text.Trim();
            string roomNameText = roomName.Text.Trim();
            string roomType = type.SelectedValue.Trim();
            string roomCapacity = Capacity.Text.Trim();
            string roomDescription = description.Text.Trim();
            string roomAvailable = Available.SelectedValue.Trim();
            string imageFileName = "";


            if (fuImage.HasFile)
            {
                imageFileName = fuImage.FileName;
                string imageDirectory = Server.MapPath("~/imgs/");
                string imagePath = Path.Combine(imageDirectory, imageFileName);

                // Ensure the directory exists
                if (!Directory.Exists(imageDirectory))
                {
                    Directory.CreateDirectory(imageDirectory);
                }

                fuImage.SaveAs(imagePath);
            }
            string newRoomEntry = $"{roomId},{roomNameText},{roomType},{roomCapacity},{imageFileName},{roomDescription},{roomAvailable}";
            if (File.Exists(filePath))
            {
                string[] existingRooms = File.ReadAllLines(filePath);

                foreach (string room in existingRooms)
                {
                    string[] details = room.Split(',');

                    if (details[0].Trim() == roomId)
                    {
                        lblMessage.Text = "⚠️ Room ID already exists. Please use a unique ID.";
                        lblMessage.Visible = true;
                        return;
                    }
                }

                
                File.AppendAllText(filePath, newRoomEntry + Environment.NewLine);

                lblMessage.Text = "✅ Room added successfully!";
                lblMessage.Visible = true;

                // Clear the form fields after adding
                roomID.Text = "";
                roomName.Text = "";
                Capacity.Text = "";
                description.Text = "";
                type.SelectedIndex = 0;
                Available.SelectedIndex = 0;
            }

            else
            {
                File.WriteAllText(filePath, newRoomEntry + Environment.NewLine);

            }
        }
    }
}