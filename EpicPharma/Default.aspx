<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EpicPharma.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                <div id="carousel" class="d-flex justify-content-center w-100">
                    <div id="myCarousel" class="carousel slide mb-6 w-100" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
                            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
                        </div>
                        <div class="carousel-inner" >
                            <div class="carousel-item">

                                <img src="Content/img/Vetoquinol1.jpg" class="bd-placeholder-img" width="100%"  xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveaspectratio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></img>

                            </div>
                            <div class="carousel-item active">

                                <img src="Content/img/Aboca.jpg" class="bd-placeholder-img" width="100%"  xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveaspectratio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></img>

                            </div>
                            <div class="carousel-item">

                                <img src="Content/img/Multicentrum.jpg" class="bd-placeholder-img" width="100%"  xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveaspectratio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></img>

                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>

        
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

            <div class="collapse navbar-collapse  d-flex justify-content-center" id="navbarNav">
                <ul class="navbar-nav py-3">
                    <li class="nav-item mx-5">
                        <asp:LinkButton ID="Alimentazione" runat="server" CssClass="nav-link text-light text-uppercase fs-5" OnClick="Alimentazione_Click">Alimentazione</asp:LinkButton>
                    </li>
                    <li class="nav-item mx-5">
                        <asp:LinkButton ID="Automedicazione" runat="server" CssClass="nav-link text-light text-uppercase fs-5" OnClick="Automedicazione_Click">Automedicazione</asp:LinkButton>
                    </li>
                    <li class="nav-item mx-5">
                        <asp:LinkButton ID="Integratori" runat="server" CssClass="nav-link text-light text-uppercase fs-5" OnClick="Integratori_Click">Integratori</asp:LinkButton>
                    </li>
                    <li class="nav-item mx-5">
                        <asp:LinkButton ID="PresidiMedici" runat="server" CssClass="nav-link text-light text-uppercase fs-5" OnClick="PresidiMedici_Click">Presidi Medici</asp:LinkButton>
                    </li>
                    <li class="nav-item mx-5">
                        <asp:LinkButton ID="PrimaInfanzia" runat="server" CssClass="nav-link text-light text-uppercase fs-5" OnClick="PrimaInfanzia_Click">Prima Infanzia</asp:LinkButton>
                    </li>
                    <li class="nav-item mx-5">
                        <asp:LinkButton ID="PersonalCare" runat="server" CssClass="nav-link text-light text-uppercase fs-5" OnClick="PersonalCare_Click">Personal Care</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>
    
    
    <div class="row row-cols-1 row-cols-md3 g-4 pt-5" >


    <%-- INIZIO CARD--%>

    <div class="container py-3">
        <h2 class="text-center">Prodotto del momento</h2>
        <div class="row row-cols-1 row-cols-md3 g-4 py-5">

            <asp:Repeater ID="ProductRepeater" runat="server" ItemType="EpicPharma.Prodotto">
                <ItemTemplate>
                    <div class="col col-sm-6 col-md-4 col-lg-3 ">
                        <div class="card mx-1">

                            <img class="imgC" src="Content/img/<%#Item.Immagine %>" class="card-img-top" alt="...">

                            <div class="card-body text-center">
                                
                                <h5 class="tittleP">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Details.aspx?id=" + Item.ID%>'>
                                        <asp:Label ID="ProductTitle" runat="server" Text="<%#Item.Nome %>"></asp:Label>
                                    </asp:HyperLink>
                                </h5>

                                <asp:Label ID="ProductPrice" runat="server" CssClass="my-3 fw-bold" Text='<%# Item.Prezzo.ToString("C2") %>'></asp:Label>

                                <asp:Button runat="server" ID="AddToChart_Button" CssClass="myButton" Text="Aggiungi al carrello" OnClick="AddToChart_Button_OnClick"
                                    CommandArgument="<%#Item.ID %>" />
                                <asp:HyperLink ID="RedirectToDetails" runat="server" Text="Dettagli" NavigateUrl='<%# "Details.aspx?id=" + Item.ID%>' CssClass="myButton"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>




            </asp:Repeater>


        </div>
    </div>

        </div>

</asp:Content>


        
       