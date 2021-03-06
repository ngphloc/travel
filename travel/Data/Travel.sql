ALTER TABLE [dbo].[Book] DROP CONSTRAINT FK_Book_CategoryBook
GO

ALTER TABLE [dbo].[BookingOffice] DROP CONSTRAINT FK_BookingOffice_CategoryBookingOffice
GO

ALTER TABLE [dbo].[Communication] DROP CONSTRAINT FK_Communication_CategoryCommunication
GO

ALTER TABLE [dbo].[PlaceToStay] DROP CONSTRAINT FK_PlaceToStay_CategoryPlaceToStay
GO

ALTER TABLE [dbo].[Entertainment] DROP CONSTRAINT FK_Entertainment_CategoryEntertainment
GO

ALTER TABLE [dbo].[PlaceToEat] DROP CONSTRAINT FK_PlaceToEat_CategoryFood
GO

ALTER TABLE [dbo].[MedicalService] DROP CONSTRAINT FK_MedicalService_CategoryMedicalService
GO

ALTER TABLE [dbo].[Shopping] DROP CONSTRAINT FK_Shopping_CategoryShopping
GO

ALTER TABLE [dbo].[Transport] DROP CONSTRAINT FK_Transport_CategoryTransport
GO

ALTER TABLE [dbo].[PlaceOfWorship] DROP CONSTRAINT FK_PlaceOfWorship_CategoryWorship
GO

ALTER TABLE [dbo].[Location] DROP CONSTRAINT FK_Location_District
GO

ALTER TABLE [dbo].[Precinct] DROP CONSTRAINT FK_Precinct_District
GO

ALTER TABLE [dbo].[Location] DROP CONSTRAINT FK_Location_Images
GO

ALTER TABLE [dbo].[LocationImages] DROP CONSTRAINT FK_LocationImages_Images
GO

ALTER TABLE [dbo].[Book] DROP CONSTRAINT FK_Book_LocationCategory
GO

ALTER TABLE [dbo].[BookingOffice] DROP CONSTRAINT FK_BookingOffice_LocationCategory
GO

ALTER TABLE [dbo].[Communication] DROP CONSTRAINT FK_Communication_LocationCategory
GO

ALTER TABLE [dbo].[Entertainment] DROP CONSTRAINT FK_Entertainment_LocationCategory
GO

ALTER TABLE [dbo].[Location] DROP CONSTRAINT FK_Location_LocationCategory
GO

ALTER TABLE [dbo].[MedicalService] DROP CONSTRAINT FK_MedicalService_LocationCategory
GO

ALTER TABLE [dbo].[Museum] DROP CONSTRAINT FK_Museum_LocationCategory
GO

ALTER TABLE [dbo].[PlaceOfWorship] DROP CONSTRAINT FK_PlaceOfWorship_LocationCategory
GO

ALTER TABLE [dbo].[PlaceToEat] DROP CONSTRAINT FK_PlaceToEat_LocationCategory
GO

ALTER TABLE [dbo].[PlaceToStay] DROP CONSTRAINT FK_PlaceToStay_LocationCategory
GO

ALTER TABLE [dbo].[Shopping] DROP CONSTRAINT FK_Shopping_LocationCategory
GO

ALTER TABLE [dbo].[Transport] DROP CONSTRAINT FK_Transport_LocationCategory
GO

ALTER TABLE [dbo].[TravelAgency] DROP CONSTRAINT FK_TravelAgency_LocationCategory
GO

ALTER TABLE [dbo].[Location] DROP CONSTRAINT FK_Location_Movies
GO

ALTER TABLE [dbo].[LocationMovies] DROP CONSTRAINT FK_LocationMovies_Movies
GO

ALTER TABLE [dbo].[Location] DROP CONSTRAINT FK_Location_Sounds
GO

ALTER TABLE [dbo].[LocationSounds] DROP CONSTRAINT FK_LocationSounds_Sounds
GO

ALTER TABLE [dbo].[LocationTours] DROP CONSTRAINT FK_LocationTours_Tours
GO

ALTER TABLE [dbo].[Location] DROP CONSTRAINT FK_Location_Precinct
GO

ALTER TABLE [dbo].[Book] DROP CONSTRAINT FK_Book_Location
GO

ALTER TABLE [dbo].[BookingOffice] DROP CONSTRAINT FK_BookingOffice_Location
GO

ALTER TABLE [dbo].[Communication] DROP CONSTRAINT FK_Communication_Location
GO

ALTER TABLE [dbo].[Entertainment] DROP CONSTRAINT FK_Entertainment_Location
GO

ALTER TABLE [dbo].[LocationImages] DROP CONSTRAINT FK_LocationImages_Location
GO

ALTER TABLE [dbo].[LocationInfo] DROP CONSTRAINT FK_LocationInfo_Location
GO

ALTER TABLE [dbo].[LocationMovies] DROP CONSTRAINT FK_LocationMovies_Location
GO

ALTER TABLE [dbo].[LocationSounds] DROP CONSTRAINT FK_LocationSounds_Location
GO

ALTER TABLE [dbo].[LocationTours] DROP CONSTRAINT FK_LocationTours_Location
GO

ALTER TABLE [dbo].[MedicalService] DROP CONSTRAINT FK_MedicalService_Location
GO

ALTER TABLE [dbo].[Museum] DROP CONSTRAINT FK_Museum_Location
GO

ALTER TABLE [dbo].[PlaceOfWorship] DROP CONSTRAINT FK_PlaceOfWorship_Location
GO

ALTER TABLE [dbo].[PlaceToEat] DROP CONSTRAINT FK_PlaceToEat_Location
GO

ALTER TABLE [dbo].[PlaceToStay] DROP CONSTRAINT FK_PlaceToStay_Location
GO

ALTER TABLE [dbo].[Shopping] DROP CONSTRAINT FK_Shopping_Location
GO

ALTER TABLE [dbo].[Transport] DROP CONSTRAINT FK_Transport_Location
GO

ALTER TABLE [dbo].[TravelAgency] DROP CONSTRAINT FK_TravelAgency_Location
GO

/****** Object:  Trigger dbo.CheckMainImageID    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckMainImageID]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckMainImageID]
GO

/****** Object:  Trigger dbo.CheckBook    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckBook]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckBook]
GO

/****** Object:  Trigger dbo.CheckBookingOffice    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckBookingOffice]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckBookingOffice]
GO

/****** Object:  Trigger dbo.CheckCommunication    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckCommunication]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckCommunication]
GO

/****** Object:  Trigger dbo.CheckEntertainment    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckEntertainment]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckEntertainment]
GO

/****** Object:  Trigger dbo.CheckMedicalService    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckMedicalService]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckMedicalService]
GO

/****** Object:  Trigger dbo.CheckMuseum    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckMuseum]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckMuseum]
GO

/****** Object:  Trigger dbo.CheckPlaceOfWorship    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckPlaceOfWorship]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckPlaceOfWorship]
GO

/****** Object:  Trigger dbo.CheckPlaceToEat    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckPlaceToEat]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckPlaceToEat]
GO

/****** Object:  Trigger dbo.CheckPlaceToStay    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckPlaceToStay]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckPlaceToStay]
GO

/****** Object:  Trigger dbo.CheckStandard    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckStandard]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckStandard]
GO

/****** Object:  Trigger dbo.CheckShopping    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckShopping]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckShopping]
GO

/****** Object:  Trigger dbo.CheckTransport    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckTransport]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckTransport]
GO

/****** Object:  Trigger dbo.CheckTravelAgency    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CheckTravelAgency]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CheckTravelAgency]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Book]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Book]
GO

/****** Object:  Table [dbo].[BookingOffice]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[BookingOffice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookingOffice]
GO

/****** Object:  Table [dbo].[Communication]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Communication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Communication]
GO

/****** Object:  Table [dbo].[Entertainment]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Entertainment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Entertainment]
GO

/****** Object:  Table [dbo].[LocationImages]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LocationImages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocationImages]
GO

/****** Object:  Table [dbo].[LocationInfo]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LocationInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocationInfo]
GO

/****** Object:  Table [dbo].[LocationMovies]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LocationMovies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocationMovies]
GO

/****** Object:  Table [dbo].[LocationSounds]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LocationSounds]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocationSounds]
GO

/****** Object:  Table [dbo].[LocationTours]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LocationTours]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocationTours]
GO

/****** Object:  Table [dbo].[MedicalService]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[MedicalService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MedicalService]
GO

/****** Object:  Table [dbo].[Museum]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Museum]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Museum]
GO

/****** Object:  Table [dbo].[PlaceOfWorship]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[PlaceOfWorship]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PlaceOfWorship]
GO

/****** Object:  Table [dbo].[PlaceToEat]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[PlaceToEat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PlaceToEat]
GO

/****** Object:  Table [dbo].[PlaceToStay]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[PlaceToStay]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PlaceToStay]
GO

/****** Object:  Table [dbo].[Shopping]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Shopping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Shopping]
GO

/****** Object:  Table [dbo].[Transport]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Transport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Transport]
GO

/****** Object:  Table [dbo].[TravelAgency]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[TravelAgency]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TravelAgency]
GO

/****** Object:  Table [dbo].[Location]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Location]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Location]
GO

/****** Object:  Table [dbo].[Precinct]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Precinct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Precinct]
GO

/****** Object:  Table [dbo].[CategoryBook]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryBook]
GO

/****** Object:  Table [dbo].[CategoryBookingOffice]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryBookingOffice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryBookingOffice]
GO

/****** Object:  Table [dbo].[CategoryCommunication]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryCommunication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryCommunication]
GO

/****** Object:  Table [dbo].[CategoryDesign]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryDesign]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryDesign]
GO

/****** Object:  Table [dbo].[CategoryEntertainment]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryEntertainment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryEntertainment]
GO

/****** Object:  Table [dbo].[CategoryFood]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryFood]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryFood]
GO

/****** Object:  Table [dbo].[CategoryMedicalService]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryMedicalService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryMedicalService]
GO

/****** Object:  Table [dbo].[CategoryShopping]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryShopping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryShopping]
GO

/****** Object:  Table [dbo].[CategoryTransport]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryTransport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryTransport]
GO

/****** Object:  Table [dbo].[CategoryWorship]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CategoryWorship]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CategoryWorship]
GO

/****** Object:  Table [dbo].[District]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[District]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[District]
GO

/****** Object:  Table [dbo].[Images]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Images]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Images]
GO

/****** Object:  Table [dbo].[LocationCategory]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LocationCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocationCategory]
GO

/****** Object:  Table [dbo].[Movies]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Movies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Movies]
GO

/****** Object:  Table [dbo].[Sounds]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Sounds]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Sounds]
GO

/****** Object:  Table [dbo].[Tours]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Tours]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tours]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 7/23/2001 11:19:32 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Users]
GO

/****** Object:  Table [dbo].[CategoryBook]    Script Date: 7/23/2001 11:19:45 AM ******/
CREATE TABLE [dbo].[CategoryBook] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryBookingOffice]    Script Date: 7/23/2001 11:19:46 AM ******/
CREATE TABLE [dbo].[CategoryBookingOffice] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryCommunication]    Script Date: 7/23/2001 11:19:46 AM ******/
CREATE TABLE [dbo].[CategoryCommunication] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryDesign]    Script Date: 7/23/2001 11:19:47 AM ******/
CREATE TABLE [dbo].[CategoryDesign] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryEntertainment]    Script Date: 7/23/2001 11:19:47 AM ******/
CREATE TABLE [dbo].[CategoryEntertainment] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryFood]    Script Date: 7/23/2001 11:19:47 AM ******/
CREATE TABLE [dbo].[CategoryFood] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryMedicalService]    Script Date: 7/23/2001 11:19:47 AM ******/
CREATE TABLE [dbo].[CategoryMedicalService] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryShopping]    Script Date: 7/23/2001 11:19:48 AM ******/
CREATE TABLE [dbo].[CategoryShopping] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryTransport]    Script Date: 7/23/2001 11:19:48 AM ******/
CREATE TABLE [dbo].[CategoryTransport] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CategoryWorship]    Script Date: 7/23/2001 11:19:48 AM ******/
CREATE TABLE [dbo].[CategoryWorship] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[District]    Script Date: 7/23/2001 11:19:49 AM ******/
CREATE TABLE [dbo].[District] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (32) NOT NULL ,
	[EnglishDescription] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Images]    Script Date: 7/23/2001 11:19:49 AM ******/
CREATE TABLE [dbo].[Images] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Path] [varchar] (32) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LocationCategory]    Script Date: 7/23/2001 11:19:49 AM ******/
CREATE TABLE [dbo].[LocationCategory] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[EnglishName] [varchar] (32) NOT NULL ,
	[EnglishDescription] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Movies]    Script Date: 7/23/2001 11:19:49 AM ******/
CREATE TABLE [dbo].[Movies] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Path] [varchar] (32) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sounds]    Script Date: 7/23/2001 11:19:50 AM ******/
CREATE TABLE [dbo].[Sounds] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Path] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Tours]    Script Date: 7/23/2001 11:19:50 AM ******/
CREATE TABLE [dbo].[Tours] (
	[ID] [int] NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[EnglishIntroduction] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 7/23/2001 11:19:50 AM ******/
CREATE TABLE [dbo].[Users] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Username] [varchar] (20) NULL ,
	[Password] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Precinct]    Script Date: 7/23/2001 11:19:51 AM ******/
CREATE TABLE [dbo].[Precinct] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[DistrictID] [int] NOT NULL ,
	[EnglishName] [varchar] (32) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Location]    Script Date: 7/23/2001 11:19:51 AM ******/
CREATE TABLE [dbo].[Location] (
	[ID] [int] NOT NULL ,
	[EnglishName] [varchar] (64) NOT NULL ,
	[VNName] [varchar] (64) NULL ,
	[CategoryID] [int] NULL ,
	[DistrictID] [int] NOT NULL ,
	[PrecinctID] [int] NULL ,
	[YearBuilt] [int] NULL ,
	[EnglishAddress] [varchar] (128) NULL ,
	[VNAddress] [varchar] (128) NULL ,
	[Phone] [varchar] (16) NULL ,
	[Fax] [varchar] (16) NULL ,
	[Email] [varchar] (64) NULL ,
	[Website] [varchar] (64) NULL ,
	[MapPart] [varchar] (8) NULL ,
	[MapLocation] [varchar] (32) NULL ,
	[MainImageID] [int] NULL ,
	[MainMovieID] [int] NULL ,
	[MainSoundID] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 7/23/2001 11:19:51 AM ******/
CREATE TABLE [dbo].[Book] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryBookID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookingOffice]    Script Date: 7/23/2001 11:19:52 AM ******/
CREATE TABLE [dbo].[BookingOffice] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryBookingOfficeID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Communication]    Script Date: 7/23/2001 11:19:52 AM ******/
CREATE TABLE [dbo].[Communication] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryCommunicationID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Entertainment]    Script Date: 7/23/2001 11:19:52 AM ******/
CREATE TABLE [dbo].[Entertainment] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryEntertainmentID] [int] NOT NULL ,
	[MinPrice] [float] NULL ,
	[MaxPrice] [float] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LocationImages]    Script Date: 7/23/2001 11:19:53 AM ******/
CREATE TABLE [dbo].[LocationImages] (
	[LocationID] [int] NOT NULL ,
	[ImageID] [int] NOT NULL ,
	[EnglishDescription] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LocationInfo]    Script Date: 7/23/2001 11:19:53 AM ******/
CREATE TABLE [dbo].[LocationInfo] (
	[ID] [int] NOT NULL ,
	[EnglishIntroduction] [varchar] (16) NULL ,
	[EnglishGuide] [varchar] (16) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LocationMovies]    Script Date: 7/23/2001 11:19:53 AM ******/
CREATE TABLE [dbo].[LocationMovies] (
	[LocationID] [int] NOT NULL ,
	[MovieID] [int] NOT NULL ,
	[EnglishDescription] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LocationSounds]    Script Date: 7/23/2001 11:19:54 AM ******/
CREATE TABLE [dbo].[LocationSounds] (
	[LocationID] [int] NOT NULL ,
	[SoundID] [int] NOT NULL ,
	[EnglishDescription] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LocationTours]    Script Date: 7/23/2001 11:19:54 AM ******/
CREATE TABLE [dbo].[LocationTours] (
	[LocationID] [int] NOT NULL ,
	[TourID] [int] NOT NULL ,
	[EnglishDescription] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MedicalService]    Script Date: 7/23/2001 11:19:54 AM ******/
CREATE TABLE [dbo].[MedicalService] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryMedicalServiceID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Museum]    Script Date: 7/23/2001 11:19:55 AM ******/
CREATE TABLE [dbo].[Museum] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[MinPrice] [float] NULL ,
	[MaxPrice] [float] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PlaceOfWorship]    Script Date: 7/23/2001 11:19:55 AM ******/
CREATE TABLE [dbo].[PlaceOfWorship] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryWorshipID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PlaceToEat]    Script Date: 7/23/2001 11:19:55 AM ******/
CREATE TABLE [dbo].[PlaceToEat] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryFoodID] [int] NOT NULL ,
	[EnglishPrincipalDish] [varchar] (64) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PlaceToStay]    Script Date: 7/23/2001 11:19:56 AM ******/
CREATE TABLE [dbo].[PlaceToStay] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryDesignID] [int] NOT NULL ,
	[Standard] [int] NOT NULL ,
	[MinPrice] [float] NULL ,
	[MaxPrice] [float] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Shopping]    Script Date: 7/23/2001 11:19:56 AM ******/
CREATE TABLE [dbo].[Shopping] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryShoppingID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Transport]    Script Date: 7/23/2001 11:19:56 AM ******/
CREATE TABLE [dbo].[Transport] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[CategoryTransportID] [int] NOT NULL ,
	[MinPrice] [float] NULL ,
	[MaxPrice] [float] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TravelAgency]    Script Date: 7/23/2001 11:19:57 AM ******/
CREATE TABLE [dbo].[TravelAgency] (
	[CategoryID] [int] NOT NULL ,
	[LocationID] [int] NOT NULL ,
	[Inbound] [bit] NOT NULL ,
	[Outbound] [bit] NOT NULL ,
	[MotorbikingTour] [bit] NOT NULL ,
	[Trekking] [bit] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CategoryBook] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryBook] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryBookingOffice] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryBookingOffice] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryCommunication] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryCommunication] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryDesign] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryPlaceToStay] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryEntertainment] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryEntertainment] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryFood] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryFood] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryMedicalService] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryMedicalService] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryShopping] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryShopping] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryTransport] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryTransport] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CategoryWorship] WITH NOCHECK ADD 
	CONSTRAINT [PK_CategoryWorship] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[District] WITH NOCHECK ADD 
	CONSTRAINT [PK_District] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Images] WITH NOCHECK ADD 
	CONSTRAINT [PK_Images] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LocationCategory] WITH NOCHECK ADD 
	CONSTRAINT [PK_LocationCategory] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Movies] WITH NOCHECK ADD 
	CONSTRAINT [PK_Movies] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Sounds] WITH NOCHECK ADD 
	CONSTRAINT [PK_Sounds] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Tours] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tours] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Users] WITH NOCHECK ADD 
	CONSTRAINT [PK_User] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Precinct] WITH NOCHECK ADD 
	CONSTRAINT [PK_Precinct] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Location] WITH NOCHECK ADD 
	CONSTRAINT [PK_Location] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Book] WITH NOCHECK ADD 
	CONSTRAINT [DF_Book_CategoryID] DEFAULT (9) FOR [CategoryID],
	CONSTRAINT [PK_Books] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BookingOffice] WITH NOCHECK ADD 
	CONSTRAINT [DF_BookingOffice_CategoryID] DEFAULT (13) FOR [CategoryID],
	CONSTRAINT [PK_BookingOffice] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Communication] WITH NOCHECK ADD 
	CONSTRAINT [DF_Communication_CategoryID] DEFAULT (12) FOR [CategoryID],
	CONSTRAINT [PK_Communication] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Entertainment] WITH NOCHECK ADD 
	CONSTRAINT [DF_Entertainment_CategoryID] DEFAULT (5) FOR [CategoryID],
	CONSTRAINT [PK_EntertainmentAndRelax] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LocationImages] WITH NOCHECK ADD 
	CONSTRAINT [PK_LocationImages] PRIMARY KEY  NONCLUSTERED 
	(
		[LocationID],
		[ImageID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LocationInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_LocationInfo] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LocationMovies] WITH NOCHECK ADD 
	CONSTRAINT [PK_LocationMovies] PRIMARY KEY  NONCLUSTERED 
	(
		[LocationID],
		[MovieID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LocationSounds] WITH NOCHECK ADD 
	CONSTRAINT [PK_LocationSounds] PRIMARY KEY  NONCLUSTERED 
	(
		[LocationID],
		[SoundID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LocationTours] WITH NOCHECK ADD 
	CONSTRAINT [PK_LocationTour] PRIMARY KEY  NONCLUSTERED 
	(
		[LocationID],
		[TourID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MedicalService] WITH NOCHECK ADD 
	CONSTRAINT [DF_MedicalService_CategoryID] DEFAULT (8) FOR [CategoryID],
	CONSTRAINT [PK_MedicalService] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Museum] WITH NOCHECK ADD 
	CONSTRAINT [DF_Museums_CategoryID] DEFAULT (6) FOR [CategoryID],
	CONSTRAINT [PK_Museums] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PlaceOfWorship] WITH NOCHECK ADD 
	CONSTRAINT [DF_PlaceOfWorship_CategoryID] DEFAULT (3) FOR [CategoryID],
	CONSTRAINT [PK_PlaceOfWorship] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PlaceToEat] WITH NOCHECK ADD 
	CONSTRAINT [DF_PlaceToEat_CategoryID] DEFAULT (2) FOR [CategoryID],
	CONSTRAINT [PK_PlacesToEat] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PlaceToStay] WITH NOCHECK ADD 
	CONSTRAINT [DF_PlaceToStay_CategoryID] DEFAULT (1) FOR [CategoryID],
	CONSTRAINT [DF_PlaceToStay_Standard] DEFAULT (1) FOR [Standard],
	CONSTRAINT [PK_PlaceToStay] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Shopping] WITH NOCHECK ADD 
	CONSTRAINT [DF_Shopping_CategoryID] DEFAULT (4) FOR [CategoryID],
	CONSTRAINT [PK_Shopping] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Transport] WITH NOCHECK ADD 
	CONSTRAINT [DF_Transport_CategoryID] DEFAULT (7) FOR [CategoryID],
	CONSTRAINT [PK_Transports] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TravelAgency] WITH NOCHECK ADD 
	CONSTRAINT [DF_TravelAgency_CategoryID] DEFAULT (14) FOR [CategoryID],
	CONSTRAINT [DF_TravelAgency_Inbound] DEFAULT (0) FOR [Inbound],
	CONSTRAINT [DF_TravelAgency_Outbound] DEFAULT (0) FOR [Outbound],
	CONSTRAINT [DF_TravelAgency_MotorbikingTour] DEFAULT (0) FOR [MotorbikingTour],
	CONSTRAINT [DF_TravelAgency_Trekking] DEFAULT (0) FOR [Trekking],
	CONSTRAINT [PK_TravelAgency] PRIMARY KEY  NONCLUSTERED 
	(
		[CategoryID],
		[LocationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Precinct] ADD 
	CONSTRAINT [FK_Precinct_District] FOREIGN KEY 
	(
		[DistrictID]
	) REFERENCES [dbo].[District] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Location] ADD 
	CONSTRAINT [FK_Location_District] FOREIGN KEY 
	(
		[DistrictID]
	) REFERENCES [dbo].[District] (
		[ID]
	),
	CONSTRAINT [FK_Location_Images] FOREIGN KEY 
	(
		[MainImageID]
	) REFERENCES [dbo].[Images] (
		[ID]
	),
	CONSTRAINT [FK_Location_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	),
	CONSTRAINT [FK_Location_Movies] FOREIGN KEY 
	(
		[MainMovieID]
	) REFERENCES [dbo].[Movies] (
		[ID]
	),
	CONSTRAINT [FK_Location_Precinct] FOREIGN KEY 
	(
		[PrecinctID]
	) REFERENCES [dbo].[Precinct] (
		[ID]
	),
	CONSTRAINT [FK_Location_Sounds] FOREIGN KEY 
	(
		[MainSoundID]
	) REFERENCES [dbo].[Sounds] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Book] ADD 
	CONSTRAINT [FK_Book_CategoryBook] FOREIGN KEY 
	(
		[CategoryBookID]
	) REFERENCES [dbo].[CategoryBook] (
		[ID]
	),
	CONSTRAINT [FK_Book_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_Book_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[BookingOffice] ADD 
	CONSTRAINT [FK_BookingOffice_CategoryBookingOffice] FOREIGN KEY 
	(
		[CategoryBookingOfficeID]
	) REFERENCES [dbo].[CategoryBookingOffice] (
		[ID]
	),
	CONSTRAINT [FK_BookingOffice_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_BookingOffice_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Communication] ADD 
	CONSTRAINT [FK_Communication_CategoryCommunication] FOREIGN KEY 
	(
		[CategoryCommunicationID]
	) REFERENCES [dbo].[CategoryCommunication] (
		[ID]
	),
	CONSTRAINT [FK_Communication_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_Communication_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Entertainment] ADD 
	CONSTRAINT [FK_Entertainment_CategoryEntertainment] FOREIGN KEY 
	(
		[CategoryEntertainmentID]
	) REFERENCES [dbo].[CategoryEntertainment] (
		[ID]
	),
	CONSTRAINT [FK_Entertainment_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_Entertainment_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[LocationImages] ADD 
	CONSTRAINT [FK_LocationImages_Images] FOREIGN KEY 
	(
		[ImageID]
	) REFERENCES [dbo].[Images] (
		[ID]
	),
	CONSTRAINT [FK_LocationImages_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	)
GO

ALTER TABLE [dbo].[LocationInfo] ADD 
	CONSTRAINT [FK_LocationInfo_Location] FOREIGN KEY 
	(
		[ID]
	) REFERENCES [dbo].[Location] (
		[ID]
	)
GO

ALTER TABLE [dbo].[LocationMovies] ADD 
	CONSTRAINT [FK_LocationMovies_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_LocationMovies_Movies] FOREIGN KEY 
	(
		[MovieID]
	) REFERENCES [dbo].[Movies] (
		[ID]
	)
GO

ALTER TABLE [dbo].[LocationSounds] ADD 
	CONSTRAINT [FK_LocationSounds_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_LocationSounds_Sounds] FOREIGN KEY 
	(
		[SoundID]
	) REFERENCES [dbo].[Sounds] (
		[ID]
	)
GO

ALTER TABLE [dbo].[LocationTours] ADD 
	CONSTRAINT [FK_LocationTours_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_LocationTours_Tours] FOREIGN KEY 
	(
		[TourID]
	) REFERENCES [dbo].[Tours] (
		[ID]
	)
GO

ALTER TABLE [dbo].[MedicalService] ADD 
	CONSTRAINT [FK_MedicalService_CategoryMedicalService] FOREIGN KEY 
	(
		[CategoryMedicalServiceID]
	) REFERENCES [dbo].[CategoryMedicalService] (
		[ID]
	),
	CONSTRAINT [FK_MedicalService_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_MedicalService_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Museum] ADD 
	CONSTRAINT [FK_Museum_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_Museum_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[PlaceOfWorship] ADD 
	CONSTRAINT [FK_PlaceOfWorship_CategoryWorship] FOREIGN KEY 
	(
		[CategoryWorshipID]
	) REFERENCES [dbo].[CategoryWorship] (
		[ID]
	),
	CONSTRAINT [FK_PlaceOfWorship_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_PlaceOfWorship_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[PlaceToEat] ADD 
	CONSTRAINT [FK_PlaceToEat_CategoryFood] FOREIGN KEY 
	(
		[CategoryFoodID]
	) REFERENCES [dbo].[CategoryFood] (
		[ID]
	),
	CONSTRAINT [FK_PlaceToEat_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_PlaceToEat_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[PlaceToStay] ADD 
	CONSTRAINT [FK_PlaceToStay_CategoryPlaceToStay] FOREIGN KEY 
	(
		[CategoryDesignID]
	) REFERENCES [dbo].[CategoryDesign] (
		[ID]
	),
	CONSTRAINT [FK_PlaceToStay_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_PlaceToStay_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Shopping] ADD 
	CONSTRAINT [FK_Shopping_CategoryShopping] FOREIGN KEY 
	(
		[CategoryShoppingID]
	) REFERENCES [dbo].[CategoryShopping] (
		[ID]
	),
	CONSTRAINT [FK_Shopping_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_Shopping_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Transport] ADD 
	CONSTRAINT [FK_Transport_CategoryTransport] FOREIGN KEY 
	(
		[CategoryTransportID]
	) REFERENCES [dbo].[CategoryTransport] (
		[ID]
	),
	CONSTRAINT [FK_Transport_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_Transport_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

ALTER TABLE [dbo].[TravelAgency] ADD 
	CONSTRAINT [FK_TravelAgency_Location] FOREIGN KEY 
	(
		[LocationID]
	) REFERENCES [dbo].[Location] (
		[ID]
	),
	CONSTRAINT [FK_TravelAgency_LocationCategory] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [dbo].[LocationCategory] (
		[ID]
	)
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckMainImageID    Script Date: 7/23/2001 11:19:57 AM ******/
/****** Object:  Trigger dbo.CheckMainImageID    Script Date: 6/19/2001 2:47:11 AM ******/
/****** Object:  Trigger dbo.CheckMainImageID    Script Date: 6/4/2001 1:38:38 AM ******/

/****** Object:  Trigger dbo.CheckMainImageID    Script Date: 30/05/2001 1:10:22 PM ******/
CREATE TRIGGER CheckMainImageID ON dbo.Location 
FOR INSERT, UPDATE
AS
	Declare @MainImageID int, @ID int
	Select @MainImageID = i.MainImageID, @ID = i.ID
	From    Inserted i
		If (@MainImageID <> (Select  ImageID
				         From    LocationImages
				         Where LocationImages.LocationID = @ID))
			Begin
				print 'Khong ton tai hinh anh nay trong dia danh'
				Rollback Transaction
			End

GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckBook    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckBook    Script Date: 6/19/2001 2:47:11 AM ******/
CREATE TRIGGER CheckBook ON [Book] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckBookingOffice    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckBookingOffice    Script Date: 6/19/2001 2:47:11 AM ******/
CREATE TRIGGER CheckBookingOffice ON [BookingOffice] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End



GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckCommunication    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckCommunication    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckCommunication ON [Communication] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckEntertainment    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckEntertainment    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckEntertainment ON [Entertainment] 
FOR INSERT, UPDATE
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End



GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckMedicalService    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckMedicalService    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckMedicalService ON [MedicalService] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckMuseum    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckMuseum    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckMuseum ON [Museum] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckPlaceOfWorship    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckPlaceOfWorship    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckPlaceOfWorship ON [PlaceOfWorship] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckPlaceToEat    Script Date: 7/23/2001 11:19:57 AM ******/

/****** Object:  Trigger dbo.CheckPlaceToEat    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckPlaceToEat ON [PlaceToEat] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckPlaceToStay    Script Date: 7/23/2001 11:19:58 AM ******/

/****** Object:  Trigger dbo.CheckPlaceToStay    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckPlaceToStay ON dbo.PlaceToStay 
FOR INSERT, UPDATE
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckStandard    Script Date: 7/23/2001 11:19:58 AM ******/

/****** Object:  Trigger dbo.CheckStandard    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckStandard ON [PlaceToStay] 
FOR INSERT, UPDATE
AS
	Declare @standard int
	Select @standard=i.Standard
	From Inserted i
		If (@standard < 1 OR @standard > 5) 
			Begin
				print 'Nhap tieu chuan sai. Tieu chuan tu 1->5'
				Rollback Transaction
			End

GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckShopping    Script Date: 7/23/2001 11:19:58 AM ******/

/****** Object:  Trigger dbo.CheckShopping    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckShopping ON [Shopping] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckTransport    Script Date: 7/23/2001 11:19:58 AM ******/

/****** Object:  Trigger dbo.CheckTransport    Script Date: 6/19/2001 2:47:12 AM ******/
CREATE TRIGGER CheckTransport ON [Transport] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  ON    SET ANSI_NULLS  ON 
GO

/****** Object:  Trigger dbo.CheckTravelAgency    Script Date: 7/23/2001 11:19:58 AM ******/

/****** Object:  Trigger dbo.CheckTravelAgency    Script Date: 6/19/2001 2:47:13 AM ******/
CREATE TRIGGER CheckTravelAgency ON [TravelAgency] 
FOR INSERT, UPDATE, DELETE 
AS
	Declare @type int, @location int
	Select @type = i.CategoryID, @location = i.LocationID
	From Inserted i
		If (@type <> ( Select CategoryID
			         From    Location
			         Where Location.ID = @location ) ) 
			Begin
				print 'Khong ton tai dia danh nay'
				Rollback Transaction
			End


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

