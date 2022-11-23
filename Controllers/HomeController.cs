using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP08.Models;
 
namespace TP08.Controllers;
 
public class HomeController : Controller
{
    static int UltimoId;
    private readonly ILogger<HomeController> _logger;
 
    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
 
    public IActionResult Index()
    {
        return View();
    }
 
   
    public IActionResult PonerUsuario()
    {
        return View("FormUsuario");
    }
 
    [HttpPost]
    public IActionResult GuardarUsuario(string nombre)
    {
        BD.AgregarUsuario(nombre);
        List<Usuario> usuarios = BD.ObtenerUsuarios();
        UltimoId = usuarios.Last().IdUsuario;
        //UltimoId = usuarios[usuarios.Length-1].IdUsuario;
        return RedirectToAction("Home");
    }
 
    public IActionResult Home()
    {
        ViewBag.Peliculas = BD.ObtenerPeliculas();
        return View();
    }
 
    public IActionResult VerInfoPelicula(int IdPelicula)
    {
        ViewBag.InfoPelicula = BD.VerInfoPelicula(IdPelicula);
        ViewBag.FkUsuario = UltimoId;
        ViewBag.IdPelicula = IdPelicula;
        ViewBag.Reseña = BD.ObtenerReseñas();
        return View("InfoPelicula");
    }
 
    public IActionResult AgregarPelicula(int IdPelicula)
    {
        ViewBag.IdPelicula = IdPelicula;
        ViewBag.Categorias = BD.ObtenerCategoria();
        return View("FormPelicula");
    }
 
    [HttpPost]
    public IActionResult AgregarReseña(Reseña res)
    {
        BD.AgregarReseña(res);
        ViewBag.FkUsuario = res.FkUsuario;
        ViewBag.FkPelicula = res.FkPelicula;
        return RedirectToAction ("VerInfoPelicula", new {IdPelicula = res.FkPelicula});
    }
 
    public IActionResult EliminarPelicula(int IdPelicula)
    {

        BD.EliminarReseñas(IdPelicula);
        BD.EliminarPelicula(IdPelicula);
        return RedirectToAction("Home");
    }
 
    [HttpPost]
    public IActionResult GuardarPelicula(Pelicula Peli)
    {
        BD.AgregarPelicula(Peli);
        return RedirectToAction("Home");
    }
 
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

