<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="EpicPharma.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenitore_wishlist">
        <div class="mb-5">
            <h1>Lista dei desideri</h1>
        </div>

        <div>
            <asp:GridView ID="GridView1" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="false" runat="server" ItemType="EpicPharma.ListaPrototipo">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <p><strong>Immagine</strong></p>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <img runat="server" class="img_wishlist" src="<%#Item.IMGprodotto %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <p><strong>Nome prodotto</strong></p>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <p><%#Item.NomeProdotto %></p>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <p><strong>Descrizione prodotto</strong></p>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <p><%#Item.DescrizionePrdotto %></p>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <p><strong>Prezzo</strong></p>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <p><%#Item.PrezzoProdotto %> €</p>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <p><strong>Aggiungi al carrello</strong></p>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="AGGIUNGI" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>