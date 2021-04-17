<%@ Page Title="" Language="C#" MasterPageFile="~/unlogged.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content-figure-wrap">
        <center>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="browse-display" DataKeyNames="bookName" DataSourceID="SqlDataSource1" ForeColor="Black" Height="50px" Width="70%" BorderColor="#91CCFF" BorderStyle="Double" BorderWidth="5px" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center" OnPageIndexChanging="DetailsView1_PageIndexChanging">
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table class="browse-display" style="width:100%;">
                                <tr>
                                    <td colspan="2" style="width: auto; height: 59px; background-color: #91CCFF;" align="center">
                                        &nbsp;<asp:Label ID="Label6" runat="server" Font-Size="24pt" ForeColor="White" Text='<%# Eval("bookName") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="padding: 10px; width: 220px; height: 200px">
                                        <asp:Image ID="Image1" runat="server" BorderColor="#000" BorderStyle="Double" BorderWidth="6px" Height="250px" ImageAlign="Middle" ImageUrl='<%# Eval("bookCover") %>' Width="180px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 6px; background-color: #E1E1E1; width: 50%;" >
                                        <br />
                                        Author:
                                        <asp:Label ID="Label2" runat="server" CssClass="pub-desc" Text='<%# Eval("bookAuthor") %>'></asp:Label>
                                        <br />
                                        <br />
                                    </td>
                                    <td style="padding: 6px; background-color: #E1E1E1; width: 50%;">Genre:
                                        <asp:Label ID="Label3" runat="server" CssClass="pub-desc" Text='<%# Eval("genreName") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 6px; background-color: #E1E1E1; width: 50%;" colspan="2">
                                        <br />
                                        Rating: Borrowed
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("bookBorrowed") %>'></asp:Label>
                                        &nbsp;times<br /> <br /></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnBorrow" runat="server" BackColor="#FE6F4C" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Height="40px"  Text="Borrow" Width="100%" OnClick="btnBorrow_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="select bookCover, bookName, genreName, bookContent, bookAuthor, bookBorrowed, bookCount 
from tblBooks
where bookName=@bookName">
                <SelectParameters>
                    <asp:QueryStringParameter Name="bookName" QueryStringField="bookName" />
                </SelectParameters>
            </asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

