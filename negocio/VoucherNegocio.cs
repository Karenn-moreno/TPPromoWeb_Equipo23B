using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class VoucherNegocio
    {

        // Método para validar el código de voucher

        public bool ValidarCodigo(string codigo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                
                datos.setearConsulta("SELECT CodigoVoucher FROM VOUCHERS WHERE CodigoVoucher = @codigo AND FechaCanje IS NULL");
                datos.setearParametro("@codigo", codigo);
                datos.ejecutarLectura();

                // Si Read() devuelve true, significa que existe códigp y que no ha sido utilizado
                return datos.Lector.Read();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al validar el código de voucher.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void CanjearVoucher(string codigoVoucher, int idArticulo, int idCliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
            UPDATE VOUCHERS 
            SET FechaCanje = GETDATE(), 
                IdArticulo = @IdArticulo, 
                IdCliente = @IdCliente
            WHERE CodigoVoucher = @CodigoVoucher AND FechaCanje IS NULL
        ");

                datos.setearParametro("@IdArticulo", idArticulo);
                datos.setearParametro("@IdCliente", idCliente);
                datos.setearParametro("@CodigoVoucher", codigoVoucher);

                datos.ejecutarAccionInt(); // Ejecuta el UPDATE
            }
            catch (Exception ex)
            {
                throw new Exception("Error al canjear el voucher.", ex);
            }
        }

    }
}
