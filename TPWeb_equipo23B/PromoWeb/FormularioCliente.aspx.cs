using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;
using dominio;
using negocio;

namespace PromoWeb
{
    public partial class FormularioCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblError.CssClass = "text-danger mt-2 d-block";

            // Validar campos obligatorios
            if (string.IsNullOrWhiteSpace(txtDocumento.Text) ||
                string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtApellido.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                string.IsNullOrWhiteSpace(txtCiudad.Text) ||
                string.IsNullOrWhiteSpace(txtCodPostal.Text))
            {
                lblError.Text = "Todos los campos son obligatorios.";
                return;
            }


            // Validar Documento solo numeros
            long dniNumero;
            if (!long.TryParse(txtDocumento.Text, out dniNumero))
            {
                lblError.Text = "El Documento debe contener solo números.";
                return;
            }
            if (dniNumero <= 0)
            {
                lblError.Text = "El Documento no puede ser un número negativo.";
                return;
            }

            //validar que Nombre solo  letras y espacios
            if (!txtNombre.Text.Replace(" ", "").All(char.IsLetter))
            {
                lblError.Text = "El Nombre solo puede contener letras.";
                return;
            }

            //validar que Apellido solo letras y espacios
            if (!txtApellido.Text.Replace(" ", "").All(char.IsLetter))
            {
                lblError.Text = "El Apellido solo puede contener letras.";
                return;
            }

            int codPostal;
            if (!int.TryParse(txtCodPostal.Text, out codPostal))
            {
                lblError.Text = "Código postal inválido.";
                return;
            }
            if (codPostal <= 0)
            {
                lblError.Text = "El Código Postal no puede ser negativo ni cero.";
                return;
            }

            //Validar aceptación de términos
            if (!chkAcepto.Checked)
            {
                lblError.Text = "Debe aceptar los términos y condiciones.";
                return;
            }

            //Verificar si el cliente ya existe en la bdd
            ClienteNegocio clienteNeg = new ClienteNegocio();
            if (clienteNeg.ExisteDocumento(txtDocumento.Text))
            {
                lblError.Text = "El Documento ingresado ya está registrado.";
                return;
            }

            
            Cliente a = new Cliente
            {
                Documento = txtDocumento.Text,
                Nombre = txtNombre.Text,
                Apellido = txtApellido.Text,
                Email = txtEmail.Text,
                Direccion = txtDireccion.Text,
                Ciudad = txtCiudad.Text,
                CP = codPostal
            };

            //Guardar en base de datos
            clienteNeg.Guardar(a);
            
            if (Session["CodigoVoucher"] != null)
            {
                string codigoVoucher = Session["CodigoVoucher"].ToString();

                //Recuperar el ID del cliente recién guardado
                int idCliente = clienteNeg.ObtenerIdPorDocumento(a.Documento);

                
                int idArticulo = 1; 

                
                VoucherNegocio voucherNeg = new VoucherNegocio();
                voucherNeg.CanjearVoucher(codigoVoucher, idArticulo, idCliente);

                
                Session.Remove("CodigoVoucher");
            }

            //Mensaje 
            Response.Redirect("Exito.aspx");

            //limpiar
            txtDocumento.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDireccion.Text = "";
            txtCiudad.Text = "";
            txtCodPostal.Text = "";
            chkAcepto.Checked = false;
        }

    }
}

