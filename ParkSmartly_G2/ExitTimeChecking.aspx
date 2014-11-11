<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExitTimeChecking.aspx.cs" Inherits="ExitTimeChecking" %>

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
                <div id="printPanel" style="padding-left: 7px; margin-left: 0px; height: 360px; width: 340px">
                        <div style="height: 380px; width: 310px">
                            <div style="height: 20px; width: 310px; margin-top: 10px; margin-bottom: 10px">
                                <asp:Label ID="lblTitle" runat="server" Font-Size="X-Large" Text="Welcome to ParkSmartly.Inc"></asp:Label>
                            </div>
                            <asp:Label ID="Label4" runat="server">---------------------------------------------------------</asp:Label>
                            <div style="height: 120px; width: 300px; margin-bottom: 5px;">
                                <div style="height: 20px; width: 300px">
                                    <div style="height: 20px; float: left; width: 150px; padding-left: 15px; margin-top: 5px; margin-bottom: 5px; text-align: left">
                                        <asp:Label ID="Lbl_dt" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div style="height: 20px; width: 150px; margin-left: 150px; padding-right: 15px; margin-top: 5px; margin-bottom: 5px; text-align: right">
                                        <asp:Label ID="Lbl_t_id" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div style="height: 20px; width: 300px; margin-top: 10px">
                                    <div style="height: 20px; float: left; width: 150px; text-align: right">
                                        <asp:Label ID="Label7" runat="server" Text="Parking Floor:"></asp:Label>

                                    </div>
                                    <div style="height: 20px; width: 150px; padding-left: 5px; margin-left: 150px; text-align: left">
                                        <asp:Label ID="lbl_flor" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <div style="height: 20px; width: 300px; margin-top: 5px">
                                    <div style="height: 20px; float: left; width: 150px; text-align: right">
                                        <asp:Label ID="Label5" runat="server" Text="Space:"></asp:Label>

                                    </div>
                                    <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                                        <asp:Label ID="Lbl_spc" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                   
                                <div style="height: 20px; width: 300px; margin-top: 5px">
                                    <div style="height: 20px; float: left; width: 150px; text-align: right">
                                        <asp:Label ID="Label11" runat="server" Text="Licence Plate:"></asp:Label>

                                    </div>
                                    <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                                        <asp:Label ID="Lbl_Lplate" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>

                            </div>
                            <table id="table1" runat="server" style="width: 84%; border-style: solid; border-width: 1px; height: 56px; margin-left: 15px">
                                <tr>
                                    <td colspan="2" style="border-style: none none solid none; border-bottom-width: 1px; padding-left: 80px">&nbsp;
                                <asp:Label ID="Label12" runat="server" Text="Exceeded Charge" Font-Bold="True"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style3">&nbsp;Exceeded By:</td>
                                    <td style="width: 125px;">&nbsp;
                                <asp:Label ID="Lbl_timeIn" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style3">&nbsp;Charge Per Hour:</td>
                                    <td style="width: 125px;">&nbsp;
                                <asp:Label ID="Lbl_timeOut" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style4">&nbsp;Charged amount:</td>
                                    <td style="width: 125px;">&nbsp;
                                <asp:Label ID="Lbl_hrs" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <div>
                                <asp:Label ID="Label6" runat="server">---------------------------------------------------------</asp:Label>
                            </div>
                            <div style="height: 20px; width: 300px; margin-top: 1px; text-align: center">
                                <asp:Label ID="Label19" runat="server" Text="Make Reservation for Parking Space."></asp:Label>
                            </div>
                            <div style="height: 20px; width: 300px; margin-top: 1px; text-align: center">
                                <asp:Label ID="Label20" runat="server" Text="www.parksmartly.com"></asp:Label>
                            </div>
                            <div style="height: 20px; width: 300px; margin-top: 1px; text-align: center">
                                <asp:Label ID="Label21" runat="server" Text="Thank You."></asp:Label>
                                <asp:Label ID="Label22" runat="server" Text="Please Come Again."></asp:Label>
                            </div>
                            <div style="height: 20px; width: 300px; margin-top: 1px; text-align: center">
                            </div>
                        </div>

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
