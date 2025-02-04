<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="webFormProject.adnan.WebForm1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
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
            margin-left: 250px;
            padding: 20px;
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
    <div class="container mt-5">
        <h2 class="text-center">Add new book </h2>
        <form id="form1" runat="server">
            <div class="sidebar animate hidden">
                <img src="Images/Books/Lumina-removebg-preview.png" class="imglogo" />
                 <asp:Button ID="dash" runat="server" Text="Dashboard" OnClick="dash_Click" CssClass="abtn" />
                <asp:Button ID="editB" runat="server" Text="All Books" OnClick="editB_Click" CssClass="abtn" />
                <asp:Button ID="editR" runat="server" Text="All Room" OnClick="editR_Click" CssClass="abtn" />
                <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
                <asp:Button ID="Borrow" runat="server" Text="Borrow Book" OnClick="Borrow_Click" CssClass="abtn" />
                <asp:Button ID="logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="abtn" />
            </div>
            <div class="content">
                <div class="form-group">
                    <label for="txtBookID">Book Id </label>
                    <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtBookName">Book name </label>
                    <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtType">Book type </label>
                    <asp:TextBox ID="txtType" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtLevel">Book Level </label>
                    <asp:TextBox ID="txtLevel" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="fuImage">Book image </label>
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control-file"  />
                </div>
                <div class="form-group">
                    <label for="txtDescription">Book discerption </label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlAvailability">Book availability </label>
                    <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                        <asp:ListItem Text="Unavailable" Value="Unavailable"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnAddBook" runat="server" Text=" Add book " CssClass="btn btn-green1" OnClick="btnAddBook_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3"></asp:Label>
            </div>

            <%-- <asp:Button ID="btnShowBooks" runat="server" Text="Show Books" CssClass="btn btn-secondary" OnClick="btnShowBooks_Click" />--%>
        </form>
    </div>
</body>
</html>