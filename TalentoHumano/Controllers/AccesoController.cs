using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TalentoHumano.Models;
using TalentoHumano.Logica;

namespace TalentoHumano.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string correo, string clave)
        {
            Usuarios usu = new LO_Usuarios().EncontrarUsuario(correo, clave);
            if (usu.Nombre != null)
            {
                FormsAuthentication.SetAuthCookie(usu.Correo, false);
                Session["Usuario"] = usu;

                if (usu.IdRol == TalentoHumano.Models.Roles.Administrador)
                {
                    return RedirectToAction("Index", "Administrador");
                }
                else if (usu.IdRol == TalentoHumano.Models.Roles.Empleado)
                {
                    return RedirectToAction("Index", "Empleado");
                }
                else
                {
                    return RedirectToAction("SinPermiso", "Shared");
                }
            }

            ViewBag.ErrorMessage = "Correo o contraseña incorrecta.";
            return View();
        }

        // Método para cerrar sesión
        public ActionResult CerrarSesion()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index", "Home"); // Redirige a la página de inicio u otra página deseada
        }
    }
}
