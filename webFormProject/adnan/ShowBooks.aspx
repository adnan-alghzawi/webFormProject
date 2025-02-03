<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowBooks.aspx.cs" Inherits="webFormProject.adnan.ShowBooks" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Show Books</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card {
            width: 300px;
            min-height: 450px;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease;
        }

            .card img {
                height: 250px;
                object-fit: cover;
                width: 100%;
            }

        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .edit-btn, .export-btn {
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }

            .edit-btn:hover, .export-btn:hover {
                background-color: #28a745;
                color: white;
            }

        .form-control {
            width: auto;
            display: inline-block;
        }

        .bg-umber {
            background-color: #22333B;
        }

        .imglogo {
            width: 40%;
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
            margin-left: 140px;
            padding: 10px;
            width: 100%;
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


        .text-center {
            text-align: center !important;
            margin-left: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar animate hidden">
            <img src="Images/Books/Lumina-removebg-preview.png" class="imglogo" />
             <asp:Button ID="dash" runat="server" Text="Dashboard" OnClick="dash_Click" CssClass="abtn" />
            <asp:Button ID="editB" runat="server" Text="Edit Books" OnClick="editB_Click" CssClass="abtn" />
            <asp:Button ID="editR" runat="server" Text="Edit Room" OnClick="editR_Click" CssClass="abtn" />
            <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
            <asp:Button ID="Borrow" runat="server" Text="Borrow" OnClick="Borrow_Click" CssClass="abtn" />
        </div>
        <div class="content">
            <div class="container mt-5">
                <h2 class="text-center">📚 Books</h2>
                <div class="btn-container">
                    <asp:DropDownList ID="ddlFilter" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                        <asp:ListItem Value="All">All Books</asp:ListItem>
                        <asp:ListItem Value="Available">Available Books</asp:ListItem>
                        <asp:ListItem Value="Unavailable">Unavailable Books</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-primary export-btn" OnClick="export_Click" />

                    <asp:Button ID="btnEdit" runat="server" Text="Edit Books" CssClass="btn btn-success edit-btn" OnClick="edit_Click" />
                    <asp:Button ID="btnAddBook" runat="server" Text="Add Book" CssClass="btn btn-info add-btn" OnClick="btnAddBook_Click" />
                </div>
                <br />
                <div class="card-container">
                    <asp:Repeater ID="rptBooks" runat="server">
                        <ItemTemplate>
                            <div class="card">
                                <img src='<%# Eval("ImagePath") %>' alt='Book Image' />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("BookName") %></h5>
                                    <p class="card-text"><strong>Type:</strong> <%# Eval("Type") %></p>
                                    <p class="card-text"><strong>Level:</strong> <%# Eval("Level") %></p>
                                    <p class="card-text"><strong>Description:</strong> <%# Eval("Description") %></p>
                                    <p class="card-text"><strong>Availability:</strong> <span class='<%# Eval("AvailabilityClass") %>'><%# Eval("Availability") %></span></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <br />
            </div>



        </div>
    </form>
</body>
</html>
