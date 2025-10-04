using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class VoucherNegocio
    {

        // Método para validar el código de voucher.

        public bool ValidarCodigo(string codigo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //En la consulta buscamos que el codigo sea valido y que no se haya utilizado con el null
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

    }
}
