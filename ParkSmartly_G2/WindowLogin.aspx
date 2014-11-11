<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WindowLogin.aspx.cs" Inherits="WindowLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="styles/bootstrap.css" rel="stylesheet" />
    
    <style type="text/css">
        .auto-style1 {
            height: 33px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 34px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="t1" style="height: 300px; width: 460px; opacity: 0.9; float: left; margin-left: 120px; margin-top: 20px; margin-bottom: 100px">
        <div style="height: 40px; width: 312px; margin-left: 140px;">
            <h2>Window Login</h2>
        </div>

        <table  style="width: 92%; margin-top: 25px; margin-left: 50px; border-spacing: 2px;">
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Label ID="Lbl_invld" runat="server" ForeColor="Red" Text="Invalid User name or Password" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;User name:</td>
                <td class="auto-style1">&nbsp;
                            <asp:TextBox ID="Tb_usrnm" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_usrnm" ErrorMessage="User name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;Password:</td>
                <td class="auto-style3">&nbsp;
                            <asp:TextBox ID="Tb_psswrd" TextMode="Password" runat="server"></asp:TextBox></td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_psswrd" ErrorMessage="Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td style="padding-left:80px" >
                            <asp:Button ID="login_btn" CssClass="btn btn-primary"  Height="30px" runat="server" OnClick="login_btn_Click" Text="Log In" Width="78px" /></td>

            </tr>
        </table>

    </div>

</asp:Content>

