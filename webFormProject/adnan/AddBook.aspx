<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="webFormProject.adnan.WebForm1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center"> Add new book </h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtBookID"> Book Id </label>
                <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtBookName"> Book name </label>
                <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtType"> Book type </label>
                <asp:TextBox ID="txtType" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtLevel"> Book Level </label>
                <asp:TextBox ID="txtLevel" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="fuImage"> Book image </label>
                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control-file" required />
            </div>
            <div class="form-group">
                <label for="txtDescription"> Book discerption </label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlAvailability"> Book availability </label>
                <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                    <asp:ListItem Text="Unavailable" Value="Unavailable"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnAddBook" runat="server" Text=" Add book " CssClass="btn btn-primary" OnClick="btnAddBook_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3"></asp:Label>
        </form>
    </div>
</body>
</html>
