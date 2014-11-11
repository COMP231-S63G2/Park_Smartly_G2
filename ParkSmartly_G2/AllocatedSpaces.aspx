<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AllocatedSpaces.aspx.cs" Inherits="AllocatedSpaces" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script runat="server">

        protected void Btn_gent_Click(object sender, EventArgs e)
        {
            Response.Redirect("GenerateTicket.aspx");
        }
        protected void Btn_alct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllocatedSpaces.aspx");
        }
        protected void Btn_extc_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExitTimeChecking.aspx");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="btn-group btn-group-justified" style="width: 800px; margin-left: 10px">
        <div class="btn-group">
            <asp:Button ID="Btn_gent" class="btn btn-default" runat="server" OnClick="Btn_gent_Click" CausesValidation="false" Text="Generate Ticket" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_alct" class="btn btn-default" runat="server" OnClick="Btn_alct_Click" CausesValidation="false" Text="Allocated Spaces" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_extc" class="btn btn-default" runat="server" OnClick="Btn_extc_Click" CausesValidation="false" Text="Exit Check out" />
        </div>
    </div>
    <div class="t1" style="height: 550px; width: 760px; float: left; margin-left: 20px; margin-top: 10px; margin-bottom: 10px">

        <div style="height: 45px; margin-left: 270px; width: 200px;">
            <h4>Allocated Spaces</h4>
        </div>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" class="col-sm-2 control-label" Text="Floor No" Font-Bold="True" ForeColor="#993399" Font-Size="Medium"></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Label2" runat="server" Text="Allocated" Font-Bold="True" ForeColor="#993399" Font-Size="Medium"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="Label3" runat="server" Text="Percentage" Font-Bold="True" ForeColor="#993399" Font-Size="Medium"></asp:Label>
            </div>
            <div class="progress" style="visibility: hidden">
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" class="col-sm-2 control-label" Text="Floor No 1" Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_all1" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="lbl_per1" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress1" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100" >
                </div>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label7" runat="server" class="col-sm-2 control-label" Text="Floor No 2"  Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_all2" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="lbl_per2" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress2" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100">
                </div>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label10" runat="server" class="col-sm-2 control-label" Text="Floor No 3"  Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_all3" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="lbl_per3" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress3" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                </div>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label13" runat="server" class="col-sm-2 control-label" Text="Floor No 4"  Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_all4" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="lbl_per4" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress4" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                </div>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label16" runat="server" class="col-sm-2 control-label" Text="Floor No 5"  Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_all5" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="lbl_per5" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress5" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                </div>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label19" runat="server" class="col-sm-2 control-label" Text="Floor No 6"  Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_all6" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="lbl_per6" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress6" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                </div>
            </div>
        </div>
        <div style="height: 45px; margin-left: 270px;margin-top:10px; width: 200px;">
            <h4>Reserved Spaces</h4>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" class="col-sm-2 control-label" Text="Reserved"  Font-Bold="True" Font-Size="Small" ></asp:Label>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_res" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label ID="Lbl_re_ttl" runat="server" Text=""></asp:Label>
            </div>
            <div class="progress">
                <div runat="server" id="progress7" class="progress-bar" role="progressbar" aria-valuenow="0.1" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                </div>
            </div>
        </div>
        <div style="margin-left: 570px; margin-top: 30px">
            <asp:Button ID="Btn_back" class="btn btn-default" OnClick="Btn_back_Click" Width="90px" runat="server" Text="Back" />
        </div>

    </div>

</asp:Content>

