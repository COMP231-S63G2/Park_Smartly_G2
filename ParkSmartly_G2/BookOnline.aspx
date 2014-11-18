<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookOnline.aspx.cs" Inherits="BookOnline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 800px; float: left; margin-left: 10px; margin-top: 10px;">

        <div style="width: 708px; height: 500px; margin-top: 20px">
            <div style="width: 600px; height: 500px; float: left">
                <div class="panel panel-default" style="width: 600px; height: 500px; margin-left: 100px">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht">Online Booking</h3>
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <div class="col-sm-5 control-label" style="text-align: right">
                                <asp:Label ID="Label1" Style="padding-right: 10px" runat="server" Text="Date:"></asp:Label>
                            </div>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="Tb_Date" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div class="col-sm-2" style="padding-left: 20px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_Date" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 40px; margin-left: 60px">
                            <asp:Label ID="Lbl_ptime" runat="server" Style="padding-left: 62px" Font-Bold="true" Text=" Select Parking Times"></asp:Label>

                        </div>
                        <div style="margin-left: 80px">
                            <div class="form-group" style="margin-top: 20px; margin-bottom: 20px; height: 20px">
                                <div class="col-sm-7 control-label" style="text-align: right">
                                    <asp:CheckBox ID="Cb_mor" runat="server" />
                                    <asp:Label ID="Label2" runat="server" Style="padding-left: 10px; margin-right: 20px" Text="Morning (6:00AM to 2:00PM)"></asp:Label>
                                </div>
                                <div class="col-sm-5" style="padding-left: 0px;">
                                    <asp:Label ID="Label3" runat="server" Style="padding-left: 62px" Font-Bold="true" ForeColor="Red" Text="Slot Not Available"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group" style="margin-top: 0px; height: 20px">
                                <div class="col-sm-7 control-label" style="text-align: right">
                                    <asp:CheckBox ID="Cb_aft" runat="server" />
                                    <asp:Label ID="Label4" runat="server" Style="padding-left: 10px; margin-right: 2px" Text="Afternoon (2:00PM to 10:00PM)"></asp:Label>
                                </div>
                                <div class="col-sm-5" style="padding-left: 0px;">
                                    <asp:Label ID="Label5" runat="server" Style="padding-left: 62px" Font-Bold="true" ForeColor="Red" Text="Slot Not Available"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group" style="">
                                <div class="col-sm-7 control-label" style="text-align: right; height: 20px">
                                    <asp:CheckBox ID="Cb_nig" runat="server" />
                                    <asp:Label ID="Label6" runat="server" Style="padding-left: 10px; margin-right: 30px" Text="Night (10:00PM to 6:00AM)"></asp:Label>
                                </div>
                                <div class="col-sm-5" style="padding-left: 0px;">
                                    <asp:Label ID="Label7" runat="server" Style="padding-left: 62px" Font-Bold="true" ForeColor="Red" Text="Slot Not Available"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 10px; margin-left: 130px">

                                <div class="col-sm-12" style="padding-left: 200px; margin-top: 20px;">
                                    <asp:Button ID="Btn_book" class="btn btn-default" runat="server" Text="Book" Width="80px" />
                                </div>
                            </div>
                        </div>

                    </div>
                    <div style="margin-left: 100px; margin-top: 5px; width: 400px">
                        <table class="table">
                            <tr>
                                <td colspan="2">&nbsp;
                                <asp:Label ID="Label12" runat="server" Text="Prices" Font-Bold="True"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style3">&nbsp;Morming Time:</td>
                                <td>&nbsp;45 CAD
                                </td>

                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style3">&nbsp;Afternoon Time:</td>
                                <td>&nbsp; 50 CAD
                                </td>

                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style4">&nbsp;Night Time:</td>
                                <td>&nbsp;40 CAD
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

