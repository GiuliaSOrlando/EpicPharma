using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EpicPharma
{
    public partial class carello : System.Web.UI.Page
    {
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

                        
                        string Idprodotto = sqlSelezione["IdProdotto"].ToString();
                        string queryProdotto = "SELECT *  FROM Prodotti WHERE IdProdotto=@IdProdotto";
                        SqlCommand cmdProdotto = new SqlCommand(queryProdotto, conn);
                        cmdProdotto.Parameters.AddWithValue("@IdProdotto", Idprodotto);

                        SqlDataReader sqlProdotto = cmdProdotto.ExecuteReader();

                        while (sqlProdotto.Read())
                            {
                                string NomeProdotto = sqlProdotto["Nome"].ToString();
                                decimal PrezzoProdotto = Convert.ToDecimal(sqlProdotto["Prezzo"]);
                                string ImmagineProdotto = sqlProdotto["Immagine"].ToString();

                                DataRow newRow = cartData.NewRow();
                                newRow["Nome"] = NomeProdotto;
                                newRow["Prezzo"] = PrezzoProdotto;
                                newRow["Immagine"] = ImmagineProdotto; 
                                cartData.Rows.Add(newRow);
                            }

                            sqlProdotto.Close();

                        sqlSelezione.Close();

                        conn.Close();

                        CartRepeater.DataSource = cartData;
                        CartRepeater.DataBind();

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