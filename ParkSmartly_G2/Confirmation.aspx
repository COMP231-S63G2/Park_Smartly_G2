<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="t1" style="height: 550px; width: 800px; float: left; margin-left: 10px; margin-top: 10px;">









        <div class="form-group" style="margin-top: 10px; margin-left: 130px">

                                <div class="col-sm-12" style="padding-left: 200px; margin-top: 20px;">
                                    <asp:Button ID="Btn_Payment" class="btn btn-default" runat="server" Text="Confirm & Make Payment" OnClick="Btn_Payment_Click" Width="180px" />
                                </div>
                            </div>
    </div>
</asp:Content>

