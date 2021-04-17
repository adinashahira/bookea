<%@ Page Title="" Language="C#" MasterPageFile="~/unlogged.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                            <div class="content-figure-wrap">
                            <div class="content-figure-header">
                                search results for &quot;&nbsp;<asp:Label ID="lblKeyword" runat="server" Text="Label"></asp:Label>
                                &quot;</div>
                            <br />
                            <center>
                                <br />
                                <asp:GridView ID="GridView1" runat="server" ForeColor="Black" GridLines="None" ShowHeader="False" AutoGenerateColumns="False" CssClass="browse-display" Width="80%">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td rowspan="3" style="width: 25%">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("bookCover") %>' Height="100px" Width="80px" />
                                                        </td>
                                                        <td>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="pub-title" NavigateUrl='<%# Eval("bookName", "detail.aspx?bookName={0}") %>' Text='<%# Eval("bookName") %>'></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("genreName") %>' CssClass="pub-desc"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("bookAuthor") %>' CssClass="pub-desc"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <br />
                            </center>
                            <br />
                        </div>
</asp:Content>

