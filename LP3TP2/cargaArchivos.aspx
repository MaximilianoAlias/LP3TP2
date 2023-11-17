<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="cargaArchivos.aspx.cs" Inherits="LP3TP2.cargaArchivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulosCargaArchivos">
    <h1>Formulario 2 - Carga de archivos</h1>
    <h2>Session iniciada por: <asp:Label ID="labelUsername" runat="server" Text=""></asp:Label></h2>
    </div>

    <div class="bodyCargaArchivos">

        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" /><br />
        <br />
        <br />
        <asp:Label ID="labelResultadoError" runat="server" Text="" ForeColor="Red" ></asp:Label><br />
        <br />
        <asp:Button ID="btnSubirArchivos" runat="server" Text="Subir Archivos" OnClick="btnSubirArchivos_Click" /><br />
        <br />
        <asp:Label ID="labelResultado" runat="server" Text="" ForeColor="GreenYellow" ></asp:Label>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:ButtonField CommandName="Descargar" Text="Descargar" ButtonType="Button"></asp:ButtonField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
