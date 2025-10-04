using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace PromoWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {

                lblMensaje.Text = "";
            }
        }

        protected void btnValidar_Click(object sender, EventArgs e)
        {
            string codigo = txtCodigoVoucher.Text.Trim().ToUpper();
            lblMensaje.Text = ""; // Limpia mensajes anteriores

            if (string.IsNullOrEmpty(codigo))
            {
                lblMensaje.Text = "Debe ingresar un código.";
                lblMensaje.CssClass = "text-danger";
                return;
            }

            try
            {
                VoucherNegocio negocio = new VoucherNegocio();

                if (negocio.ValidarCodigo(codigo))
                {
                    // Código válido: guardamos en Session y redirigimos
                    Session["CodigoVoucher"] = codigo;
                    // Response.Redirect(..., false) para evitar un Response.End() inmediato
                    Response.Redirect("FormularioCliente.aspx", false);
                }
                else
                {
                    // Código inválido o usado
                    lblMensaje.Text = "El código ingresado es inválido o ya fue utilizado.";
                    lblMensaje.CssClass = "text-danger";
                }
            }
            catch (System.Threading.ThreadAbortException)
            {
                // Esta excepción es esperada por Response.Redirect y la ignoramos.
            }
            catch (Exception ex)
            {
                // Aquí se capturan los errores de sistema o de base de datos reales (como SqlException)
                string mensajeSistema = "Error de conexión o de base de datos. Por favor, revisa tu conexión a SQL Server.";

                if (ex.InnerException != null)
                {
                    mensajeSistema += " DETALLE TÉCNICO: " + ex.InnerException.Message;
                }
                else
                {
                    mensajeSistema += " DETALLE TÉCNICO: " + ex.Message;
                }

                lblMensaje.Text = mensajeSistema;
                lblMensaje.CssClass = "text-danger";
            }



        }
    }
}
