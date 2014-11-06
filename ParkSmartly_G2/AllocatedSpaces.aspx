<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AllocatedSpaces.aspx.cs" Inherits="AllocatedSpaces" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 760px; float: left; margin-left: 20px; margin-top: 10px; margin-bottom: 10px">

        <div  style="height: 45px;margin-left:270px; width: 200px;"><h4>Allocated Spaces</h4>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" class="col-sm-2 control-label" Text="Floor No" Font-Bold="True" ForeColor="#993399"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Label2" runat="server" Text="Allocated" Font-Bold="True" ForeColor="#993399"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Label3" runat="server" Text="Percentage" Font-Bold="True" ForeColor="#993399"></asp:Label>
                </div>
                <div class="progress" style="visibility: hidden">
                </div>
            </div>
  
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" class="col-sm-2 control-label" Text="Floor No 1"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Lbl_all1" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl_per1" runat="server" Text=""></asp:Label>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span class="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" class="col-sm-2 control-label" Text="Floor No 2"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Lbl_all2" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl_per2" runat="server" Text=""></asp:Label>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span class="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label10" runat="server" class="col-sm-2 control-label" Text="Floor No 3"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Lbl_all3" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl_per3" runat="server" Text=""></asp:Label>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span class="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label13" runat="server" class="col-sm-2 control-label" Text="Floor No 4"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Lbl_all4" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl_per4" runat="server" Text=""></asp:Label>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span class="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label16" runat="server" class="col-sm-2 control-label" Text="Floor No 5"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Lbl_all5" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl_per5" runat="server" Text=""></asp:Label>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span class="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label19" runat="server" class="col-sm-2 control-label" Text="Floor No 6"></asp:Label>
                <div class="col-sm-2">
                    <asp:Label ID="Lbl_all6" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl_per6" runat="server" Text=""></asp:Label>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span class="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
      <div style="margin-left:570px;margin-top:30px">
          <asp:Button ID="Button1" class="btn btn-default" Width="90px" runat="server" Text="Back" /></div>

    </div>

</asp:Content>

