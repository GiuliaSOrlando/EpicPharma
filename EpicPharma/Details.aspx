<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EpicPharma.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenitore_dettagli_top">
        <div>
         <asp:Image ID="Image1" runat="server" CssClass="main_img"/>
        </div>
        <div>
            <h1 id="nomeProdotto" runat="server">Titolo del prodotto</h1>
            <hr />
            <div>
                <div>
                    <p>Prezzo Epicpharm</p>
                    <p id="Prezzo" runat="server">€ 16,80</p>
                </div>
                <div>
                    <div class="div_qta">
                        <span>QTÀ</span>
                        <asp:Button ID="Button2" runat="server" Text="+" CssClass="btn_qta" />
                        <span id="quantita" runat="server">1</span>
                        <asp:Button ID="Button3" runat="server" Text="-" CssClass="btn_qta" />
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="AGGIUNGI AL CARRELLO" CssClass="myButton" OnClick="Button1_Click" />
                </div>
                <hr />
                <div class="d-flex justify-content-between">
                    <span>Disponibilita:</span>
                    <span id="disponibile" runat="server" class="text-success">Disponibile</span>
                    <span id="non_disponibile" runat="server" class="text-danger">Non disponibile al momento</span>
                </div>
                <hr />
            </div>
            <div id="preferiti">
                <i class="bi bi-star me-3"></i>
                <span>AGGIUNGI ALLA TUA WISHLIST</span>
            </div>
        </div>
    </div>
    <hr />
    <div id="cotenitore_dettagli_bottom">
        <h2>Descrizione prodotto</h2>
        <p id="descrizione" runat="server">Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <h4>Casa farmaceutica</h4>
        <p id="Brand" runat="server"></p>
        <h4>Modalita d'uso</h4>
        <p id="Modalita" runat="server"></p>
        <h4>Composizione</h4>
        <p id="Composizione" runat="server"></p>
        <h4>Data di scadenza</h4>
        <p id="DataScadenza" runat="server"></p>
    </div>
</asp:Content>