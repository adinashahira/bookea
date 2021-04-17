<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminlog.aspx.cs" Inherits="adminlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <br />
                <center><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></center>
                <br />
                <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="5" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="borrower" HeaderText="Borrower" SortExpression="borrower" />
                        <asp:BoundField DataField="bookName" HeaderText="Title" SortExpression="bookName" />
                        <asp:BoundField DataField="borrowdate" HeaderText="Borrow Date" SortExpression="borrowdate" />
                        <asp:BoundField DataField="returndate" HeaderText="Return Date" SortExpression="returndate" />
                        <asp:BoundField DataField="returnstatus" HeaderText="Status" SortExpression="returnstatus" />
                    </Columns>
                    <HeaderStyle Wrap="False" BackColor="#612849" ForeColor="White" />
                </asp:GridView></center>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="select borrower, bookName, borrowDate, returnDate, returnStatus
from tbllogs
"></asp:SqlDataSource>
</asp:Content>

