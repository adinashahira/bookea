<%@ Page Title="" Language="C#" MasterPageFile="~/unlogged.master" AutoEventWireup="true" CodeFile="borrow.aspx.cs" Inherits="borrow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <table id="content-body" style="width:100%;" align="center">
    <tr>
        <td class="content-figure-header">borrow</td>
    </tr>
    <tr>
        <td class="pub-syn" align="center">
            <br />
                            Name
            <br />
            <br />
                            <asp:TextBox ID="txtName" runat="server" Width="300px" EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>
                            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="Black" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            Email Address
            <br />
            <br />
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>  &nbsp; &nbsp; <asp:Button ID="btnOTP" runat="server" Text="Request OTP" OnClick="btnOTP_Click" CausesValidation="False" />
                            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="Black" ErrorMessage="This field is required" ForeColor="White" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblOTPSent" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />
            OTP
            <br />
            <br />
                            <asp:TextBox ID="txtPhone" runat="server" Width="300px" EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="Black" ControlToValidate="txtPhone" ErrorMessage="RequiredFieldValidator" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblOtpInv" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            <br />
            <br />
            Return Date<br />
            <br />
                            <asp:TextBox ID="txtReturn" runat="server" Width="300px" Enabled="False" EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>
                            <br />
            <br />
            <br />
            Book You Chose To Borrow
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="browse-display" DataKeyNames="bookName" DataSourceID="SqlDataSource2" ForeColor="Black" Height="50px" Width="70%" BorderColor="#526D51" BorderStyle="Double" BorderWidth="5px" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center">
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table class="browse-display" style="width:100%;">
                                <tr>
                                    <td colspan="2" style="width: auto; height: 59px; background-color: #fe6f4c;" align="center">
                                        &nbsp;<asp:Label ID="Label6" runat="server" Font-Size="24pt" ForeColor="White" Text='<%# Eval("bookName") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="padding: 10px; width: 220px; height: 200px">
                                        <asp:Image ID="Image1" runat="server" BorderColor="#526D51" BorderStyle="Double" BorderWidth="6px" Height="250px" ImageAlign="Middle" ImageUrl='<%# Eval("bookCover") %>' Width="180px" />
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
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bookea1ConnectionString %>" SelectCommand="select bookCover, bookName, genreName, bookContent, bookAuthor, bookBorrowed, bookCount 
from tblBooks
where bookName=@bookName">
                <SelectParameters>
                    <asp:SessionParameter Name="bookName" SessionField="confirmborrow" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            Reminders: By borrowing books from bookea.com, you will not be registered as a member. Non-member can only borrow one book at a time for not more than 1 week. Your reading link will expire after 1 week. By clicking <em>borrow</em> you agree to bookea.com&#39;s terms of service<br />
            <br />
							    <asp:Button ID="btnReg" runat="server" BackColor="#fe6f4c" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Height="40px" Text="Checkout" Width="100%" OnClick="btnReg_Click" />
                            <br />
        </td>
    </tr>
</table>
</asp:Content>

