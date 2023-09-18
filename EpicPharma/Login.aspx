<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EpicPharma.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Username" Text="Username" runat="server"></asp:Label>
<asp:TextBox ID="Username_Input" runat="server"></asp:TextBox>
<asp:Label ID="Password" Text="Password" runat="server"></asp:Label>
<asp:TextBox ID="Password_Input" runat="server" TextMode="Password"></asp:TextBox>
    <asp:Button ID="Login_Button" Text="Entra" runat="server"  OnClick="Login_Button_OnClick"/>
</asp:Content>
