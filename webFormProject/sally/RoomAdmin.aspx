﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomAdmin.aspx.cs" Inherits="webFormProject.sally.RoomAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>home</title>
    <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <style>
        .bg-umber {
            background-color: #22333B;
        }

        body {
            background-color: #EAE0D6;
        }

        .imglogo {
            width: 20%;
        }

        .btn-green {
            --bs-btn-color: #22333B !important;
            --bs-btn-bg: #EAE0D6 !important;
            --bs-btn-border-color: #EAE0D6;
            --bs-btn-hover-color: #EAE0D6;
            --bs-btn-hover-bg: #22333B;
            --bs-btn-hover-border-color: #EAE0D6 !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #22333B;
            --bs-btn-active-bg: #EAE0D6;
            --bs-btn-active-border-color: #EAE0D6;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #22333B;
            --bs-btn-disabled-bg: #EAE0D6;
            --bs-btn-disabled-border-color: #EAE0D6;
            border-radius: 170px !important;
            margin-right: 5px;
        }

        .btn-green1 {
            --bs-btn-color: #EAE0D6 !important;
            --bs-btn-bg: #22333B !important;
            --bs-btn-border-color: #22333B;
            --bs-btn-hover-color: #22333B;
            --bs-btn-hover-bg: #EAE0D6;
            --bs-btn-hover-border-color: #22333B !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #EAE0D6;
            --bs-btn-active-bg: #22333B;
            --bs-btn-active-border-color: #22333B;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #EAE0D6;
            --bs-btn-disabled-bg: #22333B;
            --bs-btn-disabled-border-color: #22333B;
            border-radius: 170px !important;
            margin-right: 5px;
            width: 10% !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- navbar -->
            <nav class="navbar navbar-expand-lg navbar-light  bg-umber">
                <a class="navbar-brand ps-3 text-white" href="#">
                    <img class="imglogo" src="imgs/Lumina__1_-removebg-preview.png" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ">
                        <li class="nav-item ">

                            <asp:LinkButton CssClass="nav-link active text-white" ID="homeTab" runat="server" OnClick="homeTab_Click" Text="Home"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="aboutTab" runat="server" OnClick="aboutTab_Click" Text="About Us"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="contactTab" runat="server" OnClick="contactTab_Click" Text="Contact Us"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="books" runat="server" OnClick="contactTab_Click" Text="Books"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="rooms" runat="server" OnClick="contactTab_Click" Text="Meeting Rooms"></asp:LinkButton>
                        </li>
                    </ul>
                    <div>
                        <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0"></asp:Button>
                        <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0"></asp:Button>
                    </div>
                </div>
            </nav>
            <div class="container my-5">
                <div class="row d-flex w-100">
                    <asp:TextBox CssClass="form-control mr-sm-2 w-25 me-1" ID="search" runat="server"></asp:TextBox>
                    <asp:Button ID="SearchRoom" runat="server" Text="Search" CssClass="btn btn-green1 my-2 my-sm-0 me-5 " OnClick="SearchRoom_Click"></asp:Button>
                    <asp:Button ID="EditRooms" runat="server" Text="Edit Rooms" CssClass="btn btn-green1 my-2 my-sm-0 " OnClick="EditRoom_Click"></asp:Button>
                    <asp:Button ID="DeleteRooms" runat="server" Text="Delete Rooms" CssClass="btn btn-green1 my-2 my-sm-0"></asp:Button>
                    <asp:Button ID="AddRooms" runat="server" Text="Add Rooms" CssClass="btn btn-green1 my-2 my-sm-0"></asp:Button>
                </div>
            </div>
            <div class="container pt-3 d-flex gap-2 flex-wrap" id="Cards" runat="server">
            </div>
        </div>
    </form>

</body>
</html>
