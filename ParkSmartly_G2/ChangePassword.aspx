<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 192px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="height: 450px; width: 380px; opacity: 0.9; float: left; margin-left: 180px; margin-top: 20px;">
     <div style="height: 40px; width: 312px; margin-left:50px";><h2>Change Password</h2></div>
    <table style="width:100%;">
        <tr>
            <td></td>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            <td class="auto-style1">Old Password</td>
            <td>
                <input id="Password1" type="password" /></td>
            
        </tr>
        <tr>
            <td class="auto-style1">New Password</td>
            <td>
                <input id="Password2" type="password" /></td>
           
        </tr>
        <tr>
            <td class="auto-style1">Confirm Password</td>
            <td>
                <input id="Password3" type="password" /></td>
        </tr>
         <tr>
            <td class="auto-style1"></td>
            <td> 
                <asp:Button ID="changePassword1" runat="server" Text="Change Password" Width="162px" />
                </td>
        </tr>
    </table>
   </div>
</asp:Content>

