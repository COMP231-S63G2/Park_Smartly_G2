<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Yearly.aspx.cs" Inherits="Yearly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script runat="server">

        protected void Btn_daily_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");
        }
        protected void Btn_monthly_Click(object sender, EventArgs e)
        {
            Response.Redirect("Monthly.aspx");
        }
        protected void Btn_yearly_Click(object sender, EventArgs e)
        {
            Response.Redirect("Yearly.aspx");
        }
        protected void Btn_reserved_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reserved.aspx");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="btn-group btn-group-justified" style="width: 800px; margin-left: 10px">
        <div class="btn-group">
            <asp:Button ID="Btn_daily" class="btn btn-default" runat="server" OnClick="Btn_daily_Click" CausesValidation="false" Text="Daily" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_monthly" class="btn btn-default" runat="server" OnClick="Btn_monthly_Click" CausesValidation="false" Text="Monthly" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_yearly" class="btn btn-default" runat="server" OnClick="Btn_yearly_Click" CausesValidation="false" Text="Yearly" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_reserved" class="btn btn-default" runat="server" OnClick="Btn_reserved_Click" CausesValidation="false" Text="Reserved" />
        </div>
    </div>
    
    <div class="t1" style="height: 550px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">
    </div>

</asp:Content>



