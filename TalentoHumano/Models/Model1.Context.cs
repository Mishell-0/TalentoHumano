﻿//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TalentoHumano.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TalentoHumanoEntities : DbContext
    {
        public TalentoHumanoEntities()
            : base("name=TalentoHumanoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<DetalleRolPagos> DetalleRolPagos { get; set; }
        public DbSet<Empleados> Empleados { get; set; }
        public DbSet<RolPagos> RolPagos { get; set; }
    }
}
