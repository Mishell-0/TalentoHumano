using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TalentoHumano.Models;

namespace TalentoHumano.Permisos
{
    public class PermisosRolAttribute : ActionFilterAttribute
    {

        private Roles idrol;

        public PermisosRolAttribute(Roles _idrol)
        {
            idrol = _idrol;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            if (HttpContext.Current.Session["Usuario"] != null)
            {

                Usuarios usuarios = HttpContext.Current.Session["Usuario"] as Usuarios;

                if (usuarios.IdRol !=this.idrol)
                {
                    filterContext.Result = new RedirectResult("~/Home/SinPermiso");
                }

                base.OnActionExecuting(filterContext);
            }
        }
    }
}