using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EpicPharma
{
    public partial class carello : System.Web.UI.Page
    {
        private List<string> prodottiDalDB = new List<string>();
        private List<string> prodottiDal = new List<string>();

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

                        while (sqlSelezione.Read())
                        {
                            string IDProdotto = sqlSelezione["IdProdotto"].ToString();
                            prodottiDalDB.Add(IDProdotto);
                        }

                        sqlSelezione.Close();
                        string id = "";
                        foreach (string IdProdotto in prodottiDalDB)
                        {
                            string queryProdotto = "SELECT *  FROM Prodotti WHERE IdProdotto=@IdProdotto";
                            SqlCommand cmdProdotto = new SqlCommand(queryProdotto, conn);
                            cmdProdotto.Parameters.AddWithValue("@IdProdotto", IdProdotto);

                            SqlDataReader sqlProdotto = cmdProdotto.ExecuteReader();

                            while (sqlProdotto.Read())
                            {
                                prodottiDal.Add(sqlProdotto["idProdotto"].ToString());
                            }
                            sqlProdotto.Close();
                        }
                        Prodotto prodotto = new Prodotto();
                        prodotto.getInfoFromDB();
                        List<Prodotto> prodottos = prodotto.listaProdottiDB;
                        List<Prodotto> carello = prodottos.FindAll((prod) => prod.ID == Convert.ToInt32(id));
                        CartRepeater.DataSource = carello;
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
        }
    }
}