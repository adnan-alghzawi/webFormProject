<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="webFormProject.suleiman.about" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>About Us</title>
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

            .container-main {
                background-color: white;
                padding: 2rem;
                border-radius: 8px;
                margin-top: 2rem;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .about-content {
                max-width: 800px;
                margin: 0 auto;
                line-height: 1.6;
            }

            .icon-large {
                font-size: 2.5rem;
                color: #22333B;
                margin-bottom: 1rem;
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <!-- navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-umber">
                <a class="navbar-brand ps-3 text-white" href="#">
                    <img class="imglogo" src="imgs/Lumina__1_-removebg-preview.png" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="homeTab" runat="server"
                                OnClick="homeTab_Click" Text="Home"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link active text-white" ID="aboutTab" runat="server"
                                OnClick="aboutTab_Click" Text="About Us"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="contactTab" runat="server"
                                OnClick="contactTab_Click" Text="Contact Us"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="books" runat="server"
                                OnClick="books_Click" Text="Books"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="rooms" runat="server"
                                OnClick="rooms_Click" Text="Meeting Rooms"></asp:LinkButton>
                        </li>
                    </ul>
                   <div runat="server" id="buttons" visible="true">
     <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="login_Click"></asp:Button>
     <asp:Button ID="rigester" runat="server" Text="register" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="rigester_Click"></asp:Button>
 </div>

    <div runat="server" id="buttons2" visible="false">
    <asp:Button ID="logout" runat="server" Text="logout" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="logout_Click"></asp:Button>
    <asp:Button ID="prof" runat="server" Text="Profile" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="prof_Click"></asp:Button>
</div>


                </div>
            </nav>

            <div class="container container-main">
                <div class="about-content">
                    <h2 class="text-center mb-4">About Our Library</h2>

                    <div class="text-center mb-5">
                        <i class="fas fa-book-open icon-large"></i>
                    </div>

                    <p class="lead">Welcome to Lumina Library, your gateway to knowledge and community since 1995.</p>

                    <div class="mb-4">
                        <h4 class="mb-3"><i class="fas fa-bullseye me-2"></i>Our Mission</h4>
                        <p>To provide free access to information, foster lifelong learning, and serve as a cultural hub
                            for our community.</p>
                    </div>

                    <div class="mb-4">
                        <h4 class="mb-3"><i class="fas fa-users me-2"></i>Our Facilities</h4>
                        <ul class="list-unstyled">
                            <li class="mb-2">• Over 50,000 books across various genres</li>
                            <li class="mb-2">• State-of-the-art meeting rooms</li>
                            <li class="mb-2">• Children's reading area</li>
                            <li class="mb-2">• Free public internet access</li>
                            <li class="mb-2">• Regular community events</li>
                        </ul>
                    </div>

                    <div class="mb-4">
                        <h4 class="mb-3"><i class="fas fa-clock me-2"></i>Opening Hours</h4>
                        <p>Monday - Friday: 9 AM - 8 PM<br />
                            Saturday: 10 AM - 6 PM<br />
                            Sunday: Closed</p>
                    </div>
                </div>
            </div>
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>