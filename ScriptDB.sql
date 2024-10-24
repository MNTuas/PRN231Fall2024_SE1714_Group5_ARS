USE [master]
GO
/****** Object:  Database [AirlinesReservationSystem]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE DATABASE [AirlinesReservationSystem]
GO
ALTER DATABASE [AirlinesReservationSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirlinesReservationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirlinesReservationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirlinesReservationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirlinesReservationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AirlinesReservationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [AirlinesReservationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirlinesReservationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirlinesReservationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirlinesReservationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AirlinesReservationSystem] SET QUERY_STORE = OFF
GO
USE [AirlinesReservationSystem]
GO
/****** Object:  Table [dbo].[Airlines]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airlines](
	[Id] [char](36) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplane](
	[Id] [char](36) NOT NULL,
	[CodeNumber] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[AirlinesId] [char](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirplaneSeat]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirplaneSeat](
	[Id] [char](36) NOT NULL,
	[AirplaneId] [char](36) NOT NULL,
	[SeatClassId] [char](36) NOT NULL,
	[SeatCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[Id] [char](36) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingInformation]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingInformation](
	[Id] [char](36) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserId] [char](36) NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK__BookingI__3214EC07A2E4AB37] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[Id] [char](36) NOT NULL,
	[FlightNumber] [nvarchar](50) NOT NULL,
	[AirplaneId] [char](36) NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[Duration] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[From] [char](36) NOT NULL,
	[To] [char](36) NOT NULL,
 CONSTRAINT [PK__Flight__3214EC07A0A2C2BE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[Id] [char](36) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Dob] [date] NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[UserId] [char](36) NOT NULL,
 CONSTRAINT [PK__Passenge__3214EC074FD50069] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[Id] [char](36) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Discount] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatClass]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatClass](
	[Id] [char](36) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [char](36) NOT NULL,
	[TicketClassId] [char](36) NOT NULL,
	[BookingId] [char](36) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Dob] [date] NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Ticket__3214EC0723F9FC1C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketClass]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketClass](
	[Id] [char](36) NOT NULL,
	[FlightId] [char](36) NOT NULL,
	[SeatClassId] [char](36) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TicketCl__3214EC07F0F9CC3D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [char](36) NOT NULL,
	[BookingId] [char](36) NOT NULL,
	[UserId] [char](36) NOT NULL,
	[FinalPrice] [decimal](18, 2) NOT NULL,
	[PayDate] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Transact__3214EC072F6C7077] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/23/2024 9:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [char](36) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Point] [int] NOT NULL,
	[RankId] [char](36) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK__User__3214EC07FFD92900] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Airlines] ([Id], [Name], [Code], [Status]) VALUES (N'53AAA70C-6185-4468-98E1-65ABAFC690B3', N'Vietnam Airlines', N'VN', 1)
INSERT [dbo].[Airlines] ([Id], [Name], [Code], [Status]) VALUES (N'f29d5d08-6ba8-4542-a277-020767ccf729', N'Vietjet Airs', N'VJ', 1)
GO
INSERT [dbo].[Airplane] ([Id], [CodeNumber], [Status], [AirlinesId]) VALUES (N'1ac5282e-bfef-4a18-ab73-d0748d99b396', N'VN1234', 1, N'53AAA70C-6185-4468-98E1-65ABAFC690B3')
INSERT [dbo].[Airplane] ([Id], [CodeNumber], [Status], [AirlinesId]) VALUES (N'2800e5df-ff60-4014-867d-d80e5ce45b75', N'VJ3679', 1, N'f29d5d08-6ba8-4542-a277-020767ccf729')
INSERT [dbo].[Airplane] ([Id], [CodeNumber], [Status], [AirlinesId]) VALUES (N'b4a8f9d9-610f-4b6b-8164-f84a8bce58cc', N'VN4567', 1, N'53AAA70C-6185-4468-98E1-65ABAFC690B3')
INSERT [dbo].[Airplane] ([Id], [CodeNumber], [Status], [AirlinesId]) VALUES (N'd0f3027f-61eb-482c-bb55-e73ccaff3ed7', N'VJ2345', 1, N'f29d5d08-6ba8-4542-a277-020767ccf729')
GO
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'0498bc27-3709-4310-b27f-a0480c2e5939', N'2800e5df-ff60-4014-867d-d80e5ce45b75', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', 50)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'19441262-4f8d-492a-8ad4-2c8c95b8787d', N'1ac5282e-bfef-4a18-ab73-d0748d99b396', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', 100)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'29200cc0-e554-405a-b94d-bf9932b867fa', N'1ac5282e-bfef-4a18-ab73-d0748d99b396', N'977A3036-5375-44EB-9A62-411F3861F767', 25)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'3951a8bb-ef9e-4451-8c4f-69b3940833e5', N'1ac5282e-bfef-4a18-ab73-d0748d99b396', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', 50)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'3fa48048-1900-4115-bae4-3e49b232bb1b', N'b4a8f9d9-610f-4b6b-8164-f84a8bce58cc', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', 50)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'58796b56-41d5-4895-82d3-ea19b3dcecc7', N'2800e5df-ff60-4014-867d-d80e5ce45b75', N'977A3036-5375-44EB-9A62-411F3861F767', 25)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'749c7e56-b9e5-473e-a460-84c7bfc8cdfc', N'b4a8f9d9-610f-4b6b-8164-f84a8bce58cc', N'977A3036-5375-44EB-9A62-411F3861F767', 25)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'765c3262-387d-40eb-8b18-6209ecafc942', N'2800e5df-ff60-4014-867d-d80e5ce45b75', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', 100)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'a89181df-f58a-4dc1-9bfc-028d8b55f9d7', N'b4a8f9d9-610f-4b6b-8164-f84a8bce58cc', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', 100)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'ce275997-1936-4c7d-a70f-443f3323185d', N'd0f3027f-61eb-482c-bb55-e73ccaff3ed7', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', 100)
INSERT [dbo].[AirplaneSeat] ([Id], [AirplaneId], [SeatClassId], [SeatCount]) VALUES (N'e8a567fe-cbe0-478f-9845-00754e9915c7', N'd0f3027f-61eb-482c-bb55-e73ccaff3ed7', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', 50)
GO
INSERT [dbo].[Airport] ([Id], [Name], [City], [Country], [Status]) VALUES (N'ACE506C4-0489-4B6D-ADD0-5F5D24796E0F', N'Noi Bai International Airport', N'Hanoi', N'Vietnam', 1)
INSERT [dbo].[Airport] ([Id], [Name], [City], [Country], [Status]) VALUES (N'F4E862F3-AA6C-4E90-9DD4-52F7703B9496', N'Tan Son Nhat International Airport', N'Ho Chi Minh City', N'Vietnam', 1)
GO
INSERT [dbo].[Flight] ([Id], [FlightNumber], [AirplaneId], [DepartureTime], [ArrivalTime], [Duration], [Status], [From], [To]) VALUES (N'13a4ce9c-04ed-410d-b207-3b857e9802ed', N'VN401', N'1ac5282e-bfef-4a18-ab73-d0748d99b396', CAST(N'2024-10-19T13:45:00.000' AS DateTime), CAST(N'2024-10-19T17:05:00.000' AS DateTime), 200, N'Schedule', N'ACE506C4-0489-4B6D-ADD0-5F5D24796E0F', N'F4E862F3-AA6C-4E90-9DD4-52F7703B9496')
INSERT [dbo].[Flight] ([Id], [FlightNumber], [AirplaneId], [DepartureTime], [ArrivalTime], [Duration], [Status], [From], [To]) VALUES (N'3d790e90-c1b5-4277-bbd4-7cae2bd1c703', N'VJ809', N'd0f3027f-61eb-482c-bb55-e73ccaff3ed7', CAST(N'2024-10-19T11:15:00.000' AS DateTime), CAST(N'2024-10-19T13:15:00.000' AS DateTime), 120, N'Schedule', N'ACE506C4-0489-4B6D-ADD0-5F5D24796E0F', N'F4E862F3-AA6C-4E90-9DD4-52F7703B9496')
INSERT [dbo].[Flight] ([Id], [FlightNumber], [AirplaneId], [DepartureTime], [ArrivalTime], [Duration], [Status], [From], [To]) VALUES (N'aee04022-d17e-4154-9344-31a297a0dd50', N'VN209', N'1ac5282e-bfef-4a18-ab73-d0748d99b396', CAST(N'2024-10-18T15:00:00.000' AS DateTime), CAST(N'2024-10-18T17:30:00.000' AS DateTime), 150, N'Schedule', N'ACE506C4-0489-4B6D-ADD0-5F5D24796E0F', N'F4E862F3-AA6C-4E90-9DD4-52F7703B9496')
INSERT [dbo].[Flight] ([Id], [FlightNumber], [AirplaneId], [DepartureTime], [ArrivalTime], [Duration], [Status], [From], [To]) VALUES (N'f7013f52-f0a3-48a8-852b-cdcb0e74772a', N'VN209', N'1ac5282e-bfef-4a18-ab73-d0748d99b396', CAST(N'2024-10-19T06:00:00.000' AS DateTime), CAST(N'2024-10-19T08:00:00.000' AS DateTime), 120, N'Schedule', N'ACE506C4-0489-4B6D-ADD0-5F5D24796E0F', N'F4E862F3-AA6C-4E90-9DD4-52F7703B9496')
GO
INSERT [dbo].[Rank] ([Id], [Type], [Description], [Discount]) VALUES (N'85788ACB-C23D-4F73-8E06-4E1DD4018B3C', N'Bronze', N'Bronze rank description', CAST(5.00 AS Decimal(5, 2)))
INSERT [dbo].[Rank] ([Id], [Type], [Description], [Discount]) VALUES (N'A406102A-6723-4C7C-8973-5686AE87C989', N'Gold', N'Gold rank description', CAST(15.00 AS Decimal(5, 2)))
INSERT [dbo].[Rank] ([Id], [Type], [Description], [Discount]) VALUES (N'F21A4D25-40CA-4002-A48C-AD2929E6C82C', N'Silver', N'Silver rank description', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[SeatClass] ([Id], [Name], [Description], [Status]) VALUES (N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', N'Business', N'Business class seats with more amenities', 1)
INSERT [dbo].[SeatClass] ([Id], [Name], [Description], [Status]) VALUES (N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', N'Economy', N'Economy class seats', 1)
INSERT [dbo].[SeatClass] ([Id], [Name], [Description], [Status]) VALUES (N'977A3036-5375-44EB-9A62-411F3861F767', N'FirstClass', N'Premium first-class seats with luxurious amenities', 1)
GO
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'0b6dbbe3-0262-4595-ace5-8f4d45e00819', N'13a4ce9c-04ed-410d-b207-3b857e9802ed', N'977A3036-5375-44EB-9A62-411F3861F767', CAST(2800000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'107eb204-7d58-43b7-94f1-3bec2d20a8ee', N'13a4ce9c-04ed-410d-b207-3b857e9802ed', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', CAST(1200000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'24b507d3-b97b-450b-a627-afa27a3b4dcc', N'13a4ce9c-04ed-410d-b207-3b857e9802ed', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', CAST(2000000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'36222ca0-6dff-4b3f-80f7-b33837ff0853', N'f7013f52-f0a3-48a8-852b-cdcb0e74772a', N'977A3036-5375-44EB-9A62-411F3861F767', CAST(4800000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'449837cb-81a1-4ae9-9c8b-95b6e636fa59', N'3d790e90-c1b5-4277-bbd4-7cae2bd1c703', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', CAST(3000000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'4ae96dde-9341-4ea5-b72d-8c7bfda25cf6', N'aee04022-d17e-4154-9344-31a297a0dd50', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', CAST(1200000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'4fc105c3-d859-4585-93dd-164ba99bd238', N'3d790e90-c1b5-4277-bbd4-7cae2bd1c703', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', CAST(1000000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'657d387a-2ead-4a99-919d-6c2c6987ead6', N'f7013f52-f0a3-48a8-852b-cdcb0e74772a', N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', CAST(1450000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'77422ff0-f0ba-4d39-8a6b-427f5f098638', N'f7013f52-f0a3-48a8-852b-cdcb0e74772a', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', CAST(2400000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'c3a7badd-e2be-4ada-b2ba-c9b04d6ef76c', N'aee04022-d17e-4154-9344-31a297a0dd50', N'977A3036-5375-44EB-9A62-411F3861F767', CAST(2800000.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[TicketClass] ([Id], [FlightId], [SeatClassId], [Price], [Status]) VALUES (N'f1422760-39e1-403e-9027-1013a910adf9', N'aee04022-d17e-4154-9344-31a297a0dd50', N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', CAST(2000000.00 AS Decimal(18, 2)), N'Available')
GO
INSERT [dbo].[User] ([Id], [Avatar], [Name], [PhoneNumber], [Email], [Password], [Address], [Point], [RankId], [Role], [Status]) VALUES (N'ea04dcf9-ccbb-4a7b-b895-3ba3d97f707b', NULL, N'staff', NULL, N'staff@gmail.com', N'$2a$11$y6pP93RzdQCHqEUErouayO9YH4LXZZ5rtpfd31jaGTo8WLchXtBvS', NULL, 0, N'85788ACB-C23D-4F73-8E06-4E1DD4018B3C', N'Staff', N'Active')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Airplane_Airlines]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Airplane_Airlines] ON [dbo].[Airplane]
(
	[AirlinesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_AirplaneSeat_Airplane]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_AirplaneSeat_Airplane] ON [dbo].[AirplaneSeat]
(
	[AirplaneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_AirplaneSeat_SeatClass]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_AirplaneSeat_SeatClass] ON [dbo].[AirplaneSeat]
(
	[SeatClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_BookingInformation_User]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_BookingInformation_User] ON [dbo].[BookingInformation]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Flight_Airplane]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Flight_Airplane] ON [dbo].[Flight]
(
	[AirplaneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Flight_Airport_From]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Flight_Airport_From] ON [dbo].[Flight]
(
	[From] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Flight_Airport_To]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Flight_Airport_To] ON [dbo].[Flight]
(
	[To] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Passenger_User]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Passenger_User] ON [dbo].[Passenger]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Ticket_BookingInformation]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Ticket_BookingInformation] ON [dbo].[Ticket]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Ticket_TicketClass]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Ticket_TicketClass] ON [dbo].[Ticket]
(
	[TicketClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_TicketClass_Flight]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_TicketClass_Flight] ON [dbo].[TicketClass]
(
	[FlightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_TicketClass_SeatClass]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_TicketClass_SeatClass] ON [dbo].[TicketClass]
(
	[SeatClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Transaction_BookingInformation]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Transaction_BookingInformation] ON [dbo].[Transaction]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Transaction_User]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Transaction_User] ON [dbo].[Transaction]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_User_Rank]    Script Date: 10/23/2024 9:30:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_User_Rank] ON [dbo].[User]
(
	[RankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airplane]  WITH CHECK ADD  CONSTRAINT [FK_Airplane_Airlines] FOREIGN KEY([AirlinesId])
REFERENCES [dbo].[Airlines] ([Id])
GO
ALTER TABLE [dbo].[Airplane] CHECK CONSTRAINT [FK_Airplane_Airlines]
GO
ALTER TABLE [dbo].[AirplaneSeat]  WITH CHECK ADD  CONSTRAINT [FK_AirplaneSeat_Airplane] FOREIGN KEY([AirplaneId])
REFERENCES [dbo].[Airplane] ([Id])
GO
ALTER TABLE [dbo].[AirplaneSeat] CHECK CONSTRAINT [FK_AirplaneSeat_Airplane]
GO
ALTER TABLE [dbo].[AirplaneSeat]  WITH CHECK ADD  CONSTRAINT [FK_AirplaneSeat_SeatClass] FOREIGN KEY([SeatClassId])
REFERENCES [dbo].[SeatClass] ([Id])
GO
ALTER TABLE [dbo].[AirplaneSeat] CHECK CONSTRAINT [FK_AirplaneSeat_SeatClass]
GO
ALTER TABLE [dbo].[BookingInformation]  WITH CHECK ADD  CONSTRAINT [FK_BookingInformation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[BookingInformation] CHECK CONSTRAINT [FK_BookingInformation_User]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airplane] FOREIGN KEY([AirplaneId])
REFERENCES [dbo].[Airplane] ([Id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airplane]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport_From] FOREIGN KEY([From])
REFERENCES [dbo].[Airport] ([Id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport_From]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport_To] FOREIGN KEY([To])
REFERENCES [dbo].[Airport] ([Id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport_To]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_User]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_BookingInformation] FOREIGN KEY([BookingId])
REFERENCES [dbo].[BookingInformation] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_BookingInformation]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketClass] FOREIGN KEY([TicketClassId])
REFERENCES [dbo].[TicketClass] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_TicketClass]
GO
ALTER TABLE [dbo].[TicketClass]  WITH CHECK ADD  CONSTRAINT [FK_TicketClass_Flight] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([Id])
GO
ALTER TABLE [dbo].[TicketClass] CHECK CONSTRAINT [FK_TicketClass_Flight]
GO
ALTER TABLE [dbo].[TicketClass]  WITH CHECK ADD  CONSTRAINT [FK_TicketClass_SeatClass] FOREIGN KEY([SeatClassId])
REFERENCES [dbo].[SeatClass] ([Id])
GO
ALTER TABLE [dbo].[TicketClass] CHECK CONSTRAINT [FK_TicketClass_SeatClass]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BookingInformation] FOREIGN KEY([BookingId])
REFERENCES [dbo].[BookingInformation] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_BookingInformation]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Rank] FOREIGN KEY([RankId])
REFERENCES [dbo].[Rank] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Rank]
GO
USE [master]
GO
ALTER DATABASE [AirlinesReservationSystem] SET  READ_WRITE 
GO
