<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationForm.aspx.cs" Inherits="webFormProject.jana.ReservationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-image: url('FormPhoto.jpg'); /* Path to your image */
            background-size: cover; /* Make the image cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent repeating */
            background-attachment: fixed;
            
        }
        
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
         width: 10% !important;
     }

    </style>


</head>
<body>
    <form id="form1" runat="server">
                    <!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light  bg-umber">
    <a class="navbar-brand ps-3 text-white" href="#">
        <img class="imglogo" src="../sally/imgs/Lumina_1-removebg-preview.png" /></a>
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
        <div>
            <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0"></asp:Button>
            <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0"></asp:Button>
        </div>
    </div>
</nav>
        <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3 border p-4 shadow bg-light">
                <div class="col-12">
                    <h3 class="fw-normal text-secondary fs-4 text-uppercase mb-4">Room Reservation form</h3>
                </div>
               <div class="row g-3">
    
    <!-- Room ID (ReadOnly) -->
    <div class="col-md-6">
        <asp:TextBox ID="roomID" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Room ID"></asp:TextBox>
    </div>

    <!-- Room Type (ReadOnly) -->
    <div class="col-md-6">
        <asp:TextBox ID="roomType" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Room Type"></asp:TextBox>
    </div>

    <!-- Full Name -->
    <div class="col-md-6">
        <asp:TextBox ID="fullName" runat="server" CssClass="form-control" placeholder="Full Name" required></asp:TextBox>
    </div>

    <!-- Email -->
    <div class="col-md-6">
        <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" required></asp:TextBox>
    </div>

    <!-- Phone Number -->
    <div class="col-md-6">
        <asp:TextBox ID="phoneNumber" runat="server" CssClass="form-control" placeholder="Phone Number" TextMode="Phone" required></asp:TextBox>
    </div>

    <!-- Date -->
    <div class="col-md-6">
        <asp:TextBox ID="reservationDate" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
    </div>

    <!-- Start Time (Triggers End Time Calculation) -->
    <div class="col-md-6">
        <asp:TextBox ID="startTime" runat="server" CssClass="form-control" TextMode="Time" AutoPostBack="true" OnTextChanged="startTime_TextChanged" required></asp:TextBox>
    </div>

    <!-- End Time (Calculated Automatically) -->
    <div class="col-md-6">
        <asp:TextBox ID="endTime" runat="server" CssClass="form-control" TextMode="Time" ReadOnly="true" required></asp:TextBox>
    </div>

    <!-- Message Box for Additional Requests -->
    <div class="col-md-12">
        <asp:TextBox ID="specialRequests" runat="server" CssClass="form-control" placeholder="Special Requests" TextMode="MultiLine"></asp:TextBox>
    </div>

    <!-- Submit Button -->
    <div class="col-md-12 text-center">
        <asp:Button ID="btnReserve" runat="server" Text="Confirm Reservation" CssClass="btn btn-success" OnClick="btnReserve_Click" />
    </div>

</div>

        </div>
    </div>
    </form>
</body>
</html>
