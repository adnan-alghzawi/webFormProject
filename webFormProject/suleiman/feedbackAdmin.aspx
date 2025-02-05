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
            width: 40%;
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
    </style>
</head>

<body class="d-flex flex-column min-vh-100">
    <form id="form1" runat="server">
        <!-- navbar -->

        <div class="sidebar animate hidden">
            <img src="imgs/Lumina__1_-removebg-preview.png" class="imglogo" />
            <asp:Button ID="dash" runat="server" Text="Dashboard" OnClick="dash_Click" CssClass="abtn" />
            <asp:Button ID="editB" runat="server" Text="All Books" OnClick="editB_Click" CssClass="abtn" />
            <asp:Button ID="editR" runat="server" Text="All Room" OnClick="editR_Click" CssClass="abtn" />
            <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
            <asp:Button ID="Borrow" runat="server" Text="Borrow" OnClick="Borrow_Click" CssClass="abtn" />
            <asp:Button ID="Button1" runat="server" Text="logout" OnClick="Button1_Click" CssClass="abtn" />
        </div>
        <div class="content">

            <div class="container container-main">
                <h2 class="mb-4">Feedback Administration</h2>

                <asp:Panel ID="pnlNoFeedback" runat="server" Visible="false" CssClass="alert alert-info">
                    <p>No feedback entries available.</p>
                </asp:Panel>

                <asp:Literal ID="litFeedbackTable" runat="server" />
            </div>

        </div>
       <%-- <footer class="bg-umber text-center text-lg-start text-white mt-auto">
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2020 Copyright:
        <span>LUMINA</span>
            </div>
            <!-- Copyright -->
        </footer>--%>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
