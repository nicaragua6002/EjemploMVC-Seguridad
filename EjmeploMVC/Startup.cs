
using Microsoft.Owin;
using Owin;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using EjmeploMVC.Models;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;

[assembly: OwinStartupAttribute(typeof(EjmeploMVC.Startup))]
namespace EjmeploMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            CrearRolesUsuarios();
        }

        //Creamos un metodo para crear roles y usuarios
        void CrearRolesUsuarios()
        {
            //Manjadores de Roles y manejador de usuarios
            ApplicationDbContext context = new ApplicationDbContext();
            var ManejadorRol = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var ManejadorUsuario = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            //Definimos cada un de los roles del sistema
            //Establecemos un usuario por defecto para cada rol
            if (!ManejadorRol.RoleExists("Admin"))
            {
                //sino existe, se crea el rol y se asigna un nuevo usuario con ese rol
                var rol = new IdentityRole();
                rol.Name = "Admin"; ManejadorRol.Create(rol);
                
                //creamos un primer usuario para ese rol
                var user = new ApplicationUser(); 
                //LOs parametros del objeto usuario
                user.UserName = "Admin@sistemas.com"; 
                user.Email = "Admin@sistemas.com"; 
                string PWD = "12345678";
                //Se crea el usuario
                var chkUser = ManejadorUsuario.Create(user, PWD);

                //Asignamos el rol al usuario
                //si se creo con exito
                if(chkUser.Succeeded)
                {
                    ManejadorUsuario.AddToRole(user.Id, "Admin");
                }
            }

            //Rol miembro
            if (!ManejadorRol.RoleExists("Miembro"))
            {
                //sino existe, se crea el rol y se asigna un nuevo usuario con ese rol
                var rol = new IdentityRole();
                rol.Name = "Miembro"; ManejadorRol.Create(rol);

                //creamos un primer usuario para ese rol
                var user = new ApplicationUser();
                //LOs parametros del objeto usuario
                user.UserName = "juanprez@yahoo.es";
                user.Email = "juanprez@yahoo.es";
                string PWD = "12345678";
                //Se crea el usuario
                var chkUser = ManejadorUsuario.Create(user, PWD);

                //Asignamos el rol al usuario
                //si se creo con exito
                if (chkUser.Succeeded)
                {
                    ManejadorUsuario.AddToRole(user.Id, "Miembro");
                }
            }

            //Rol Usuario
            if (!ManejadorRol.RoleExists("Usuario"))
            {
                //sino existe, se crea el rol y se asigna un nuevo usuario con ese rol
                var rol = new IdentityRole();
                rol.Name = "Usuario"; ManejadorRol.Create(rol);

                //creamos un primer usuario para ese rol
                var user = new ApplicationUser();
                //LOs parametros del objeto usuario
                user.UserName = "Usuario@Sistemas.com";
                user.Email = "Usuario@Sistemas.com";
                string PWD = "12345678";
                //Se crea el usuario
                var chkUser = ManejadorUsuario.Create(user, PWD);

                //Asignamos el rol al usuario
                //si se creo con exito
                if (chkUser.Succeeded)
                {
                    ManejadorUsuario.AddToRole(user.Id, "Usuario");
                }
            }


        }
    }
}
