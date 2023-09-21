<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EpicPharma.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carousel" class="d-flex justify-content-center" >
    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item">
       
          <img src="Content/img/Vetoquinol1.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></img>

      </div>
      <div class="carousel-item active">

          <img src="Content/img/Aboca.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></img>

      </div>
      <div class="carousel-item">

          <img src="Content/img/Multicentrum.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></img>
   
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

   <%-- INIZIO CARD--%>


  
    <div class="container py-3" >
        <h2 class="text-center mt-3" > Categoria</h2>

       <%-- Inizio Ctegory--%>

        
        <div class="row row-cols-1 row-cols-md3 g-4 py-5" >


            <a href="#"  class="col col-sm-6 col-md-2 col-lg-2 ">

                <div class="card text-bg-dark">
                    <img src="Content/img/Automedicazione.jpeg" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="DarkMode" ></div>
                        <h5 class="catetext">Automedicazione</h5>                    
                    </div>
                </div>
            </a>

            <a href="#" class="col col-sm-6 col-md-2 col-lg-2 ">

                <div class="card text-bg-dark">
                    <img src="Content/img/Personal care.jpeg" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="DarkMode" ></div>
                        <h5 class="catetext">Personal <br /> Care </h5> 
                    </div>
                </div>
            </a>

            <a href="#" class="col col-sm-6 col-md-2 col-lg-2 ">

                <div class="card text-bg-dark">
                    <img src="Content/img/Prima infanzia.jpeg" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="DarkMode" ></div>
                       <h5 class="catetext">Prima <br /> Infanzia</h5> 
                    </div>
                </div>
            </a>

            <a href="#" class="col col-sm-6 col-md-2 col-lg-2 ">

                <div class="card text-bg-dark">
                    <img src="Content/img/Integratori.jpeg" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="DarkMode" ></div>
                        <h5 class="catetext">Integratori</h5> 
                    </div>
                </div>
            </a>

            <a href="#" class="col col-sm-6 col-md-2 col-lg-2 ">

                <div class="card text-bg-dark">
                    <img src="Content/img/Presidi Medicali.jpeg" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="DarkMode" ></div>
                       <h5 class="catetext">Presidi <br /> Medicali </h5> 
                    </div>
                </div>
            </a>

            <a href="#" class="col col-sm-6 col-md-2 col-lg-2 ">

                <div class="card text-bg-dark">
                    <img src="Content/img/Alimentazione.jpeg" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="DarkMode" ></div>
                     <h5 class="catetext">Alimentazione</h5> 
                    </div>
                </div>
            </a>
        </div>
    </div>
    








      <%--  <section class="category">
            <div class="category-box">
                <h3>Automedicazione</h3>
            </div>
            <div class="category-box">
                <h3>Personal <br />
                    care
                </h3>
            </div>
            <div class="category-box">
                <h3>Prima <br /> Infanzia </h3>
            </div>
            <div class="category-box">
                <h3>Integratori</h3>
            </div>
            <div class="category-box">
                <h3>Presidi <br /> Medical </h3>
            </div>
            <div class="category-box">
                <h3>Alimentazione</h3>
            </div>
        </section>--%>
  



        <%--====--%>

        <div class="row row-cols-1 row-cols-md3 g-4 py-5" >


            <div class="col col-sm-6 col-md-4 col-lg-3 ">
    <div class="card mx-1" ">

        <img CssClass="imgC" src="Content/img/EPIC_PHARMA_ridotto.png" class="card-img-top" alt="...">
        <div class="card-body text-center">
            <h5 class="tittleP" ><a href="Details.aspx?id=1" >Titolo - con un po di descrizione del prodotto :) uwdhshudsiudh</a></h5>
            
            <h4 class="my-3">35,00€</h4>
            <a href="Details.aspx?id=1"  class="myButton"> Details </a>

        </div>
    </div>
</div>

            <div class="col col-sm-6 col-md-4 col-lg-3 ">
    <div class="card mx-1" ">

        <img CssClass="imgC" src="Content/img/lipikar.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
           <h5 class="tittleP" ><a href="Details.aspx?id=1" >Titolo - con un po di descrizione del prodotto :) aarggaergaregaeddbdbdtbdtbdtbdrgaergargeragaergeragrgagargagaegeargeargerh</a></h5>
           
            <h3 class="my-3">35,00€</h3>
            <a href="#" class="myButton">Details</a>

        </div>
    </div>
</div>

            <div class="col col-sm-6 col-md-4 col-lg-3 ">
                <div class="card mx-1" ">

                    <img CssClass="imgC" src="Content/img/EPIC_PHARMA_ridotto.png" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                        <h5 class="tittleP" ><a href="Details.aspx?id=1>" >Titolo - con un po di descrizione del prodotto :) uwdhshudsiargagaergeargeargeragagaudh</a></h5>
                       
                        <h3 class="my-3">35,00€</h3>
                        <a href="#" class="myButton">Details</a>

                    </div>
                </div>
            </div>

            <div class="col col-sm-6 col-md-4 col-lg-3 ">
    <div class="card mx-1">

        <img CssClass="imgC" src="Content/img/lipikar.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
           <h5 class="tittleP" ><a href="Details.aspx?id=1>" >Titolo - con un po di descrizione del prodotto :) uwdhargargshudsiudh</a></h5>
           
            <h3 class="my-3">35,00€</h3>
            <a href="#" class="myButton">Details</a>

        </div>
    </div>
</div>

            <div class="col col-sm-6 col-md-4 col-lg-3 ">
    <div class="card mx-1" >

        <img CssClass="imgC" src="Content/img/EPIC_PHARMA_ridotto.png" class="card-img-top" alt="...">
        <div class="card-body text-center">
           <h5 class="tittleP" ><a href="Details.aspx?id=1>" >Titolo - con un po di descrizione del prodotto :) uwdhshudsiudh</a></h5>
            
            <h3 class="my-3">35,00€</h3>
            <a href="#" class="btn btn-primary">Details</a>

        </div>
    </div>
</div>
 


        </div>
    </div>



</asp:Content>