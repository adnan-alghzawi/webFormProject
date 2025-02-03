<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="webFormProject.suleiman.contactUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
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

        .img-fluid {
            max-height: 100%;  /* Ensure the image height matches the form height */
            object-fit: cover; /* Cover will ensure the aspect ratio is maintained */
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

        .container-main {
            display: flex;
            justify-content: space-between;
            align-items: stretch; /* Align items in their containers to stretch to match heights */
            gap: 20px;
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            margin-top: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 87%;
            background-color: #22333B;
            color: #EAE0D6;
        }

        .contact-form {
            flex: 1;  /* Allow the form to grow to use up extra space */
            display: flex;
            flex-direction: column;
        }
        .img-fluid {
    max-width: 100%;
    height: 90%;
    border-radius: 20px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-umber">
            <a class="navbar-brand ps-3 text-white" href="#">
                <img class="imglogo" src="../adnan/Images/Books/Lumina-removebg-preview.png" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active text-white" id="homeTab" href="../jana/index.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" id="aboutTab" href="../jana/about.aspx">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" runat="server" id="books" href="../nada/show_books.aspx">Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" runat="server" id="rooms" href="../jana/ViewRooms.aspx">Rooms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" id="contact" href="../suleiman/contactUs.aspx">Contact Us</a>
                    </li>
                </ul>
            </div>
            <div runat="server" id="buttons" visible="true">
                <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="login_Click"></asp:Button>
                <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="rigester_Click"></asp:Button>
            </div>
            <div runat="server" id="buttons2" visible="false">
                <asp:Button ID="logout" runat="server" Text="logout" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="logout_Click"></asp:Button>
                <asp:Button ID="prof" runat="server" Text="Profile" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="prof_Click"></asp:Button>
            </div>
        </nav>
        <div class="container container-main">
            <div style="flex: 1;">
                <img src="../adnan/Images/Books/contact.png" class="img-fluid" alt="University Library Reception Area" />
            </div>
            <div class="contact-form" style="flex: 1;">
                <h2 class="text-center mb-4">Contact Us</h2>
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success">
                    Thank you for your message! We'll respond shortly.
                </asp:Panel>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txtName">Name</asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txtEmail">Email</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Required="true"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txtMessage">Message</asp:Label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Required="true"></asp:TextBox>
                </div>
                <div class="text-center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn btn-green" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
