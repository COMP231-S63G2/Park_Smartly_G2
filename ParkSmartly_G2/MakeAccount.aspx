<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MakeAccount.aspx.cs" Inherits="MakeAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 32px;
        }
        .auto-style3 {
            height: 35px;
        }
        .auto-style4 {
            height: 36px;
        }
        .auto-style5 {
            height: 39px;
        }
        .auto-style6 {
            height: 2px;
        }
        .auto-style7 {
            height: 32px;
            width: 187px;
        }
        .auto-style8 {
            height: 35px;
            width: 187px;
        }
        .auto-style9 {
            height: 36px;
            width: 187px;
        }
        .auto-style10 {
            height: 39px;
            width: 187px;
        }
        .auto-style11 {
            width: 187px;
        }
        .auto-style12 {
            height: 2px;
            width: 187px;
        }
        .auto-style13 {
            height: 38px;
        }
        .auto-style14 {
            height: 38px;
            width: 187px;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="t1" style="height: 600px; width: 550px; opacity: 0.9; float: left; margin-left: 100px; margin-top: 20px;margin-bottom:110px">
     <div style="height: 40px; width: 312px; margin-left:170px";><h2>Registration</h2></div>
    <table style="width:89%; margin-left:50px; height: 356px;">
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:Label ID="lbl_us_exists" runat="server" Text="Username already exists..Try another." ForeColor="Red" Visible="false"></asp:Label>
                <asp:Label ID="lbl_succs" runat="server" Text="Registration Successfully done." ForeColor="#009900" Visible="false"></asp:Label>
                <asp:Label ID="lbl_nt_mtch" runat="server" Text="Confirm Password not matching" ForeColor="Red" Visible="false"></asp:Label>
        </td>
             </tr>     
        
        <tr><td class="auto-style2">First Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="Tb_fname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_fname" ErrorMessage="First name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td></tr>
            <tr><td class="auto-style3">Last Name</td>
                <td class="auto-style3">
                    <asp:TextBox ID="Tb_lname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Tb_lname" ErrorMessage="Last name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td></tr>
            <tr><td class="auto-style4">Gender</td><td class="auto-style4">
                <asp:DropDownList ID="DropDown_gen" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td class="auto-style9">
                     <asp:Label ID="lbl_gen_error" runat="server" Text="select Gender" ForeColor="Red" Visible="false"></asp:Label>   </td>
            </tr>
            <tr><td class="auto-style4">Address</td><td class="auto-style4">
                    <asp:TextBox ID="tb_adrs" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_adrs" ErrorMessage="Please, Enter address" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr><td class="auto-style5">City</td><td class="auto-style5">
                    <asp:TextBox ID="tb_city" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_city" ErrorMessage="City required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr><td class="auto-style4">Province</td><td class="auto-style4">
                <asp:DropDownList ID="DropDown_pro" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Ontario</asp:ListItem>
                    <asp:ListItem>Alberta</asp:ListItem>
                    <asp:ListItem>Québec</asp:ListItem>
                    <asp:ListItem>British Columbia</asp:ListItem>
                    <asp:ListItem>Saskatchewan</asp:ListItem>
                    <asp:ListItem>Manitoba</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
             <tr><td>Postal Code</td><td class="auto-style1">
                    <asp:TextBox ID="Tb_pocd" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Tb_pocd" ErrorMessage="Postal code required"  ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="txtZIP_validation" runat="SERVER" ControlToValidate="Tb_pocd" ErrorMessage="Enter a valid postal code." ForeColor="Red" ValidationExpression="[a-zA-Z][0-9][a-zA-Z](-||)[0-9][a-zA-Z][0-9]">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr><td>Contact Number</td><td class="auto-style1">
                    <asp:TextBox ID="tb_conmr" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_conmr" ErrorMessage="Please, Enter contact number" ForeColor="Red"></asp:RequiredFieldValidator>
                  </td>
            </tr>
            <tr><td class="auto-style6">E Mail</td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_email" ErrorMessage="Email address required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="SERVER" ControlToValidate="tb_email" ErrorMessage="Enter a valid email address." ForeColor="Red" ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
        <tr><td>User Name</td><td class="auto-style1">
                    <asp:TextBox ID="Tb_usnm" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Tb_usnm" ErrorMessage="Please, Enter contact number" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td class="auto-style4">Birth Date</td><td class="auto-style4">
                    <asp:TextBox ID="Tb_bdate" runat="server"></asp:TextBox>
                <%--<asp:ImageButton ID="ImageButton1"  ImageUrl="Images/cal_date.png" Height="25px" Width="25px" OnClick="ImageButton1_Click" runat="server" />--%>
                </td>
                  
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Tb_bdate" ErrorMessage="Birthdate required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                 </tr>        
            <tr><td class="auto-style13">Blood Group</td><td class="auto-style13">
                <asp:DropDownList ID="DropDown_blgr" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>A +ve</asp:ListItem>
                    <asp:ListItem>A -ve</asp:ListItem>
                    <asp:ListItem>B +ve</asp:ListItem>
                    <asp:ListItem>B -ve</asp:ListItem>
                    <asp:ListItem>AB +ve</asp:ListItem>
                    <asp:ListItem>AB -ve</asp:ListItem>
                    <asp:ListItem>O +ve</asp:ListItem>
                    <asp:ListItem>O -ve</asp:ListItem>
                </asp:DropDownList></td>
                 <td class="auto-style14">
                     <asp:Label ID="lbl_bld_grp" runat="server" Text="select Gender" ForeColor="Red" Visible="false"></asp:Label>   </td>
            

            </tr> 
             
             <tr><td>
                 <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="Button2_Click" />
                 </td><td class="auto-style1">
                     <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Btn_sbmt_Click" />
                 </td>
             </tr>   
         </table>
     </div>

</asp:Content>

