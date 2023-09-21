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
                <asp:Repeater ID="CartRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="item-photo">
                                        <img src='<%# Eval("Immagine") %>' alt="Immagine">
                                        <div class="item-name"><%# Eval("Nome") %></div>
                                    </div>
                                </td>
                                <td><%# Eval("Prezzo","{0:C}") %></td>
                                <td>
                                    <div class="quantity-controls">
                                        <div class="quantity-button">+</div>
                                        <div class="quantity-square m-0">
                                            <div class="quantity-value"><%# Eval("Quantity") %></div>
                                        </div>
                                        <div class="quantity-button">-</div>
                                    </div>
                                </td>
                                <td><%# Eval("Subtotal", "{0:C}") %></td>
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
