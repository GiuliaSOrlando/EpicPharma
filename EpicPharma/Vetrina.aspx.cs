using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicPharma
{
    public partial class Chart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Prodotto prodotto = new Prodotto();
                prodotto.getInfoFromDB();
                List<Prodotto> prodottos = prodotto.listaProdottiDB;
                ProductGridView.DataSource = prodottos;
                ProductGridView.DataBind();
                Carrello carrello = Session["Carrello"] as Carrello;
                if(carrello == null)
                {
                    carrello = new Carrello();
                    Session["Carrello"] = carrello;
                }

            }
        }
        protected void AddToChart_Button_OnClick(object sender, EventArgs e)
        {
            
            Button btnAggiungiProdotto = (Button)sender;
            GridViewRow gridViewRow = (GridViewRow)btnAggiungiProdotto.NamingContainer;
            int index = gridViewRow.RowIndex;
            Carrello carrello = new Carrello();
            carrello = (Carrello)Session["Carrello"];

            if (index >= 0)
            {
                int ID = Convert.ToInt32(ProductGridView.DataKeys[index].Value);
                CartItem elementoSelezionato = carrello.CartItems.Find(p => p.IdProdotto == ID);

                if (elementoSelezionato != null)
                {
                    elementoSelezionato.Quantita++;
                }
                else
                {
                    carrello.CartItems.Add(new CartItem
                    {
                        IdProdotto = ID,
                        Quantita = 1
                    });
                }
            }
              

            }
        }
    }
