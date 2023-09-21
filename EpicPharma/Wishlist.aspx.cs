using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicPharma
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListaPrototipo.creatList();
            GridView1.DataSource = ListaPrototipo.wishlist;
            GridView1.DataBind();
        }
    }

    public class ListaPrototipo
    {
        public int IDprodotto { get; set; }
        public string NomeProdotto { get; set; }

        public string DescrizionePrdotto { get; set; }
        public double PrezzoProdotto { get; set; }
        public string IMGprodotto { get; set; }

        public ListaPrototipo(int id, string nome, string desc, double prezzo, string img)
        {
            this.IDprodotto = id;
            this.NomeProdotto = nome;
            this.DescrizionePrdotto = desc;
            this.PrezzoProdotto = prezzo;
            this.IMGprodotto = img;
        }

        public static List<ListaPrototipo> wishlist = new List<ListaPrototipo>();

        public static void creatList()
        {
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
            wishlist.Add(new ListaPrototipo(1, "blalalala", "tlalalalalal", 22.0, "~/Content/img/tachipirina.jpg"));
        }
    }
}