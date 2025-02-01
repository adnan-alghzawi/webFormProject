<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationForm.aspx.cs" Inherits="webFormProject.jana.ReservationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
     
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3 border p-4 shadow bg-light">
                <div class="col-12">
                    <h3 class="fw-normal text-secondary fs-4 text-uppercase mb-4">Room Reservation form</h3>
                </div>
               <div class="row g-3">
    
    <!-- Room ID (ReadOnly) -->
    <div class="col-md-6">
        <asp:TextBox ID="roomID" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Room ID"></asp:TextBox>
    </div>

    <!-- Room Type (ReadOnly) -->
    <div class="col-md-6">
        <asp:TextBox ID="roomType" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Room Type"></asp:TextBox>
    </div>

    <!-- Full Name -->
    <div class="col-md-6">
        <asp:TextBox ID="fullName" runat="server" CssClass="form-control" placeholder="Full Name" required></asp:TextBox>
    </div>

    <!-- Email -->
    <div class="col-md-6">
        <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" required></asp:TextBox>
    </div>

    <!-- Phone Number -->
    <div class="col-md-6">
        <asp:TextBox ID="phoneNumber" runat="server" CssClass="form-control" placeholder="Phone Number" TextMode="Phone" required></asp:TextBox>
    </div>

    <!-- Date -->
    <div class="col-md-6">
        <asp:TextBox ID="reservationDate" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
    </div>

    <!-- Start Time (Triggers End Time Calculation) -->
    <div class="col-md-6">
        <asp:TextBox ID="startTime" runat="server" CssClass="form-control" TextMode="Time" AutoPostBack="true" OnTextChanged="startTime_TextChanged" required></asp:TextBox>
    </div>

    <!-- End Time (Calculated Automatically) -->
    <div class="col-md-6">
        <asp:TextBox ID="endTime" runat="server" CssClass="form-control" TextMode="Time" ReadOnly="true" required></asp:TextBox>
    </div>

    <!-- Message Box for Additional Requests -->
    <div class="col-md-12">
        <asp:TextBox ID="specialRequests" runat="server" CssClass="form-control" placeholder="Special Requests" TextMode="MultiLine"></asp:TextBox>
    </div>

    <!-- Submit Button -->
    <div class="col-md-12 text-center">
        <asp:Button ID="btnReserve" runat="server" Text="Confirm Reservation" CssClass="btn btn-success" OnClick="btnReserve_Click" />
    </div>

</div>

        </div>
    </div>
    </form>
</body>
</html>
