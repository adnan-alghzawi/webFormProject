<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHistory.aspx.cs" Inherits="LibraryManagement.UserHistory" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>User Borrowing History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .gridview-container {
            max-width: 800px;
            margin: auto;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        }
        .gridview th {
            background-color: #007bff;
            color: white;
            padding: 8px;
        }
        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="gridview-container">
            <h2 style="text-align:center;">User Borrowing History</h2>
            <asp:GridView ID="gvUserHistory" runat="server" CssClass="gridview" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
