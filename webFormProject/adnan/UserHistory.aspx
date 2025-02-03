<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHistory.aspx.cs" Inherits="LibraryManagement.UserHistory" %>

<!DOCTYPE html>
<html lang="en">
    <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    
<head runat="server">
    <title>User Borrowing History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
/*            margin: 20px;*/
        }

        .gridview-container {
            max-width: 800px;
            margin: auto;
            border: 1px solid #ddd;
/*            padding: 15px;*/
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        }
        .gridview th {
            background-color: #007bff;
            color: white;
            padding: 8px;
        }

        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
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
        <br />
        <br />
        <div class="gridview-container">
            <h2 style="text-align: center;">User Borrowing History</h2>
            <asp:GridView ID="gvUserHistory" runat="server" CssClass="gridview" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                    <asp:BoundField DataField="BookName" HeaderText="Book name" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Footer -->
  <footer class="text-center text-lg-start bg-umber text-white fixed-bottom" >
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
                      <img src="../adnan/Images/Books/Lumina-removebg-preview.png" style="width:70%" />
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
          Â© 2025 Copyright:
   
          <a class="text-reset fw-bold" href="https://mdbootstrap.com/">LUMINA.com</a>
      </div>
      <!-- Copyright -->
  </footer>
  <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>
    </form>
</body>
</html>
