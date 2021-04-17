<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="freepass.aspx.cs" Inherits="freepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admin-content-wrap" style="color: #000000">
                <center><div class="admin-content-header">
                    MANAGE FREEPASS</div></center>
                <center>&nbsp; </center>
                <br />
                <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="5" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="borrower" HeaderText="Borrower" SortExpression="borrower" />
                        <asp:BoundField DataField="bookName" HeaderText="Title" SortExpression="bookName" />
                        <asp:BoundField DataField="borroweremail" HeaderText="Email" SortExpression="borroweremail" />
                        <asp:BoundField DataField="borrowerphone" HeaderText="Phone No" SortExpression="borrowerphone" />
                        <asp:BoundField DataField="borrowdate" HeaderText="Borrow Date" SortExpression="borrowdate" />
                        <asp:ButtonField ButtonType="Button" CommandName="verifyreturn" Text="Verify Return" />
                    </Columns>
                    <HeaderStyle Wrap="False" BackColor="#612849" ForeColor="White" />
                </asp:GridView></center>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="SELECT [borrower], [bookName], [borroweremail], [borrowerphone], [borrowdate] FROM [freepass]"></asp:SqlDataSource>
                <br />
            </div>
</asp:Content>

