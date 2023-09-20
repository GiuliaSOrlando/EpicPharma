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
                    <!-- Primo oggetto -->
                    <tr>
                        <td>
                            <div class="item-photo">
                                <img src="https://www.efarma.com/media/catalog/product/0/3/035618026.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=466&width=466&canvas=466:466" alt="Immagine">
                                <div class="item-name">Moment Act</div>
                            </div>
                        </td>
                        <td>10.00 €</td>
                        <td>
                            <div class="quantity-controls">
                                <div class="quantity-button">+</div>
                                <div class="quantity-square m-0">
                                    <div class="quantity-value">2</div>
                                </div>
                                <div class="quantity-button">-</div>
                            </div>
                        </td>
                        <td>10.00 €</td>
                        <td><i class="bi bi-trash"></i></td>
                    </tr>
                    <!-- Secondo oggetto -->
                    <tr>
                        <td>
                            <div class="item-photo">
                                <img src="https://www.farmainforma.net/4157-thickbox_default/Tachifludec-Gusto-Limone-e-Miele.jpg" alt="Immagine">
                                <div class="item-name">Tachifludec</div>
                            </div>
                        </td>
                        <td>20.00 €</td>
                        <td>
                            <div class="quantity-controls">
                                <div class="quantity-button">+</div>
                                <div class="quantity-square m-0">
                                    <div class="quantity-value">1</div>
                                </div>
                                <div class="quantity-button">-</div>
                            </div>
                        </td>
                        <td>20.00 €</td>
                        <td><i class="bi bi-trash"></i></td>
                    </tr>
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
