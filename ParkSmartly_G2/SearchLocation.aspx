<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchLocation.aspx.cs" Inherits="SearchLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 800px; opacity: 0.9; float: left; margin-left: 10px; margin-top: 10px; margin-bottom: 0px">

        <div style="width: 700px; height: 500px; margin-left: 20PX; margin-top: 10px;">
            <div class="panel panel-default" style="width: 300px; height: 200px; margin-left: 20px; float: left">
                <div class="panel-heading">
                    <h3 class="panel-title-wht">Find Your Car Location</h3>
                </div>
                <div class="panel-body" style="margin-left: 15px">
                    <div style="margin-left: 50px">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="SERVER" ControlToValidate="Tb_noPlt" ErrorMessage="Licence Number Invalid" ForeColor="Red" ValidationExpression="^[A-Z]{4}?[0-9]{3}$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Lbl_plt" Style="padding-left: 0px" runat="server" class="col-sm-5 control-label" Text="License Plate:"></asp:Label>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:TextBox ID="Tb_noPlt" class="form-control" runat="server" Width="110px"></asp:TextBox>
                        </div>
                        <div class="col-sm-2" style="padding-left: 20px;">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 30px;">
                        <asp:Label ID="Label2" runat="server" Style="padding-left: 10px" class="col-sm-5 control-label" Text="Ticket Id:"></asp:Label>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:TextBox ID="Tb_id" class="form-control" runat="server" Width="110px"></asp:TextBox>
                        </div>
                        <div class="col-sm-2" style="padding-left: 20px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tb_id" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 60px;">
                        <div class="col-sm-5 control-label">
                        </div>
                        <div class="col-sm-4" style="padding-left: 0px;">
                            <asp:Button ID="Btn_search" class="btn btn-default" runat="server" OnClick="Btn_search_Click" Text="Search" Width="110px" />
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 110px;">
                        <div class="col-sm-12 control-label">
                            <asp:Label ID="Lbl_err_msg" runat="server" Style="padding-left: 30px" ForeColor="#CC0000" Text=""></asp:Label>

                        </div>
                    </div>
                </div>
            </div>
            <div  style="margin-left: 390px;margin-top:20px; border: 1px groove #CC99FF; height: 380px; width: 320px;">

                <div class="form-group" style="margin-top: 230px">
                    <div style="padding-left: 50px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="lbl_msg" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div style="padding-left: 50px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="lbl_floor" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div style="padding-left: 50px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="lbl_space" runat="server" Text="" Visible="false"></asp:Label>

                    </div>
                    <div style="padding-left: 50px; margin-top: 5px; height: 25px; width: 280px; text-align: center">
                        <asp:Label ID="Lbl_remnder" runat="server" Text="" Visible="false"></asp:Label>

                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

