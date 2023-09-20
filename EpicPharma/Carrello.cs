using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;

namespace EpicPharma
{
    public class Carrello
    {
        public List<CartItem> CartItems { get; set; }
    
        public Carrello() {
            CartItems = new List<CartItem>();
        }
    }

    public class CartItem
    {
        public int IdProdotto { get; set; }
        public int Quantita { get; set; }
    }

    
}