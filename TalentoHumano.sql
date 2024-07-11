USE [master]
GO
/****** Object:  Database [TalentoHumano]    Script Date: 11/07/2024 8:01:06 ******/
CREATE DATABASE [TalentoHumano]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TalentoHumano', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TalentoHumano.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TalentoHumano_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TalentoHumano_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TalentoHumano] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TalentoHumano].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TalentoHumano] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TalentoHumano] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TalentoHumano] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TalentoHumano] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TalentoHumano] SET ARITHABORT OFF 
GO
ALTER DATABASE [TalentoHumano] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TalentoHumano] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TalentoHumano] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TalentoHumano] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TalentoHumano] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TalentoHumano] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TalentoHumano] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TalentoHumano] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TalentoHumano] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TalentoHumano] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TalentoHumano] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TalentoHumano] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TalentoHumano] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TalentoHumano] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TalentoHumano] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TalentoHumano] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TalentoHumano] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TalentoHumano] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TalentoHumano] SET  MULTI_USER 
GO
ALTER DATABASE [TalentoHumano] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TalentoHumano] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TalentoHumano] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TalentoHumano] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TalentoHumano] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TalentoHumano] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TalentoHumano] SET QUERY_STORE = ON
GO
ALTER DATABASE [TalentoHumano] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TalentoHumano]
GO
/****** Object:  Table [dbo].[DetalleRolPagos]    Script Date: 11/07/2024 8:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleRolPagos](
	[idDetalleRolPagos] [int] IDENTITY(1,1) NOT NULL,
	[idRolPagos] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[Sueldo] [decimal](18, 0) NOT NULL,
	[HorasSuplementarias] [decimal](18, 2) NOT NULL,
	[Bonificaciones] [decimal](18, 2) NOT NULL,
	[FondoReserva] [decimal](18, 2) NOT NULL,
	[Alimentacion] [decimal](18, 2) NOT NULL,
	[OtrosIngresos] [decimal](18, 2) NOT NULL,
	[AportacionIESS] [decimal](18, 2) NOT NULL,
	[DescuentoAtrasos] [decimal](18, 2) NOT NULL,
	[ImpuestoRenta] [decimal](18, 2) NOT NULL,
	[PrestamoQuirografario] [decimal](18, 2) NOT NULL,
	[PrestamoHipotecario] [decimal](18, 2) NOT NULL,
	[Anticipos] [decimal](18, 2) NOT NULL,
	[OtrosDescuentos] [decimal](18, 2) NOT NULL,
	[SubIngresos] [decimal](18, 0) NOT NULL,
	[SubDescuentos] [decimal](18, 0) NOT NULL,
	[TotalIngresos] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_DetalleRolPagos] PRIMARY KEY CLUSTERED 
(
	[idDetalleRolPagos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/07/2024 8:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleados] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](10) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[Cargo] [varchar](30) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NULL,
	[Sueldo] [decimal](18, 0) NOT NULL,
	[HorasSuplementarias] [decimal](18, 0) NOT NULL,
	[DiasTrabajados] [int] NOT NULL,
	[Bonificaciones] [decimal](18, 0) NOT NULL,
	[FondoReserva] [decimal](18, 0) NOT NULL,
	[Alimentacion] [decimal](18, 0) NOT NULL,
	[OtrosIngresos] [decimal](18, 0) NOT NULL,
	[MinutosAtraso] [int] NULL,
	[ValorMinuto]  AS ([Sueldo]*(0.0001)) PERSISTED,
	[descuentoAtrasos] [decimal](18, 2) NULL,
	[AportacionIESS]  AS ((([Sueldo]+[Bonificaciones])+[HorasSuplementarias])*(0.0945)) PERSISTED,
	[ImpuestoRenta] [decimal](18, 0) NULL,
	[PrestamoHipotecario] [decimal](18, 0) NULL,
	[PrestamoQuirografario] [decimal](18, 0) NULL,
	[Anticipos] [decimal](18, 0) NULL,
	[Seguro] [decimal](18, 0) NULL,
	[OtrosDescuentos] [decimal](18, 0) NULL,
	[Prestamos] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Empleado__42034B0E1803A2A0] PRIMARY KEY CLUSTERED 
(
	[idEmpleados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/07/2024 8:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK__Roles__2A49584C0C0E94A8] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolPagos]    Script Date: 11/07/2024 8:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolPagos](
	[idRolPagos] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_RolPagos] PRIMARY KEY CLUSTERED 
(
	[idRolPagos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/07/2024 8:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[IdRol] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetalleRolPagos] ON 

INSERT [dbo].[DetalleRolPagos] ([idDetalleRolPagos], [idRolPagos], [idEmpleado], [Sueldo], [HorasSuplementarias], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [AportacionIESS], [DescuentoAtrasos], [ImpuestoRenta], [PrestamoQuirografario], [PrestamoHipotecario], [Anticipos], [OtrosDescuentos], [SubIngresos], [SubDescuentos], [TotalIngresos]) VALUES (1, 1, 4, CAST(1281 AS Decimal(18, 0)), CAST(7.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(73.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(98.00 AS Decimal(18, 2)), CAST(131.16 AS Decimal(18, 2)), CAST(1.15 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1571 AS Decimal(18, 0)), CAST(132 AS Decimal(18, 0)), CAST(1439 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DetalleRolPagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([idEmpleados], [Cedula], [Nombres], [TipoContrato], [Cargo], [Estado], [FechaEntrada], [FechaSalida], [Sueldo], [HorasSuplementarias], [DiasTrabajados], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [MinutosAtraso], [descuentoAtrasos], [ImpuestoRenta], [PrestamoHipotecario], [PrestamoQuirografario], [Anticipos], [Seguro], [OtrosDescuentos], [Prestamos]) VALUES (1, N'1234567890', N'Juan Dilan Pérez Lopez', N'Indefinido', N'Desarrollador', 1, CAST(N'2023-01-15T00:00:00.000' AS DateTime), NULL, CAST(3000 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), 20, CAST(100 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), 10, CAST(3.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([idEmpleados], [Cedula], [Nombres], [TipoContrato], [Cargo], [Estado], [FechaEntrada], [FechaSalida], [Sueldo], [HorasSuplementarias], [DiasTrabajados], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [MinutosAtraso], [descuentoAtrasos], [ImpuestoRenta], [PrestamoHipotecario], [PrestamoQuirografario], [Anticipos], [Seguro], [OtrosDescuentos], [Prestamos]) VALUES (4, N'1754048690', N'Mishell Alejandra Chiles Cholango', N'Indefinido', N'Docente', 1, CAST(N'2023-02-10T00:00:00.000' AS DateTime), NULL, CAST(1280 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 9, CAST(100 AS Decimal(18, 0)), CAST(73 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(98 AS Decimal(18, 0)), 9, CAST(1.15 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([idEmpleados], [Cedula], [Nombres], [TipoContrato], [Cargo], [Estado], [FechaEntrada], [FechaSalida], [Sueldo], [HorasSuplementarias], [DiasTrabajados], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [MinutosAtraso], [descuentoAtrasos], [ImpuestoRenta], [PrestamoHipotecario], [PrestamoQuirografario], [Anticipos], [Seguro], [OtrosDescuentos], [Prestamos]) VALUES (7, N'1725145807', N'Jonathan Joel Mamarandi Freire', N'Indefinido', N'Docente', 1, CAST(N'2024-10-04T00:00:00.000' AS DateTime), NULL, CAST(2382 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), 22, CAST(150 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(98 AS Decimal(18, 0)), 6, CAST(1.43 AS Decimal(18, 2)), CAST(40 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[Empleados] ([idEmpleados], [Cedula], [Nombres], [TipoContrato], [Cargo], [Estado], [FechaEntrada], [FechaSalida], [Sueldo], [HorasSuplementarias], [DiasTrabajados], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [MinutosAtraso], [descuentoAtrasos], [ImpuestoRenta], [PrestamoHipotecario], [PrestamoQuirografario], [Anticipos], [Seguro], [OtrosDescuentos], [Prestamos]) VALUES (10, N'1782921100', N'Sara Gabriela Cholango Fernandez', N'Indefinido', N'Docente', 1, CAST(N'2024-03-15T00:00:00.000' AS DateTime), NULL, CAST(3002 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), 28, CAST(150 AS Decimal(18, 0)), CAST(34 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 5, CAST(1.50 AS Decimal(18, 2)), CAST(67 AS Decimal(18, 0)), CAST(65 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Empleados] ([idEmpleados], [Cedula], [Nombres], [TipoContrato], [Cargo], [Estado], [FechaEntrada], [FechaSalida], [Sueldo], [HorasSuplementarias], [DiasTrabajados], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [MinutosAtraso], [descuentoAtrasos], [ImpuestoRenta], [PrestamoHipotecario], [PrestamoQuirografario], [Anticipos], [Seguro], [OtrosDescuentos], [Prestamos]) VALUES (11, N'1799237865', N'Andres Felipe Jurado Hernandez', N'Indefinido', N'Desarrollador', 1, CAST(N'2024-05-23T00:00:00.000' AS DateTime), NULL, CAST(1500 AS Decimal(18, 0)), CAST(67 AS Decimal(18, 0)), 27, CAST(100 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(88 AS Decimal(18, 0)), 3, CAST(0.45 AS Decimal(18, 2)), CAST(98 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(76 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Empleados] ([idEmpleados], [Cedula], [Nombres], [TipoContrato], [Cargo], [Estado], [FechaEntrada], [FechaSalida], [Sueldo], [HorasSuplementarias], [DiasTrabajados], [Bonificaciones], [FondoReserva], [Alimentacion], [OtrosIngresos], [MinutosAtraso], [descuentoAtrasos], [ImpuestoRenta], [PrestamoHipotecario], [PrestamoQuirografario], [Anticipos], [Seguro], [OtrosDescuentos], [Prestamos]) VALUES (14, N'1754047643', N'Sara Gabriela Cholango Fernandez', N'Indefinido', N'Docente', 1, CAST(N'2024-03-15T00:00:00.000' AS DateTime), NULL, CAST(1801 AS Decimal(18, 0)), CAST(67 AS Decimal(18, 0)), 27, CAST(66 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(77 AS Decimal(18, 0)), 2, CAST(0.36 AS Decimal(18, 2)), CAST(77 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(23 AS Decimal(18, 0)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRol], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([IdRol], [Descripcion]) VALUES (2, N'Empleado')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[RolPagos] ON 

INSERT [dbo].[RolPagos] ([idRolPagos], [Fecha], [idEmpleado]) VALUES (1, CAST(N'2024-07-10T08:09:24.630' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[RolPagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [Nombres], [Correo], [Clave], [IdRol]) VALUES (1, N'Mishell Chiles', N'ma.chiles@itq.edu.ec', N'12345', 1)
INSERT [dbo].[Usuarios] ([idUsuario], [Nombres], [Correo], [Clave], [IdRol]) VALUES (2, N'Lorena Guerrero', N'sl.guerrero@itq.edu.ec', N'6789', 2)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Horas__12C8C788]  DEFAULT ((0)) FOR [HorasSuplementarias]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Bonif__13BCEBC1]  DEFAULT ((0)) FOR [Bonificaciones]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Fondo__14B10FFA]  DEFAULT ((0)) FOR [FondoReserva]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Alime__15A53433]  DEFAULT ((0)) FOR [Alimentacion]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Otros__1699586C]  DEFAULT ((0)) FOR [OtrosIngresos]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Aport__178D7CA5]  DEFAULT ((0)) FOR [AportacionIESS]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Descu__1881A0DE]  DEFAULT ((0)) FOR [DescuentoAtrasos]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Impue__1975C517]  DEFAULT ((0)) FOR [ImpuestoRenta]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Prest__1A69E950]  DEFAULT ((0)) FOR [PrestamoQuirografario]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Prest__1B5E0D89]  DEFAULT ((0)) FOR [PrestamoHipotecario]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Antic__1C5231C2]  DEFAULT ((0)) FOR [Anticipos]
GO
ALTER TABLE [dbo].[DetalleRolPagos] ADD  CONSTRAINT [DF__DetalleRo__Otros__1D4655FB]  DEFAULT ((0)) FOR [OtrosDescuentos]
GO
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [DF_Empleados_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[DetalleRolPagos]  WITH CHECK ADD  CONSTRAINT [FK_DetalleRolPagos_Empleados] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleados])
GO
ALTER TABLE [dbo].[DetalleRolPagos] CHECK CONSTRAINT [FK_DetalleRolPagos_Empleados]
GO
ALTER TABLE [dbo].[DetalleRolPagos]  WITH CHECK ADD  CONSTRAINT [FK_DetalleRolPagos_RolPagos] FOREIGN KEY([idRolPagos])
REFERENCES [dbo].[RolPagos] ([idRolPagos])
GO
ALTER TABLE [dbo].[DetalleRolPagos] CHECK CONSTRAINT [FK_DetalleRolPagos_RolPagos]
GO
ALTER TABLE [dbo].[RolPagos]  WITH CHECK ADD  CONSTRAINT [FK_RolPagos_Empleados] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleados])
GO
ALTER TABLE [dbo].[RolPagos] CHECK CONSTRAINT [FK_RolPagos_Empleados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK__Usuarios__IdRol__38996AB5] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK__Usuarios__IdRol__38996AB5]
GO
USE [master]
GO
ALTER DATABASE [TalentoHumano] SET  READ_WRITE 
GO
