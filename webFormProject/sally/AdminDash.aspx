<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDash.aspx.cs" Inherits="webFormProject.sally.AdminDash" %>


<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

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

        .abtn {
            display: block;
            color: white;
            background-color: #22333B;
            padding: 10px;
            text-decoration: none;
            margin: 10px 0;
            border: none !important;
            width: 100%;
            text-align: left;
        }

            .abtn:hover {
                background-color: #34495e;
            }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        .header {
            background-color: #22333B;
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
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition */
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

        .card:hover {
            transform: translateY(-5px); /* Moves the card up */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15); /* Adds shadow */
        }

        .hidden {
            opacity: 0;
            transform: translateY(50px);
            transition: opacity 0.8s ease-out, transform 0.8s ease-out;
        }

        .hidden2 {
            opacity: 0;
            transform: translatex(50px);
            transition: opacity 0.8s ease-out, transform 0.8s ease-out;
        }

        /* عندما يظهر العنصر */
        .visible {
            opacity: 1;
            transform: translateY(0);
        }

        .visible2 {
            opacity: 1;
            transform: translatex(0);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar animate hidden">
            <img src="imgs/Lumina__1_-removebg-preview.png" class="imglogo" />
            <asp:Button ID="editB" runat="server" Text="Edit Books" OnClick="editB_Click" CssClass="abtn" />
            <asp:Button ID="editR" runat="server" Text="Edit Room" OnClick="editR_Click" CssClass="abtn" />
            <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
            <asp:Button ID="Borrow" runat="server" Text="Borrow" OnClick="Borrow_Click" CssClass="abtn" />
        </div>

        <div class="content animate2 hidden2">
            <div class="header">
                <h2>Welcome To LUMINA DashBoard</h2>
            </div>

            <div class="row ">
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

            <div class="row w-100 mt-5 ">
                <div class="bg-white rounded text-center p-2">
                    <p runat="server"><span class="me-5"><b>Avilable rooms:</b><asp:Label ID="avaRoom" runat="server"></asp:Label></span>
                       <span class="me-5"><b>Unavailable rooms:</b><asp:Label ID="unavaroom" runat="server"></asp:Label></span>

                        <span class="me-5"><b>Available Books:</b><asp:Label ID="avaBooks" runat="server"></asp:Label></span>
                        <span class="me-5"><b> Borrowed Books:</b><asp:Label ID="Borrow1" runat="server"></asp:Label></span>

                    </p>
                </div>
            </div>
        </div>
    </form>

    <script>

        document.addEventListener("DOMContentLoaded", () => {
            const elements = document.querySelectorAll(".animate"); // اختيار العناصر
            const elements2 = document.querySelectorAll(".animate2"); // اختيار العناصر

            setTimeout(() => {
                elements.forEach(element => {
                    element.classList.add("visible"); // إضافة الـ class لجعل العنصر يظهر
                });
            }, 500); // وقت التأخير (500 مللي ثانية)
            setTimeout(() => {
                elements2.forEach(element => {
                    element.classList.add("visible2"); // إضافة الـ class لجعل العنصر يظهر
                });
            }, 500); // وقت التأخير (500 مللي ثانية)
        });
    </script>
</body>
</html>
