<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reserved.aspx.cs" Inherits="Reserved" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 88%;
            border-style: solid;
            border-width: 1px;
            height: 56px;
        }
    </style>
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
    <div class="t1" style="height: 40px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">
        <div class="form-group col-sm-6">
            <asp:Label ID="Label2"  align="left" runat="server" class="col-sm-5 control-label" Text="Select Year:"></asp:Label>
            <div class="col-sm-4" style="padding-left: 0px;">
                <asp:DropDownList OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="True" ID="ddlYear" Width="120px" runat="server" DataSourceID="dsYears" DataTextField="Year" DataValueField="Year"></asp:DropDownList>
                <asp:SqlDataSource ID="dsYears" runat="server" ConnectionString="<%$ ConnectionStrings:Park_smartly_conStr %>" SelectCommand="SELECT DISTINCT YEAR([Date]) as 'Year' from Registration_Data"></asp:SqlDataSource>
            </div>

        </div>
        <div class="form-group col-sm-6">
            <asp:Label ID="Label1" align="left" runat="server" class="col-sm-5 control-label" Text="Select Month:"></asp:Label>
            <div class="col-sm-4" style="padding-left: 0px;">
                <asp:DropDownList OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="True" ID="ddlMonth" Width="120px" runat="server" DataSourceID="dsMonths" DataTextField="Month" DataValueField="Month"></asp:DropDownList>
                <asp:SqlDataSource ID="dsMonths" runat="server" ConnectionString="<%$ ConnectionStrings:Park_smartly_conStr %>" SelectCommand="SELECT DISTINCT MONTH([Date]) as 'Month' from Registration_Data"></asp:SqlDataSource>
            </div>

        </div>
         
    </div>
    <div class="t1" style="height: 550px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">
        <asp:GridView ID="gvData" runat="server" CssClass="table table-condensed" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#f1d9f4" />
            <FooterStyle BackColor="#be8fd1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#be8fd1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#be8fd1" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#f1d9f4" />
            <SelectedRowStyle BackColor="#f1d9f4" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        
    </div>

</asp:Content>

