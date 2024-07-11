using System.Linq;
using System.Web.Mvc;
using TalentoHumano.Models;
using TalentoHumano.Permisos;

namespace TalentoHumano.Controllers
{
    [Authorize]
    [OverrideAuthentication]
    [PermisosRol(Models.Roles.Administrador)]
    public class AdministradorController : Controller
    {
        private TalentoHumanoEntities db = new TalentoHumanoEntities();

        // GET: Empleado
        public ActionResult Index()
        {
            var empleados = db.Empleados.ToList();
            return View(empleados);
        }

        // GET: Empleado/Details/5
        public ActionResult Details(int id)
        {
            var empleado = db.Empleados.FirstOrDefault(x => x.idEmpleados == id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // GET: Empleado/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Empleado/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Empleados.Add(empleados);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(empleados);
        }

        // GET: Empleado/Edit/5
        public ActionResult Edit(int id)
        {
            var empleado = db.Empleados.FirstOrDefault(x => x.idEmpleados == id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // POST: Empleado/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleados).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(empleados);
        }

        // GET: Empleado/Delete/5
        public ActionResult Delete(int id)
        {
            var empleado = db.Empleados.FirstOrDefault(x => x.idEmpleados == id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // POST: Empleado/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var empleado = db.Empleados.FirstOrDefault(x => x.idEmpleados == id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            db.Empleados.Remove(empleado);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        // GET: Empleado/CambiarEstado/5
        public ActionResult CambiarEstado(int id)
        {
            var empleado = db.Empleados.FirstOrDefault(x => x.idEmpleados == id);
            if (empleado == null)
            {
                return HttpNotFound();
            }

            // Cambiar el estado inverso (si está activo pasa a inactivo, y viceversa)
            empleado.Estado = !empleado.Estado;

            db.Entry(empleado).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult RolPagos()
        {
            var empleados = db.Empleados.ToList();
            ViewBag.Empleados = new SelectList(empleados, "idEmpleados", "Nombres");
            return View();
        }

        [HttpPost]
        public ActionResult RolPagos(int id)
        {
            var empleado = db.Empleados.FirstOrDefault(e => e.idEmpleados == id);
            if (empleado == null)
            {
                return HttpNotFound();
            }

            ViewBag.Empleados = new SelectList(db.Empleados.ToList(), "idEmpleados", "Nombres");
            return View(empleado);
        }

    }
}
