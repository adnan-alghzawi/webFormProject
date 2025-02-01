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
            justify-content: center; /* جعل الكروت في المنتصف */
            gap: 20px; /* مسافة بين الكروت */
        }
        .card {
            width: 300px;
            min-height: 450px;
            display: flex;
            flex-direction: column;
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
        /* تحسين تصميم الزر */
        .edit-btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .edit-btn {
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }
        .edit-btn i {
            margin-right: 8px;
        }
        .edit-btn:hover {
            background-color: #28a745;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">📚 Books</h2>
            <br />
            <div class="card-container">
                <asp:Panel ID="pnlBooks" runat="server" CssClass="d-flex flex-wrap justify-content-center"></asp:Panel>
            </div>

            <!-- تحسين تصميم الزر -->
            <div class="edit-btn-container">
                <asp:Button ID="edit" runat="server" Text=" Edit Books" CssClass="btn btn-success edit-btn" OnClick="edit_Click1" />
            </div>
        </div>
    </form>
</body>
</html>
