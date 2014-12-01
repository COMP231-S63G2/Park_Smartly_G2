<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExtendTime.aspx.cs" Inherits="ExtendTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">

        <div style="width: 450px; height: 500px; margin-left: 100PX; margin-top: 10px; float: left">
            <div class="panel panel-default" style="width: 450px; height: 270px; margin-left: 20px">
                <div class="panel-heading">
                    <h3 class="panel-title-wht">Extend Parking-time Limit</h3>
                </div>
                <div class="panel-body">
                    <div style="margin-left: 50px">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="SERVER" ControlToValidate="Tb_noPlt" ErrorMessage="Licence Number Invalid" ForeColor="Red" ValidationExpression="^[A-Z]{4}?[0-9]{3}$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Lbl_plt" Style="padding-left: 50px" runat="server" class="col-sm-5 control-label" Text="License Plate:"></asp:Label>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:TextBox ID="Tb_noPlt" class="form-control" runat="server" Width="110px"></asp:TextBox>
                        </div>
                        <div class="col-sm-2" style="padding-left: 20px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_noPlt" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 30px;">
                        <asp:Label ID="Label2" runat="server" Style="padding-left: 62px" class="col-sm-5 control-label" Text="Ticket Id:"></asp:Label>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:TextBox ID="Tb_id" class="form-control" runat="server" Width="110px"></asp:TextBox>
                        </div>
                        <div class="col-sm-2" style="padding-left: 20px;">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 60px;">
                        <asp:Label ID="Lbl" runat="server" Style="padding-left: 30px" class="col-sm-12 control-label" Text="Extend Time limit Now. Save Your Money" Font-Bold="True" ForeColor="#CC9900"></asp:Label>

                    </div>
                    <div class="form-group" style="margin-top: 90px;">
                        <asp:Label ID="Label1" runat="server" Style="padding-left: 20px" class="col-sm-5 control-label" Text="How many Hours:"></asp:Label>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:TextBox ID="Tb_hrs" class="form-control" runat="server" Width="110px"></asp:TextBox>
                        </div>
                        <div class="col-sm-2" style="padding-left: 20px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_hrs" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 120px;">
                        <div class="col-sm-5 control-label">
                        </div>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:Button ID="Btn_extd" class="btn btn-default" runat="server" OnClick="Btn_extd_Click" Text="Extend" Width="110px" />
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 140px;">
                        <div class="col-sm-12 control-label">
                            <asp:Label ID="Lbl_err_msg" runat="server" Style="padding-left: 30px" ForeColor="#CC0000" Text=""></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="SERVER" ControlToValidate="Tb_hrs" ErrorMessage="Enter valid hours" ForeColor="Red" ValidationExpression="^\d+$">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
            <div class="well well-lg" style="border: 1px groove #CC99FF; height: 160px; width: 450px; margin-left: 20px;">

                <div class="form-group" style="margin-left:30px">
                    <div style="padding-left: 0px; height: 25px; width: 320px; text-align: center">
                        <asp:Label ID="lbl_msg" runat="server" Text="" Visible="False"></asp:Label>
                    </div>
                    <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="lbl_ex_hrs" runat="server" Text="" Visible="False"></asp:Label>
                    </div>
                    <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="lbl_amt" runat="server" Text="" Visible="False"></asp:Label>

                    </div>
                    <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="lbl_nw_ext_tm" runat="server" Text="" Visible="False"></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

