<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <div class="admin-content-wrap">
                <center><div class="admin-content-header">
                    MANAGE BOOKS - UPDATE/DELETE UPLOADED BOOKS - SEE BOOKS RECORDS</div></center>
                <br />
                <br />
                <center><asp:TextBox ID="txtSearch" runat="server" Width="300px"></asp:TextBox>&nbsp; <asp:Button ID="btnSearch" runat="server" BackColor="#8E93EF" EnableTheming="True" Font-Names="Corbel" Font-Size="12px" ForeColor="White" Height="40px" Text="Search" Width="80px" OnClick="btnSearch_Click" />
                                    <asp:Button ID="btnAll" runat="server" BackColor="#8E93EF" EnableTheming="True" Font-Names="Corbel" Font-Size="12px" ForeColor="White" Height="40px" Text="Show All" Width="80px" OnClick="btnAll_Click" /></center>
                <br />
                <br />
                <center><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="bookName" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="5">
                    <Columns>
                        <asp:ImageField DataImageUrlField="bookCover">
                            <ControlStyle Height="100px" Width="80px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="bookName" HeaderText="Title" ReadOnly="True" SortExpression="bookName" />
                        <asp:BoundField DataField="genreName" HeaderText="Genre" SortExpression="genreName" />
                        <asp:BoundField DataField="bookAuthor" HeaderText="Author" SortExpression="bookAuthor" />
                        <asp:BoundField DataField="bookDate" HeaderText="Upload Date" SortExpression="bookDate" />
                        <asp:BoundField DataField="bookBorrowed" HeaderText="Borrowed Times" SortExpression="bookBorrowed" />
                        <asp:ButtonField ButtonType="Button" CommandName="deletebook" Text="Delete" />
                        <asp:ButtonField ButtonType="Button" CommandName="updatebook" Text="Update" HeaderText="Update Link" >
                        </asp:ButtonField>
                        <asp:HyperLinkField DataTextField="bookLink" DataNavigateUrlFields="bookLink" DataTextFormatString="Click here" HeaderText="Visit" />
                    </Columns>
                    <HeaderStyle Wrap="False" BackColor="#612849" ForeColor="White" />
                </asp:GridView></center>
                <br />
                <br />
                <br />
                <br />
                <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookName" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="5" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:ImageField DataImageUrlField="bookCover">
                            <ControlStyle Height="100px" Width="80px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="bookName" HeaderText="Title" ReadOnly="True" SortExpression="bookName" />
                        <asp:BoundField DataField="genreName" HeaderText="Genre" SortExpression="genreName" />
                        <asp:BoundField DataField="bookAuthor" HeaderText="Author" SortExpression="bookAuthor" />
                        <asp:BoundField DataField="bookDate" HeaderText="Upload Date" SortExpression="bookDate" />
                        <asp:BoundField DataField="bookBorrowed" HeaderText="Borrowed Times" SortExpression="bookBorrowed" />
                        <asp:ButtonField ButtonType="Button" CommandName="deletebook" Text="Delete" />
                        <asp:ButtonField ButtonType="Button" CommandName="updatebook" Text="Update" HeaderText="Update Link" >
                        </asp:ButtonField>
                        <asp:HyperLinkField DataNavigateUrlFields="bookLink" DataTextField="bookLink" DataTextFormatString="Click Here" HeaderText="Book Link" />
                    </Columns>
                    <HeaderStyle Wrap="False" BackColor="#612849" ForeColor="White" />
                </asp:GridView></center>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="SELECT [bookName], [bookContent], [genreName], [bookDate], [bookCover], [bookBorrowed], [bookCount], [bookAuthor], [bookLink] FROM [tblBooks]"></asp:SqlDataSource>
                <br />
            </div>
</asp:Content>

