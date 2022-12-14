USE [master]
GO
/****** Object:  Database [TP08]    Script Date: 22/11/2022 20:35:20 ******/
CREATE DATABASE [TP08]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP08', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TP08.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP08_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TP08_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP08] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP08].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP08] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP08] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP08] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP08] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP08] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP08] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP08] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP08] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP08] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP08] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP08] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP08] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP08] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP08] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP08] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP08] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP08] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP08] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP08] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP08] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP08] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP08] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP08] SET RECOVERY FULL 
GO
ALTER DATABASE [TP08] SET  MULTI_USER 
GO
ALTER DATABASE [TP08] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP08] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP08] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP08] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP08] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP08] SET QUERY_STORE = OFF
GO
USE [TP08]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 22/11/2022 20:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 22/11/2022 20:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[IdPelicula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](max) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Estrellas] [int] NOT NULL,
	[FkCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseña]    Script Date: 22/11/2022 20:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseña](
	[IdReseña] [int] IDENTITY(1,1) NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](50) NULL,
	[FkUsuario] [int] NOT NULL,
	[FkPelicula] [int] NOT NULL,
 CONSTRAINT [PK_Reseña] PRIMARY KEY CLUSTERED 
(
	[IdReseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/11/2022 20:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Terror')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Comedia')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Romance')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Drama')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Acción')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (6, N'Suspenso')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (7, N'Ciencia ficcion')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 

INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (8, N'Toy Story 3', N'https://img.remediosdigitales.com/2a03d7/toy-story-3/450_1000.jpg', N'Woody (Tom Hanks), Buzz (Tim Allen) y el resto de los juguetes terminan en una guardería luego de que Andy se va al colegio.', 3, 2)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (11, N'Cars 2', N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/577D3897AA79929283F846D284C2413411096F842EB4EEF7E781CAA887169A1F/scale?width=1200&aspectRatio=1.78&format=jpeg', N'De camino al prestigiado campeonato Copa Pistón, un automóvil de carreras que sólo se preocupa por ganar aprende sobre lo que realmente es importante en la vida de varios vehículos que viven en un pueblo a lo largo de la histórica Ruta 66.', 3, 2)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (13, N'Titanic', N'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/hc_1440x810/public/media/image/2022/01/titanic-2577593.jpg?itok=pPjwlyds', N'Una joven de la alta sociedad abandona a su arrogante pretendiente por un artista humilde en el trasatlántico que se hundió durante su viaje inaugural.', 5, 3)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (15, N'Cars 3', N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/9DAC415069DB9B3B3A45AEA72D8C21D4706369AF755E01024116D0E167CECE14/scale?width=1200&aspectRatio=1.78&format=jpeg', N'Eclipsado por los autos jóvenes, el veterano Rayo McQueen ha sido expulsado del deporte que tanto ama. Sin embargo, no se rendirá tan fácilmente, con la ayuda de sus amigos, Rayo aprende trucos nuevos para vencer al arrogante Jackson Storm, el rival que lo humilló.', 1, 5)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (16, N'Kung Fu Panda', N'https://i.blogs.es/621217/kung-fu-panda-3-poster/1366_2000.jpg', N'El panda Po trabaja en la tienda de fideos de su familia y sueña en convertirse en un maestro del kung-fu. Su sueño se hace una realidad cuando es inesperadamente elegido para cumplir una antigua profecía y debe estudiar artes marciales con sus ídolos, los Cinco Furiosos', 5, 5)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (17, N'Iron Man', N'https://i.blogs.es/7ccbec/iron-man/1366_2000.jpg', N'Iron Man (titulada Iron Man: el hombre de hierro en Hispanoamérica) es una película de superhéroes. Es la primera entrega del Universo cinematográfico de Marvel. La cinta fue dirigida por Jon Favreau, con un guion de Stan Lee, Hawk Ostby, Art Marcum y Matt Holloway.', 5, 2)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (18, N'Avengers: Endgame', N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/A4B58B11C7019B5403E07D551249121C4F4CC99119907F4460F0725B34A27086/scale?width=1200&aspectRatio=1.78&format=jpeg', N'Los Vengadores restantes deben encontrar una manera de recuperar a sus aliados para un enfrentamiento épico con Thanos, el malvado que diezmó el planeta y el universo.', 5, 5)
INSERT [dbo].[Pelicula] ([IdPelicula], [Nombre], [Foto], [Descripcion], [Estrellas], [FkCategoria]) VALUES (19, N'Cars', N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/E8AE6930B0A452C2FB77C15CFC0F5C0AE3C0FED690FED059698C650B11EA6BFF/scale?width=1200&aspectRatio=1.78&format=jpeg', N'De camino al prestigiado campeonato Copa Pistón, un automóvil de carreras que sólo se preocupa por ganar aprende sobre lo que realmente es importante en la vida de varios vehículos que viven en un pueblo a lo largo de la histórica Ruta 66.', 4, 2)
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Reseña] ON 

INSERT [dbo].[Reseña] ([IdReseña], [Contenido], [NombreUsuario], [FkUsuario], [FkPelicula]) VALUES (29, N'muy buena esta', NULL, 44, 8)
SET IDENTITY_INSERT [dbo].[Reseña] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (1, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (2, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (3, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (4, N'pepe')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (5, N'pepe')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (6, N'Jana')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (7, N'pepe')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (8, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (9, N'Uriel')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (10, N'MARIANA')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (11, N'Javier')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (12, N'a')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (13, N'Shrek')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (14, N'Urieñ')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (15, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (16, N'pepe')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (17, N'Mario')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (18, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (19, N'Cars')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (20, N'a')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (21, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (22, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (23, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (24, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (25, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (26, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (27, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (28, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (29, N'nau')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (30, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (31, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (32, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (33, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (34, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (35, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (36, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (37, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (38, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (39, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (40, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (41, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (42, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (43, N'Shrek')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (44, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (45, N'juli')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (46, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (47, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (48, N'Shrek')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (49, N'Shrek')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (50, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (51, N'Juliana')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (52, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (53, N'nadu')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (54, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (55, N'Lionel Messi')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (56, N'Cars 2')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre]) VALUES (57, N'nadu')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Categoria] FOREIGN KEY([FkCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Categoria]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Pelicula] FOREIGN KEY([FkPelicula])
REFERENCES [dbo].[Pelicula] ([IdPelicula])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Pelicula]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Usuario] FOREIGN KEY([FkUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Usuario]
GO
USE [master]
GO
ALTER DATABASE [TP08] SET  READ_WRITE 
GO
