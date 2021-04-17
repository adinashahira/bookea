<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="updatestock.aspx.cs" Inherits="updatestock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
                    <div class="admin-content-wrap" style="color: #000000">
                <div class="admin-content-header">
                    UPDATE BOOK LINK</div>
                <br />
                <br />
                Book Title<br />
                <asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
               
                Book Link<br />
                <br />
                <asp:TextBox ID="txtLink" runat="server" Width="200px"></asp:TextBox>
                        <br />
                        Update Book Cover<br />
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                <br />
                <br />
							    <asp:Button ID="btnUpdate" runat="server" BackColor="#8E93EF" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Height="40px" Text="Update Information" Width="100%" OnClick="btnUpdate_Click" CausesValidation="False" />
                <br />
            </div>
    </center>
</asp:Content>

