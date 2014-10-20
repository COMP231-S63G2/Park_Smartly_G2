<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link href="styles/slider.css" rel="stylesheet" />
    <script src="styles/thumbnail-slider.js"></script>
    <div style="height: 500px; background-color: #cec7d3">
        <div style="margin-left:30px;padding-top:10px">
            <h1 style="color:#6e4c8e">Park smartly</h1>
            <p style="color:#7c5d8a">
                ParkSmartly is a complete solution for todays parking problems.
            Its solutions saves drivers time.It provides online parking space
            booking and extend parking time limit facilities.
            </p>
        </div>
        <div class="div2" style="float: left; width: 720px; margin-top: 10px; margin-left: 30px;">
            <div id="mcts1" style="width: 700px; height: 300px; float: left;">
                <img src="Images/1.png" style="height: 250px; width: 650px" />
                <img src="Images/2.png" style="height: 250px; width: 670px" />
                <img src="Images/3.jpg" style="height: 250px; width: 660px" />

            </div>
        </div>


    </div>
</asp:Content>

