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
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
                    <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4"></asp:Button>
                    <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4"></asp:Button>
                </div>
            </nav>
            <div id="borrowBook" runat="server">
                <div class="container mt-5">

                    <div class="row">
                        <!-- Book Image -->
                        <div class="col-md-3">
                            <asp:Image ID="bookImage" runat="server" ImageUrl=".\imgs\book1.jpg" CssClass="img-fluid" />
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
                                <div class="col-md-6">
                                    <label for="startTime">Start Time:</label>
                                    <asp:TextBox ID="startTime" runat="server" CssClass="form-control" TextMode="Time" />
                                </div>
                                <!-- End Date & Time -->
                                <div class="col-md-6">
                                    <label for="startDate">Start Date:</label>
                                    <asp:TextBox ID="startDate" runat="server" CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label for="endTime">End Time:</label>
                                    <asp:TextBox ID="endTime" runat="server" CssClass="form-control" TextMode="Time" />
                                </div>
                                <!-- End Date & Time -->
                                <div class="col-md-6">
                                    <label for="endDate">End Date:</label>
                                    <asp:TextBox ID="endDate" runat="server" CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="submitButton" runat="server" Text="Submit" class="btn btn-primary" OnClick="submitButton_Click" />
                                    <asp:Label ID="msg" Text="Please fill in all fields" runat="server" Visible="false" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Modal (Popup) -->
           <%-- <div class="modal fade" id="borrowRequestModal" tabindex="-1" aria-labelledby="borrowRequestModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="borrowRequestModalLabel">Request Submitted</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Your borrow request has been submitted successfully.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a href="show_books.aspx" class="btn btn-primary">Go to Books</a>
                        </div>
                    </div>
                </div>
            </div>--%>

        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
