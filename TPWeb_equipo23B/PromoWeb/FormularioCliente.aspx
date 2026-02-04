<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="PromoWeb.FormularioCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 class="text-center mt-2">Ingresa tus datos</h1>

    <div class="container mt-3" style="max-width: 1000px;">
        <div class="row g-3">

            <div class="col-sm-3">
                <label for="txtDocumento" class="form-label">Documento</label>
                <asp:TextBox runat="server" ID="txtDocumento" CssClass="form-control" placeholder="Documento" />
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ControlToValidate="txtDocumento"
                    ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="row g-3 mt-2">
                <div class="col">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Nombre" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                        ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="col">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" placeholder="Apellido" />
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido"
                        ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="row g-3 mt-2">
                <div class="col-md-6">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="correo@ejemplo.com" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Formato de email inválido." CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="row g-3 mt-2">
                <div class="col-md-6">
                    <label for="txtDireccion" class="form-label">Dirección</label>
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" placeholder="Dirección" />
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion"
                        ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="col-md-3">
                    <label for="txtCiudad" class="form-label">Ciudad</label>
                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" placeholder="Ciudad" />
                    <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ControlToValidate="txtCiudad"
                        ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="col-md-3">
                    <label for="txtCodPostal" class="form-label">Código Postal</label>
                    <asp:TextBox runat="server" ID="txtCodPostal" CssClass="form-control" placeholder="CP" />
                    <asp:RequiredFieldValidator ID="rfvCodPostal" runat="server" ControlToValidate="txtCodPostal"
                        ErrorMessage="Campo obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="form-check mt-3">
                <asp:CheckBox ID="chkAcepto" CssClass="form-check-input" runat="server" />
                <label class="form-check-label" for="chkAcepto">
                    Acepto los términos y condiciones.
                </label>
            </div>

        </div>

        <div class="row mt-3">
            <div class="col-auto">
                <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" runat="server" Text="Participar" CssClass="btn btn-dark" />
            </div>
            <div class="col-auto">
                <a href="Default.aspx" class="btn btn-secondary">Cancelar</a>
            </div>

            <div class="col align-self-center">
                <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2 d-block"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>


