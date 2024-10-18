USE [master]
GO
/****** Object:  Database [AirlinesReservationSystem]    Script Date: 10/16/2024 1:16:54 PM ******/
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
/****** Object:  Table [dbo].[Airlines]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[Airplane]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[AirplaneSeat]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[Airport]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[BookingInformation]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[Flight]    Script Date: 10/16/2024 1:16:55 PM ******/
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
	[Status] [bit] NOT NULL,
	[From] [char](36) NOT NULL,
	[To] [char](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 10/16/2024 1:16:55 PM ******/
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
	[Type] [nvarchar](50) NOT NULL,
	[UserId] [char](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[SeatClass]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 10/16/2024 1:16:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [char](36) NOT NULL,
	[TicketClassId] [char](36) NOT NULL,
	[PassengerId] [char](36) NOT NULL,
	[BookingId] [char](36) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketClass]    Script Date: 10/16/2024 1:16:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketClass](
	[Id] [char](36) NOT NULL,
	[FlightId] [char](36) NOT NULL,
	[SeatClassId] [char](36) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 10/16/2024 1:16:55 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/16/2024 1:16:55 PM ******/
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
GO
INSERT [dbo].[Airport] ([Id], [Name], [City], [Country], [Status]) VALUES (N'ACE506C4-0489-4B6D-ADD0-5F5D24796E0F', N'Noi Bai International Airport', N'Hanoi', N'Vietnam', 1)
INSERT [dbo].[Airport] ([Id], [Name], [City], [Country], [Status]) VALUES (N'F4E862F3-AA6C-4E90-9DD4-52F7703B9496', N'Tan Son Nhat International Airport', N'Ho Chi Minh City', N'Vietnam', 1)
GO
INSERT [dbo].[SeatClass] ([Id], [Name], [Description], [Status]) VALUES (N'79562C9B-6B09-4CBF-B5A1-9903F2F15B67', N'Business', N'Business class seats with more amenities', 1)
INSERT [dbo].[SeatClass] ([Id], [Name], [Description], [Status]) VALUES (N'96A5D3DF-DE7B-4572-B8BD-AFE91DB378E9', N'Economy', N'Economy class seats', 1)
INSERT [dbo].[SeatClass] ([Id], [Name], [Description], [Status]) VALUES (N'977A3036-5375-44EB-9A62-411F3861F767', N'FirstClass', N'Premium first-class seats with luxurious amenities', 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Airplane_Airlines]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Airplane_Airlines] ON [dbo].[Airplane]
(
	[AirlinesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_AirplaneSeat_Airplane]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_AirplaneSeat_Airplane] ON [dbo].[AirplaneSeat]
(
	[AirplaneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_AirplaneSeat_SeatClass]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_AirplaneSeat_SeatClass] ON [dbo].[AirplaneSeat]
(
	[SeatClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_BookingInformation_User]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_BookingInformation_User] ON [dbo].[BookingInformation]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Flight_Airplane]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Flight_Airplane] ON [dbo].[Flight]
(
	[AirplaneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Flight_Airport_From]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Flight_Airport_From] ON [dbo].[Flight]
(
	[From] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Flight_Airport_To]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Flight_Airport_To] ON [dbo].[Flight]
(
	[To] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Passenger_User]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Passenger_User] ON [dbo].[Passenger]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Ticket_BookingInformation]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Ticket_BookingInformation] ON [dbo].[Ticket]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Ticket_Passenger]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Ticket_Passenger] ON [dbo].[Ticket]
(
	[PassengerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Ticket_TicketClass]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Ticket_TicketClass] ON [dbo].[Ticket]
(
	[TicketClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_TicketClass_Flight]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_TicketClass_Flight] ON [dbo].[TicketClass]
(
	[FlightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_TicketClass_SeatClass]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_TicketClass_SeatClass] ON [dbo].[TicketClass]
(
	[SeatClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Transaction_BookingInformation]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Transaction_BookingInformation] ON [dbo].[Transaction]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_Transaction_User]    Script Date: 10/16/2024 1:16:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_Transaction_User] ON [dbo].[Transaction]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FK_User_Rank]    Script Date: 10/16/2024 1:16:55 PM ******/
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
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Passenger] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[Passenger] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Passenger]
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
