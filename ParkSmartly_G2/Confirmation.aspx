﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 800px; float: left; margin-left: 10px; margin-top: 10px;">
        <div style="height: 25px; width: 312px; margin-left:270px";><h2>Confirmation</h2></div>
        <div style="height: 40px; width: 500px; margin-top: 20px; margin-left: 100px">
            <div style="height: 20px; float: left; width: 500px; text-align: center">
                <asp:Label ID="lbl_1" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div style="height: 20px; float: left; width: 500px; text-align: center">
                <asp:Label ID="Lbl_2" runat="server" Text="" Visible="false"></asp:Label>
        </div>

        </div>
        <div style="height: 20px; width: 300px; margin-top: 10px">
            <div style="height: 20px; float: left; width: 300px; margin-left: 150px; text-align: right">
                <asp:Button ID="Btn_dn" class="btn btn-default" runat="server" Text="Done" Visible="false" OnClick="Btn_dn_Click" Width="180px" />

            </div>
        </div>
        <div style="height: 120px; width: 300px; margin-bottom: 30px; margin-top: 10px; margin-left: 150px">
            <div style="height: 20px; width: 300px; margin-top: 10px">
                <div style="height: 20px; float: left; width: 150px; text-align: right">
                    <asp:Label ID="Label2" runat="server" Text="Date:"></asp:Label>

                </div>
                <div style="height: 20px; width: 150px; padding-left: 5px; margin-left: 150px; text-align: left">
                    <asp:Label ID="Lbl_date" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
            </div>
            <div style="height: 20px; width: 300px; margin-top: 10px">
                <div style="height: 20px; float: left; width: 150px; text-align: right">
                    <asp:Label ID="Label7" runat="server" Text="Name:"></asp:Label>

                </div>
                <div style="height: 20px; width: 150px; padding-left: 5px; margin-left: 150px; text-align: left">
                    <asp:Label ID="lbl_name" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
            </div>
            <div style="height: 20px; width: 300px; margin-top: 10px">
                <div style="height: 20px; float: left; width: 150px; text-align: right">
                    <asp:Label ID="Label5" runat="server" Text="Contact No:"></asp:Label>

                </div>
                <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                    <asp:Label ID="Lbl_co_name" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
            </div>
            <div style="height: 20px; width: 300px; margin-top: 10px">
                <div style="height: 20px; float: left; width: 150px; text-align: right">
                    <asp:Label ID="Label9" runat="server" Text="Email Address:"></asp:Label>

                </div>
                <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                    <asp:Label ID="Lbl_emai" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
            </div>
            <div style="height: 20px; width: 300px; margin-top: 10px">
                <div style="height: 20px; float: left; width: 150px; text-align: right">
                    <asp:Label ID="Label11" runat="server" Text="Parking Time:"></asp:Label>

                </div>
                <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                    <asp:Label ID="Lbl_par_time" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
            </div>
            <div style="height: 20px; width: 300px; margin-top: 10px">
                <div style="height: 20px; float: left; width: 150px; text-align: right">
                    <asp:Label ID="Label1" runat="server" Text="Amount:"></asp:Label>

                </div>
                <div style="height: 20px; width: 150px; margin-left: 150px; padding-left: 5px; text-align: left">
                    <asp:Label ID="Lbl_amt" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
            </div>
        </div>

        <div class="form-group" style="margin-top: 10px; margin-left: 130px">

            <div class="col-sm-12" style="padding-left: 200px; margin-top: 20px;">
                <asp:Button ID="Btn_confirm" class="btn btn-default" runat="server" Text="Confirm" OnClick="Btn_confirm_Click" Width="180px" />
            </div>
        </div>
    </div>
</asp:Content>

