using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using TalentoHumano.Models;
using System.Data.SqlClient;
using System.Data;
using System.Net.NetworkInformation;

namespace TalentoHumano.Logica
{
    public class LO_Usuarios
    {
        public Usuarios EncontrarUsuario(string correo, string clave)
        {
            Usuarios usuarios = new Usuarios();

            using (SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-EO2LGQ3\\SQLEXPRESS; Initial Catalog=TalentoHumano; User ID=sa; Password=12345"))
            {
                string query = "select Nombres,Correo,Clave,IdRol from Usuarios where Correo = @pcorreo and Clave = @pclave";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@pcorreo", correo);
                cmd.Parameters.AddWithValue("@pclave", clave);
                cmd.CommandType = CommandType.Text;

                conexion.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        usuarios = new Usuarios()
                        {
                            Nombre = dr["Nombres"].ToString(),
                            Correo = dr["Correo"].ToString(),
                            Clave = dr["Clave"].ToString(),
                            IdRol = (Roles) dr["IdRol"],
                        };
                    }
                }





                return usuarios;
            }

        }
    }
}