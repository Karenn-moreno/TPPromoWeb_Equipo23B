using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace PromoWeb
{
    public partial class verArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                List<Articulo> articulos = articuloNegocio.Listar(); // trae todos los artículos

                if (articulos != null && articulos.Count > 0)
                {
                    rptArticulos.DataSource = articulos;
                    rptArticulos.DataBind();
                }

                // Asignar evento para enlazar los repeaters anidados--
                rptArticulos.ItemDataBound += rptArticulos_ItemDataBound;
            }
        }

        protected void rptArticulos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Articulo art = (Articulo)e.Item.DataItem;
                Repeater rptImagenes = (Repeater)e.Item.FindControl("rptImagenes");

                if (art.Imagenes != null && art.Imagenes.Count > 0)
                {
                    rptImagenes.DataSource = art.Imagenes;
                    rptImagenes.DataBind();
                }
            }
        }

        protected void rptArticulos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ElegirPremio")
            {
                int idPremio = Convert.ToInt32(e.CommandArgument);

                // guardo el premio seleccionado en Session para usarlo en la siguiente página
                Session["PremioSeleccionado"] = idPremio;

                // redirigir al formulario de ingreso de datos del cliente
                Response.Redirect("FormularioCliente.aspx");
            }
        }



    }
}
