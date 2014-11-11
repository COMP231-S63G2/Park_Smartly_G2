<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GenerateTicket.aspx.cs" Inherits="GenerateTicket" %>

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
            <div style="width: 300px; height: 500px; float: left">
                <div class="panel panel-default" style="width: 330px; margin-left: 20px">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht">Generate Tickets</h3>
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
                            <asp:Label ID="Label2" runat="server" Style="padding-left: 62px" class="col-sm-5 control-label" Text="Hours:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="Tb_hours" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div class="col-sm-2" style="padding-left: 20px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_hours" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 60px; width: 300px">
                            <asp:Label ID="Lbl_amt" runat="server" Style="padding-left:50px" class="col-sm-5 control-label" Text="Amount:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 5px;">
                                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 90px;">
                            <div class="col-sm-5 control-label">
                                <asp:Button ID="Button1" class="btn btn-default" runat="server" OnClick="Btn_rst_Click" CausesValidation="false" Text="Reset" Width="100px" />
                            </div>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:Button ID="Button2" class="btn btn-default" runat="server" OnClick="Btn_gnrt_Click" Text="Generate" Width="110px" />
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin-left: 100px; margin-top: 15px">
                    <asp:Label ID="Lbl_nospc" runat="server" Text="No Space Available" Font-Bold="True" Font-Size="Large" ForeColor="#CC0000" Visible="False"></asp:Label>
                </div>


                <div class="panel panel-default" style="width: 330px; margin-left: 20px; margin-top: 40px;">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht">Generate Ticket For Reserved Space</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ID="Label3" Style="padding-right: 10px;" runat="server" class="col-sm-5 control-label" Text="Reference No:"></asp:Label>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:TextBox ID="TB_reference_no" class="form-control" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div class="col-sm-2" style="padding-left: 10px;">
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_reference_no" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 30px;">
                            <div class="col-sm-5 control-label">
                            </div>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:Button ID="Btn_gnrt_resrd" class="btn btn-default" runat="server" CausesValidation="false" OnClick="Btn_gnrt_resrd_Click" Text="Generate" Width="110px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="printDiv" runat="server" style="visibility: hidden;">
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
                                        <asp:Label ID="Label9" runat="server" Text="Amount:"></asp:Label>

                                    </div>
                                    <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                                        <asp:Label ID="Lbl_amount" runat="server" Text="" Font-Bold="True"></asp:Label>
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
                                <asp:Label ID="Label12" runat="server" Text="Time Limit" Font-Bold="True"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style3">&nbsp;Time In:</td>
                                    <td style="width: 125px;">&nbsp;
                                <asp:Label ID="Lbl_timeIn" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style3">&nbsp;Time Out:</td>
                                    <td style="width: 125px;">&nbsp;
                                <asp:Label ID="Lbl_timeOut" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style4">&nbsp;Hours:</td>
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
                    <div class="form-group" style="margin-top: 25px; margin-left: 130px">
                        <div class="col-sm-4 control-label">
                            <asp:Button ID="Btn_clr" class="btn btn-default" runat="server" CausesValidation="false" OnClick="Btn_clr_Click" Text="Clear" Width="80px" />
                        </div>
                        <div class="col-sm-4" style="padding-left: 40px;">
                            <asp:Button ID="Btn_print" class="btn btn-default" runat="server" CausesValidation="false" OnClientClick="printReciept()" Text="Print" Width="80px" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        function printReciept() {
            win = window.open();
            win.document.write(document.getElementById("printPanel").innerHTML);
            win.print();
            win.close();
        }
    </script>
</asp:Content>
