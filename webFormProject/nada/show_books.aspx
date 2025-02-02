<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_books.aspx.cs" Inherits="webFormProject.nada.show_books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books</title>
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
                            <asp:LinkButton CssClass="nav-link text-white" ID="books" runat="server" OnClick="contactTab_Click" Text="Books"></asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton CssClass="nav-link text-white" ID="rooms" runat="server" OnClick="contactTab_Click" Text="Meeting Rooms"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <div>
                    <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4"></asp:Button>
                    <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4"></asp:Button>
                </div>

            </nav>


            <section class="section2">
                <div class="row m-0">
                    <div class="search-container">
                        <asp:TextBox ID="searchTextBox" runat="server" Placeholder="Search for your favorite Book ..." CssClass="search-input"></asp:TextBox>
                        <asp:Button ID="searchButton" runat="server" CssClass="search-button" OnClick="SearchButton_Click" />
                    </div>

                    <div class="filter-container">
                        <asp:DropDownList ID="filterOptions" runat="server" OnSelectedIndexChanged="SearchButton_Click" AutoPostBack="true">
                            <asp:ListItem Value="all">All Books</asp:ListItem>
                            <asp:ListItem Value="available">Available Only</asp:ListItem>
                            <asp:ListItem Value="notAvailable">Not Available</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </section>

            <section class="cards-book">
                <div class="mb-3 row" runat="server" id="booksContainer">
                    
                </div>
            </section>
        </div>
    </form>
</body>
</html>
