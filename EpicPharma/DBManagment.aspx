<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DBManagment.aspx.cs" Inherits="EpicPharma.DBManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Nome" Text="Nome" runat="server"></asp:Label>
    <asp:TextBox ID="Nome_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Prezzo" Text="Prezzo" runat="server"></asp:Label>
    <asp:TextBox ID="Prezzo_Input" runat="server" TextMode="Number"></asp:TextBox>
    <asp:Label ID="Descrizione" Text="Descrizione" runat="server"></asp:Label>
    <asp:TextBox ID="Descrizione_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Categoria" Text="Categoria" runat="server"></asp:Label>
    <asp:TextBox ID="Categoria_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Brand" Text="Brand" runat="server"></asp:Label>
    <asp:TextBox ID="Brand_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Modalita" Text="Modalità" runat="server"></asp:Label>
    <asp:TextBox ID="Modalita_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Composizione" Text="Composizione" runat="server"></asp:Label>
    <asp:TextBox ID="Composizione_Input" runat="server"></asp:TextBox>
    <asp:Label ID="Immagine" Text="Immagine" runat="server"></asp:Label>
    <asp:FileUpload ID="Immagine_Input" runat="server" />
    <asp:Label ID="DataScadenza" Text="Data Scadenza" runat="server"></asp:Label>
    <asp:TextBox ID="DataScadenza_Input" runat="server" TextMode="Date"></asp:TextBox>
    <asp:Label ID="InStock" Text="In stock" runat="server"></asp:Label>
    <asp:CheckBox ID="InStock_Input" runat="server"/>
    <asp:Label ID="GruppoMerciologico" Text="Gruppo merciologico" runat="server"></asp:Label>
    <asp:TextBox ID="GruppoMerciologico_Input" runat="server"></asp:TextBox>
    <asp:Button ID="AddToDB_Button" runat="server" Text="Aggiungi" OnClick="AddToDB_Button_OnClick" />

</asp:Content>
