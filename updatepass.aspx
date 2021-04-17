<%@ Page Title="" Language="C#" MasterPageFile="~/loggedmaster.master" AutoEventWireup="true" CodeFile="updatepass.aspx.cs" Inherits="updatepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-figure-wrap">
    <div class="content-figure-header"> UPDATE PASSWORD / DELETE ACCOUNT</div>
                <table align="center" style="width: 100%;">
                    <tr>
                        <td align="center" style="font-family: corbel; color: #000000;">
                            <br />
                            <br />
                            Username<br />
                            <asp:TextBox ID="txtUser" runat="server" Width="300px" ReadOnly="True" Enabled="False"></asp:TextBox>
                            <br />
                            Old Password<br />
                            <br />
                            <asp:TextBox ID="txtOPass" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="Black" ControlToValidate="txtOPass" ErrorMessage="This field cannot be blank" ForeColor="White"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <br />
                            New Password<br />
                            <br />
                            <asp:TextBox ID="txtNPass" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="Black" ControlToValidate="txtNPass" ErrorMessage="This field cannot be blank" ForeColor="White"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            Confirm
                            Password<br />
                            <br />
                            <asp:TextBox ID="txtCNPass" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="Black" ControlToValidate="txtCNPass" ErrorMessage="This field cannot be blank" ForeColor="White"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" BackColor="Black" ControlToCompare="txtNPass" ControlToValidate="txtCNPass" ErrorMessage="This field must match with New Password field" ForeColor="White"></asp:CompareValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
							    <asp:Button ID="btnReg" runat="server" CssClass="btnAffirmative" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Height="40px" Text="Update Password" Width="33.3%" OnClick="btnReg_Click" />
                            &nbsp; &nbsp;
							    <asp:Button ID="btnDelAcc" runat="server" CssClass="btnCancel" EnableTheming="True" Font-Names="Corbel" Font-Size="20px" Height="40px" Text="Delete Account" Width="33.3%" OnClick="btnDelAcc_Click" />
                            <br />
                            </td>
                    </tr>
                    </table>
			</div>		
</asp:Content>

