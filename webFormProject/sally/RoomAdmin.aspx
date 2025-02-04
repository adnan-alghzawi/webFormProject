<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomAdmin.aspx.cs" Inherits="webFormProject.sally.RoomAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>home</title>
    <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #22333B;
            color: white;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .abtn {
            display: block;
            color: white;
            background-color: #22333B;
            padding: 10px;
            text-decoration: none;
            margin: 10px 0;
            border: none !important;
            width: 100%;
            text-align: left;
        }

            .abtn:hover {
                background-color: #34495e;
            }


        .bg-umber {
            background-color: #22333B;
        }

        form {
            height: 95vh;
        }

        body {
            background-color: #EAE0D6;
        }

        .imglogo {
            width: 40%;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
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

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition */
        }

            .card:hover {
                transform: translateY(-5px); /* Moves the card up */
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15); /* Adds shadow */
            }
    </style>
</head>
<body>
    <form id="form1" class="" runat="server">
        <div class="d-flex flex-column min-vh-100">
            <div class="sidebar animate hidden">
                <img src="imgs/Lumina__1_-removebg-preview.png" class="imglogo" />
                <asp:Button ID="Dashboard" runat="server" Text="dashboard" OnClick="Dashboard_Click" CssClass="abtn" />

                <asp:Button ID="editB" runat="server" Text="All Books" OnClick="editB_Click" CssClass="abtn" />
                <asp:Button ID="editR" runat="server" Text="All Room" OnClick="editR_Click" CssClass="abtn" />
                <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
                <asp:Button ID="Borrow" runat="server" Text="Borrow Book" OnClick="Borrow_Click" CssClass="abtn" />
                <asp:Button ID="logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="abtn" />

            </div>
            <div class="content">
                <div class="container my-5 ">
                    <div class="row d-flex justify-content-center w-100">
                        <asp:DropDownList CssClass="form-select w-25 me-1" ID="ddlSearchRoom" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SearchRoom_Click">
                            <asp:ListItem Text="Select Room" Value="" />
                            <asp:ListItem Text="Private Room" Value="Private room" />
                            <asp:ListItem Text="Meeting Room" Value="Meeting room" />
                            <asp:ListItem Text="Available" Value="true" />
                            <asp:ListItem Text="not Available" Value="false" />
                        </asp:DropDownList>
                        <asp:Button ID="AddRooms" runat="server" Text="Add Rooms" CssClass="btn btn-green1 my-2 my-sm-0" OnClick="AddRooms_Click"></asp:Button>
                        <asp:Button ID="Export" runat="server" Text="Export Report" CssClass="btn btn-green1 my-2 my-sm-0" OnClick="Export_Click"></asp:Button>


                        <%--<asp:Button ID="SearchRoom" runat="server" Text="Search" CssClass="btn btn-green1 my-2 my-sm-0 me-5 " OnClick="SearchRoom_Click"></asp:Button>--%>
                    </div>
                </div>
                <asp:GridView ID="gvRooms" runat="server" AutoGenerateColumns="false" DataKeyNames="ID"
                    CssClass="table table-bordered mt-3" OnRowCommand="gvRooms_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Room Name" />
                        <asp:BoundField DataField="RoomType" HeaderText="Room Type" />
                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="IsAvailable" HeaderText="Available" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm"
                                    CommandName="EditRoom" CommandArgument='<%# Container.DataItemIndex %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                    CommandName="DeleteRoom" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <footer class="bg-umber text-center text-lg-start text-white mt-auto">
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2020 Copyright:
        <span>LUMINA</span>
            </div>
            <!-- Copyright -->
        </footer>
    </form>

</body>
</html>
