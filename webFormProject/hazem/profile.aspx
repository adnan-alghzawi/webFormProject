<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="task1_webForm_27_1_2025.profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /*        body {
            background-color: #EAE0D6;
            color: #22333B;
            font-family: 'Arial', sans-serif;
        }*/
        body {
            background-color: #EAE0D6;
            color: #EAE0D6;
            font-family: 'Arial', sans-serif;
        }

        .profile-container {
            max-width: 900px;
            margin: auto;
            padding: 40px 0;
        }

        .profile-card {
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            background-color: #22333B;
            color: #EAE0D6;
            padding: 30px;
        }

        .profile-img {
            width: 130px;
            border-radius: 50%;
            border: 5px solid #EAE0D6;
            margin-left: 43%;
        }

        .btn-custom {
            width: 32%;
            margin: 5px;
            background-color: #EAE0D6;
            border: none;
            color: #22333B;
            font-weight: bold;
            border-radius: 10px;
            padding: 10px;
            transition: 0.3s;
        }

            .btn-custom:hover {
                background-color: #EAE0D6;
            }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .bg-umber {
            background-color: #22333B;
        }

        .imglogo {
            width: 20%;
        }

        .btn-green {
            --bs-btn-color: #22333B !important;
            --bs-btn-bg: #EAE0D6 !important;
            --bs-btn-border-color: #EAE0D6;
            --bs-btn-hover-color: #22333B;
            --bs-btn-hover-bg: #C6AD8F;
            --bs-btn-hover-border-color: #C6AD8F !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #22333B;
            --bs-btn-active-bg: #EAE0D6;
            --bs-btn-active-border-color: #EAE0D6;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #22333B;
            --bs-btn-disabled-bg: #EAE0D6;
            --bs-btn-disabled-border-color: #EAE0D6;
            border-radius: 20px !important;
            margin-right: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1),inset 3px 3px 6px rgba(0, 0, 0, 0.3);
            border: none;
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
        <nav class="navbar navbar-expand-lg navbar-light  bg-umber pb-0 pt-0">
            <a class="navbar-brand ps-3 text-white  pb-0 pt-0" href="#">
                <img class="imglogo" src="../adnan/Images/Books/Lumina-removebg-preview.png" /></a>
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
                        <asp:LinkButton CssClass="nav-link text-white" ID="books" runat="server" OnClick="books_Click" Text="Books"></asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton CssClass="nav-link text-white" ID="rooms" runat="server" OnClick="rooms_Click" Text="Meeting Rooms"></asp:LinkButton>
                    </li>
                </ul>
            </div>
            <div>
                <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="login_Click" />
                <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="rigester_Click" />
            </div>

        </nav>
        <div class="profile-container">
            <div class="card profile-card text-center">
                <img src="https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg" alt="Avatar" class="profile-img mb-3">
                <h4>
                    <asp:TextBox ID="name" runat="server" CssClass="form-control text-center" ReadOnly></asp:TextBox>
                </h4>
                <div class="form-outline flex-fill mb-3">
                    <asp:RadioButton ID="Male" GroupName="Gender" Text="Male" runat="server" CssClass="form-check-input" Style="background-color: #22333B; border: none;"  />
                    <asp:RadioButton ID="Female" GroupName="Gender" Text="Female" runat="server" CssClass="form-check-input ms-2" Style="background-color: #22333B; border: none;" />
                    <label class="form-label ms-3">Gender</label>
                </div>
                <div class="button-group">
<%--                    <asp:Button runat="server" OnClick="Save_Click" Text="Save" CssClass="btn btn-custom" />--%>
                    <asp:Button runat="server" OnClick="btnEdit_Click" Text="Edit" CssClass="btn btn-warning btn-custom" />
                    <asp:Button runat="server" OnClick="UserHistory_Click" Text="User History" CssClass="btn btn-info btn-custom" />
                </div>
            </div>

            <div class="card profile-card mt-4">
                <h5 class="text-center">Profile Information</h5>
                <hr>
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="name2" runat="server" CssClass="form-control" placeholder="Enter Full Name" ReadOnly></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="email2" runat="server" CssClass="form-control" placeholder="Enter Email" ReadOnly></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <asp:TextBox ID="dob2" runat="server" CssClass="form-control" placeholder="Enter Date of Birth" ReadOnly></asp:TextBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
