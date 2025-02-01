<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckBorrowStatus.aspx.cs" Inherits="webFormProject.adnan.CheckBorrowStatus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Check Borrow Status</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Check Borrow Status</h2>
        <form id="form1" runat="server">
            
            <div class="form-group">
                <label for="txtUserEmail">Enter Your Email:</label>
                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="btnCheckStatus" runat="server" Text="Check Status" CssClass="btn btn-primary mt-3" OnClick="btnCheckStatus_Click" />

            <div class="mt-4">
                <asp:Label ID="lblStatus" runat="server" CssClass="alert"></asp:Label>
            </div>

            <asp:GridView ID="gvNotifications" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered mt-3">
                <Columns>
                    <asp:BoundField DataField="Message" HeaderText="Notification" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                </Columns>
            </asp:GridView>

        </form>
    </div>
</body>
</html>
