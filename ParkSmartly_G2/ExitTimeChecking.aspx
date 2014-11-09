<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExitTimeChecking.aspx.cs" Inherits="ExitTimeChecking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">
        <div style="width: 708px; height: 400px; margin-top: 20px">
            <div style="width: 360px; height: 464px; float: left">
                <div class="panel panel-default" style="width: 330px; margin-left: 20px; height: 200px;">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht">Check Time Limit</h3>
                    </div>
                    <div class="panel-body">

                        <div style="margin-left: 10px; margin-bottom: 2px">
                            <asp:Label ID="Lbl_nt_fnd" runat="server" Text="Data Not Matching, Try Again." Visible="False" ForeColor="#CC0000"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Lbl_noplt" Style="padding-right: 10px" runat="server" class="col-sm-5 control-label" Text="License Plate:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="Tb_noPlt" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>

                        </div>
                        <div class="form-group" style="margin-top: 35px">
                            <asp:Label ID="Label2" Style="padding-right: 10px" runat="server" class="col-sm-5 control-label" Text="Ticket Id:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="Tb_tId" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 70px;">
                            <div class="col-sm-5 control-label">
                            </div>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:Button ID="Btn_check" class="btn btn-default" runat="server" OnClick="Btn_check_Click" Text="Check" Width="110px" />
                            </div>
                        </div>

                    </div>
                </div>

                <div class="well well-lg" style="border: 1px groove #CC99FF; height: 160px; width: 330px; margin-left: 20px;">

                    <div class="form-group">
                        <div style="padding-left: 0px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_excd" runat="server" Text="" Font-Bold="True" Visible="False"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_excd_by" runat="server" Text="" Font-Bold="True" Visible="False"></asp:Label>
                        </div>
                        <div style="padding-left: 0px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                            <asp:Label ID="lbl_exc_amt" runat="server" Text="" Font-Bold="True" Visible="False"></asp:Label>

                        </div>

                    </div>
                </div>
                  <div style="margin-left: 240px">
                        <asp:Button ID="Btn_check_out" class="btn btn-default" runat="server" OnClick="Btn_check_out_Click" Text="Check Out" Width="110px" />
                        
                </div>

            </div>
            <div style="margin-left: 390px; border: double; border-color: #ddbbea; height: 390px; width: 320px">
                <div id="printPanel" style="padding-left: 7px; margin-left: 0px; height: 360px; width: 310px">
                </div>
                <div class="form-group" style="margin-top: 30px; margin-left: 130px">
                    <div class="col-sm-4 control-label">
                        <asp:Button ID="Btn_clr" class="btn btn-default" runat="server" OnClick="Btn_clr_Click" Text="Clear" Width="80px" />

                    </div>
                    <div class="col-sm-4" style="padding-left: 40px;">
                        <asp:Button ID="Btn_print" class="btn btn-default" runat="server" OnClick="Btn_print_Click" Text="Print" Width="80px" />

                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

