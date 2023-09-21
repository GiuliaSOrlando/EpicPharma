<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="carello.aspx.cs" Inherits="EpicPharma.carello" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="carrello">
        <div class="container-carrello">
            <h1 class="carrello-title">Il tuo carrello:</h1>
            <div class="line"></div>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Oggetto</th>
                        <th>Prezzo</th>
                        <th>Quantità</th>
                        <th>Subtotale</th>
                        <th>Elimina</th>
                    </tr>
                </thead>
                <tbody>
                <asp:Repeater ID="CartRepeater" runat="server" ItemType="EpicPharma.Prodotto">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="item-photo">
                                        <img id="immagineProdotto" runat="server" src="Content/img/<%# Item.Immagine %>" alt="Immagine">
                                        <div runat="server" class="item-name"><%# Item.Nome%></div>
                                    </div>
                                </td>
                                <td runat="server"><%# Item.Prezzo %></td>
                                <td>
                                    <div class="quantity-controls">
                                        <div class="quantity-button">+</div>
                                        <div class="quantity-square m-0">
                                            <div class="quantity-value"></div>
                                        </div>
                                        <div class="quantity-button">-</div>
                                    </div>
                                </td>
                                <td></td>
                                <td><i class="bi bi-trash"></i></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

        <!-- Riepilogo -->
        <div class="riepilogo-container">
            <h2>Riepilogo</h2>
            <hr>
            <p><strong>Stima spese di gestione e tasse <i class="bi bi-caret-down-fill"></i></strong></p>
            <hr>
            <div class="subtotale">
                <span>Subtotale</span>
                <span>30.00€</span>
            </div>
            <hr>
            <div class="spese-gestione">
                <span>Costi di spedizione</span>
                <span>1.00€</span>
            </div>
            <hr>
            <div class="totale">
                <strong>Totale ordine</strong>
                <span>31.00€</span>
            </div>
            <hr>
            <button class="myButton">PROCEDI AL PAGAMENTO</button>
            <hr>
            <p>Applica codice sconto</p>
            <input type="text" class="codice-sconto">
            <hr>
            <button class="myButton">APPLICA SCONTO</button>
        </div>
    </div>
</asp:Content>
