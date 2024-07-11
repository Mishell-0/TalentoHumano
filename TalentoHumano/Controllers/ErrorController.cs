using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TalentoHumano.Controllers
{
    public class ErrorController : Controller
    {
        public ActionResult SinPermiso()
        {
            return View();
        }
    }
}