<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EpicPharma.carello" %>
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
                                           <img class="imgC card-img-top" src="Content/img/<%#Item.Immagine %>" alt="Immagine">
                                        <div runat="server" class="item-name"><%# Item.Nome%></div>
                                    </div>
                                </td>
                                <td runat="server"><%# Item.Prezzo.ToString("C2") %></td>
                                <td>
                                    <div class="quantity-controls">
                                       <asp:Button ID="btnAumenta" runat="server" Text="+" CssClass="btn_qta" OnClick="btnAumenta_Click" CommandArgument="<%# Item.ID %>"/>
                                        <div class="quantity-square m-0">
                                            <div class="quantity-value"> <%# Item.Quantity %> </div>
                                        </div>
                                       <asp:Button ID="Button2" runat="server" Text="-" CssClass="btn_qta" OnClick="btnDiminuisci_Click" CommandArgument="<%# Item.ID %>"/>
                                    </div>
                                </td>
                                <td><%# Item.Costotot.ToString("C2") %></td>
                             
                                    <i class="bi bi-trash"></i></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

       <!-- Riepilogo -->
        <!-- Riepilogo -->
<div class='riepilogo-container'>
    <h2>Riepilogo</h2>
    <hr>
    <asp:Button runat="server" ID="toggleCollapseButton" Text="Spese di spedizione ▼ "  OnClick="toggleCollapseButton_Click" />
    <asp:Label runat="server" ID="collapseLink"></asp:Label>
    <asp:Panel runat="server" ID="collapseContentPanel">
        <div class="vertical-column">
            <!-- Contenuto da nascondere/espandere -->
            <div class="dropdown-container">
                <p>Scegli la nazione</p>
                <select id="custom-dropdown" class="dropdown-content">
                    <option value="" disabled selected>Nazione</option>
                    <option value="italy">Italia</option>
                </select>
            </div>
            <div class="dropdown-container">
                <p>Scegli la regione</p>
                <select id="region-dropdown" class="dropdown-content">
                    <option value="" disabled selected>Seleziona Regione...</option>
                    <option value="abruzzo">Abruzzo</option>
                    <option value="basilicata">Basilicata</option>
                    <option value="calabria">Calabria</option>
                    <option value="campania">Campania</option>
                    <option value="emilia-romagna">Emilia-Romagna</option>
                    <option value="friuli-venezia-giulia">Friuli-Venezia Giulia</option>
                    <option value="lazio">Lazio</option>
                    <option value="liguria">Liguria</option>
                    <option value="lombardy">Lombardia</option>
                    <option value="marche">Marche</option>
                    <option value="molise">Molise</option>
                    <option value="piedmont">Piemonte</option>
                    <option value="apulia">Puglia</option>
                    <option value="sardinia">Sardegna</option>
                    <option value="sicily">Sicilia</option>
                    <option value="trentino-alto-adige">Trentino-Alto Adige</option>
                    <option value="tuscany">Toscana</option>
                    <option value="umbria">Umbria</option>
                    <option value="valle-daosta">Valle d'Aosta</option>
                    <option value="veneto">Veneto</option>
                </select>
            </div>
            <div class="dropdown-container">
                <p>Scegli la città</p>
                <select id="city-dropdown" class="dropdown-content">
                    <option value="" disabled selected>Seleziona Città...</option>
                    <option value="rome">Roma</option>
                    <option value="milan">Milano</option>
                    <option value="venice">Venezia</option>
                    <option value="florence">Firenze</option>
                    <option value="naples">Napoli</option>
                    <option value="turin">Torino</option>
                    <option value="genoa">Genova</option>
                    <option value="bologna">Bologna</option>
                    <option value="palermo">Palermo</option>
                    <option value="catania">Catania</option>
                    <option value="brescia">Brescia</option>
                    <option value="padua">Padova</option>
                    <option value="venice">Venezia</option>
                    <option value="verona">Verona</option>
                    <option value="florence">Firenze</option>
                    <option value="bari">Bari</option>
                    <option value="turin">Torino</option>
                    <option value="genoa">Genova</option>
                </select>
            </div>
            <div class="dropdown-container">
                <p>Inserisci il CAP</p>
                <input type="text" id="zip" class="dropdown-content" placeholder="Inserisci il CAP">
            </div>
        </div>
    </asp:Panel>
    <hr>
    <div class="subtotale">
        <span>Subtotale</span>
        <span id="tot" runat="server"></span>
    </div>
    <hr>
    <div class="spese-gestione">
        <span>Costi di spedizione</span>
        <span>5.00€</span>
    </div>
    <hr>
    <div class="totale">
        <strong>Totale ordine</strong>
        <span id="totsped" runat="server"></span>
    </div>
    <hr>
    <button class="myButton">PROCEDI AL PAGAMENTO</button>
    <hr>
    <p>Applica codice sconto</p>
    <input type="text" class="dropdown-content" placeholder="Inserisci il codice sconto">
    <hr>
    <button class="myButton">APPLICA SCONTO</button>
</div>
</div>
</asp:Content>