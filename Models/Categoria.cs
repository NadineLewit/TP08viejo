namespace TP09;
 
public class Categoria
{
    private int _idCategoria;
    private string _nombre;
 
    public int IdCategoria
    {
        get{return _idCategoria;}
        set{_idCategoria = value;}
    }
    public string Nombre
    {
        get{return _nombre;}
        set{_nombre = value;}
    }
}