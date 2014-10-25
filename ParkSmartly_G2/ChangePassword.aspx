<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 192px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="t1" style="height: 300px; width: 550px; opacity: 0.9; float: left; margin-left: 100px; margin-top: 20px;margin-bottom:110px">
     <div style="height: 40px; width: 312px; margin-left:110px";><h2>Change Password</h2></div>
    <table class="tabl" style="width:85%; margin-left:50px">
        <tr>
            <td></td>
            <td></td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:Label ID="lbl_succ" runat="server" Text="Your Password Successfully Changed" ForeColor="#009900" Visible="false"></asp:Label>
        
                <asp:Label ID="lbl_nt_f" runat="server" Text="Password not found" ForeColor="Red" Visible="false"></asp:Label>
       
                <asp:Label ID="lbl_nt_mtch" runat="server" Text="Confirm Password not matching" ForeColor="Red" Visible="true"></asp:Label>
        </td>
             </tr>
        <tr>
            <td>Old Password</td>
            <td>
                 <asp:TextBox ID="Tbox_pass1" TextMode="Password" runat="server"></asp:TextBox></td>
            
                 <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tbox_pass1" ErrorMessage="Old Password required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                     </tr>
        <tr>
            <td>New Password</td>
            <td>
                 <asp:TextBox ID="Tbox_passN" TextMode="Password" runat="server"></asp:TextBox></td>
           <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tbox_passN" ErrorMessage="Enter new password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td >Confirm Password</td>
            <td>
                 <asp:TextBox ID="Tbox_passCN" TextMode="Password" runat="server"></asp:TextBox></td>
       <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Tbox_passCN" ErrorMessage="Confirm the password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
        </tr>
         <tr>
            <td></td>
            <td> 
                <asp:Button ID="changePassword1" runat="server" Text="Change Password" Width="152px" OnClick="changePassword1_Click" />
                </td>
             <td> 
                 </td>
             </tr>
    </table>
         <div style="margin-left:400px;margin-top:30px">
         <asp:Button ID="continue" runat="server" Text="Continue" Width="97px" OnClick="continue_Click"  CausesValidation="false" />
         </div>            
   </div>

</asp:Content>

