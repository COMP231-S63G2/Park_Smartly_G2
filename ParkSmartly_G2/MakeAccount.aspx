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
    
    <script runat="server">

    protected void Btn_mkAcc_Click(object sender, EventArgs e)
    {
        Response.Redirect("MakeAccount.aspx");
    }
    protected void Btn_updt_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateData.aspx");
    }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="btn-group btn-group-justified" style="width: 590px; margin-left: 100px">
        <div class="btn-group">
            <asp:Button ID="Btn_mkAcc" class="btn btn-default" runat="server" OnClick="Btn_mkAcc_Click" CausesValidation="false" Text="Registration" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_updt" class="btn btn-default" runat="server" OnClick="Btn_updt_Click" CausesValidation="false" Text="Insert Spaces" />
        </div>
    </div>

     <div class="t1" style="height: 600px; width: 590px; opacity: 0.9; float: left; margin-left: 100px; margin-top: 20px;margin-bottom:10px">
     <div style="height: 25px; width: 312px; margin-left:170px";><h2>Registration</h2></div>
    <table style="width:91%; margin-left:50px; height: 356px;">
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:Label ID="lbl_us_exists" runat="server" Text="Username already exists..Try another." ForeColor="Red" Visible="false"></asp:Label>
                <asp:Label ID="lbl_succs" runat="server" Text="Registration Successfully done." ForeColor="#009900" Visible="false"></asp:Label>
        </td>
             </tr>     
        
        <tr><td class="auto-style2">First Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="Tb_fname" class="form-control" Width="170px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_fname" ErrorMessage="First name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td></tr>
            <tr><td class="auto-style3">Last Name</td>
                <td class="auto-style3">
                    <asp:TextBox ID="Tb_lname" class="form-control" Width="170px" runat="server"></asp:TextBox>
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
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDown_gen" ForeColor="Red" InitialValue="Select" ErrorMessage="Please select Gender" />
</td> </tr>
            <tr><td class="auto-style4">Address</td><td class="auto-style4">
                    <asp:TextBox ID="tb_adrs" class="form-control" Width="170px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_adrs" ErrorMessage="Please, Enter address" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr><td class="auto-style5">City</td><td class="auto-style5">
                    <asp:TextBox ID="tb_city" class="form-control" Width="170px" runat="server"></asp:TextBox>
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
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DropDown_pro" InitialValue="Select" ForeColor="Red" ErrorMessage="Please select Province" />
               </td>
            </tr>
             <tr><td>Postal Code</td><td class="auto-style1">
                    <asp:TextBox ID="Tb_pocd" class="form-control" Width="210px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Tb_pocd" ErrorMessage="Postal code required"  ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="txtZIP_validation" runat="SERVER" ControlToValidate="Tb_pocd" ErrorMessage="Enter a valid postal code." ForeColor="Red" ValidationExpression="[a-zA-Z][0-9][a-zA-Z](-||)[0-9][a-zA-Z][0-9]">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr><td>Contact Number</td><td class="auto-style1">
                    <asp:TextBox ID="tb_conmr" class="form-control" Width="170px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_conmr" ErrorMessage="Please, Enter contact number" ForeColor="Red"></asp:RequiredFieldValidator>
                  </td>
            </tr>
            <tr><td class="auto-style6">E Mail</td>
                <td class="auto-style6">
                    <asp:TextBox ID="tb_email" class="form-control" Width="210px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_email" ErrorMessage="Email address required        ." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="SERVER" ControlToValidate="tb_email" ErrorMessage="Enter a valid email address." ForeColor="Red" ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
        <tr><td>User Name</td><td class="auto-style1">
                    <asp:TextBox ID="Tb_usnm" class="form-control" Width="170px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Tb_usnm" ErrorMessage="Please, Enter contact number" ForeColor="Red"></asp:RequiredFieldValidator>
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
                     <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="DropDown_blgr" InitialValue="Select" ForeColor="Red" ErrorMessage="Please select Blood Group" />
</td>
            </tr> 
             
             <tr><td>
                 <asp:Button ID="Button2" runat="server" class="btn btn-default" Width="100px" Text="Reset" OnClick="Btn_reset_Click" />
                 </td><td class="auto-style1">
                     <asp:Button ID="Button1" runat="server" class="btn btn-default" Width="100px" Text="Submit" OnClick="Btn_sbmt_Click" />
                 </td>
                  
             </tr>   
         </table>
     </div>

</asp:Content>

