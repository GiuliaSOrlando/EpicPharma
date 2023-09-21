<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DBManagment.aspx.cs" Inherits="EpicPharma.DBManagment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenitore_admin">
        <div>
            <h1>Aggiungi un nuovo prodotto</h1>
            <p>Inserisci tutti i dati necessari qui di seguito</p>
            <hr />
        </div>
    <div id="contenitore_input_prodotti">

        <div>
            <div>
                <p>Nome</p>
                <asp:TextBox ID="Nome_Input" CssClass="input_area" runat="server" placeholder="Inserisci nome "></asp:TextBox>
            </div>
            <div>
                <p>Prezzo</p>
                <asp:TextBox ID="Prezzo_Input" CssClass="input_area" runat="server" TextMode="Number" placeholder="Inserisci prezzo "></asp:TextBox>
            </div>
            <div>
                <p>Descrizione</p>
                <asp:TextBox ID="Descrizione_Input" CssClass="input_area" runat="server" placeholder="Inserisci descrizione "></asp:TextBox>
            </div>
            <div>
                <p>Categoria</p>
                <asp:TextBox ID="Categoria_Input" CssClass="input_area" runat="server" placeholder="Inserisci categoria "></asp:TextBox>
            </div>

        </div>
        <div>
            <div>
                <p>Modalita d'uso</p>
                <asp:TextBox ID="Modalita_Input" CssClass="input_area" runat="server" placeholder="Inserisci modalita d'uso "></asp:TextBox>
            </div>
            <div>
                <p>Composizione</p>
                <asp:TextBox ID="Composizione_Input" CssClass="input_area" runat="server" placeholder="Inserisci composizione"></asp:TextBox>
            </div>
                        <div>
                <p>Casa produttrice</p>
                <asp:TextBox ID="Brand_Input" CssClass="input_area" runat="server" placeholder="Inserisci brand prodotto"></asp:TextBox>
            </div>
            <div>
                <p>Gruppo merciologico</p>
                <asp:TextBox ID="GruppoMerciologico_Input" CssClass="input_area" runat="server" placeholder="Inserisci nome prodotto"></asp:TextBox>
            </div>

        </div>
        <div class="div_input_admin">
            <div class="input-group mb-3">
                <label class="input-group-text" for="Immagine_Input">Carica IMG</label>
   
                    <asp:FileUpload ID="Immagine_Input"  class="form-control" runat="server" />
            </div>
            <div class="form-group">
                <label class="active" for="dateStandard">
                    <p>Data di scadenza</p>
                    <asp:TextBox TextMode="Date" ID="DataScadenza_Input" name="dateStandard" runat="server"></asp:TextBox>
                </label>
                
            </div>
            <div class="mt-5">
                <label class="control control-checkbox"> Presente in magazzino
                    <asp:CheckBox ID="InStock_Input" runat="server" />
                    <div class="control_indicator"></div>
                </label>
            </div>
        </div>
    </div>
    <asp:Button ID="AddToDB_Button" CssClass="myButton mx-3" runat="server" Text="AGGIUNGI PRODOTTO" OnClick="AddToDB_Button_OnClick" />
    </div>
</asp:Content>
