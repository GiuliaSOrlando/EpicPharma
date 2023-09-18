<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrello.aspx.cs" Inherits="EpicPharma.Carrello" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
    <!--Container Carrello-->
    <div class="container">
        <h1 class="carrello-title">CARRELLO</h1>
        <div class="line"></div>
        <!--Indice/Header-->
        <div class="item item-header">
            <div class="item-name">Oggetto</div>
            <div class="item-price">Prezzo</div>
            <div class="item-quantity">Quantità</div>
            <div class="item-subtotal">Subtotale</div>
        </div>
        <div class="line"></div>
        <!--Primo oggetto-->
        <div class="item">
            <div class="item-photo"></div>
            <div class="item-name">Nome Oggetto</div>
            <div class="item-price">10.00 €</div>
            <div class="item-quantity">
                <div class="quantity-controls">
                    <div class="quantity-button">+</div>
                    <div class="quantity-value">2</div>
                    <div class="quantity-button">-</div>
                </div>
            </div>
            <div class="item-subtotal">10.00 €</div>
        </div>
    <div class="line"></div>
    <!--Secondo oggetto-->
    <div class="item">
        <div class="item-photo"></div>
        <div class="item-name">Nome Oggetto</div>
        <div class="item-price">20.00 €</div>
        <div class="item-quantity">
            <div class="quantity-controls">
                <div class="quantity-button">+</div>
                <div class="quantity-value">1</div>
                <div class="quantity-button">-</div>
            </div>
        </div>
        <div class="item-subtotal">20.00 €</div>
    </div>
    <div class="line"></div>
</asp:Content>
