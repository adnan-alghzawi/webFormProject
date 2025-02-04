<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowBooks.aspx.cs" Inherits="webFormProject.adnan.ShowBooks" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Show Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        body {
            background-color: #EAE0D6;
        }

        .card {
            width: 300px;
            min-height: 450px;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease;
        }

            .card img {
                height: 250px;
                object-fit: cover;
                width: 100%;
            }

        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .edit-btn, .export-btn {
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }

            .edit-btn:hover, .export-btn:hover {
                background-color: #28a745;
                color: white;
            }

        .form-control {
            width: auto;
            display: inline-block;
        }

        .bg-umber {
            background-color: #22333B;
        }

        .imglogo {
            width: 40%;
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

        .content {
            margin-left: 292px;
            padding: 10px;
            width: 75%;
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


        .text-center {
            text-align: center !important;
            margin-left: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar animate hidden">
            <img src="Images/Books/Lumina-removebg-preview.png" class="imglogo" />
            <asp:Button ID="dash" runat="server" Text="Dashboard" OnClick="dash_Click" CssClass="abtn" />
            <asp:Button ID="editB" runat="server" Text="All Books" OnClick="editB_Click" CssClass="abtn" />
            <asp:Button ID="editR" runat="server" Text="All Room" OnClick="editR_Click" CssClass="abtn" />
            <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
            <asp:Button ID="Borrow" runat="server" Text="Borrow Book" OnClick="Borrow_Click" CssClass="abtn" />
            <asp:Button ID="logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="abtn" />
        </div>
        <div class="content">
            <div class="mt-5">
                <h2 class="text-center">📚 Books</h2>
                <div class="btn-container">
                    <asp:DropDownList ID="ddlFilter" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                        <asp:ListItem Value="All">All Books</asp:ListItem>
                        <asp:ListItem Value="Available">Available Books</asp:ListItem>
                        <asp:ListItem Value="Unavailable">Unavailable Books</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-green1 my-2 my-sm-0" OnClick="export_Click" />

                    <asp:Button ID="btnAddBook" runat="server" Text="Add Book" CssClass="btn btn-green1 my-2 my-sm-0" OnClick="btnAddBook_Click" />
                </div>
                <br />
                <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered mt-3"
                    OnRowCommand="gvBooks_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                        <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                        <asp:BoundField DataField="Type" HeaderText="Type" />
                        <asp:BoundField DataField="Level" HeaderText="Level" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Availability" HeaderText="Availability" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm"
                                    CommandName="EditBook" CommandArgument='<%# Eval("BookID") %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                    CommandName="DeleteBook" CommandArgument='<%# Eval("BookID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <br />
            </div>



        </div>
    </form>
</body>
</html>
