<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="task1_webForm_27_1_2025.profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f0f2f5;
        }

        .profile-container {
            max-width: 900px;
            margin: auto;
            padding: 40px 0;
        }

        .profile-card {
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .profile-img {
            width: 120px;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 4px solid #fff;
        }

        .btn-custom {
            width: 100%;
            margin-top: 10px;
        }

        .profile-header {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            color:
        }

        .profile-details {
            padding: 30px;
        }

        .form-outline {
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="profile-container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card profile-card">
                        <div class="profile-header">
                            <img src="https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg" alt="Avatar" class="profile-img" id="profileImage">
                            <h5>
                                <asp:TextBox ID="name" runat="server" CssClass="form-control text-center" placeholder="Enter Name"></asp:TextBox>
                            </h5>
                            <div class="form-outline flex-fill mb-0 text-center">
                                <asp:RadioButton ID="Male" GroupName="Gender" Text="Male" runat="server" CssClass="form-check-input" />
                                <asp:RadioButton ID="Female" GroupName="Gender" Text="Female" runat="server" CssClass="form-check-input ms-2" />
                                <label class="form-label ms-3">Gender</label>
                            </div>
                        </div>
                        <div class="card-body text-center">
                            <asp:FileUpload ID="profilePicture" runat="server" CssClass="form-control mb-3" />
                            <asp:Button runat="server" OnClick="UploadImage_Click" Text="Add Photo" CssClass="btn btn-secondary btn-custom" />
                            <asp:Button runat="server" OnClick="Save_Click" Text="Save" CssClass="btn btn-primary btn-custom mt-2" />
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card profile-card">
                        <div class="profile-details">
                            <h5 class="text-center">Profile Information</h5>
                            <hr>

                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <asp:TextBox ID="name2" runat="server" CssClass="form-control" placeholder="Enter Full Name"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <asp:TextBox ID="email2" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Date of Birth</label>
                                <asp:TextBox ID="dob2" runat="server" CssClass="form-control" placeholder="Enter Date of Birth"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="lblMessage" runat="server" CssClass="form-text text-muted"></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
