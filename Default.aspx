<%@ Page Title="" Language="C#" MasterPageFile="~/unlogged.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            height: 40px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-figure-wrap">
        <div class="content-figure-header">New Arrival</div>
        <br />
        <center><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="bookName" DataSourceID="SqlDataSource2" ForeColor="Black" BorderStyle="None" CssClass="browse-display" GridLines="None" ShowHeader="False" PageSize="3" Width="80%" AllowPaging="True">
            <Columns>
                <asp:TemplateField>
                            <ItemTemplate>
                                <table class="browse-display" style="width:100%;" cellpadding="4px">
                                    <tr>
                                        <td rowspan="3" style="width: 20%">
                                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("bookCover") %>' Width="80px" />
                                        </td>
                                        <td style="width: auto">
                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="pub-title" NavigateUrl='<%# Eval("bookName", "detail.aspx?bookName={0}") %>' Text='<%# Eval("bookName") %>'></asp:HyperLink>
                                        </td>
                                        <td rowspan="3" style="width: 40%">
                                            <asp:Label ID="Label4" runat="server" CssClass="pub-syn" Text='<%# Eval("bookContent") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: auto">
                                            <asp:Label ID="Label2" runat="server" CssClass="pub-desc" Text='<%# Eval("genreName") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: auto">
                                            <asp:Label ID="Label3" runat="server" CssClass="pub-desc" Text='<%# Eval("bookAuthor") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
            </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="SELECT bookName, genreName, bookAuthor, bookContent, bookCover FROM tblBooks WHERE (GETDATE() - bookDate &gt; 15)"></asp:SqlDataSource>
            
            </div>
    <br />
            <br />

        <div class="content-figure-wrap">
            <div class="content-figure-header">Most Popular</div>
            <center><asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="bookName" DataSourceID="SqlDataSource3" AllowSorting="True" CellPadding="4" CellSpacing="8" GridLines="None" ShowHeader="False" Width="80%" AllowPaging="True" PageSize="2">
                <Columns>
                    <asp:TemplateField>
                            <ItemTemplate>
                                <table class="auto-style3">
                                    <tr>
                                        <td rowspan="3" style="width: 40%">
                                            <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl='<%# Eval("bookCover") %>' Width="80px" />
                                        </td>
                                        <td colspan="2">
                                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="pub-title" NavigateUrl='<%# Eval("bookName", "detail.aspx?bookName={0}") %>' Text='<%# Eval("bookName") %>'></asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">borrowed
                                            <asp:Label ID="Label6" runat="server" CssClass="pub-desc" Text='<%# Eval("bookBorrowed") %>'></asp:Label>
                                            &nbsp;times</td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%">
                                            <asp:Label ID="Label7" runat="server" CssClass="pub-syn" Text='<%# Eval("genreName") %>'></asp:Label>
                                        </td>
                                        <td class="pub-syn">author:
                                            <asp:Label ID="Label8" runat="server" CssClass="pub-syn" Text='<%# Eval("bookAuthor") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="SELECT bookName, bookCover, genreName, bookAuthor, bookBorrowed FROM tblBooks WHERE (bookBorrowed &gt; 40) ORDER BY bookBorrowed DESC"></asp:SqlDataSource>
        </center>
        <br />
    </div>
</asp:Content>

