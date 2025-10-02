<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="verArticulo.aspx.cs" Inherits="PromoWeb.verArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> <!--Contenido no visible (Links, Scripts, Tags) -->
   
    <link href="Content/estilos.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> <!--Contenido visible del body (Diseño General)-->
   
    <h2>ELIGE TU PREMIO!!! </h2>
    <div class="imagenes-articulos">
        <asp:Repeater ID="rptArticulos" runat="server" OnItemCommand="rptArticulos_ItemCommand">
            <ItemTemplate>
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title mb-3 nombre-articulo"><%# Eval("Nombre") %></h3>

                        <div class="row">
                            <asp:Repeater ID="rptImagenes" runat="server"
                                DataSource='<%# DataBinder.Eval(Container.DataItem, "Imagenes") %>'>
                                <ItemTemplate>
                                    <div class="col-6 col-md-4 col-lg-3 mb-3">

                                        <img src='<%# ResolveUrl(Eval("UrlImagen").ToString()) %>'
                                            alt="Imagen del artículo"
                                            class="imagen-producto"
                                            onerror="this.src='https://redthread.uoregon.edu/files/original/affd16fd5264cab9197da4cd1a996f820e601ee4.png';" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- boton para elegir el premio -->
                        <asp:Button ID="btnElegirPremio" runat="server"
                            Text="Elegir premio"
                            CssClass="btn btn-primary mt-3"
                            CommandName="ElegirPremio"
                            CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
