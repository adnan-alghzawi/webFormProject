<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_profile.aspx.cs" Inherits="task1_webForm_27_1_2025.edit_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
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
                            <asp:FileUpload ID="profileImageUpload" runat="server" CssClass="form-control mb-2" />
                            <asp:Image ID="profileImage" runat="server" CssClass="profile-img" ImageUrl="~/images/default-avatar.png" />
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
                            <asp:Button runat="server" OnClick="save_Click" Text="Save" CssClass="btn btn-primary btn-custom" />
                            <asp:Button runat="server" OnClick="UploadImage_Click" Text="Upload Image" CssClass="btn btn-secondary btn-custom" />
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card profile-card">
                        <div class="profile-details">
                            <h5 class="text-center">Edit Profile</h5>
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

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
