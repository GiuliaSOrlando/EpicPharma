<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vetrina.aspx.cs" Inherits="EpicPharma.Chart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>ciao</p>
    <asp:GridView ID="ProductGridView" runat="server"  AutoGenerateColumns="false" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="Nome" HeaderText="Nome" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" />
            <asp:BoundField DataField="Prezzo" HeaderText="Prezzo" DataFormatString="{0:C}" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="AddToChart_Button" runat="server" Text="Aggiungi al carrello" OnClick="AddToChart_Button_OnClick" />

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

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

