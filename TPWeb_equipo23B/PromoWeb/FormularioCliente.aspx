<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="PromoWeb.FormularioCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1>Formulario del cliente </h1>

    <div class="row">
        <div class="col-6">

            <div class="mb-3">
                <label for="txtDni" class="form-label">Dni</label>
                <asp:TextBox runat="server" DNI="txtDni" cssclass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" NOMBRE="txtNombre" cssclass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" Apellido="txtApellido" cssclass="form-control" />
            </div>

             <div class="mb-3">
                <label for="txtDireccion" class="form-label">Dirección</label>
                <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtCiudad" class="form-label">Ciudad</label>
                <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtCodPostal" class="form-label">Código Postal</label>
                <asp:TextBox runat="server" ID="txtCodPostal" CssClass="form-control" />
            </div>

             <div class="mb-3 form-check">
                <asp:CheckBox ID="chkAcepto" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="chkAcepto">Acepto los términos y condiciones</label>
            </div>

            <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" CssClass="btn btn-primary" />



        </div>
    </div>

</asp:Content>
