<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="formulario1.aspx.cs" Inherits="LP3TP2.formulario1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="tituloFormulario1">
      <h1>Formulario 1 - Registracion</h1>
        <h2>Session Iniciada por: <asp:Label ID="labelSession" runat="server" Text=""></asp:Label></h2>
                <h2><asp:Label ID="labelCookiePass" runat="server" Text=""></asp:Label></h2>

    </div>

    <div class="cuerpoDelFormulario1">

        <asp:Label ID="label1" runat="server" Text="Enter your email: "></asp:Label><br />
        <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="El campo email es obligatorio" ControlToValidate="email" ForeColor="Red" Display="None"></asp:RequiredFieldValidator><br /><br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El formato ingresado de email no es válido" ControlToValidate="email" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="None"></asp:RegularExpressionValidator>
        
        <asp:Label ID="label2" runat="server" Text="Usermane: "></asp:Label><br />
        <asp:TextBox ID="username" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo Username es obligatorio" ControlToValidate="username" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <br /><br />
        
        <asp:Label ID="label3" runat="server" Text="Enter your age: "></asp:Label><br />
        <asp:TextBox ID="edad" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo edad es obligatorio" ControlToValidate="edad" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="La edad debe ser mayor a 15 años y los caracteres ingresados deben ser números enteros" MaximumValue="99" MinimumValue="15" ControlToValidate="edad" ForeColor="Red" Type="Integer" Display="None"></asp:RangeValidator>

        <br /><br />

        <asp:Label ID="label4" runat="server" Text="Enter your password"></asp:Label><br />
        <asp:TextBox ID="pass1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo de contraseña es obligatorio" ControlToValidate="pass1" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <br /><br />

        <asp:Label ID="label5" runat="server" Text="Repeat yout password"></asp:Label><br />
        <asp:TextBox ID="pass2" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las Contraseñas deben ser iguales" ControlToCompare="pass1" ControlToValidate="pass2" ForeColor="Red" Display="None"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo de repetir contraseña es obligatorio" ControlToValidate="pass2" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <br /><br />

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        <asp:Button ID="btnRegistrarUsuario" runat="server" Text="Registrar" OnClick="btnRegistrarUsuario_Click" /> <br /><br />
    </div>


</asp:Content>
