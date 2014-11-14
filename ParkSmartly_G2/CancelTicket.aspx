<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CancelTicket.aspx.cs" Inherits="CancelTicket" %>

<%--  UI page for Cancel Ticket option #70 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="styles/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 88%;
            border-style: solid;
            border-width: 1px;
            height: 56px;
        }
    </style>
    <script runat="server">

        protected void Btn_gent_Click(object sender, EventArgs e)
        {
            Response.Redirect("GenerateTicket.aspx");
        }
        protected void Btn_cncl_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelTicket.aspx");
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
            <asp:Button ID="Btn_cncl" class="btn btn-default" runat="server" OnClick="Btn_cncl_Click" CausesValidation="false" Text="Cancel Ticket" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_alct" class="btn btn-default" runat="server" OnClick="Btn_alct_Click" CausesValidation="false" Text="Allocated Spaces" />
        </div>
        <div class="btn-group">
            <asp:Button ID="Btn_extc" class="btn btn-default" runat="server" OnClick="Btn_extc_Click" CausesValidation="false" Text="Exit Check out" />
        </div>
    </div>
    <div class="t1" style="height: 450px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">

        <div style="width: 708px; height: 400px; margin-top: 20px">
            <div style="width: 300px; height: 500px; float: left">
                <div class="panel panel-default" style="width: 330px; margin-left: 20px">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht" style="text-align: center">Cancel Tickets</h3>
                    </div>
                    <div class="panel-body">
                        <div style="margin-left: 50px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="SERVER" ControlToValidate="Tb_noPlt" ErrorMessage="Licence Number Invalid" ForeColor="Red" ValidationExpression="^[A-Z]{4}?[0-9]{3}$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" Style="padding-right: 10px" runat="server" class="col-sm-5 control-label" Text="License Plate:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="Tb_noPlt" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div class="col-sm-2" style="padding-left: 20px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_noPlt" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 30px;">
                            <asp:Label ID="Label2" runat="server" Style="padding-left: 40px" class="col-sm-5 control-label" Text="Ticket Id:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="Tb_Tid" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div class="col-sm-2" style="padding-left: 20px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_Tid" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 70px;">
                            <div class="col-sm-5 control-label">
                            </div>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:Button ID="Btn_Cancel" class="btn btn-default" runat="server" OnClick="Btn_Cancel_Click" Text="Cancel" Width="110px" />
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 100px;">
                            <div class="col-sm-12 control-label">
                                <asp:Label ID="Lbl_ntfnd" runat="server" Style="padding-left: 30px" ForeColor="Red" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="well well-lg" style="margin-left: 390px; border: 1px groove #CC99FF; height: 300px; width: 330px;">
                <div id="sidedt">
                    <div class="form-group">
                        <div style="padding-left: 0px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_msg" runat="server" Text="Ticket cancelation Successfully done" ForeColor="Green" Visible="false"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_Lplate" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_flr" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_spc" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_hrs" runat="server"  Text="" Visible="false"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_rf_amt" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

