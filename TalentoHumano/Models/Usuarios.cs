using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TalentoHumano.Models
{
    public class Usuarios
    {
        public String Nombre { get; set; }
        public String Correo { get; set; }
        public String Clave { get; set; }
        public Roles IdRol { get; set; }
    }
}