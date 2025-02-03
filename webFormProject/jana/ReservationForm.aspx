<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationForm.aspx.cs" Inherits="webFormProject.jana.ReservationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #EAE0D6;
            /*background-image: url('FormPhoto.jpg');*/ /* Path to your image */
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
                    <!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light  bg-umber pb-0 pt-0">
    <a class="navbar-brand ps-3 text-white  pb-0 pt-0" href="#">
        <img class="imglogo" src="Lumina-removebg-preview1.png" /></a>
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
    <asp:LinkButton CssClass="nav-link text-white" ID="books" runat="server" OnClick="books_Click" Text="Books"></asp:LinkButton>
</li>
<li class="nav-item">
    <asp:LinkButton CssClass="nav-link text-white" ID="rooms" runat="server" OnClick="rooms_Click" Text="Rooms"></asp:LinkButton>
</li>
            <li class="nav-item">
    <asp:LinkButton CssClass="nav-link text-white" ID="contactTab" runat="server" OnClick="contactTab_Click" Text="Contact Us"></asp:LinkButton>
</li>
        </ul>
    </div>
    <div>
        <div runat="server" id="buttons" visible="true">
            <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="login_Click"></asp:Button>
            <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="rigester_Click"></asp:Button>
        </div>

        <div runat="server" id="buttons2" visible="false">
            <asp:Button ID="logout" runat="server" Text="logout" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="logout_Click"></asp:Button>
            <asp:Button ID="prof" runat="server" Text="Profile" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="prof_Click"></asp:Button>
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
            </div>
        <br />
        <br />
        <br />
        <br />
             <!-- Footer -->
  <footer class="text-center text-lg-start bg-umber text-white">
      <!-- Section: Social media -->
      <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
          <!-- Left -->
          <div class="me-5 d-none d-lg-block">
              <span>Get connected with us on social networks:</span>
          </div>
          <!-- Left -->

          <!-- Right -->
          <div>
              <a href="" class="me-4 text-reset">
                  <i class="fab fa-facebook-f"></i>
              </a>
              <a href="" class="me-4 text-reset">
                  <i class="fab fa-twitter"></i>
              </a>
              <a href="" class="me-4 text-reset">
                  <i class="fab fa-google"></i>
              </a>
              <a href="" class="me-4 text-reset">
                  <i class="fab fa-instagram"></i>
              </a>
              <a href="" class="me-4 text-reset">
                  <i class="fab fa-linkedin"></i>
              </a>
              <a href="" class="me-4 text-reset">
                  <i class="fab fa-github"></i>
              </a>
          </div>
          <!-- Right -->
      </section>
      <!-- Section: Social media -->

      <!-- Section: Links  -->
      <section class="">
          <div class="container text-center text-md-start mt-5">
              <!-- Grid row -->
              <div class="row mt-3">
                  <!-- Grid column -->
                  <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                      <!-- Content -->
                      <img src="../sally/imgs/Lumina__1_-removebg-preview.png" style="width:70%" />
                      <p>
                         University Library System
                      </p>
                  </div>
                  <!-- Grid column -->

                  <!-- Grid column -->
                  <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                      <!-- Links -->
                      <h6 class="text-uppercase fw-bold mb-4">Services
</h6>
                      <p>
                          <a href="#!" class="text-reset">Books</a>
                      </p>
                      <p>
                          <a href="#!" class="text-reset">Meeting rooms</a>
                      </p>
                      <p>
                          <a href="#!" class="text-reset">Private rooms</a>
                      </p>
                      
                  </div>
                  <!-- Grid column -->

                  <!-- Grid column -->
                  <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                      <!-- Links -->
                      <h6 class="text-uppercase fw-bold mb-4">Useful links
</h6>
                      <p>
                          <a href="#!" class="text-reset">Home</a>
                      </p>
                      <p>
                          <a href="#!" class="text-reset">About us</a>
                      </p>
                      <p>
                          <a href="#!" class="text-reset">Contact Us</a>
                      </p>
                     
                  </div>
                  <!-- Grid column -->

                  <!-- Grid column -->
                  <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                      <!-- Links -->
                      <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                      <p><i class="fas fa-home me-3"></i>New York, NY 10012, US</p>
                      <p>
                          <i class="fas fa-envelope me-3"></i>
                          LUMINA@gmail.com
         
                      </p>
                      <p><i class="fas fa-phone me-3"></i>+ 01 234 567 88</p>
                      <p><i class="fas fa-print me-3"></i>+ 01 234 567 89</p>
                  </div>
                  <!-- Grid column -->
              </div>
              <!-- Grid row -->
          </div>
      </section>
      <!-- Section: Links  -->

      <!-- Copyright -->
      <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
          © 2025 Copyright:
   
          <a class="text-reset fw-bold" href="https://mdbootstrap.com/">LUMINA.com</a>
      </div>
      <!-- Copyright -->
  </footer>
  <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>
    </form>
</body>
</html>
