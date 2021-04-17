<%@ Page Title="" Language="C#" MasterPageFile="~/loggedmaster.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>
<%@ MasterType VirtualPath="~/loggedmaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <div class="content-figure-wrap" style="color: #000000">
                <div class="content-figure-header">
                    Your Cart 
                </div>
                <br />
                Welcome to your <strong>Cart. </strong>Below are the list of books that you intended to borrow. Please check your personal information and please be reminded of the return date for your books.
                <br />
                <br />
                In case you wish to replace one of the books with another, feel free to delete the item, browse through our library and add the intended book to cart. Be reminded of the user limit of the books that you wish to borrow.<br />
                <br />
                Please only submit the form if your personal information is correct. If you find any incorrect information, please contact bookea.com<br />
                <br />
                <br />
                <center>  
                    <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="txtName" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                                    <br />
                    Bookea Policy User Limit of Borrowing Books<br />
                    <br />
                    <asp:TextBox ID="txtLimit" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="8" CssClass="browse-display" DataKeyNames="bookName" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnRowCommand="GridView2_RowCommand1">
                        <AlternatingRowStyle BackColor="#91CCFF" ForeColor="White" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="bookCover">
                                <ControlStyle Height="100px" Width="80px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="bookName" HeaderText="Title" ReadOnly="True" SortExpression="bookName" />
                            <asp:BoundField DataField="bookAuthor" HeaderText="Author" />
                            <asp:BoundField DataField="genreName" HeaderText="Genre" SortExpression="genreName" />
                            <asp:ButtonField ButtonType="Button" CommandName="removebook" Text="Remove">
                            <ControlStyle BackColor="#FE6F4C" Font-Names="Corbel" Font-Size="12pt" ForeColor="White" />
                            <ItemStyle ForeColor="Black" />
                            </asp:ButtonField>
                        </Columns>
                        <HeaderStyle BackColor="#FE6F4C" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="select bookCover, bookName, bookAuthor, genreName, borrower
from loglist3
where borrower=@username AND borrowDate IS NULL">
                        <SelectParameters>
                            <asp:SessionParameter Name="username" SessionField="username" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    Estimated
                    Return Date
                    <br />
                    <asp:TextBox ID="txtReturn" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                    <br />
                    <br />
                    <br />
                    <br />
							    <asp:Button ID="btnSubmit" runat="server" BackColor="#FE6F4C" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Height="40px" Text="Submit Form" Width="100%" OnClick="btnSignIn_Click" />
                    <br />
                </center>
            </div>
</asp:Content>

