using System.Web.Mvc;
using System;
using TalentoHumano.Models;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using Rotativa;
using TalentoHumano.Permisos;

namespace TalentoHumano.Controllers
{
    [Authorize]
    [OverrideAuthentication]
    [PermisosRol(Roles.Administrador)]
    public class RolPagosController : Controller
    {
        private TalentoHumanoEntities db = new TalentoHumanoEntities();

        // GET: RolPagos/Create
        public ActionResult Create()
        {
            ViewBag.idEmpleado = new SelectList(db.Empleados, "idEmpleados", "Nombres");
            return View();
        }

        // POST: RolPagos/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(RolPagos rolPagos)
        {
            if (ModelState.IsValid)
            {
                Empleados empleado = db.Empleados.Find(rolPagos.idEmpleado);

                if (empleado != null)
                {
                    decimal nuevoSueldo = empleado.Sueldo;
                    decimal nuevaHoras = empleado.HorasSuplementarias;
                    decimal nuevaBonificacion = empleado.Bonificaciones;
                    decimal nuevoFondo = empleado.FondoReserva;
                    decimal nuevaAlimentacion = empleado.Alimentacion;
                    decimal nuevosIngresos = empleado.OtrosIngresos;
                    decimal nuevoAporte = empleado.AportacionIESS ?? 0;
                    decimal nuevoDescuentoAtraso = empleado.descuentoAtrasos ?? 0;
                    decimal nuevoImpuesto = empleado.ImpuestoRenta ?? 0;
                    decimal nuevoPrestamoQuirografario = empleado.PrestamoQuirografario ?? 0;
                    decimal nuevoPrestamoHipotecario = empleado.PrestamoHipotecario ?? 0;
                    decimal nuevoAnticipos = empleado.Anticipos ?? 0;
                    decimal nuevosDescuentos = empleado.OtrosDescuentos ?? 0;

                    decimal subIngresos = empleado.Sueldo +
                                          empleado.HorasSuplementarias +
                                          empleado.Bonificaciones +
                                          empleado.FondoReserva +
                                          empleado.Alimentacion +
                                          empleado.OtrosIngresos;

                    decimal subDescuentos = (empleado.AportacionIESS ?? 0) +
                                            (empleado.descuentoAtrasos ?? 0) +
                                            (empleado.ImpuestoRenta ?? 0) +
                                            (empleado.PrestamoQuirografario ?? 0) +
                                            (empleado.PrestamoHipotecario ?? 0) +
                                            (empleado.Anticipos ?? 0) +
                                            (empleado.OtrosDescuentos ?? 0);

                    decimal totalARecibir = subIngresos - subDescuentos;

                    rolPagos.Fecha = DateTime.Now;
                    db.RolPagos.Add(rolPagos);
                    db.SaveChanges();

                    DetalleRolPagos detalleRolPagos = new DetalleRolPagos
                    {
                        idRolPagos = rolPagos.idRolPagos,
                        idEmpleado = empleado.idEmpleados,
                        Sueldo = nuevoSueldo,
                        HorasSuplementarias = nuevaHoras,
                        Bonificaciones = nuevaBonificacion,
                        FondoReserva = nuevoFondo,
                        Alimentacion = nuevaAlimentacion,
                        OtrosIngresos = nuevosIngresos,
                        AportacionIESS = nuevoAporte,
                        DescuentoAtrasos = nuevoDescuentoAtraso,
                        ImpuestoRenta = nuevoImpuesto,
                        PrestamoQuirografario = nuevoPrestamoQuirografario,
                        PrestamoHipotecario = nuevoPrestamoHipotecario,
                        Anticipos = nuevoAnticipos,
                        OtrosDescuentos = nuevosDescuentos,
                        SubIngresos = subIngresos,
                        SubDescuentos = subDescuentos,
                        TotalIngresos = totalARecibir
                    };
                    db.DetalleRolPagos.Add(detalleRolPagos);
                    db.SaveChanges();

                    return RedirectToAction("Index", "RolPagos");
                }
                else
                {
                    ModelState.AddModelError("", "Empleado no encontrado.");
                }
            }

            ViewBag.idEmpleado = new SelectList(db.Empleados, "idEmpleados", "Nombres", rolPagos.idEmpleado);
            return View(rolPagos);
        }

        // GET: RolPagos/GetEmpleadoDetails
        public ActionResult GetEmpleadoDetails(int id)
        {
            var empleado = db.Empleados.Find(id);
            var nuevoSueldo = empleado.Sueldo;
            var nuevaHoras = empleado.HorasSuplementarias;
            var nuevaBonificacion = empleado.Bonificaciones;
            var nuevoFondo = empleado.FondoReserva;
            var nuevaAlimentacion = empleado.Alimentacion;
            var nuevosIngresos = empleado.OtrosIngresos;
            var nuevoAporte = empleado.AportacionIESS;
            var nuevoDescuentoAtraso = empleado.descuentoAtrasos;
            var nuevoImpuesto = empleado.ImpuestoRenta;
            var nuevoPrestamoQuirografario = empleado.PrestamoQuirografario;
            var nuevoPrestamoHipotecario = empleado.PrestamoHipotecario;
            var nuevoAnticipos = empleado.Anticipos;
            var nuevosDescuentos = empleado.OtrosDescuentos;

            if (empleado == null)
            {
                return HttpNotFound();
            }
            return Json(new
            {
                Nombres = empleado.Nombres,
                Cargo = empleado.Cargo,

                Sueldo = nuevoSueldo,
                HorasSuplementarias = nuevaHoras,
                Bonificaciones = nuevaBonificacion,
                FondoReserva = nuevoFondo,
                Alimentacion = nuevaAlimentacion,
                OtrosIngresos = nuevosIngresos,
                AportacionIESS = nuevoAporte,
                descuentoAtrasos = nuevoDescuentoAtraso,
                ImpuestoRenta = nuevoImpuesto,
                PrestamoQuirografario = nuevoPrestamoQuirografario,
                PrestamoHipotecario = nuevoPrestamoHipotecario,
                Anticipos = nuevoAnticipos,
                OtrosDescuentos = nuevosDescuentos
            }, JsonRequestBehavior.AllowGet);
        }

        // GET: RolPagos/Index
        public ActionResult Index()
        {
            var rolPagos = db.RolPagos.Include(r => r.Empleados).ToList();
            return View(rolPagos);
        }
    }

    public class DetalleRolPagosController : Controller
    {
        private TalentoHumanoEntities db = new TalentoHumanoEntities();

        // GET: DetalleRolPagos/Index
        public ActionResult Index()
        {
            var detalleRolPagos = db.DetalleRolPagos.Include(d => d.Empleados).Include(d => d.RolPagos).ToList();
            return View(detalleRolPagos);
        }

        // GET: DetalleRolPagos/Create
        public ActionResult Create()
        {
            var modeloRolPagos = new RolPagos();
            modeloRolPagos.Empleados = new Empleados();

            ViewBag.idEmpleado = new SelectList(db.Empleados, "idEmpleados", "Nombres");
            ViewBag.idRolPagos = new SelectList(db.RolPagos, "idRolPagos", "Fecha");

            return View(modeloRolPagos);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(RolPagos rolPagos)
        {
            if (ModelState.IsValid)
            {
                rolPagos.Fecha = DateTime.Now;
                Empleados empleado = db.Empleados.Find(rolPagos.idEmpleado);

                if (empleado != null)
                {
                    decimal SueldoNuevo = empleado.Sueldo;

                    // Calcular subIngresos y subDescuentos
                    decimal subIngresos = empleado.Sueldo +
                                          empleado.HorasSuplementarias +
                                          empleado.Bonificaciones +
                                          empleado.FondoReserva +
                                          empleado.Alimentacion +
                                          empleado.OtrosIngresos;

                    decimal subDescuentos = (empleado.AportacionIESS ?? 0) +
                                            (empleado.descuentoAtrasos ?? 0) +
                                            (empleado.ImpuestoRenta ?? 0) +
                                            (empleado.PrestamoQuirografario ?? 0) +
                                            (empleado.PrestamoHipotecario ?? 0) +
                                            (empleado.Anticipos ?? 0) +
                                            (empleado.OtrosDescuentos ?? 0);

                    // Calcular total a recibir
                    decimal totalARecibir = subIngresos - subDescuentos;

                    // Crear y guardar el rol de pagos
                    rolPagos.Fecha = DateTime.Now;
                    db.RolPagos.Add(rolPagos);
                    db.SaveChanges();

                    // Guardar en la tabla DetalleRolPagos
                    DetalleRolPagos detalleRolPagos = new DetalleRolPagos
                    {
                        idRolPagos = rolPagos.idRolPagos,
                        idEmpleado = empleado.idEmpleados,
                        Sueldo = SueldoNuevo,
                        SubIngresos = subIngresos,
                        SubDescuentos = subDescuentos,
                        TotalIngresos = totalARecibir
                    };
                    db.DetalleRolPagos.Add(detalleRolPagos);
                    db.SaveChanges();

                    return RedirectToAction("Index", "RolPagos");
                }
                else
                {
                    ModelState.AddModelError("", "Empleado no encontrado.");
                }
            }

            ViewBag.idEmpleado = new SelectList(db.Empleados, "idEmpleados", "Nombres", rolPagos.idEmpleado);
            return View(rolPagos);
        }




        public ActionResult GetEmpleadoDetails(int id)
        {
            var empleado = db.Empleados.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return Json(new
            {
                Nombres = empleado.Nombres,
                Cargo = empleado.Cargo,
                Sueldo = empleado.Sueldo,
                HorasSuplementarias = empleado.HorasSuplementarias,
                Bonificaciones = empleado.Bonificaciones,
                FondoReserva = empleado.FondoReserva,
                Alimentacion = empleado.Alimentacion,
                OtrosIngresos = empleado.OtrosIngresos,
                AportacionIESS = empleado.AportacionIESS,
                descuentoAtrasos = empleado.descuentoAtrasos,
                ImpuestoRenta = empleado.ImpuestoRenta,
                PrestamoQuirografario = empleado.PrestamoQuirografario,
                PrestamoHipotecario = empleado.PrestamoHipotecario,
                Anticipos = empleado.Anticipos,
                OtrosDescuentos = empleado.OtrosDescuentos
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Details(int id)
        {
            // Cargar el detalle del rol de pagos con el ID especificado
            var detalleRolPagos = db.DetalleRolPagos
                                    .Include("Empleados")
                                    .Include("RolPagos")
                                    .FirstOrDefault(d => d.idDetalleRolPagos == id);

            if (detalleRolPagos == null)
            {
                return HttpNotFound();
            }

            return View(detalleRolPagos);
        }
        public ActionResult GenerarPDF(int id)
        {
            var rol = db.DetalleRolPagos
                        .Include(r => r.RolPagos)
                        .Include(r => r.Empleados)
                        .FirstOrDefault(r => r.idDetalleRolPagos == id);

            if (rol == null)
            {
                return HttpNotFound();
            }

            return new ViewAsPdf("GenerarPDF", rol)
            {
                FileName = "Roles.pdf"
            };
        }


        // GET: DetalleRolPagos/Delete/5
        // GET: DetalleRolPagos/Delete/5
        public ActionResult Delete(int id)
        {
            // Buscar el detalle de rol de pagos por su id
            var detalleRolPagos = db.DetalleRolPagos.FirstOrDefault(x => x.idDetalleRolPagos == id);

            if (detalleRolPagos == null)
            {
                return HttpNotFound();
            }

            // Puedes acceder al rol de pagos asociado desde el detalle de rol de pagos si la relación está configurada
            var rolPagosId = detalleRolPagos.idRolPagos;

            // Buscar el rol de pagos principal por su id
            var rolPagos = db.RolPagos.FirstOrDefault(x => x.idRolPagos == rolPagosId);

            if (rolPagos == null)
            {
                return HttpNotFound();
            }

            // Eliminar el detalle de rol de pagos
            db.DetalleRolPagos.Remove(detalleRolPagos);

            // Eliminar el rol de pagos principal
            db.RolPagos.Remove(rolPagos);

            // Guardar los cambios en la base de datos
            db.SaveChanges();

            return RedirectToAction("Index", "RolPagos"); // Redirigir a la vista de índice de RolPagos después de la eliminación
        }

        // POST: DetalleRolPagos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            // Primero, busca el registro en la tabla DetalleRolPagos
            var detalleRolPago = db.DetalleRolPagos.FirstOrDefault(x => x.idDetalleRolPagos == id);
            if (detalleRolPago == null)
            {
                return HttpNotFound();
            }

            // Obtener el idRolPagos relacionado
            var idRolPagos = detalleRolPago.idRolPagos;

            // Eliminar el detalle del rol de pagos
            db.DetalleRolPagos.Remove(detalleRolPago);

            // Buscar si hay más detalles para el mismo idRolPagos
            var otrosDetalles = db.DetalleRolPagos.Any(x => x.idRolPagos == idRolPagos);

            // Si no hay más detalles, eliminar el registro de RolPagos
            if (!otrosDetalles)
            {
                var rolPago = db.RolPagos.FirstOrDefault(x => x.idRolPagos == idRolPagos);
                if (rolPago != null)
                {
                    db.RolPagos.Remove(rolPago);
                }
            }

            // Guardar los cambios en la base de datos
            db.SaveChanges();

            return RedirectToAction("Index", "RolPagos");
        }



    }
}