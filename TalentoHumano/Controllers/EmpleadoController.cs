using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TalentoHumano.Permisos;

namespace TalentoHumano.Controllers
{
    [Authorize]
    [OverrideAuthentication]
    [PermisosRol(Models.Roles.Empleado)]
    public class EmpleadoController : Controller
    {
        // GET: Vista
        public ActionResult Index()
        {
            return View();
        }
    }
}