using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EpicPharma
{
    public partial class carello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        
        {
            if (User.Identity.IsAuthenticated)
            {
                
                string username = User.Identity.Name;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                try
                {
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



                    string querySelezione = "SELECT IdProdotto FROM Carrello WHERE IdUtente=@IdUtente";
                    SqlCommand cmdSelezione = new SqlCommand(querySelezione, conn);
                    cmdSelezione.Parameters.AddWithValue("@IdUtente", IDUtente);
                    SqlDataReader sqlSelezione;
                    sqlSelezione = cmdSelezione.ExecuteReader();
                    string Idprodotto="";
                    while (sqlSelezione.Read())
                    {
                        Idprodotto =  sqlSelezione["IdProdotto"].ToString();
                    }
                    sqlSelezione.Close();
                    sqlSelezione.Dispose();


                    string queryProdotto = "SELECT *  FROM prodotti WHERE IdProdotto=@IdProdotto";
                    SqlCommand cmdProdotto = new SqlCommand(querySelezione, conn);
                    cmdSelezione.Parameters.AddWithValue("@IdProdotto", Idprodotto);
                    SqlDataReader sqlProdotto;
                    sqlProdotto = cmdUtente.ExecuteReader();
                    
          
                    conn.Close();
                }
                catch { }
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