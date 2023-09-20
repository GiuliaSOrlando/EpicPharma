<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EpicPharma.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div>
   <h2 id="nomeProdotto" runat="server" class=" m-0 text-center  fs-1 "></h2>
      <asp:Image ID="Image1" runat="server"  CssClass="img-dettaglio" />
   <p id="descrizione" class="  ms-2  text-center" runat="server"> </p>
       <p id="InStock" class="  ms-2  text-center" runat="server"> </p>

    </div>
    <asp:Button ID="Button1" runat="server" Text="Button"   OnClick="Button1_Click"/>
</asp:Content>
