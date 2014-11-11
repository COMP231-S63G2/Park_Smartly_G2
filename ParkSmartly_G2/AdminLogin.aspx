<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="styles/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 93px;
        }

        .auto-style3 {
            float: right;
            width: 93px;
            height: 34px;
        }

        .auto-style4 {
            height: 34px;
        }

        .auto-style5 {
            float: right;
            width: 93px;
            height: 32px;
        }

        .auto-style6 {
            height: 32px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <div class="t1" style="height: 300px; width: 380px; opacity: 0.9; float: left; margin-left: 180px; margin-top: 20px; margin-bottom: 100px">
        <div style="height: 40px; width: 312px; margin-left: 80px;">
            <h2>Admin Login</h2>
        </div>

        <table style="width: 100%; margin-top: 25px; margin-left: 50px">
            <tr>
                <td></td><td>
                <asp:Label ID="Lbl_invalid" runat="server" ForeColor="Red" Text="Invalid User name or Password" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;User name:</td>
                <td class="auto-style4">&nbsp;
                           <asp:TextBox ID="Tbox_un" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;Password:</td>
                <td class="auto-style6">&nbsp;
                            <asp:TextBox ID="Tbox_pass" TextMode="Password" runat="server"></asp:TextBox></td>
            </tr>
              <tr>
                <td class="auto-style2"></td>
                <td style="float: left; margin-left: 40px">&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Log In" Width="120px" /></td>

            </tr>
        </table>







    </div>
</asp:Content>

