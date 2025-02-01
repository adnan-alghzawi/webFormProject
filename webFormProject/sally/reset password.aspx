<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset password.aspx.cs" Inherits="webFormProject.sally.reset_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>reset password</title>
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

                            <asp:LinkButton ID="homeTab" CssClass="nav-link active text-white" runat="server" Text="Home"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton  ID="aboutTab" runat="server" Text="About Us" CssClass="nav-link text-white"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton  ID="contactTab" runat="server" Text="Contact Us" CssClass="nav-link text-white"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="books" runat="server" Text="Books" CssClass="nav-link text-white"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="rooms" runat="server" Text="Meeting Rooms" CssClass="nav-link text-white"></asp:LinkButton>
                        </li>
                    </ul>
                    <div>
                        <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0"></asp:Button>
                        <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0"></asp:Button>
                    </div>
                </div>
            </nav>

            <div class="container p-5 rounded border mt-5 w-25 bg-umber text-white">
                <h1 class="text-center">Check your Email:</h1>
                <div class="mb-3">
                    <label for="Email" class="form-label">Email:</label>
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="check" runat="server" class=" col-6 btn btn-green" OnClick="check_Click" Text="Check"></asp:Button>
                <asp:Label ID="EmailLabel" runat="server" Visible="false"></asp:Label>
            </div>
            <div class="container p-5 rounded border mt-5 w-25 bg-umber text-white" id="resetForm" runat="server" visible="false">
                <h1 class="text-center">Set A New Password</h1>
                <div class="mb-3">
                    <label for="newpass" class="form-label">New Password</label>
                    <asp:TextBox runat="server" ID="newPass" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Confirm password</label>
                    <asp:TextBox runat="server" ID="Confirm" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="row justify-content-between ">
                    <asp:Label ID="pass" runat="server" Visible="false"></asp:Label>
                    <asp:Button ID="cancel" runat="server" class="col-4 btn btn-secondary " OnClick="cancel_Click" Text="Cancel"></asp:Button>
                    <asp:Button ID="saveCanghes" runat="server" class=" col-6 btn btn-green " OnClick="saveCanghes_Click" Text="Update Password"></asp:Button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
