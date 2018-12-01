/*
Universidad O&M
Jhoan Santana 17-MIIN-1-127
María Victoria 17-EIIN-1-017
Seccion:0541
*/

USE [master]
GO
/****** Object:  Database [Instituto]    Script Date: 30/11/2018 4:06:40 p. m. ******/
CREATE DATABASE [Instituto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Instituto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Instituto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Instituto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Instituto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Instituto] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Instituto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Instituto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Instituto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Instituto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Instituto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Instituto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Instituto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Instituto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Instituto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Instituto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Instituto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Instituto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Instituto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Instituto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Instituto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Instituto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Instituto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Instituto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Instituto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Instituto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Instituto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Instituto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Instituto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Instituto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Instituto] SET  MULTI_USER 
GO
ALTER DATABASE [Instituto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Instituto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Instituto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Instituto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Instituto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Instituto] SET QUERY_STORE = OFF
GO
USE [Instituto]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 30/11/2018 4:06:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[IDEstudiantes] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Apellido] [nchar](10) NOT NULL,
	[Telefono] [nchar](10) NULL,
	[Cedula] [nchar](10) NULL,
	[Matricula] [nchar](10) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IDEstudiantes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 30/11/2018 4:06:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[IDFactura] [int] IDENTITY(1,1) NOT NULL,
	[EstudianteID] [int] NOT NULL,
	[ReferenciaFactura] [nchar](10) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Subtotal] [numeric](18, 0) NOT NULL,
	[Itbis] [numeric](18, 0) NOT NULL,
	[Total] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 30/11/2018 4:06:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[IDInscripcion] [int] IDENTITY(1,1) NOT NULL,
	[EstudianteID] [int] NOT NULL,
	[Fecha_Inscripcion] [date] NOT NULL,
	[FacturaID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 30/11/2018 4:06:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[IDPago] [int] IDENTITY(1,1) NOT NULL,
	[FacturaID] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[MontoPagado] [numeric](18, 0) NOT NULL,
	[EstudianteID] [int] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[IDPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (1, N'Alejandro ', N'Gonzalez  ', N'8093203909', N'4093000390', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (2, N'Pedro     ', N'Pujols    ', N'8093203940', N'2039400290', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (3, N'Maria     ', N'Concepcion', N'8092303900', N'2039049400', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (4, N'Jose      ', N'Peralta   ', N'3203984020', N'3202930209', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (5, N'Augusto   ', N'Moncion   ', N'2300390023', N'3940499011', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (6, N'Manolo    ', N'Urena     ', N'8095678989', N'1300093273', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (9, N'Angel     ', N'Medrano   ', N'1803090093', N'0019930029', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (10, N'Miguelina ', N'Pujols    ', N'0982093802', N'0932098230', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (11, N'Rosa      ', N'Ramirez   ', N'0912309840', N'0934023840', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (14, N'Jorge     ', N'Garcia    ', N'1092048104', N'0394029384', N'          ')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiantes], [Nombre], [Apellido], [Telefono], [Cedula], [Matricula]) VALUES (15, N'Daniela   ', N'Durango   ', N'1029309404', N'3203495040', N'          ')
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (1, 1, N'1         ', CAST(N'2018-01-12' AS Date), CAST(80 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (3, 2, N'2         ', CAST(N'2018-01-13' AS Date), CAST(100 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (4, 2, N'3         ', CAST(N'2018-01-14' AS Date), CAST(100 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (6, 3, N'4         ', CAST(N'2018-01-14' AS Date), CAST(120 AS Numeric(18, 0)), CAST(25 AS Numeric(18, 0)), CAST(145 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (7, 4, N'5         ', CAST(N'2018-01-15' AS Date), CAST(300 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(330 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (8, 5, N'6         ', CAST(N'2018-01-17' AS Date), CAST(250 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(280 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (9, 6, N'7         ', CAST(N'2018-01-18' AS Date), CAST(405 AS Numeric(18, 0)), CAST(45 AS Numeric(18, 0)), CAST(450 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (13, 9, N'8         ', CAST(N'2018-01-18' AS Date), CAST(340 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(380 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (14, 10, N'9         ', CAST(N'2018-01-18' AS Date), CAST(202 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(240 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [EstudianteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (15, 11, N'10        ', CAST(N'2018-01-18' AS Date), CAST(301 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), CAST(320 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] ON 
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (3, 2, CAST(N'2018-01-13' AS Date), 3)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (6, 4, CAST(N'2018-01-15' AS Date), 7)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (7, 5, CAST(N'2018-01-17' AS Date), 8)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (8, 6, CAST(N'2018-01-18' AS Date), 9)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (11, 11, CAST(N'2018-01-18' AS Date), 15)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (3, 2, CAST(N'2018-01-13' AS Date), 3)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (4, 2, CAST(N'2018-01-14' AS Date), 4)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (5, 3, CAST(N'2018-01-14' AS Date), 6)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (6, 4, CAST(N'2018-01-15' AS Date), 7)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (7, 5, CAST(N'2018-01-17' AS Date), 8)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (8, 6, CAST(N'2018-01-18' AS Date), 9)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (9, 9, CAST(N'2018-01-18' AS Date), 13)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (10, 10, CAST(N'2018-01-18' AS Date), 14)
GO
INSERT [dbo].[Inscripcion] ([IDInscripcion], [EstudianteID], [Fecha_Inscripcion], [FacturaID]) VALUES (11, 11, CAST(N'2018-01-18' AS Date), 15)
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (1, 1, CAST(N'2018-01-12' AS Date), CAST(100 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (2, 3, CAST(N'2018-01-13' AS Date), CAST(120 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (3, 4, CAST(N'2018-01-14' AS Date), CAST(120 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (4, 6, CAST(N'2018-01-14' AS Date), CAST(145 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (5, 7, CAST(N'2018-01-15' AS Date), CAST(330 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (6, 8, CAST(N'2018-01-17' AS Date), CAST(280 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (7, 9, CAST(N'2018-01-18' AS Date), CAST(450 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (8, 13, CAST(N'2018-01-18' AS Date), CAST(380 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (9, 14, CAST(N'2018-01-18' AS Date), CAST(240 AS Numeric(18, 0)), 10)
GO
INSERT [dbo].[Pagos] ([IDPago], [FacturaID], [Fecha], [MontoPagado], [EstudianteID]) VALUES (10, 15, CAST(N'2018-01-18' AS Date), CAST(320 AS Numeric(18, 0)), 11)
GO
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Paciente] FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([IDEstudiantes])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Factura_Paciente]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Estudiantes] FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([IDEstudiantes])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Estudiantes]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Facturas] FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([IDFactura])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Facturas]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Factura] FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([IDFactura])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Recibo_Factura]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Paciente] FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([IDEstudiantes])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Recibo_Paciente]
GO
USE [master]
GO
ALTER DATABASE [Instituto] SET  READ_WRITE 
GO
