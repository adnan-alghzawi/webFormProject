<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowBook.aspx.cs" Inherits="webFormProject.adnan.BorrowBook" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Borrow a Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Borrow a Book</h2>
        <form id="form1" runat="server">
            
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtUserName">Full Name:</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="ddlBooks">Select Book:</label>
                <asp:DropDownList ID="ddlBooks" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtBorrowDate">Borrow Date:</label>
                <asp:TextBox ID="txtBorrowDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtDuration">Duration (Days):</label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" CssClass="btn btn-primary mt-3" OnClick="btnSubmit_Click" />

        </form>
    </div>
</body>
</html>
