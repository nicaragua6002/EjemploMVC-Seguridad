﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EjmeploMVC.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ProyectoTIModelContainer : DbContext
    {
        public ProyectoTIModelContainer()
            : base("name=ProyectoTIModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Equipo> Equipos { get; set; }
        public virtual DbSet<Miembro> Miembros { get; set; }
        public virtual DbSet<Proyecto> Proyectos { get; set; }
        public virtual DbSet<Tarea> Tareas { get; set; }
        public virtual DbSet<Asignacion> Asignaciones { get; set; }
        public virtual DbSet<Comentario> Comentarios { get; set; }
        public virtual DbSet<Valoracion> Valoraciones { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }
    }
}