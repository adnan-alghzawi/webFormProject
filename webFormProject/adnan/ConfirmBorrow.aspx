<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmBorrow.aspx.cs" Inherits="webFormProject.adnan.ConfirmBorrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Confirm Borrow Requests</title>
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
            border-radius: 170px !important;
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
            <div class="container mt-5">
                <h2 class="text-center">Confirm Borrow Requests</h2>

                <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered mt-3">
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="UserName" HeaderText="User Name" />
                        <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                        <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                        <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration (Days)" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-green1 btn-sm"
                                    CommandArgument='<%# Eval("Email") + "|" + Eval("BookID")+ "|" + Eval("BookName") %>' OnClick="btnApprove_Click" />
                                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-red btn-sm"
                                    CommandArgument='<%# Eval("Email") + "|" + Eval("BookID")+ "|" + Eval("BookName") %>' OnClick="btnReject_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
