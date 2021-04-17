<%@ Page Title="" Language="C#" MasterPageFile="~/loggedmaster.master" AutoEventWireup="true" CodeFile="browselogged.aspx.cs" Inherits="browselogged" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                    <div class="content-figure-wrap">
                    <div class="content-figure-header">
                        <asp:Label ID="lblBrowse" runat="server" Text="Label"></asp:Label>
&nbsp;</div>
                    <br />
                    <center><asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="browse-display" DataKeyNames="bookName" DataSourceID="SqlDataSource1" GridLines="None" ShowHeader="False" Width="80%" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="browseall">
                                <ItemTemplate>
                                    <table style="width:100%;">
                                        <tr>
                                            <td rowspan="3" style="width: 20%">
                                                <asp:HyperLink ID="HyperLink2" runat="server" ImageHeight="100px" ImageUrl='<%# Eval("bookCover") %>' ImageWidth="80px" NavigateUrl='<%# Eval("bookName", "detailslogged.aspx?bookName={0}") %>'>HyperLink</asp:HyperLink>
                                            </td>
                                            <td colspan="2" style="height: 22px">
                                                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="pub-title" NavigateUrl='<%# Eval("bookName", "detailslogged.aspx?bookName={0}") %>' Text='<%# Eval("bookName") %>'></asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pub-desc" style="width: 40%">Author:
                                                <asp:Label ID="Label5" runat="server" CssClass="pub-desc" Text='<%# Eval("bookAuthor") %>'></asp:Label>
                                            </td>
                                            <td style="width: 40%">
                                                <asp:Label ID="Label6" runat="server" CssClass="pub-desc" Text='<%# Eval("genreName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="Label7" runat="server" CssClass="pub-syn" Text='<%# Eval("bookContent") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#91CCFF" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView></center>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="select bookCover, bookName, bookAuthor, genreName, bookContent
from tblBooks"></asp:SqlDataSource>
                    <br />
                    <center><asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="browse-display" DataKeyNames="bookName" DataSourceID="SqlDataSource2" GridLines="None" ShowHeader="False" Width="80%" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="browseall">
                                <ItemTemplate>
                                    <table style="width:100%;">
                                        <tr>
                                            <td rowspan="3" style="width: 20%">
                                                <asp:HyperLink ID="HyperLink4" runat="server" ImageHeight="100px" ImageUrl='<%# Eval("bookCover") %>' ImageWidth="80px" NavigateUrl='<%# Eval("bookName", "detailslogged.aspx?bookName={0}") %>'>HyperLink</asp:HyperLink>
                                            </td>
                                            <td colspan="2" style="height: 22px">
                                                <asp:HyperLink ID="HyperLink5" runat="server" CssClass="pub-title" NavigateUrl='<%# Eval("bookName", "detailslogged.aspx?bookName={0}") %>' Text='<%# Eval("bookName") %>'></asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pub-desc" style="width: 40%">Author:
                                            </td>
                                            <td style="width: 40%">
                                                <asp:Label ID="Label9" runat="server" CssClass="pub-desc" Text='<%# Eval("genreName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="Label10" runat="server" CssClass="pub-syn" Text='<%# Eval("bookContent") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#91CCFF" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView></center>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="select bookCover, bookName, bookAuthor, genreName, bookContent
from tblBooks
where genreName=@genreName">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="genreName" QueryStringField="genreName" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                   
                    <br />
                </div>
</asp:Content>

