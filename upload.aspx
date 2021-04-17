<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
                <div class="admin-content-wrap" style="color: #000000">
                <div class="admin-content-header">
                    UPLOAD NEW BOOK 
                </div>
                <br />
                Title<br />
                <br />
                <asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                <br />
                Book Synopsis<br />
                <br />
                <asp:TextBox ID="txtSyn" TextMode="multiline" wrap="true" runat="server" Width="500px" Height="200px"></asp:TextBox>
                <br />
                Genre<br />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="genreName" DataValueField="genreName" Font-Names="Corbel" Font-Size="11pt" Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="SELECT [genreName] FROM [tblGenre]"></asp:SqlDataSource>
                    <br />
                    <br />
                    OR<br />
                    <br />
                    <asp:RadioButton ID="RadioButton1" runat="server" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Open a new genre category" AutoPostBack="true" />
&nbsp;<br />
                    <br />
                <asp:TextBox ID="txtNewGenre" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                    <br />
                <br />
                <br />
                Book Cover<br />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                Book Author<br />
                <br />
                <asp:TextBox ID="txtAuthor" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
                Book Link<br />
                <asp:TextBox ID="txtLink" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
							    <asp:Button ID="btnUpload" runat="server" BackColor="#8E93EF" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Height="40px" Text="Upload" Width="100%" OnClick="btnUpload_Click" CausesValidation="False" />
                            <br />
                <br />
            </div></center>
</asp:Content>

