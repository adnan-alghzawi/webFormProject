<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHistory.aspx.cs" Inherits="LibraryManagement.UserHistory" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>User Borrowing History</title>

    <!-- FontAwesome & Bootstrap -->
    <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #EAE0D6;
            font-family: 'Poppins', sans-serif;
        }

        /* تحسين تصميم الجدول */
        .gridview-container {
            max-width: 900px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            background-color: #fff;
            padding: 20px;
            text-align: center;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .gridview th {
            background-color: #22333B;
            
            color: white;
            padding: 10px;
            text-transform: uppercase;
        }
        .text-u{
            color:#22333B;
        }

        .gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }

        /* تحسين زر تسجيل الدخول والتسجيل */
        .btn-custom {
            background-color: #22333B;
            color: #EAE0D6;
            border-radius: 50px;
            padding: 10px 20px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #EAE0D6;
            color: #22333B;
            border: 2px solid #22333B;
        }

        /* تحسين الهيدر */
        .bg-umber {
            background-color: #22333B;
        }

        .imglogo {
            width: 20%;
        }

        .container-main {
            background-color: #22333B;
            color: #EAE0D6;
            padding: 2rem;
            border-radius: 8px;
            width: 87%;
            margin: auto;
            margin-top: 2rem;
        }

    </style>
</head>

<body class="d-flex flex-column min-vh-100">
    <form id="form1" runat="server">
        
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-umber">
            <a class="navbar-brand ps-3 text-white" href="#">
                <img class="imglogo" src="../adnan/Images/Books/Lumina-removebg-preview.png" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-white" href="../jana/index.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="../jana/about.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="../nada/show_books.aspx">Books</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="../jana/ViewRooms.aspx">Rooms</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="../suleiman/contactUs.aspx">Contact Us</a></li>
                </ul>
            </div>
            <div runat="server" id="buttons" visible="true">
                <asp:Button ID="login" runat="server" Text="Login" class="btn btn-custom me-2" OnClick="login_Click"></asp:Button>
                <asp:Button ID="rigester" runat="server" Text="Register" class="btn btn-custom" OnClick="rigester_Click"></asp:Button>
            </div>
            <div runat="server" id="buttons2" visible="false">
                <asp:Button ID="logout" runat="server" Text="Logout" class="btn btn-custom me-2" OnClick="logout_Click"></asp:Button>
                <asp:Button ID="prof" runat="server" Text="Profile" class="btn btn-custom" OnClick="prof_Click"></asp:Button>
            </div>
        </nav>

        <!-- User Borrowing History Table -->
        <div class="gridview-container mt-4">
            <h2 class="mb-3 text-u">User Borrowing History</h2>
            <asp:GridView ID="gvUserHistory" runat="server" CssClass="gridview" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <!-- Footer -->
        <!-- Footer -->
  <footer class="text-center text-lg-start bg-umber text-white mt-auto" >
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
    </form>
</body>
</html>
