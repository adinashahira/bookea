<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- External CSS -->
    <link rel="stylesheet" type="text/css" href="assets/master.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <title>Bookea - Create an Account</title>
</head>
<body>
    <form id="form1" runat="server">

        <div id="topnav">
            <asp:TextBox ID="txtSearch" runat="server" Width="50%" placeholder="Search something"></asp:TextBox>&nbsp;&nbsp;
            <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" CausesValidation="False"><i class="fa fa-search" style="font-size:30px; color:white"></i></asp:LinkButton>        </div>

        <div class="main">
        <div id="signup-body">
            <div class="content-figure-header"> Create a Free Account </div>
                <table align="center" style="width: 100%;">
                    <tr>
                        <td align="center" style="font-family: corbel; color: #000000;">
                            <br />
                            <br />
                            Name<br />
                            <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validName" runat="server" BackColor="Black" ControlToValidate="txtName" ErrorMessage="Name field cannot be empty" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            Username<br />
                            <br />
                            <asp:TextBox ID="txtUser" runat="server" Width="300px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validUser" runat="server" BackColor="Black" ControlToValidate="txtUser" ErrorMessage="Username field cannot be empty" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            Email<br />
                            <br />
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validEmail" runat="server" BackColor="Black" ControlToValidate="txtEmail" ErrorMessage="Email field cannot be empty" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
                            <br />
                            <asp:RegularExpressionValidator ID="validEmail2" runat="server" BackColor="Black" ControlToValidate="txtEmail" ErrorMessage="Please enter valid email address" ForeColor="White" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            Password<br />
                            <br />
                            <asp:TextBox ID="txtPass" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validPass" runat="server" BackColor="Black" ControlToValidate="txtPass" ErrorMessage="Password field cannot be empty" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            Confirm Password<br />
                            <br />
                            <asp:TextBox ID="txtCPass" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validCPass" runat="server" BackColor="Black" ControlToValidate="txtCPass" ErrorMessage="Please re-enter password" ForeColor="White"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
                            <br />
                            <asp:CompareValidator ID="validCPass2" runat="server" BackColor="Black" ControlToCompare="txtPass" ControlToValidate="txtCPass" ErrorMessage="The passwords does not match. Please recheck" ForeColor="White" SetFocusOnError="True"></asp:CompareValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            Occupation<br />
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Corbel" Font-Size="14pt">
                                <asp:ListItem>Educator/Researcher</asp:ListItem>
                                <asp:ListItem>Entrepreneur</asp:ListItem>
                                <asp:ListItem>Student</asp:ListItem>
                                <asp:ListItem>Officer</asp:ListItem>
                                <asp:ListItem>Not Working</asp:ListItem>
                                <asp:ListItem>Work From Home</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <br />
                            <br />
                            By creating an account you agree to our
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" ForeColor="#FE6F4C">Terms and Conditions</asp:HyperLink>
                            <br />
                            <br />
                            <br />
                            <br />
							    <asp:Button ID="btnReg" runat="server" CssClass="btnAffirmative" EnableTheming="True" Font-Names="Corbel" Text="Register" Width="33.3%" height="50px" OnClick="btnReg_Click" />
                            &nbsp;&nbsp;    
                            <asp:Button ID="btnCancel" runat="server" CssClass="btnCancel" Width="33.3%" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" />
                            </td>
                    </tr>
                    </table>
			</div><br><br>		
        </div>
    
        </form>
</body>
</html>
