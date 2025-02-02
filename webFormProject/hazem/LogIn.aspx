﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="task1_webForm_27_1_2025.login_page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #EAE0D6;
            color: #22333B;
        }
        .card {
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #22333B;
            padding: 2rem;
        }
        .form-control {
            border-radius: 10px;
            background-color: #22333B;
            color: #EAE0D6;
            border: none;
        }
        .btn-primary {
            background-color: #22333B;
            border: none;
            border-radius: 10px;
            transition: 0.3s;
            color: #EAE0D6;
        }
        .btn-primary:hover {
            background-color: #22333B;
            color: #EAE0D6;
        }
        label, .form-check-label {
            color: #EAE0D6;
        }
        .social-icons button {
            background-color: #EAE0D6;
            border: none;
        }
        .social-icons button:hover {
            background-color: #22333B;
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
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="row w-100">
                <div class="col-md-8 col-lg-6 mx-auto">
                    <div class="card text-center">
                        <h2 class="fw-bold" style="color:#EAE0D6">Login</h2>
                        <div class="social-icons my-3">
                            <button class="btn btn-primary mx-1"><i class="fab fa-facebook-f"></i></button>
                            <button class="btn btn-primary mx-1"><i class="fab fa-twitter"></i></button>
                            <button class="btn btn-primary mx-1"><i class="fab fa-linkedin-in"></i></button>
                        </div>
                        <p class="fw-bold">Or</p>
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <asp:TextBox ID="email_address" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter a valid email address" style="background-color:#EAE0D6;" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <asp:TextBox ID="login_password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" style="background-color:#EAE0D6;" />
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe" />
                                <label class="form-check-label" for="rememberMe">Remember me</label>
                            </div>
                            <a href="#" class="text-decoration-none" style="color: #C6AD8F;">Forgot password?</a>
                        </div>
                        <asp:Button ID="login_button" runat="server" Text="Login" OnClick="login_button_Click" CssClass="btn btn-primary w-100" />
                        <p class="small fw-bold mt-3" style="color:#EAE0D6">Don't have an account? <a href="https://localhost:44356/hazem/registration.aspx" class="text-decoration-none" style="color: #C6AD8F;">Register</a></p>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

