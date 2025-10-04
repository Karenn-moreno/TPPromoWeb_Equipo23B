<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PromoWeb.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="estilos.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg p-4">
                    <h2 class="card-title text-center mb-4">🎁 Ingresa tu Código de Voucher 🎁</h2>
                    
                    <div class="mb-3">
                        <label for="<%= txtCodigoVoucher.ClientID %>" class="form-label">Código de Voucher</label>
                        <asp:TextBox ID="txtCodigoVoucher" runat="server" CssClass="form-control form-control-lg" MaxLength="20" Placeholder="Ej: ABC-123-XYZ"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCodigoVoucher"
                            CssClass="text-danger" ErrorMessage="El código es obligatorio." Display="Dynamic" />
                    </div>

                    <div class="d-grid gap-2">
                        <asp:Button ID="btnValidar" runat="server" Text="Validar Código" CssClass="btn btn-primary btn-lg" OnClick="btnValidar_Click" />
                    </div>

                   <asp:Label ID="lblMensaje" runat="server" CssClass="fw-bold"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
