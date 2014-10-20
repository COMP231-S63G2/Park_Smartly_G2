<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div style="height: 450px; width: 380px; opacity: 0.9; float: left; margin-left: 180px; margin-top: 20px;">
            <div style="height: 40px; width: 312px; margin-left:50px";><h2>Change Password</h2></div>
         
                <table class="t1" style="width: 100%;margin-top:25px">
                   
                    <tr>
                        <td style="float: right">&nbsp;Old Password:</td>
                        <td>&nbsp;<input id="fn" type="text" name="Tfname" /></td>
                    </tr>
                    <tr>
                        <td style="float: right">&nbsp;New Password:</td>
                        <td>&nbsp;<input id="ln" type="text" name="Tlname" /></td>

                    </tr>
                    <tr>
                        <td style="float: right">&nbsp;Confirm Password:</td>
                        <td>&nbsp;<input id="ad" type="text" name="Tadd" /></td>

                    </tr>
                  
                    <tr>
                        <td></td>
                        <td style="float:left">&nbsp;<input id="Submit1" class="Button" type="submit" value="Change Password" /></td>
                        
                    </tr>
                </table>
                  
        </div>
</asp:Content>

