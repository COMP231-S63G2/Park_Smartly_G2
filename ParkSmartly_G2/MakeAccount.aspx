<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MakeAccount.aspx.cs" Inherits="MakeAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="height: 450px; width: 380px; opacity: 0.9; float: left; margin-left: 180px; margin-top: 0px;">
     <div style="height: 40px; width: 312px; margin-left:50px";><h2>Create New Account</h2></div><br/>
        <table style="width:100%;">
            <tr><td>Operator ID</td><td>
                <input id="Text1" type="text" /></td></tr>
            <tr><td>First Name</td><td>
                <input id="Text2" type="text" /></td></tr>
            <tr><td>Last Name</td><td>
                <input id="Text3" type="text" /></td></tr>
            <tr><td>Gender</td><td>
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList></tr>
            <tr><td>Address</td><td>
                <input id="Text4" type="text" /></td></tr>
            <tr><td>City</td><td>
                <input id="Text5" type="text" /></td></tr>
            <tr><td>Province</td><td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Ontario</asp:ListItem>
                    <asp:ListItem>Alberta</asp:ListItem>
                    <asp:ListItem>Québec</asp:ListItem>
                    <asp:ListItem>British Columbia</asp:ListItem>
                    <asp:ListItem>Saskatchewan</asp:ListItem>
                    <asp:ListItem>Manitoba</asp:ListItem>
                </asp:DropDownList>
                </td></tr>
            <tr><td>Birth Date</td><td>
                <input id="Text6" type="text" /></td></tr>
            <tr><td>E Mail</td><td>
                <input id="Text7" type="text" /></td></tr>
            <tr><td>Blood Group</td><td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>A +ve</asp:ListItem>
                    <asp:ListItem>A -ve</asp:ListItem>
                    <asp:ListItem>B +ve</asp:ListItem>
                    <asp:ListItem>B -ve</asp:ListItem>
                    <asp:ListItem>AB +ve</asp:ListItem>
                    <asp:ListItem>AB -ve</asp:ListItem>
                    <asp:ListItem>O +ve</asp:ListItem>
                    <asp:ListItem>O -ve</asp:ListItem>
                </asp:DropDownList></td></tr> 
            <tr><td>Joint Date</td><td>
                <input id="Text8" type="text" /></td></tr>  
             <tr><td>
                 <asp:Button ID="Button2" runat="server" Text="Reset" />
                 </td><td>
                     <asp:Button ID="Button1" runat="server" Text="Done" />
                 </td></tr>   
         </table>
     </div>
</asp:Content>

