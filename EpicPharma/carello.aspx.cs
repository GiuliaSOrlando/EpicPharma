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

                        string querySelezione = "SELECT IdProdotto FROM Carrello WHERE IdUtente=@IdUtente";
                        SqlCommand cmdSelezione = new SqlCommand(querySelezione, conn);
                        cmdSelezione.Parameters.AddWithValue("@IdUtente", IDUtente);
                        SqlDataReader sqlSelezione = cmdSelezione.ExecuteReader();

                        DataTable cartData = new DataTable();
                        cartData.Load(sqlSelezione);
                        cartData.Columns.Add("Nome");
                        cartData.Columns.Add("Prezzo");
                        cartData.Columns.Add("Immagine");

                        while (sqlSelezione.Read())
                        {
                            string Idprodotto = sqlSelezione["IdProdotto"].ToString();
                            cartData.Rows.Add(Idprodotto);
                        }

                        sqlSelezione.Close();
                        sqlSelezione.Dispose();

                        foreach (DataRow row in cartData.Rows)
                        {
                            string Idprodotto = row["IdProdotto"].ToString();
                            string queryProdotto = "SELECT *  FROM prodotti WHERE IdProdotto=@IdProdotto";
                            SqlCommand cmdProdotto = new SqlCommand(queryProdotto, conn);
                            cmdProdotto.Parameters.AddWithValue("@IdProdotto", Idprodotto);
                            SqlDataReader sqlProdotto = cmdProdotto.ExecuteReader();

                            while (sqlProdotto.Read())
                            {
                                string NomeProdotto = sqlProdotto["Nome"].ToString();
                                decimal PrezzoProdotto = Convert.ToDecimal(sqlProdotto["Prezzo"]);
                                string ImmagineProdotto = sqlProdotto["Immagine"].ToString();

                                Prodotto prodotto = new Prodotto
                                {
                                    Nome = NomeProdotto,
                                    Prezzo = PrezzoProdotto,
                                    Immagine = ImmagineProdotto,
                                };
                                DataRow newRow = cartData.NewRow();
                                newRow["Nome"] = prodotto.Nome;
                                newRow["Prezzo"] = prodotto.Prezzo;
                                newRow["Immagine"] = prodotto.Immagine; 
                                cartData.Rows.Add(newRow);
                            }

                                sqlProdotto.Close();
                            sqlProdotto.Dispose();
                        }

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