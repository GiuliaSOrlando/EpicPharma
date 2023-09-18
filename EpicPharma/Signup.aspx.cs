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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUp_Button_OnClick(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                bool boolConfirmation;                
                string adminConfirmationString = "42istheanswer";
                if (Admin_Input.Text == adminConfirmationString)
                {
                    boolConfirmation = true;
                }
                else
                {
                    boolConfirmation = false;
                }

                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO Utenti VALUES (@Nome, @Cognome, @Email, @Username, @Password, @Admin)";
                cmd.Parameters.AddWithValue("Nome", Nome_Input.Text);
                cmd.Parameters.AddWithValue("Cognome", Cognome_Input.Text);
                cmd.Parameters.AddWithValue("Email", Email_Input.Text);
                cmd.Parameters.AddWithValue("Username", Username_Input.Text);
                cmd.Parameters.AddWithValue("Password", Password_Input.Text);
                cmd.Parameters.AddWithValue("Admin", boolConfirmation);


                int inserimentoEffettuato = cmd.ExecuteNonQuery();

                if (inserimentoEffettuato > 0)
                {
                    Response.Write("Inserimento effettuato con successo");
                }
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
    }
}