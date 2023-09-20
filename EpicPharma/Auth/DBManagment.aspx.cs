using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicPharma
{
    public partial class DBManagment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddToDB_Button_OnClick(object sender, EventArgs e)
        {
            string fileNameProdotto = Immagine_Input.FileName;
            Immagine_Input.SaveAs(Server.MapPath($"/Content/img/{Immagine_Input.FileName}"));
            Prodotto prodotto = new Prodotto(Nome_Input.Text, Descrizione_Input.Text, Convert.ToDecimal(Prezzo_Input.Text), Categoria_Input.Text, Brand_Input.Text, Modalita_Input.Text, Composizione_Input.Text, fileNameProdotto, Convert.ToDateTime(DataScadenza_Input.Text), InStock_Input.Checked, GruppoMerciologico_Input.Text) ;
            prodotto.setInfoIntoDB();
        }
    }
}