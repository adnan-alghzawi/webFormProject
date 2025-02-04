<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="webFormProject.adnan.EditBook" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            margin-left: 167px;
        }
    </style>
    <script>
        function limitDescriptionLength() {
            var description = document.getElementById('<%= txtDescription.ClientID %>');
            if (description.value.length > 20) {
                description.value = description.value.substring(0, 20);
                alert("⚠️ Description cannot exceed 20 characters!");
            }
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Edit Book</h2>
        <form id="form1" runat="server">
            <div class="sidebar animate hidden">
                <img src="Images/Books/Lumina-removebg-preview.png" class="imglogo" />
                 <asp:Button ID="dash" runat="server" Text="Dashboard" OnClick="dash_Click" CssClass="abtn" />
                <asp:Button ID="editB" runat="server" Text="All Books" OnClick="editB_Click" CssClass="abtn" />
                <asp:Button ID="editR" runat="server" Text="All Room" OnClick="editR_Click" CssClass="abtn" />
                <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
                <asp:Button ID="Borrow" runat="server" Text="Borrow Borrow" OnClick="Borrow_Click" CssClass="abtn" />
                <asp:Button ID="logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="abtn" />
            </div>
            <div class="content">
                <div class="form-group">
                    <label for="ddlBooks">Select Book:</label>
                    <asp:DropDownList ID="ddlBooks" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlBooks_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="txtBookID">Book ID:</label>
                    <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtBookName">Book Name:</label>
                    <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtType">Book Type:</label>
                    <asp:TextBox ID="txtType" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtLevel">Book Level:</label>
                    <asp:TextBox ID="txtLevel" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="fuImage">Book Image:</label>
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control-file" />
                </div>

                <div class="form-group">
                    <label for="txtDescription">Description:</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" oninput="limitDescriptionLength()"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="ddlAvailability">Availability:</label>
                    <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                        <asp:ListItem Text="Unavailable" Value="Unavailable"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex flex-column align-items-center mt-4">
                    <!-- Buttons Container -->
                    <div class="btn-group" role="group">
                        <asp:Button ID="btnUpdateBook" runat="server" Text="Update Book" CssClass="btn btn-primary px-4" OnClick="btnUpdateBook_Click" Style="background-color:#22333B;" />
<%--                        <asp:Button ID="show" runat="server" Text="Show Books" CssClass="btn btn-info px-4" OnClick="show_Click" />--%>
                        <asp:Button ID="delete" runat="server" Text="Delete Book" CssClass="btn btn-danger px-4" OnClick="delete_Click" />
                    </div>

                    <!-- Success Message -->
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3 fw-bold fs-5 d-block"></asp:Label>
                </div>
            </div>

        </form>
    </div>
</body>
</html>
