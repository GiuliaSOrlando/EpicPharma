<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="EpicPharma.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenitore_registrati">
        <div class=" text-start mb-4">
            <h1>Crea un nuovo account</h1>
            <p>Inserisci informazioni personali</p>
        </div>
        <div class="div_registrazione">
            <div>
                <p>Nome</p>
                <asp:TextBox ID="Nome_Input" CssClass="input_area" runat="server"></asp:TextBox>
            </div>
            <div>
                <p>Cognome</p>
                <asp:TextBox ID="Cognome_Input" CssClass="input_area" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="div_registrazione">
            <div>
                <p>Username</p>
                <asp:TextBox ID="Username_Input" CssClass="input_area" runat="server"></asp:TextBox>
            </div>
            <div>
                <p>Email</p>
                <asp:TextBox ID="Email_Input" CssClass="input_area" runat="server" TextMode="Email"></asp:TextBox>
            </div>
        </div>
        <div class="div_registrazione">
            <div>
                <p>Password</p>
                <asp:TextBox ID="Password_Input" CssClass="input_area" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <p>Conferma password</p>
                <asp:TextBox ID="Conferma_Password_Input" CssClass="input_area" runat="server" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div>
            <label class="control control-checkbox">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Registrati come amministratore" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                <div class="control_indicator"></div>
            </label>
            <div id="admin_box" runat="server">
                <asp:TextBox ID="Admin_Input" CssClass="input_area" runat="server" placeholder="Inserisci codice di autentificazione"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="REGISTRATI" />
        </div>
    </div>
</asp:Content>