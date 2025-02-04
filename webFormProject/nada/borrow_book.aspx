<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="borrow_book.aspx.cs" Inherits="webFormProject.nada.borrow_book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Borrow Book</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body class="d-flex flex-column min-vh-100">
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-light  bg-umber pb-0 pt-0">
                <a class="navbar-brand ps-3 text-white  pb-0 pt-0" href="#">
                    <img class="imglogo" src="./imgs/Lumina-removebg-preview.png" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ">
                        <li class="nav-item ">
                            <asp:LinkButton CssClass="nav-link active text-white" ID="homeTab" runat="server" OnClick="homeTab_Click" Text="Home"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="aboutTab" runat="server" OnClick="aboutTab_Click" Text="About"></asp:LinkButton>
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
            <div id="borrowBook" runat="server">
                <div class="container mt-5">

                    <div class="row">
                        <!-- Book Image -->
                        <div class="col-md-3">
                            <asp:Image ID="bookImage" runat="server" ImageUrl="" CssClass="img-fluid" Height="500px" />
                        </div>

                        <!-- Book Details -->
                        <div class="col-md-8">
                            <div class="row">
                                <h3 style="color: #22333B;">Book Details</h3>
                                <br />
                                <!-- Book Name -->
                                <div class="col-md-12 mb-3">
                                    <label for="bookName">Book Name:</label>
                                    <asp:TextBox ID="bookName" runat="server" Text="Book Title" ReadOnly="True" CssClass="form-control" />
                                </div>
                                <!-- Book Type -->
                                <div class="col-md-12 mb-3">
                                    <label for="bookType">Book Type:</label>
                                    <asp:TextBox ID="bookType" runat="server" Text="Fiction" ReadOnly="True" CssClass="form-control" />
                                </div>
                                <!-- Book Level -->
                                <div class="col-md-12 mb-3">
                                    <label for="bookLevel">Book Level:</label>
                                    <asp:TextBox ID="bookLevel" runat="server" Text="Intermediate" ReadOnly="True" CssClass="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="startDate">Start Date:</label>
                                    <asp:TextBox ID="startDate" runat="server" CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="startTime">Start Time:</label>
                                    <asp:TextBox ID="startTime" runat="server" CssClass="form-control" TextMode="Time" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="endDate">End Date:</label>
                                    <asp:TextBox ID="endDate" runat="server" CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="endTime">End Time:</label>
                                    <asp:TextBox ID="endTime" runat="server" CssClass="form-control" TextMode="Time" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="submitButton" runat="server" Text="Submit" class="btn btn-primary" OnClick="submitButton_Click" />
                                    <asp:Label ID="msg" Text="Please fill up all fields" runat="server" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
                <!-- Footer -->
        <footer class="text-center text-lg-start bg-umber text-white mt-auto">
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
                            <img src="../sally/imgs/Lumina__1_-removebg-preview.png" style="width: 70%" />
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var today = new Date();
            var tenDaysLater = new Date(today);
            tenDaysLater.setDate(today.getDate() + 10);

            var startDateInput = document.getElementById("<%= startDate.ClientID %>");
            var endDateInput = document.getElementById("<%= endDate.ClientID %>");

            startDateInput.min = today.toISOString().split("T")[0];
            startDateInput.max = tenDaysLater.toISOString().split("T")[0];

            startDateInput.addEventListener("change", function () {
                if (startDateInput.value) {
                    var startDateValue = new Date(startDateInput.value);
                    var minEndDate = new Date(startDateValue);
                    minEndDate.setDate(startDateValue.getDate() + 1);
                    var maxEndDate = new Date(startDateValue);
                    maxEndDate.setDate(startDateValue.getDate() + 7);

                    endDateInput.min = minEndDate.toISOString().split("T")[0];
                    endDateInput.max = maxEndDate.toISOString().split("T")[0];

                    if (endDateInput.value < endDateInput.min || endDateInput.value > endDateInput.max) {
                        endDateInput.value = "";
                    }
                }
            });
        };


    </script>


</body>
</html>
