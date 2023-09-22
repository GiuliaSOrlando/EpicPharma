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
    public partial class Default : System.Web.UI.Page
    {
        private string categoria { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Prodotto prodotto = new Prodotto();
                prodotto.getInfoFromDB();
                List<Prodotto> prodottos = prodotto.listaProdottiDB;
                ProductRepeater.DataSource = prodottos;
                ProductRepeater.DataBind();
                Carrello carrello = Session["Carrello"] as Carrello;
                if (carrello == null)
                {
                    carrello = new Carrello();
                    Session["Carrello"] = carrello;
                }
            }
            if (categoria != null)
            {
                Prodotto prodotto = new Prodotto();
                prodotto.getInfoFromDB();
                List<Prodotto> prodottos = prodotto.listaProdottiDB;
                List<Prodotto> prodotti = prodottos.FindAll((p) => p.GruppoMerciologico == categoria);
                ProductRepeater.DataSource = prodotti;
                ProductRepeater.DataBind();
            }
        }

        protected void AddToChart_Button_OnClick(object sender, EventArgs e)
        {
            Button btnAggiungiProdotto = (Button)sender;
            int index = Convert.ToInt32(btnAggiungiProdotto.CommandArgument);
            Carrello carrello = new Carrello();
            carrello = (Carrello)Session["Carrello"];

            if (index >= 0)
            {
                CartItem elementoSelezionato = carrello.CartItems.Find(p => p.IdProdotto == index);

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
                    cmdProdotto.Parameters.AddWithValue("@IdProdottoQ1", index);
                    int count = (int)cmdProdotto.ExecuteScalar();

                    // Se il prodotto è già presente, si aggiorna solo la quantità
                    if (count > 0)
                    {
                        try
                        {
                            cmdProdotto.Connection = conn;
                            cmdProdotto.CommandText = "UPDATE Carrello SET Quantita = Quantita +1 WHERE IdProdotto =@IdProdottoQ2 AND IdUtente = @IdUtenteQ2";
                            cmdProdotto.Parameters.AddWithValue("IdUtenteQ2", IDUtente);
                            cmdProdotto.Parameters.AddWithValue("IDProdottoQ2", index);
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
                            cmdProdotto.Parameters.AddWithValue("IDProdottoQ3", index);
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
                        elementoSelezionato.Quantita++;
                    }
                    // Se il prodotto non è presente, viene aggiunto al carrello
                    else
                    {
                        carrello.CartItems.Add(new CartItem
                        {
                            IdProdotto = index,
                            Quantita = 1
                        });
                        ;
                    }
                }
            }
        }

        protected void Automedicazione_Click(object sender, EventArgs e)
        {
            categoria = "Automedicazione";
            Page_Load(sender, e);
        }

        protected void Alimentazione_Click(object sender, EventArgs e)
        {
            categoria = "Alimentazione";
            Page_Load(sender, e);
        }

        protected void Integratori_Click(object sender, EventArgs e)
        {
            categoria = "Integratore";
            Page_Load(sender, e);
        }

        protected void PresidiMedici_Click(object sender, EventArgs e)
        {
            categoria = "Presidi medici";
            Page_Load(sender, e);
        }

        protected void PrimaInfanzia_Click(object sender, EventArgs e)
        {
            categoria = "Prima infanzia";
            Page_Load(sender, e);
        }

        protected void PersonalCare_Click(object sender, EventArgs e)
        {
            categoria = "Personal care";
            Page_Load(sender, e);
        }

    }
}