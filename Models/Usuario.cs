namespace TP09;
 
public class Usuario
{
    private int _idUsuario;
    private string _nombre;
 
    public int IdUsuario
    {
        get{return _idUsuario;}
        set{_idUsuario= value;}
    }
    public string Nombre
    {
        get{return _nombre;}
        set{_nombre= value;}
    }
}