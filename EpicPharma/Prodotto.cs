using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace EpicPharma
{
    public class Prodotto
    {
        public int ID { get; set; }
        public string Nome { get; set; }
        public string Descrizione { get; set; }
        public decimal Prezzo { get; set; }
        public string Categoria { get; set; }
        public string Brand { get; set; }
        public string Modalita { get; set; }
        public string Composizione { get; set; }
        public string Immagine { get; set; }
        public DateTime Dataaggiunta { get; set; }
        public DateTime Datascadenza { get; set; }
        public bool InStock { get; set; }
        public string GruppoMerciologico { get; set; }

        public Prodotto() { }
        public Prodotto(string nome, string descrizione, decimal prezzo, string categoria, string immagine, bool instock, string gruppomerciologico) {
            Nome = nome;
            Descrizione = descrizione;
            Prezzo = prezzo;
            Categoria = categoria;
            Immagine = immagine;
            InStock = instock;
            GruppoMerciologico = gruppomerciologico;
        }

        public Prodotto(string nome, string descrizione, decimal prezzo, string categoria, string brand, string modalita, string composizione, string immagine, DateTime datascadenza, bool inStock, string gruppoMerciologico)
        {
            Nome = nome;
            Descrizione = descrizione;
            Prezzo = prezzo;
            Categoria = categoria;
            Brand = brand;
            Modalita = modalita;
            Composizione = composizione;
            Immagine = immagine;
            Datascadenza = datascadenza;
            InStock = inStock;
            GruppoMerciologico = gruppoMerciologico;
        }

        public void setInfoIntoDB()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO Prodotti VALUES(@Nome, @Prezzo, @Descrizione, @Categoria, @Brand, @Modalita, @Composizione, @Immagine, @Dataaggiunta, @Datascadenza, @InStock, @GruppoMerciologico)";
                cmd.Parameters.AddWithValue("Nome", Nome);
                cmd.Parameters.AddWithValue("Prezzo", Prezzo);
                cmd.Parameters.AddWithValue("Descrizione", Descrizione);
                cmd.Parameters.AddWithValue("Categoria", Categoria);
                cmd.Parameters.AddWithValue("Brand", Brand);
                cmd.Parameters.AddWithValue("Modalita", Modalita);
                cmd.Parameters.AddWithValue("Composizione", Composizione);
                cmd.Parameters.AddWithValue("Immagine", Immagine); 
                cmd.Parameters.AddWithValue("Dataaggiunta", DateTime.Now);
                cmd.Parameters.AddWithValue("Datascadenza", Datascadenza);
                cmd.Parameters.AddWithValue("InStock", InStock);
                cmd.Parameters.AddWithValue("GruppoMerciologico", GruppoMerciologico);


                int inserimentoEffettuato = cmd.ExecuteNonQuery();
            }
            catch { }
            finally
            {
                conn.Close();
            }
        }
        public void getInfoFromDB()
        {
            string connetionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connetionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Prodotti", conn);
            SqlDataReader sqlDataReader;

            conn.Open();
            sqlDataReader = cmd.ExecuteReader();

            while (sqlDataReader.Read())
            {
                int IdProdotto = Convert.ToInt32(sqlDataReader["IdProdotto"].ToString());
                string NomeProdotto = sqlDataReader["Nome"].ToString();
                decimal PrezzoProdotto = Convert.ToDecimal(sqlDataReader["Prezzo"].ToString());
                string DescrizioneProdotto = sqlDataReader["Descrizione"].ToString();
                string CategoriaProdotto = sqlDataReader["Categoria"].ToString();
                string BrandProdotto = sqlDataReader["Brand"].ToString();
                string ModalitaProdotto = sqlDataReader["Modalita"].ToString();
                string ComposizioneProdotto = sqlDataReader["Composizione"].ToString();
                string ImmagineProdotto = sqlDataReader["Immagine"].ToString();
                DateTime DataScadenzaProdotto = Convert.ToDateTime(sqlDataReader["DataScadenza"].ToString());
                bool InStockProdotto = Convert.ToBoolean(sqlDataReader["InStock"].ToString());
            }

            conn.Close();

        }
    }
    }
