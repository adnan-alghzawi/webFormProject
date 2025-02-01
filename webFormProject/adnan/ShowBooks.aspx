<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowBooks.aspx.cs" Inherits="webFormProject.adnan.ShowBooks" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Show Books</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">📚 Books</h2>
            <div class="btn-container">
                <asp:DropDownList ID="ddlFilter" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Value="All">All Books</asp:ListItem>
                    <asp:ListItem Value="Available">Available Books</asp:ListItem>
                    <asp:ListItem Value="Unavailable">Unavailable Books</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-primary export-btn" OnClick="export_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit Books" CssClass="btn btn-success edit-btn" OnClick="edit_Click" />
            </div>
            <br />
            <div class="card-container">
                <asp:Repeater ID="rptBooks" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <img src='<%# Eval("ImagePath") %>' alt='Book Image' />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("BookName") %></h5>
                                <p class="card-text"><strong>Type:</strong> <%# Eval("Type") %></p>
                                <p class="card-text"><strong>Level:</strong> <%# Eval("Level") %></p>
                                <p class="card-text"><strong>Description:</strong> <%# Eval("Description") %></p>
                                <p class="card-text"><strong>Availability:</strong> <span class='<%# Eval("AvailabilityClass") %>'><%# Eval("Availability") %></span></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
