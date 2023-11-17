using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LP3TP2
{
    public partial class formulario1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookiePass = Request.Cookies["pass1"];
            labelCookiePass.Text = cookiePass != null ? "La Cookie se ha creado exitosamente" : "Cookie No Registada";

            if (this.Session["username"]!= null)
            {
                labelSession.Text = this.Session["username"].ToString();
            }

        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            //creacion cookie de la contraseña
            HttpCookie cookieContraseña = new HttpCookie("pass1", pass1.Text);
            cookieContraseña.Expires = DateTime.Now.AddSeconds(10);
            Response.Cookies.Add(cookieContraseña);

            //creacion de la session con el nombre
            this.Session["username"] = username.Text;

            //recargamos la Url
            Response.Redirect(Request.RawUrl);

        }
    }
}