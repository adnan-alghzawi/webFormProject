<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmBorrow.aspx.cs" Inherits="webFormProject.adnan.ConfirmBorrow" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Confirm Borrow Requests</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Confirm Borrow Requests</h2>
        <form id="form1" runat="server">
            <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered mt-3">
                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                    <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration (Days)" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-success btn-sm"
                                CommandArgument='<%# Eval("Email") + "|" + Eval("BookID") %>' OnClick="btnApprove_Click" />
                            <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger btn-sm"
                                CommandArgument='<%# Eval("Email") + "|" + Eval("BookID") %>' OnClick="btnReject_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>
