<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedbackAdmin.aspx.cs" Inherits="webFormProject.suleiman.feedbackAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Feedback Administration</title>
    <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            border-radius: 170px !important;
            margin-right: 5px;
        }

        .feedback-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

            .feedback-table th,
            .feedback-table td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            .feedback-table th {
                background-color: #22333B;
                color: white;
            }

        .container-main {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            margin-top: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
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

        <div class="container container-main">
            <h2 class="mb-4">Feedback Administration</h2>

            <asp:Panel ID="pnlNoFeedback" runat="server" Visible="false" CssClass="alert alert-info">
                <p>No feedback entries available.</p>
            </asp:Panel>

            <asp:Literal ID="litFeedbackTable" runat="server" />
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
