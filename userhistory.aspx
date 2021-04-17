<%@ Page Title="" Language="C#" MasterPageFile="~/loggedmaster.master" AutoEventWireup="true" CodeFile="userhistory.aspx.cs" Inherits="userhistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <div class="content-figure-wrap" style="color: #000000">
                <div class="content-figure-header">
                    user history</div>
                <br />
                    Welcome to user history. Here is the list of books that you have borrowed. Be reminded that once you have clicked the &#39;Return&#39; button, you will have no access to the book anymore.
                    <br />
                    <br />
                    <center>
                <br />
                <center>  
                    <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                                    <br />
                    Bookea Policy User Limit of Borrowing Books<br />
                    <br />
                    <asp:TextBox ID="txtLimit" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                </center>
                    </center>
                <br />
                <br />
                <center>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="bookName" DataSourceID="SqlDataSource1" CellPadding="6" OnRowCommand="GridView3_RowCommand" OnDataBound="GridView3_DataBound">
                        <Columns>
                            <asp:ImageField DataImageUrlField="bookCover">
                                <ControlStyle Height="100px" Width="80px" />
                                <ItemStyle Height="80px" Width="100px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:ImageField>
                            <asp:BoundField DataField="bookName" HeaderText="Title" ReadOnly="True" SortExpression="bookName" />
                            <asp:BoundField DataField="borrowDate" HeaderText="Borrow Date" SortExpression="borrowDate" />
                            <asp:BoundField DataField="returnDate" HeaderText="Automated Return" />
                            <asp:HyperLinkField DataNavigateUrlFields="bookLink" DataTextField="bookLink" DataTextFormatString="Read this book" HeaderText="Book Link" />
                            <asp:ButtonField ButtonType="Button" CommandName="returnbook" Text="Return">
                            <ControlStyle BackColor="#FE6F4C" Font-Names="corbel" Font-Size="11pt" ForeColor="White" />
                            </asp:ButtonField>
                        </Columns>
                        <HeaderStyle BackColor="#91CCFF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="SELECT bookCover, bookName, borrower, borrowDate, returnDate, returnStatus, bookLink FROM userhistory WHERE (borrower = @username) AND (returnStatus = 'NOT RETURNED') AND ((getdate() - borrowDate) &lt; 1)">
                        <SelectParameters>
                            <asp:SessionParameter Name="username" SessionField="username" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </center>
            </div>
</asp:Content>

