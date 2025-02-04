<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRooms.aspx.cs" Inherits="webFormProject.jana.ViewRooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #EAE0D6;
        }
        .search{
            display:flex;
            justify-content:center;
            align-items:center;
           
            margin-top:30px;
            
        }
        .searchButton {
            background-color: #22333B;
            color: white;
            width: 100px;
            margin-left: 25px;
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
        .filter-container {
    position: absolute;
   
    top:380px; 
    right: 245px; 
}

.filter-container select {
    padding: 8px;
    font-size: 16px;
    border-radius: 5px;
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
    .header-image {
    width: 100%;
    height: 300px; /* Adjust height as needed */
    text-align: center;
}

.header-image img {
    width: 100%;
    height: 100%;
    
}

        .numper {
            background-color:blue;
        }
/*--------------------------------------------------------------
# Breadcrumbs
--------------------------------------------------------------*/
.breadcrumbs {
    padding: 140px 0 60px 0;
    min-height: 30vh;
    position: relative;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
  
  .breadcrumbs:before {
    content: "";
    background-color: rgba(0, 0, 0, 0.6);
    position: absolute;
    inset: 0;
  }
  
  .breadcrumbs h2 {
    font-size: 56px;
    font-weight: 500;
    color: #fff;
    font-family: var(--font-secondary);
  }
  

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


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
             <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="background-image: url('roomspage2.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

        <h2>Rooms</h2>
        
      </div>
    </div><!-- End Breadcrumbs -->
             
             <div class="search">
               
                 <asp:TextBox CssClass="form-control mr-sm-2 w-25 me-1" ID="search" runat="server" placeholder="Search about room "></asp:TextBox>
                    <asp:Button ID="SearchRoom" runat="server" Text="Search" CssClass="btn btn-green1 my-2 my-sm-0 me-5 "  OnClick="SearchRoom_Click"></asp:Button>
                     
                </div>
            <br />             
            <br />
            <div class="container pt-3 d-flex gap-2 flex-wrap justify-content-center" id="Cards" runat="server">
        </div>
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
