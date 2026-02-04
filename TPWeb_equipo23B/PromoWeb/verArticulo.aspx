<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="verArticulo.aspx.cs" Inherits="PromoWeb.verArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--Contenido no visible (Links, Scripts, Tags) -->

    <link href="Content/estilos.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Contenido visible del body (Diseño General)-->


    <h2 class="titulo-premio">¡Elige tu premio! </h2>
    <div class="imagenes-articulos">
        <asp:Repeater ID="rptArticulos" runat="server" OnItemCommand="rptArticulos_ItemCommand">
            <ItemTemplate>
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title mb-3 nombre-articulo"><%# Eval("Nombre") %></h3>

                        <div id="carouselArticulo_<%# Eval("Id") %>"
                            class="carousel slide">

                            <div class="carousel-inner">
                                <asp:Repeater ID="rptImagenes" runat="server"
                                    DataSource='<%# DataBinder.Eval(Container.DataItem, "Imagenes") %>'>
                                    <ItemTemplate>
                                        <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                                            <img src='<%# ResolveUrl(Eval("UrlImagen").ToString()) %>'
                                                class="d-block w-100 imagen-producto"
                                                alt="Imagen del artículo"
                                                onerror="this.src='https://redthread.uoregon.edu/files/original/affd16fd5264cab9197da4cd1a996f820e601ee4.png';" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <!-- flechas -->
                            <button class="carousel-control-prev" type="button"
                                data-bs-target="#carouselArticulo_<%# Eval("Id") %>" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </button>

                            <button class="carousel-control-next" type="button"
                                data-bs-target="#carouselArticulo_<%# Eval("Id") %>" data-bs-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </button>
                        </div>


                        <p class="descripcion-articulo mb-3 descripcion-articulo">
                            <%# Eval("Descripcion") %>
                        </p>
                        <!-- boton para elegir el premio -->
                        <asp:Button ID="btnElegirPremio" runat="server"
                            Text="Seleccionar"
                            CssClass="btn btn-primary mt-3"
                            CommandName="ElegirPremio"
                            CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
