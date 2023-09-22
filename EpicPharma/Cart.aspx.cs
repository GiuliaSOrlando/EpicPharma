using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace EpicPharma
{
    public partial class carello : System.Web.UI.Page
    {
        private List<string> prodottiDalDB = new List<string>();

        private List<int> quantita = new List<int>();

        private List<Prodotto> Carello = new List<Prodotto>();
        private decimal tota { get; set; }
        private decimal total { get; set; }

        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    string username = User.Identity.Name;
                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
                    SqlConnection conn = new SqlConnection(connectionString);

                    try
                    {
                        conn.Open();
                        // Selezione dell'utente loggato dalla tabella Utenti
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

                        // Selezione di tutti i prodotti con IdUtente corrispondente all'utente loggato
                        string querySelezione = "SELECT * FROM Carrello JOIN Prodotti on Carrello.IdProdotto = Prodotti.IdProdotto WHERE Carrello.IdUtente = @IdUtente";
                        SqlCommand cmdSelezione = new SqlCommand(querySelezione, conn);
                        cmdSelezione.Parameters.AddWithValue("@IdUtente", IDUtente);

                        SqlDataReader sqlSelezione = cmdSelezione.ExecuteReader();

                        DataTable cartData = new DataTable();
                        cartData.Columns.Add("Nome");
                        cartData.Columns.Add("Prezzo");
                        cartData.Columns.Add("Immagine");
                        Prodotto prodotto = new Prodotto();
                        while (sqlSelezione.Read())
                        {
                            quantita.Add(Convert.ToInt32(sqlSelezione["quantita"].ToString()));
                            string IDProdotto = sqlSelezione["IdProdotto"].ToString();
                            prodottiDalDB.Add(IDProdotto);
                        }

                        sqlSelezione.Close();
                        string id = "";
                        int n = 0;
                        foreach (string IdProdotto in prodottiDalDB)
                        {
                            string queryProdotto = "SELECT *  FROM Prodotti WHERE IdProdotto=@IdProdotto";
                            SqlCommand cmdProdotto = new SqlCommand(queryProdotto, conn);
                            cmdProdotto.Parameters.AddWithValue("@IdProdotto", IdProdotto);

                            SqlDataReader sqlProdotto = cmdProdotto.ExecuteReader();

                            while (sqlProdotto.Read())
                            {
                                id = sqlProdotto["idProdotto"].ToString();

                                prodotto.getInfoFromDB();
                                List<Prodotto> prodottos = prodotto.listaProdottiDB;

                                Carello.Add(prodottos.Find((prod) => prod.ID == Convert.ToInt32(id)));

                                Carello[n].Quantity = quantita[n];
                                Carello[n].Costotot = quantita[n] * Carello[n].Prezzo;
                                n++;
                            }
                            sqlProdotto.Close();
                        }

                        CartRepeater.DataSource = Carello;
                        CartRepeater.DataBind();
                        conn.Close();

                        ;
                    }
                    catch (Exception ex) { }
                }
                else
                {
                    Carrello carello = new Carrello();
                    if (Session["Carrello"] != null)
                    {
                        carello = (Carrello)Session["Carrello"];
                    }
                }
            }
            Carello.ForEach((ep) => tota += ep.Costotot);
            tot.InnerHtml = String.Format("{0:C}", tota);
            total = tota + 5;
            totsped.InnerHtml = String.Format("{0:C}", total);
        }

        protected void btnAumenta_Click(object sender, EventArgs e)
        {
            Button btnAumenta = (Button)sender;

            int prodottoId = Convert.ToInt32(btnAumenta.CommandArgument); ;
            Carrello carrello = new Carrello();
            carrello = (Carrello)Session["Carrello"];
            CartItem prodotto = carrello.CartItems.FirstOrDefault(p => p.IdProdotto == prodottoId);

            if (prodotto != null)
            {
                prodotto.Quantita++;
                UpdateDatabaseQuantity(prodottoId, prodotto.Quantita);
            }
            else
            {
                carrello.CartItems.Add(new CartItem
                {
                    IdProdotto = prodottoId,
                    Quantita = 1
                });
                UpdateDatabaseQuantity(prodottoId, 1);
            }
            Response.Redirect("cart.aspx");
        }

        protected void btnDiminuisci_Click(object sender, EventArgs e)
        {
            Button btnDiminuisci = (Button)sender;
            int prodottoId = Convert.ToInt32(btnDiminuisci.CommandArgument);
            Carrello carrello = new Carrello();
            carrello = (Carrello)Session["Carrello"];
            CartItem prodotto = carrello.CartItems.FirstOrDefault(p => p.IdProdotto == prodottoId);

            if (prodotto != null && prodotto.Quantita > 1)
            {
                prodotto.Quantita--;
                UpdateDatabaseQuantity(prodottoId, prodotto.Quantita);
            }
            else if (prodotto != null && prodotto.Quantita == 1)
            {
                carrello.CartItems.Remove(prodotto);
                RemoveFromDatabase(prodottoId);
            }
            Response.Redirect("cart.aspx");
        }

        private void UpdateDatabaseQuantity(int productId, int quantity)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string updateQuery = "UPDATE Carrello SET Quantita = @Quantita WHERE IdProdotto = @IdProdotto";
                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Quantita", quantity);
                    cmd.Parameters.AddWithValue("@IdProdotto", productId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void RemoveFromDatabase(int productId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string deleteQuery = "DELETE FROM Carrello WHERE IdProdotto = @IdProdotto";
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@IdProdotto", productId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void toggleCollapseButton_Click(object sender, EventArgs e)
        {
            if (collapseContentPanel.Visible)
            {
                collapseContentPanel.Visible = false;
            }
            else
            {
                collapseContentPanel.Visible = true;
            }
        }
    }
}