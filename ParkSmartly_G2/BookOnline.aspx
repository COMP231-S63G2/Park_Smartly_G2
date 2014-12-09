<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookOnline.aspx.cs" Inherits="BookOnline" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="styles/JavaScript.js"></script>
    <script src="styles/JavaScript2.js"></script>

    <link href="styles/styleDP.css" rel="stylesheet" />
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
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
                                <%--<input type="text" id="datepicker" class="form-control" style="width: 150px" />
                                --%>
                                <asp:TextBox ID="datepicker" AutoPostBack="true" OnTextChanged="datepicker_TextChanged" ClientIDMode="Static" class="form-control" runat="server" Width="110px"></asp:TextBox>

                            </div>
                            <div class="col-sm-2" style="padding-left: 20px;">
                                <%--          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_Date" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                --%>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 40px; margin-left: 60px">
                            <asp:Label ID="Lbl_ptime" runat="server" Style="padding-left: 62px" Font-Bold="true" Text=" Select Parking Times"></asp:Label>

                        </div>
                        <div style="margin-left: 30px">
                            <div class="form-group" style="margin-top: 20px; margin-bottom: 20px; height: 20px">
                                <div class="col-sm-7 control-label" style="text-align: right">
                                    <asp:CheckBox ID="Cb_mor" runat="server" />
                                    <asp:Label ID="Label2" runat="server" Style="padding-left: 0px; margin-right: 20px" Text="Morning (6:00AM to 2:00PM) 20 CAD"></asp:Label>
                                </div>
                                <div class="col-sm-5" style="padding-left: 0px;">
                                    <asp:Label ID="Lbl_mor" runat="server" Style="padding-left: 62px" Font-Bold="true" Visible="false" Text=""></asp:Label>
                                </div>
                            </div>

                            <div class="form-group" style="margin-top: 0px; height: 20px">
                                <div class="col-sm-7 control-label" style="text-align: right">
                                    <asp:CheckBox ID="Cb_aft" runat="server" />
                                    <asp:Label ID="Label4" runat="server" Style="padding-left: 0px; margin-right: 2px" Text="Afternoon (2:00PM to 10:00PM) 20 CAD"></asp:Label>
                                </div>
                                <div class="col-sm-5" style="padding-left: 0px;">
                                    <asp:Label ID="Lbl_aft" runat="server" Style="padding-left: 62px" Font-Bold="true" Visible="false" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group" style="">
                                <div class="col-sm-7 control-label" style="text-align: right; height: 20px">
                                    <asp:CheckBox ID="Cb_nig" runat="server" />
                                    <asp:Label ID="Label6" runat="server" Style="padding-left: 0px; margin-right: 30px" Text="Night (10:00PM to 6:00AM) 15 CAD"></asp:Label>
                                </div>
                                <div class="col-sm-5" style="padding-left: 0px;">
                                    <asp:Label ID="Lbl_nig" runat="server" Style="padding-left: 62px" Font-Bold="true" Visible="false" Text=""></asp:Label>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div style="margin-top: 5px;margin-left:100px">
                        <div class="form-horizontal">
                            <div class="form-group" style="height:15px">
                                <asp:Label ID="Label3" Style="padding-right: 10px" runat="server" class="col-sm-3 control-label" Text="Name:"></asp:Label>
                                <div class="col-sm-2" style="padding-left: 0px;">
                                    <asp:TextBox ID="Tb_name" class="form-control" runat="server" Width="110px"></asp:TextBox>
                                </div>
                                <div class="col-sm-5" style="padding-left: 30px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_name" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="form-group" style="height:15px">
                                <asp:Label ID="Label5" Style="padding-right: 10px" runat="server" class="col-sm-3 control-label" Text="Contact No:"></asp:Label>
                                <div class="col-sm-2" style="padding-left: 0px;">
                                    <asp:TextBox ID="Tb_cont_no" class="form-control" runat="server" Width="110px"></asp:TextBox>
                                </div>
                                <div class="col-sm-5" style="padding-left: 30px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Tb_cont_no" ErrorMessage="Enter contact number" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>

                            </div>
                            <div class="form-group" style="height:15px">
                                <asp:Label ID="Label7" Style="padding-right: 10px" runat="server" class="col-sm-3 control-label" Text="Email Address:"></asp:Label>
                                <div class="col-sm-2" style="padding-left: 0px;">
                                    <asp:TextBox ID="Tb_eml" class="form-control" runat="server" Width="110px"></asp:TextBox>
                                </div>
                                <div class="col-sm-5" style="padding-left: 30px;">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Tb_eml" ErrorMessage="Enter Email Address" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                             <div class="form-group" style="height:15px">
                                
                                <div class="col-sm-10" style="padding-left: 100px;">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="SERVER" ControlToValidate="Tb_eml" ErrorMessage="Enter a valid email address." ForeColor="Red" ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group" style="height:15px;margin-top:20px ">
                                <div class="col-sm-9">
                                    <asp:Label ID="Lbl_err" Style="padding-right: 10px" runat="server" Text=""></asp:Label>
                               
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button ID="Btn_book" class="btn btn-default" runat="server" OnClick="Btn_book_Click" Text="Book" Width="80px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

