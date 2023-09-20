<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EpicPharma.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="d-flex justify-content-center mt-5 " >
      <div class="card" style="width: 18rem" >
          <asp:Image ID="Podotto" runat="server"  />
          <div class="card-body" >
              <h3 id="Tittle" class="card-tittle" runat="server" >Nome </h3>
              <p id="Descri" class="card-text" runat="server" >Descrizione</p>
              <p id="Scadenza" class="card-text" runat="server" >Scadenza</p>
              <p id="Prezzo" class="card-text" runat="server" >Prezzo</p>


              <div>
                  <%--<asp:Button ID="modifcabtn" runat="server" Text="Modifica" OnClick="modifcabtn_Click" />
                  <asp:Button ID="eliminatbn" runat="server" Text="Elimina" OnClick="eliminatbn_Click" />--%>
              </div>

          </div>
      </div>
  </div>




</asp:Content>
