﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="accedi.aspx.cs" Inherits="EpicPharma.accedi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenitore_login">
        <div id="accedi">
            <div>
                <h1>È un piacere rivederti</h1>
                <p>Informazioni di accesso</p>
            </div>
            <div class="mt-4">
                <p>La tua email</p>
                <asp:TextBox ID="email" CssClass="input_area" runat="server" TextMode="Email" placeholder="La tua email"></asp:TextBox>
            </div>
            <div>
                <p>La tua password</p>
                <asp:TextBox ID="password"  CssClass="input_area" runat="server" TextMode="Password" placeholder="La tua password"></asp:TextBox>
            </div>
            <asp:Button ID="Button_Accedi" CssClass="myButton" runat="server" Text="ACCEDI" OnClick="Button_Accedi_Click"/>
        </div>

        <div id="divisorio"></div>

        <div id="registrati">
            <h1>Nuovo Cliente</h1>
            <p>Non sei ancora registrato?</p>
            <p>Ti ricordiamo che la registrazione è semplice e gratuita.</p>
            <h3 class="mt-4">VANTAGGI PER GLI UTENTI DI EPICPHARMA</h3>
            <p>- Checkout veloce</p>
            <p>- Salvare indirizzi di spedizione multipli</p>
            <p>- Vedere e tracciare i tuoi ordini e altro ancora</p>
            <a href="Signup.aspx" class="myButton">REGISTRATI</a>
        </div>
    </div>
</asp:Content>
