<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register_page.aspx.cs" Inherits="task1_webForm_27_1_2025.register_page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #EAE0D6;
            color: #22333B;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #22333B;
        }

        .form-control {
            border-radius: 10px;
            background-color: #EAE0D6;
            color: #22333B;
            border: none;
        }

        .btn-primary {
            background-color: #EAE0D6;
            border: none;
            border-radius: 10px;
            transition: 0.3s;
            color: #22333B;
        }

            .btn-primary:hover {
                background-color: #22333B;
                color: #EAE0D6;
            }

        .img-fluid {
            border-radius: 20px;
        }

        label, .form-check-label {
            color: #EAE0D6;
        }

        .img-fluid {
            max-width: 100%;
            height: auto;
            margin-top: 10%;
        }

        .bg-umber {
            background-color: #22333B;
        }

        .imglogo {
            width: 20%;
        }

        .btn-green {
            --bs-btn-color: #22333B !important;
            --bs-btn-bg: #EAE0D6 !important;
            --bs-btn-border-color: #EAE0D6;
            --bs-btn-hover-color: #22333B;
            --bs-btn-hover-bg: #C6AD8F;
            --bs-btn-hover-border-color: #C6AD8F !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #22333B;
            --bs-btn-active-bg: #EAE0D6;
            --bs-btn-active-border-color: #EAE0D6;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #22333B;
            --bs-btn-disabled-bg: #EAE0D6;
            --bs-btn-disabled-border-color: #EAE0D6;
            border-radius: 20px !important;
            margin-right: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1),inset 3px 3px 6px rgba(0, 0, 0, 0.3);
            border: none;
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
    </style>
<script>
    function validateForm() {
        // Name validation
        var name = document.getElementById("name").value;
        if (name == "") {
            alert("Name is required");
            return false;
        }

        // Email validation using regex
        var email = document.getElementById("email").value;
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address");
            return false;
        }

        // Password validation
        var password = document.getElementById("password").value;
        var repeatPassword = document.getElementById("repeat_password").value;

        // Password rules: 8+ characters, at least one number, one special character
        var passwordPattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;

        if (!passwordPattern.test(password)) {
            alert("Password must be at least 8 characters long and include a number and a special character.");
            return false;
        }

        if (password !== repeatPassword) {
            alert("Passwords do not match");
            return false;
        }

        // Terms and Conditions checkbox validation
        var terms = document.getElementById("terms").checked;
        if (!terms) {
            alert("You must agree to the Terms and Conditions");
            return false;
        }

        return true;
    }
</script>

</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="row w-100">
                <div class="col-md-10 col-lg-8 mx-auto">
                    <div class="card p-4">
                        <div class="row">
                            <div class="col-md-6 d-flex flex-column justify-content-center">
                                <h2 class="text-center fw-bold" style="color: #EAE0D6">Sign Up</h2>
                                <div class="mb-3">
                                    <label class="form-label">Your Name</label>
                                    <asp:TextBox ID="name" runat="server" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Your Email</label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Repeat Password</label>
                                    <asp:TextBox ID="repeat_password" runat="server" CssClass="form-control" TextMode="Password" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Gender</label><br>
                                    <asp:RadioButton ID="Male" GroupName="Gender" Text="Male" runat="server" CssClass="me-2" />
                                    <asp:RadioButton ID="Female" GroupName="Gender" Text="Female" runat="server" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Date of Birth</label>
                                    <asp:TextBox ID="dob" runat="server" CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="terms" />
                                    <label class="form-check-label" for="terms">
                                        I agree to the <a href="#" style="color: #C6AD8F;">Terms of Service</a>
                                    </label>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="register" runat="server" Text="Register" OnClick="register_Click" CssClass="btn btn-green w-50" />
                                </div>
                            </div>
                            <div class="col-md-6 d-none d-md-block">
                                <img src="https://i.pinimg.com/736x/c7/01/f6/c701f60c0feca8181e81eb079d15c3e4.jpg" class="img-fluid" alt="Library Image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
