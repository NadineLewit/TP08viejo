namespace TP09;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
 
public class BD
{
    private static string _connectionString = @"Server=A-PHZ2-LUM-17;DataBase=TP08;Trusted_Connection=True";
 
    public static List<Pelicula> ObtenerPeliculas()
    {
        List<Pelicula> lista = new List<Pelicula>();
        string sql = "SELECT * FROM Pelicula";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            lista = db.Query<Pelicula>(sql).ToList();
        }
        return lista;
    }
    public static List<Usuario> ObtenerUsuarios()
    {
        List<Usuario> lista = new List<Usuario>();
        string sql = "SELECT * FROM Usuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            lista = db.Query<Usuario>(sql).ToList();
        }
        return lista;
    }
    public static Categoria ObtenerCategoria(int IdCategoria)
    {
        Categoria categoria = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
        string sql = "SELECT * FROM Categoria WHERE IdCategoria = @pIdCategoria";
            categoria = db.QueryFirstOrDefault<Categoria>(sql, new { pIdCategoria = IdCategoria});
        }
        return categoria;
    }
 
    public static  List<Reseña> ObtenerReseñas()
    {
        List<Reseña> lista = new List<Reseña>();
        string sql = "SELECT Reseña.Contenido, Reseña.FkUsuario, Reseña.FkPelicula, Usuario.Nombre as NombreUsuario FROM Reseña inner join Usuario on Reseña.FkUsuario = Usuario.IdUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            lista = db.Query<Reseña>(sql).ToList();
        }
        return lista;
    }
 
    public static  List<Categoria> ObtenerCategoria()
    {
        List<Categoria> lista = new List<Categoria>();
        string sql = "SELECT * FROM Categoria";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            lista = db.Query<Categoria>(sql).ToList();
        }
        return lista;
    }
 
    public static void AgregarPelicula(Pelicula Peli)
    {
        string sql = "INSERT INTO Pelicula VALUES (@pNombre, @pFoto, @pDescripcion, @pEstrellas, @pFkCategoria)";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {pNombre = Peli.Nombre, pFoto = Peli.Foto, pDescripcion = Peli.Descripcion, pEstrellas = Peli.Estrellas, pFkCategoria = Peli.FkCategoria });
        }
    }
 
    public static void AgregarReseña(Reseña res)
    {
        string sql = "INSERT INTO Reseña VALUES (@pContenido, @pFkUsuario, @pFkPelicula, @pNombreUsuario)";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new { pContenido = res.Contenido, pFkUsuario = res.FkUsuario, pFkPelicula = res.FkPelicula, pNombreUsuario = res.NombreUsuario});
        }
    }
 
    public static void EliminarReseñas(int FkPelicula)
    {
        int RegistrosEliminados = 0;
        string sql = "DELETE FROM Reseña WHERE FkPelicula = @pFkPelicula ";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            RegistrosEliminados = db.Execute(sql, new { pFkPelicula = FkPelicula});
        }
    }
    public static void EliminarPelicula(int IdPelicula)
    {
        int RegistrosEliminados = 0;
        string sql = "DELETE FROM Pelicula WHERE IdPelicula = @pIdPelicula ";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            RegistrosEliminados = db.Execute(sql, new { pIdPelicula = IdPelicula});
        }
    }
    public static Pelicula VerInfoPelicula(int IdPelicula)
    {
        Pelicula peli = null;
        string sql = "SELECT Pelicula.*, Categoria.Nombre as NombreCategoria FROM Pelicula inner join Categoria on Pelicula.FkCategoria = Categoria.IdCategoria WHERE IdPelicula = @pIdPelicula ";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            peli = db.QueryFirstOrDefault<Pelicula>(sql, new { pIdPelicula = IdPelicula});
        }
        return peli;
    }
    public static void AgregarUsuario(string nombre)
    {
        string sql = "INSERT INTO Usuario VALUES (@pNombre)";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new { pNombre = nombre});
        }
    }
}