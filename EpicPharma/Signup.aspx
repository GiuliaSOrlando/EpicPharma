<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="EpicPharma.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Nome" Text="Nome" runat="server"></asp:Label>
    <asp:TextBox ID="Nome_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Cognome" Text="Cognome" runat="server"></asp:Label>
    <asp:TextBox ID="Cognome_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Username" Text="Username" runat="server"></asp:Label>
    <asp:TextBox ID="Username_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Email" Text="Email" runat="server"></asp:Label>
    <asp:TextBox ID="Email_Input" TextMode="Email" runat="server"></asp:TextBox>
    <asp:Label ID="Password" Text="Password" runat="server"></asp:Label>
    <asp:TextBox ID="Password_Input" TextMode="Password" runat="server"></asp:TextBox>
    <asp:Label ID="ConfirmPassword" Text="Conferma password" runat="server"></asp:Label>
    <asp:TextBox ID="ConfirmPassword_Input" TextMode="Password" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="ConfirmPassword_Input" ControlToCompare="Password_Input" runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator>
    <asp:Label ID="Admin" Text="Admin" runat="server"></asp:Label>
    <asp:TextBox ID="Admin_Input" runat="server"></asp:TextBox>
    <asp:Button ID="SignUp_Button" runat="server" Text="Invia" OnClick="SignUp_Button_OnClick" />
</asp:Content>
