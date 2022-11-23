namespace TP08;
 
public class Reseña
{
    private int _IdReseña;
    private string _Contenido;
    private string _NombreUsuario;
    private int _FkUsuario;
    private int _FkPelicula;
 
    public int IdReseña
    {
        get{return _IdReseña;}
        set{_IdReseña = value;}
    }
    public string Contenido
    {
        get{return _Contenido;}
        set{_Contenido = value;}
    }
    public int FkUsuario
    {
        get{return _FkUsuario;}
        set{_FkUsuario = value;}
    }
    public int FkPelicula
    {
        get{return _FkPelicula;}
        set{_FkPelicula = value;}
    }
    public string NombreUsuario
    {
        get{return _NombreUsuario;}
        set{_NombreUsuario = value;}
    }
}