<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDash.aspx.cs" Inherits="webFormProject.sally.AdminDash" %>


<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #EAE0D6;
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #22333B;
            color: white;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

            .sidebar a {
                display: block;
                color: white;
                padding: 10px;
                text-decoration: none;
                margin: 10px 0;
            }

                .sidebar a:hover {
                    background-color: #34495e;
                }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        .header {
            background-color: #34495e;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .card {
            background-color: white;
            padding: 20px;
            margin: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .card-container {
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            margin: 10px;
        }

        .imglogo {
            width: 40%;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="imgs/Lumina__1_-removebg-preview.png" class="imglogo" />
        <a href="#">Edit Book</a>
        <a href="#">Edit Room</a>
        <a href="#">Reservations</a>
        <a href="#">Borrow</a>

    </div>

    <div class="content">
        <div class="header">
            <h2>Welcome To LUMINA DashBoard</h2>
        </div>

        <div class="row">
            <div class="card-container">
                <div class="card">
                    <h3>Users</h3>
                    ِ<asp:Label ID="usersNum" runat="server"></asp:Label>
                </div>
            </div>
            <div class="card-container">
                <div class="card">
                    <h3>Books</h3>
                    ِ<asp:Label ID="booksNum" runat="server"></asp:Label>
                </div>
            </div>
            <div class="card-container">
                <div class="card">
                    <h3>Rooms</h3>
                    ِ<asp:Label ID="RoomsNum" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
