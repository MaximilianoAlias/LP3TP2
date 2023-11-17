using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace LP3TP2
{
    public partial class cargaArchivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                //si el valor de username es distinto a nulo entonces obtengo el valor.
                string username = Session["username"].ToString() + "Seleccione 1 o varios archivos para cargar";
                labelUsername.Text = username;

                //si el valor de username es distinto a nulo, habilito los botones.
                FileUpload1.Enabled = true;
                btnSubirArchivos.Enabled = true;
                cargarGrilla();
            }
            else
            {
                // Maneja el caso en el que el valor de la sesión no está disponible
                labelUsername.Text = "Nombre de usuario no disponible - No se permite la carga de Archivos";

                //si el valor de username es nulo, deshabilitar los botones.
                FileUpload1.Enabled = false;
                btnSubirArchivos.Enabled = false;

            }

        }

        public void cargarGrilla()
        {
            string path = $"{Server.MapPath(".")}/carpetaLP3TP2";
            if (Directory.Exists(path))
            {
                string[] archivosSubidos = Directory.GetFiles(path);
                List<Archivo> listaDeArchivosSubidos = new List<Archivo>();
                foreach (string archivos in archivosSubidos)
                {
                    var fileNew = new Archivo(Path.GetFileName(archivos), archivos);
                    listaDeArchivosSubidos.Add(fileNew);
                }
                GridView1.DataSource = listaDeArchivosSubidos;
                GridView1.DataBind();
            }
        }

        protected void btnSubirArchivos_Click(object sender, EventArgs e)
        {
            string path = $"{Server.MapPath(".")}/carpetaLP3TP2";
            string resultado = string.Empty;

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            else
            {
                foreach (HttpPostedFile archivos in FileUpload1.PostedFiles)
                {
                    if (archivos.ContentLength > 0) // Verifica si el archivo tiene contenido
                    {
                        if (archivos.ContentLength > 25480)
                        {
                            resultado += $"El archivo {archivos.FileName} supera los 20KB de tamaño. Error en la carga <br />";
                            labelResultadoError.Text = resultado;
                        }
                        else
                        {
                            if (File.Exists($"{path}/{archivos.FileName}"))
                            {
                                labelResultadoError.Text += $"El archivo {archivos.FileName} Ya existe.-";
                            }
                            else
                            {
                                archivos.SaveAs($"{path}/{archivos.FileName}");
                                labelResultado.Text += $"El archivo {archivos.FileName} se ha cargado de manera exitosa!!";
                                cargarGrilla();

                            }

                        }
                    }
                    else
                    {
                        // No se ha seleccionado ningún archivo
                        labelResultadoError.Text = "Advertencia: Debes seleccionar un archivo antes de intentar cargarlo.";
                    }
                }
            }
        }


        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.Close();

            }
        }
    }
}