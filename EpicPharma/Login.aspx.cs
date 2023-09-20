using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicPharma
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Login_Button_OnClick(object sender, EventArgs e)
        {

            string username = Username_Input.Text;
            string password = Password_Input.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();
            string query = "SELECT COUNT(*) FROM Utenti WHERE Username=@Username AND Password=@Password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);
            int count = (int)cmd.ExecuteScalar();


            if (count > 0)
            {
                string script = "Sei loggato";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
                FormsAuthentication.SetAuthCookie(username, false);
                Response.Redirect("Default.aspx");
            }
            else
            {
                string script2 = "Non sei ancora registrato";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script2);
                Response.Redirect("Signup.aspx");
            }
        }
    }
}