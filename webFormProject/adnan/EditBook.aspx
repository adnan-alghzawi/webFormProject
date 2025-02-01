<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="webFormProject.adnan.EditBook" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function limitDescriptionLength() {
            var description = document.getElementById('<%= txtDescription.ClientID %>');
            if (description.value.length > 20) {
                description.value = description.value.substring(0, 20);
                alert("⚠️ Description cannot exceed 20 characters!");
            }
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Edit Book</h2>
        <form id="form1" runat="server">
            
            <div class="form-group">
                <label for="ddlBooks">Select Book:</label>
                <asp:DropDownList ID="ddlBooks" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlBooks_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtBookID">Book ID:</label>
                <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtBookName">Book Name:</label>
                <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtType">Book Type:</label>
                <asp:TextBox ID="txtType" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtLevel">Book Level:</label>
                <asp:TextBox ID="txtLevel" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="fuImage">Book Image:</label>
                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control-file" />
            </div>

            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" oninput="limitDescriptionLength()"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="ddlAvailability">Availability:</label>
                <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                    <asp:ListItem Text="Unavailable" Value="Unavailable"></asp:ListItem>
                </asp:DropDownList>
            </div>
<div class="d-flex flex-column align-items-center mt-4">
    <!-- Buttons Container -->
    <div class="btn-group" role="group">
        <asp:Button ID="btnUpdateBook" runat="server" Text="Update Book" CssClass="btn btn-primary px-4" OnClick="btnUpdateBook_Click" />
        <asp:Button ID="show" runat="server" Text="Show Books" CssClass="btn btn-info px-4" OnClick="show_Click" />
        <asp:Button ID="delete" runat="server" Text="Delete Book" CssClass="btn btn-danger px-4" OnClick="delete_Click" />
    </div>

    <!-- Success Message -->
    <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3 fw-bold fs-5 d-block"></asp:Label>
</div>

        </form>
    </div>
</body>
</html>
