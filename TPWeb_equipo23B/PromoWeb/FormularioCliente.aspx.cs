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

            int codPostal;
            if (!int.TryParse(txtCodPostal.Text, out codPostal))
            {
                lblError.Text = "Código postal inválido.";
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

            //Mensaje 
            lblError.CssClass = "text-success mt-2 d-block";
            lblError.Text = "Cliente registrado correctamente.";

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

