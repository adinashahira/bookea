<%@ Page Language="C#" AutoEventWireup="true" CodeFile="landing.aspx.cs" Inherits="landing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- External CSS -->
    <link rel="stylesheet" type="text/css" href="assets/master.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <title>Bookea - Love Books</title>

    <style>
        @media screen and (max-width: 700px) {
            .row, .navbar {
                flex-direction: column;
            }
        }
        .auto-style1 {
            left: 601px;
            top: 44px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="row">
            <div class="side">
                <div id="navbar">
                    <center>
                        <div id="nav">
                            <ul>
                            <li><a href="Default.aspx">Home</a></li>

                            <li>Bookea est 2020 by adglory (c)</li>
                            </ul><br /><br />

                        
                    </center><br />
                </div>
            </div>

            <div class="main">
                <div id="header" class="auto-style1">Bookea</div>

                <br />
                <br />

                <div id="container">
                    <center>
                        Please enter email to start reading<br />
&nbsp;<asp:TextBox ID="txtFreepassEmail" runat="server" Width="259px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Button ID="btnRead" runat="server" CssClass="btnAffirmative" OnClick="btnRead_Click" Text="Start Reading" />
                    </center>
                </div>


        </div>

    </form>
</body>
</html>
