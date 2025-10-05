<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="PromoWeb.FormularioCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 class="text-center mt-2">Formulario del cliente</h1>

    <div class="container mt-3" style="max-width: 1000px;">
        <div class="row g-3">

            <div class="col-sm-3">
                <label for="txtDni" class="form-label">DNI</label>
                <asp:TextBox runat="server" ID="txtDni" CssClass="form-control" placeholder="DNI" />
                <asp:RequiredFieldValidator 
                    ID="rfvDni" 
                    runat="server" 
                    ControlToValidate="txtDni" 
                    ErrorMessage="Campo obligatorio." 
                    CssClass="text-danger" 
                    Display="Dynamic" />
            </div>

            <div class="row g-3 mt-2">
                <div class="col">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Nombre" />
                    <asp:RequiredFieldValidator 
                        ID="rfvNombre" 
                        runat="server" 
                        ControlToValidate="txtNombre" 
                        ErrorMessage="Campo obligatorio." 
                        CssClass="text-danger" 
                        Display="Dynamic" />
                </div>

                <div class="col">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" placeholder="Apellido" />
                    <asp:RequiredFieldValidator 
                        ID="rfvApellido" 
                        runat="server" 
                        ControlToValidate="txtApellido" 
                        ErrorMessage="Campo obligatorio." 
                        CssClass="text-danger" 
                        Display="Dynamic" />
                </div>
            </div>

            <div class="row g-3 mt-2">
                <div class="col-md-6">
                    <label for="txtDireccion" class="form-label">Dirección</label>
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" placeholder="Dirección" />
                    <asp:RequiredFieldValidator 
                        ID="rfvDireccion" 
                        runat="server" 
                        ControlToValidate="txtDireccion" 
                        ErrorMessage="Campo obligatorio." 
                        CssClass="text-danger" 
                        Display="Dynamic" />
                </div>

                <div class="col-md-3">
                    <label for="txtCiudad" class="form-label">Ciudad</label>
                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" placeholder="Ciudad" />
                    <asp:RequiredFieldValidator 
                        ID="rfvCiudad" 
                        runat="server" 
                        ControlToValidate="txtCiudad" 
                        ErrorMessage="Campo obligatorio." 
                        CssClass="text-danger" 
                        Display="Dynamic" />
                </div>

                <div class="col-md-3">
                    <label for="txtCodPostal" class="form-label">Código Postal</label>
                    <asp:TextBox runat="server" ID="txtCodPostal" CssClass="form-control" placeholder="CP" />
                    <asp:RequiredFieldValidator 
                        ID="rfvCodPostal" 
                        runat="server" 
                        ControlToValidate="txtCodPostal" 
                        ErrorMessage="Campo obligatorio." 
                        CssClass="text-danger" 
                        Display="Dynamic" />
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
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" CssClass="btn btn-dark mt-3" />
            </div>
            <div class="col align-self-center">
                <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2 d-block"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
