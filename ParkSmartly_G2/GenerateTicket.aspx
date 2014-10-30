<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GenerateTicket.aspx.cs" Inherits="GenerateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="styles/bootstrap.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <div class="t1" style="height: 500px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 100px">
        <div style="height: 40px; width: 312px; margin-left: 80px;">
            <h2>Generate Tickets</h2>
        </div>
        <div style="width:708px; height:400px">
        <div style="width:300px;float:left" >
        <table style="width: 32%; margin-top: 25px; margin-left: 50px; height: 98px;">
            <tr>
                <td>&nbsp;Hours:</td>
                <td>&nbsp;
                           <asp:TextBox ID="Tbox_un" runat="server" Width="110px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;Number Plate:</td>
                <td>&nbsp;
                            <asp:TextBox ID="Tbox_pass" runat="server" Width="110px"></asp:TextBox></td>
            </tr>
              <tr>
                <td>
                   <asp:Button ID="Btn_gnrt" runat="server" OnClick="Btn_gnrt_Click" Text="Generate" Width="100px" /></td>
                <td style="float: left;margin-left:20px">
                   <asp:Button ID="Btn_rst" runat="server" OnClick="Btn_rst_Click" Text="Reset" Width="100px" /></td>
            </tr>
        </table>
       </div>
       <div style="padding-left:10px;margin-left:310px; height:380px; width:365px"><asp:Panel ID="Panel1" runat="server" BorderStyle="Double" Height="363px" Width="299px">
       
           <asp:Label ID="Label1" runat="server" Text="Welcome to ABC Parking .Inc"></asp:Label>
           
           <asp:Label ID="Label2" runat="server" Text="Parking Space:Floor 1 Space:55"></asp:Label>
            </asp:Panel></div> </div>
   </div></asp:Content>

