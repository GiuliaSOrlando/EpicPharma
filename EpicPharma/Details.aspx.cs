using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicPharma
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            non_disponibile.Visible = false;
            if (!IsPostBack)
            {
                Prodotto prodotto = new Prodotto();
                prodotto.getInfoFromDB();
                List<Prodotto> prodottos = prodotto.listaProdottiDB;
                Carrello carrello = Session["Carrello"] as Carrello;
                prodotto = prodottos.Find((p) => p.ID == Convert.ToInt32(Request.QueryString["id"]));
                if (prodotto != null)
                {
                    if (carrello == null)
                    {
                        carrello = new Carrello();
                        Session["Carrello"] = carrello;
                    }

                    nomeProdotto.InnerHtml = prodotto.Nome;
                    descrizione.InnerHtml = prodotto.Descrizione;
                    Image1.ImageUrl = "Content/img/" + prodotto.Immagine;
                }
                else
                {
                    Response.Redirect("Vetrina.aspx.cs");
                }
                //  Prezzo.InnerHtml = prodotto.Prezzo;
                //   Categoria.InnerHtml = prodotto.Categoria;
                //     Brand.InnerHtml = prodotto.Brand;
                //   Modalita.InnerHtml = prodotto.Modalita;
                //Composizione.InnerHtml = prodotto.Composizione;

                //descrizione.InnerHtml = prodotto.InStock.ToString();

                //DataScadenza.InnerHtml = prodotto.Datascadenza;

                //GruppoMerciologico.InnerHtml= prodotto.GruppoMerciologico;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int elementoSelezionato = Convert.ToInt32(Request.QueryString["id"]);
            if (User.Identity.IsAuthenticated)
            {
                string username = User.Identity.Name;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();

                // Verifica che l'utente sia loggato (dal DB)
                string queryUtente = "SELECT IdUtente FROM Utenti WHERE Username=@Username";
                SqlCommand cmdUtente = new SqlCommand(queryUtente, conn);
                cmdUtente.Parameters.AddWithValue("@Username", username);
                SqlDataReader sqlDataReader;
                sqlDataReader = cmdUtente.ExecuteReader();
                string IDUtente = "";
                while (sqlDataReader.Read())
                {
                    IDUtente = sqlDataReader["IdUtente"].ToString();
                }
                sqlDataReader.Close();
                sqlDataReader.Dispose();
                // Verifica che l'utente loggato abbia il prodotto selezionato già nel carrello o meno
                string queryProdotto = "SELECT COUNT(*) FROM Carrello WHERE IdUtente=@IdUtenteQ1 AND IdProdotto=@IdProdottoQ1";
                SqlCommand cmdProdotto = new SqlCommand(queryProdotto, conn);
                cmdProdotto.Parameters.AddWithValue("@IdUtenteQ1", IDUtente);
                cmdProdotto.Parameters.AddWithValue("@IdProdottoQ1", ID);
                int count = (int)cmdProdotto.ExecuteScalar();

                // Se il prodotto è già presente, si aggiorna solo la quantità
                if (count > 0)
                {
                    try
                    {
                        cmdProdotto.Connection = conn;
                        cmdProdotto.CommandText = "UPDATE Carrello SET Quantita = Quantita +1 WHERE IdProdotto =@IdProdottoQ2 AND IdUtente = @IdUtenteQ2";
                        cmdProdotto.Parameters.AddWithValue("IdUtenteQ2", IDUtente);
                        cmdProdotto.Parameters.AddWithValue("IDProdottoQ2", ID);
                        int inserimentoEffettuato = cmdProdotto.ExecuteNonQuery();
                    }
                    catch { }
                }

                // Se il prodotto non è presente, viene aggiunto
                else
                {
                    try
                    {
                        cmdProdotto.Connection = conn;
                        cmdProdotto.CommandText = "INSERT INTO Carrello VALUES(@IdUtenteQ3, @IdProdottoQ3, @Quantita)";
                        cmdProdotto.Parameters.AddWithValue("IdUtenteQ3", IDUtente);
                        cmdProdotto.Parameters.AddWithValue("IDProdottoQ3", ID);
                        cmdProdotto.Parameters.AddWithValue("Quantita", 1);
                        int inserimentoEffettuato = cmdProdotto.ExecuteNonQuery();
                    }
                    catch { }
                }
                conn.Close();
            }

            // Se l'utente non è loggato, il carrello viene aggiornato solo a livello di Session
            else
            {
                // Se il prodotto è già presente, viene aumentata solo la quantità
                if (elementoSelezionato != null)
                {
                }
                // Se il prodotto non è presente, viene aggiunto al carrello
                else
                {
                }
            }
        }
    }
}