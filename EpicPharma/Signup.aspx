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
                <div>
                    <p>Nome</p>
                    <asp:TextBox ID="Nome_Input" CssClass="input_area" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Bold="true" ForeColor="Red"
                        ErrorMessage="Nome non valido" ControlToValidate="Nome_Input"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div>
                <div>
                    <p>Cognome</p>
                    <asp:TextBox ID="Cognome_Input" CssClass="input_area" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Bold="true" ForeColor="Red"
                        ErrorMessage="Cognome non valido" ControlToValidate="Cognome_Input"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="div_registrazione">
            <div>
                <div>
                    <p>Username</p>
                    <asp:TextBox ID="Username_Input" CssClass="input_area" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Bold="true" ForeColor="Red"
                        ErrorMessage="Username non valido" ControlToValidate="Username_Input"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div>
                <div>
                    <p>Email</p>
                    <asp:TextBox ID="Email_Input" CssClass="input_area" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Font-Bold="true" ForeColor="Red"
                        ErrorMessage="Email non valida" ControlToValidate="Email_Input"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="div_registrazione">
            <div>
                <div>
                    <p>Password</p>
                    <asp:TextBox ID="Password_Input" CssClass="input_area" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Font-Bold="true" ForeColor="Red"
                        ErrorMessage="Password non valida" ControlToValidate="Password_Input"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div>
                <div>
                    <p>Conferma password</p>
                    <asp:TextBox ID="Conferma_Password_Input" CssClass="input_area" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Font-Bold="true" ForeColor="Red"
                        ErrorMessage="La password non corrisponde" ControlToCompare="Password_Input" ControlToValidate="Conferma_Password_Input"></asp:CompareValidator>
                </div>
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
            <div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Font-Bold="true" ForeColor="Red"
                    ErrorMessage="Codice admin non valido" ControlToValidate="Admin_Input"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="REGISTRATI" />
        </div>
    </div>
</asp:Content>
