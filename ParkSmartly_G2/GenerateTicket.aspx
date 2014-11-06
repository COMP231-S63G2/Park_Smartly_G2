<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GenerateTicket.aspx.cs" Inherits="GenerateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="styles/bootstrap.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="t1" style="height: 570px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">

        <div style="width: 708px; height: 400px; margin-top: 20px">
            <div style="width: 300px; height: 500px; float: left">
                <div class="panel panel-default" style="width: 330px; margin-left: 20px">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht">Generate Tickets</h3>
                    </div>
                    <div class="panel-body">
                        <div style="margin-left: 50px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="SERVER" ControlToValidate="Tb_noPlt" ErrorMessage="Licence Number Invalid" ForeColor="Red" ValidationExpression="^[A-Z]{4}(\s)?[0-9]{3}$">
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
                        <div class="form-group" style="margin-top: 60px;">
                            <div class="col-sm-5 control-label">
                                <asp:Button ID="Button1" class="btn btn-default" runat="server" OnClick="Btn_rst_Click" CausesValidation="false" Text="Reset" Width="100px" />
                            </div>
                            <div class="col-sm-4" style="padding-left: 0px;">
                                <asp:Button ID="Button2" class="btn btn-default" runat="server" OnClick="Btn_gnrt_Click" Text="Generate" Width="110px" />
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin-left:100px;margin-top:15px">
                    <asp:Label ID="Lbl_nospc" runat="server" Text="No Space Available" Font-Bold="True" Font-Size="Large" ForeColor="#CC0000" Visible="False"></asp:Label>
                </div>


                <div class="panel panel-default" style="width: 330px; margin-left: 20px; margin-top: 40px;">
                    <div class="panel-heading">
                        <h3 class="panel-title-wht">Generate Ticket For Reserved Space</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ID="Label3" Style="padding-right: 10px" runat="server" class="col-sm-5 control-label" Text="Reference No:"></asp:Label>
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
            <div style="margin-left: 390px; border: double; border-color: #ddbbea; height: 390px; width: 340px">
                <div id="printPanel" style="padding-left: 20px; margin-left: 0px; height: 380px; width: 340px">
                </div>
                <div class="form-group" style="margin-top: 20px; margin-left: 150px">
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
