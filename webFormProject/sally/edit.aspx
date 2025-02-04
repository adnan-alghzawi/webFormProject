<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="webFormProject.sally.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>edit rooms</title>
    <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <style>
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
            margin-left: 250px;
            padding: 20px;
        }

        .bg-umber {
            background-color: #22333B;
        }

        body {
            background-color: #EAE0D6;
        }

        .imglogo {
            width: 40%;
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

        .btn-red {
            --bs-btn-color: #fff !important;
            --bs-btn-bg: #7a0505 !important;
            --bs-btn-border-color: #7a0505;
            --bs-btn-hover-color: #7a0505;
            --bs-btn-hover-bg: #fff;
            --bs-btn-hover-border-color: #7a0505 !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #fff;
            --bs-btn-active-bg: #7a0505;
            --bs-btn-active-border-color: #7a0505;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #fff;
            --bs-btn-disabled-bg: #7a0505;
            --bs-btn-disabled-border-color: #7a0505;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="sidebar animate hidden">
                <img src="imgs/Lumina__1_-removebg-preview.png" class="imglogo" />
                <asp:Button ID="Dashboard" runat="server" Text="dashborad" OnClick="Dashboard_Click" CssClass="abtn" />

                <asp:Button ID="editB" runat="server" Text="All Books" OnClick="editB_Click" CssClass="abtn" />
                <asp:Button ID="editR" runat="server" Text="All Room" OnClick="editR_Click" CssClass="abtn" />
                <asp:Button ID="Reservations" runat="server" Text="Reservations" OnClick="Reservations_Click" CssClass="abtn" />
                <asp:Button ID="Borrow" runat="server" Text="Borrow Book" OnClick="Borrow_Click" CssClass="abtn" />
                <asp:Button ID="logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="abtn" />

            </div>

            <div class="content">
                <div class="container my-5">
                    <div class="row d-flex w-100">
                        <label>Search by ID:</label>
                        <asp:TextBox CssClass="form-control mr-sm-2 w-25 me-1" ID="search" runat="server"></asp:TextBox>

                        <asp:Button ID="back" runat="server" Text="bcak" CssClass="btn btn-green1 my-2 my-sm-0 " OnClick="Back_Click"></asp:Button>
                    </div>
                    <asp:Label ID="lblMessage2" runat="server" CssClass="text-success mt-3"></asp:Label>
                </div>


                <div class="container bg-umber d-flex flex-column align-items-start text-white justify-content-center w-50 mt-5 p-5">
                    <img id="image" runat="server" class="w-100" />
                    <br />
                    <br />
                    <div class="row w-100">
                        <div class="col-md-6">
                            <label class="form-label">Room name:</label>
                            <asp:TextBox ID="roomName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="type" class="form-label">Type:</label>
                            <asp:DropDownList ID="type" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Private room">Private room</asp:ListItem>
                                <asp:ListItem Value="Meeting room">Meeting room</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <br />

                    <div class="row w-100">
                        <div class="col-md-6">
                            <label class="form-label">Capacity:</label>
                            <asp:TextBox ID="Capacity" runat="server" CssClass="form-control" OnTextChanged="Capacity_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </div>
                        <div class="col-md-6">

                            <label for="Available" class="form-label">Available:</label>
                            <asp:DropDownList ID="Available" runat="server" CssClass="form-control">
                                <asp:ListItem Value="true">Available</asp:ListItem>
                                <asp:ListItem Value="false">Not Available</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <br />
                    <label>description:</label>
                    <asp:TextBox ID="description" runat="server" CssClass="form-control"></asp:TextBox>


                    <br />
                    <br />
                    <asp:TemplateField HeaderText="Action">
                        <itemtemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-green btn-sm"
                                CommandArgument='<%# Eval("RoomID") %>' OnClick="edit_Click" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-red btn-sm"
                                CommandArgument='<%# Eval("RoomID") %>' OnClick="delete_Click" />
                        </itemtemplate>
                    </asp:TemplateField>
                    <div class="row">
                        <asp:Label ID="res" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function confirmDelete() {
            // عرض التنبيه باستخدام SweetAlert2
            Swal.fire({
                title: 'ِAre you sure?',
                text: 'Do you want to delete this room?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel',
            }).then((result) => {
                if (result.isConfirmed) {
                    // إذا أكد المستخدم الحذف، نسمح بإرسال الطلب إلى الخادم
                    __doPostBack('<%= btnDelete.ClientID %>', '');
                }
            });
            return false; // منع إرسال النموذج مباشرة
        }

    </script>
</body>
</html>
