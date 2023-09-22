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
            admin_box.Visible = false;
        }

        protected void SignUp_Button_OnClick(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();

                string querySelezione = "SELECT * FROM Utenti  WHERE Username= @Username";
                SqlCommand cmd = new SqlCommand(querySelezione, conn);
                cmd.Parameters.AddWithValue("Username", Username_Input.Text);
                int count = (int)cmd.ExecuteScalar();
                if (count == 0)
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
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                admin_box.Visible = true;
            }
        }
    }
}
