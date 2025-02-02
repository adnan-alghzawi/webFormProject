<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAndCancelReservation.aspx.cs" Inherits="webFormProject.jana.ViewAndCancelReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="stylesheet" href="styles.css">
    <style>
  .reservations-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding: 20px;
}

/* Each reservation card */
.reservation-card {
    display: flex;
    align-items: center;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 15px;
    max-width: 600px;
}

/* Room photo */
.room-photo {
    flex: 1;
    max-width: 150px;
}

.room-photo img {
    width: 100%;
    border-radius: 8px;
}

/* Reservation details */
.reservation-info {
    flex: 2;
    padding-left: 20px;
}

.reservation-info h3 {
    margin: 0;
    font-size: 18px;
    color: #333;
}

.reservation-info p {
    margin: 5px 0;
    font-size: 14px;
    color: #666;
}

/* Cancel button */
.cancel-btn {
    display: inline-block;
    background: #ff4d4d;
    color: white;
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 5px;
    font-weight: bold;
    margin-top: 10px;
    transition: background 0.3s;
}

.cancel-btn:hover {
    background: #cc0000;
}
    </style>
</head>
<body>
    <h2>Your Reservations</h2>
    <div id="reservationList">
        <asp:Literal ID="ReservationsContent" runat="server"></asp:Literal>
    </div>
</body>
</html>
