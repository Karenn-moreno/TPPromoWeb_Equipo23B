using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace negocio
{
    public class ClienteNegocio
    {
        public void Guardar(Cliente nuevoCliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Consulta INSERT: Inserta todos los campos del cliente.
                datos.setearConsulta(@"
            INSERT INTO CLIENTES 
            (Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP)
            VALUES 
            (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP)
        ");

                // Parámetros
                datos.setearParametro("@Documento", nuevoCliente.Documento);
                datos.setearParametro("@Nombre", nuevoCliente.Nombre);
                datos.setearParametro("@Apellido", nuevoCliente.Apellido);
                datos.setearParametro("@Email", nuevoCliente.Email);
                datos.setearParametro("@Direccion", nuevoCliente.Direccion);
                datos.setearParametro("@Ciudad", nuevoCliente.Ciudad);
                datos.setearParametro("@CP", nuevoCliente.CP);

                // Ejecutar la acción de inserción. ejecutarAccionInt es la forma más segura.
                datos.ejecutarAccionInt();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al guardar el nuevo cliente.", ex);
            }
            
        }

        public bool ExisteDocumento(string documento)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM CLIENTES WHERE Documento = @Documento");
                datos.setearParametro("@Documento", documento);
                int cantidad = (int)datos.ejecutarAccionInt(); 
                return cantidad > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar documento", ex);
            }
        }

    }
}
