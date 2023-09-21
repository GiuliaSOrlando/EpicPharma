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
                List<Prodotto> prodotti = prodotto.listaProdottiDB;
                Carrello carrello = Session["Carrello"] as Carrello;
                prodotto = prodotti.Find((p) => p.ID == Convert.ToInt32(Request.QueryString["id"]));
                if (prodotto != null)
                {
                    if (carrello == null)
                    {
                        carrello = new Carrello();
                        Session["Carrello"] = carrello;
                    }

                    nomeProdotto.InnerHtml = prodotto.Nome;
                    Descrizione.InnerHtml = prodotto.Descrizione;
                    Brand.InnerHtml = prodotto.Brand;
                    Modalita.InnerHtml = prodotto.Modalita;
                    Composizione.InnerHtml = prodotto.Composizione;
                    DataScadenza.InnerHtml = String.Format("{0:dd/MM/yyyy}",prodotto.Datascadenza);
                    Prezzo.InnerHtml = String.Format("{0:C}",prodotto.Prezzo);
                    Image1.ImageUrl = "Content/img/" + prodotto.Immagine;
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void AddToChart_Button_OnClick(object sender, EventArgs e)
        {
            string elementoSelezionato = Request.QueryString["id"];
            int elementoSelezionatoInt;
            bool parsed = int.TryParse(elementoSelezionato, out elementoSelezionatoInt);
            Carrello carrello = new Carrello();
            carrello = (Carrello)Session["Carrello"];
            CartItem prodotto = carrello.CartItems.Find((p) => p.IdProdotto == Convert.ToInt32(Request.QueryString["id"]));

            if (parsed)
            {
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
                    SqlDataReader sqlDataReader = cmdUtente.ExecuteReader();
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
                    cmdProdotto.Parameters.AddWithValue("@IdProdottoQ1", elementoSelezionatoInt);
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
                    if (prodotto != null)
                    {
                        prodotto.Quantita++;
                    }
                    // Se il prodotto non è presente, viene aggiunto al carrello
                    else
                    {
                        carrello.CartItems.Add(new CartItem
                        {
                            IdProdotto = elementoSelezionatoInt,
                            Quantita = 1
                        });
                    }
                }
            } else
            { }
        }
        protected void btnAumenta_Click(object sender, EventArgs e)
        {
            Button btnAumenta = (Button)sender;
            int prodottoId = Convert.ToInt32(Request.QueryString["id"]);
            Carrello carrello = new Carrello();
            carrello = (Carrello)Session["Carrello"];
            CartItem prodotto = carrello.CartItems.FirstOrDefault(p => p.IdProdotto == prodottoId);

            if (prodotto != null)
            {
                prodotto.Quantita++;
            }
            else
            {
                carrello.CartItems.Add(new CartItem
                {
                    IdProdotto = prodottoId,
                    Quantita = 1
                });
            }

        }
        // WORK IN PROGRESS: da finire di implementare
    }

}