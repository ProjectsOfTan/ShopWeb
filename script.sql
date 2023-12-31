USE [master]
GO
/****** Object:  Database [Tan_Shop1]    Script Date: 3/23/2023 1:24:27 PM ******/
CREATE DATABASE [Tan_Shop1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tan_Shop1', FILENAME = N'D:\sql\MSSQL15.MSSQLSERVER\MSSQL\DATA\Tan_Shop1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tan_Shop1_log', FILENAME = N'D:\sql\MSSQL15.MSSQLSERVER\MSSQL\DATA\Tan_Shop1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tan_Shop1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tan_Shop1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tan_Shop1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tan_Shop1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tan_Shop1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tan_Shop1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tan_Shop1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tan_Shop1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tan_Shop1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tan_Shop1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tan_Shop1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tan_Shop1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tan_Shop1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tan_Shop1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tan_Shop1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tan_Shop1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tan_Shop1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tan_Shop1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tan_Shop1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tan_Shop1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tan_Shop1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tan_Shop1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tan_Shop1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tan_Shop1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tan_Shop1] SET RECOVERY FULL 
GO
ALTER DATABASE [Tan_Shop1] SET  MULTI_USER 
GO
ALTER DATABASE [Tan_Shop1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tan_Shop1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tan_Shop1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tan_Shop1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tan_Shop1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tan_Shop1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tan_Shop1', N'ON'
GO
ALTER DATABASE [Tan_Shop1] SET QUERY_STORE = OFF
GO
USE [Tan_Shop1]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[object]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[object](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ob] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[u_email] [varchar](25) NULL,
	[oder_date] [varchar](50) NULL,
	[total_price] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [varchar](50) NULL,
	[size] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[object_id] [int] NULL,
	[color] [nvarchar](15) NULL,
	[desc] [nvarchar](max) NULL,
	[unit_in_stock] [int] NOT NULL,
	[unit_price] [varchar](100) NULL,
	[discount] [int] NOT NULL,
	[img] [nvarchar](250) NULL,
	[cate_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [int] NOT NULL,
	[size] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size_product]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size_product](
	[id_size] [int] NOT NULL,
	[id_pro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_size] ASC,
	[id_pro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/23/2023 1:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[email] [varchar](25) NOT NULL,
	[firstname] [nvarchar](15) NOT NULL,
	[lastname] [nvarchar](15) NOT NULL,
	[pass] [varchar](20) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[gender] [bit] NULL,
	[DoB] [date] NULL,
	[address] [nvarchar](80) NOT NULL,
	[image] [nvarchar](100) NULL,
	[admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Áo Polo')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Áo Khoác')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Áo Sơ Mi')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Áo Len')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Áo Nỉ')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'Áo Thun')
INSERT [dbo].[categories] ([id], [name]) VALUES (7, N'Quần Jeans')
INSERT [dbo].[categories] ([id], [name]) VALUES (8, N'Quần Âu')
INSERT [dbo].[categories] ([id], [name]) VALUES (9, N'Quần Short')
INSERT [dbo].[categories] ([id], [name]) VALUES (10, N'Quần Kaki')
INSERT [dbo].[categories] ([id], [name]) VALUES (11, N'Áo Thun Thể Thao')
INSERT [dbo].[categories] ([id], [name]) VALUES (12, N'Áo Polo Thể Thao')
INSERT [dbo].[categories] ([id], [name]) VALUES (13, N'Quần Polo Thể Thao')
INSERT [dbo].[categories] ([id], [name]) VALUES (14, N'Áo Ba Lỗ')
INSERT [dbo].[categories] ([id], [name]) VALUES (15, N'Áo Giữ Nhiệt')
INSERT [dbo].[categories] ([id], [name]) VALUES (16, N'Quần Lót')
INSERT [dbo].[categories] ([id], [name]) VALUES (17, N'Đầm Nữ')
INSERT [dbo].[categories] ([id], [name]) VALUES (18, N'Chân váy Nữ')
INSERT [dbo].[categories] ([id], [name]) VALUES (19, N'Đồ Mặc Ở Nhà')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[object] ON 

INSERT [dbo].[object] ([id], [ob]) VALUES (1, N'Nam')
INSERT [dbo].[object] ([id], [ob]) VALUES (2, N'Nữ')
INSERT [dbo].[object] ([id], [ob]) VALUES (3, N'Trẻ em')
SET IDENTITY_INSERT [dbo].[object] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (1, N'nam@gmail.com', N'2023-03-15', N'428.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (2, N'nam@gmail.com', N'2023-03-15', N'12.980.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (3, N'nam@gmail.com', N'2023-03-15', N'26.946.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (4, N'nam@gmail.com', N'2023-03-15', N'26.946.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (5, N'nam@gmail.com', N'2023-03-16', N'13.450.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (6, N'nam@gmail.com', N'2023-03-16', N'10.304.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (7, N'nam@gmail.com', N'2023-03-16', N'174.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (8, N'nam@gmail.com', N'2023-03-16', N'796.000')
INSERT [dbo].[order] ([id], [u_email], [oder_date], [total_price]) VALUES (9, N'nam@gmail.com', N'2023-03-16', N'1.070.000')
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (1, 11, 1, N'214.000', N'M')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (1, 11, 1, N'214.000', N'XL')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (2, 82, 20, N'12.980.000', N'M')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (3, 119, 54, N'26.946.000', N'2XL')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (4, 119, 54, N'26.946.000', N'2XL')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (5, 12, 50, N'13.450.000', N'XL')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (6, 13, 46, N'10.304.000', N'L')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (7, 14, 1, N'174.000', N'L')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (8, 18, 4, N'796.000', N'12')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (9, 11, 4, N'856.000', N'L')
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [price], [size]) VALUES (9, 11, 1, N'214.000', N'M')
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (3, N'Áo Polo Nữ Cafe Phối Nẹp Siêu Nhẹ Siêu Mát', 2, N'Nâu', N'Chất liệu: Vải Cafe với thành phần 50% Sợi cafe, 50% sợi tái chế PET.Vải Cafe được làm từ bột cafe có đặc tính khử mùi tốt - nhanh khô - chống tia UV.Bảo vệ cơ thể, hạn chế tiếp xúc với tia UV.Kháng khuẩn, khử mùi giúp bạn tự tin khi vận động, ngày hè hay đơn giản là tham gia 1 bữa tiệc nướng.An toàn cho da, thân thiện môi trường.Áo có form dáng suông nhẹ, bo nẹp, phối cổ và tay áo khỏe khoắn và lịch sự, thích hợp mặc đi chơi, đi làm', 25, N'329.000', 0, N'ao-polo-nu-nau1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (4, N'Áo Polo Nữ Cafe Cổ Trơn Siêu Nhẹ Thoáng Khí', 2, N'Navy', N'Chất liệu: Vải Cafe (50% sợi cafe và 50% sợi PET tái chế).Vải Cafe được làm từ bột bã cafe có đặc tính siêu nhẹ, siêu mát.Nổi bật vượt trội với khả năng kiểm soát mùi cơ thể tự nhiên và chống tia UV.An toàn cho da, thân thiện môi trường.Các đường nét cắt vải được làm mềm mại hơn, form áo tối ưu cho nữ giới giúp chị em có thể tôn lên vóc dáng thon gọn của mình', 45, N'329.000', 0, N'ao-polo-nu-cafe-navy1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (6, N'Áo Polo Nữ Cafe Cổ Trơn Siêu Nhẹ Thoáng Khí', 2, N'Đỏ', N'Chất liệu: Vải Cafe (50% sợi cafe và 50% sợi PET tái chế).Vải Cafe được làm từ bột bã cafe có đặc tính siêu nhẹ, siêu mát.Nổi bật vượt trội với khả năng kiểm soát mùi cơ thể tự nhiên và chống tia UV.An toàn cho da, thân thiện môi trường.Các đường nét cắt vải được làm mềm mại hơn, form áo tối ưu cho nữ giới giúp chị em có thể tôn lên vóc dáng thon gọn của mình', 24, N'329.000', 0, N'ao-polo-nu-cafe-do1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (7, N'Áo Polo Nữ Coolmax Phối Bo', 2, N'Xanh coban', N'Chất liệu: 95% CoolMax và 5% spandex.Áo được làm từ vải coolmax nên nhẹ, xốp, thoáng mát, truyền dẫn ẩm tốt.Bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí, hút ẩm cực tốt và cực kỳ nhanh khô.Sản phẩm có tính đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.Thiết kế phối nẹp 3 cúc cao cấp, bo phần gấu tay và cổ làm cho sản phẩm sang trọng & tiện lợi hơn.', 40, N'349.000', 0, N'ao-polo-nu-coolmax-xanh-coban1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (8, N'Áo Polo Nữ Coolmax Phối Bo', 2, N'Trắng', N'Chất liệu: 95% CoolMax và 5% spandex.Áo được làm từ vải coolmax nên nhẹ, xốp, thoáng mát, truyền dẫn ẩm tốt.Bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí, hút ẩm cực tốt và cực kỳ nhanh khô.Sản phẩm có tính đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.Thiết kế phối nẹp 3 cúc cao cấp, bo phần gấu tay và cổ làm cho sản phẩm sang trọng & tiện lợi hơn.', 48, N'349.000', 0, N'ao-polo-nu-coolmax-trang1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (10, N'Chân Váy Ôm Kaki Ngắn', 2, N'Tím than', N'Chất liệu: Vải Kaki dệt thoi (98% cotton, 2% spandex).
Chân váy kaki có cấu trúc chắc chắn, bề mặt vải khít.
Sợi vải thoáng khí, thấm hút mồ hôi tốt, thoải mái diện quanh năm.
Thiết kế tôn dáng, trẻ trung, năng động và bảng màu đa dạng cho chị em lựa chọn', 32, N'359.000', 50, N'chan-vay-om-kaki.jpg', 18)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (11, N'Quần Jeans Nữ Dáng Skinny Thêu Túi', 2, N'Xanh', N'Chất liệu: 99% cotton, 1% spandex.
Độ co giãn tốt tạo sự thỏa mái trong mọi hoạt động cho cơ thể.
Chất vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu.
Quần jean nữ với kiểu dáng và màu sắc trẻ trung, thiết kế basic nhưng lên màu cá tính', 33, N'429.000', 50, N'qjn4002-xah-01.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (12, N'Quần Jeans Nữ Skinny Coolmax Tôn Dáng', 2, N'Xanh sáng', N'Chất liệu Jean Coolmax

Vải thoáng mát, truyền dẫn ẩm tốt, bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí và ẩm.
Khả năng thấm hút mồ hôi tốt, hút ẩm nhanh tạo sự thoải mái cho cơ thể khi sử dụng.
Đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.
Phù hợp với thời tiết quanh năm', 0, N'539.000', 50, N'qjn5082-xas-8.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (13, N'Quần Jeans Nữ Ống Đứng Lưng Cao', 2, N'Xanh đậm', N'Quần jean ống đứng, chất liệu jean co giãn.
Vải mềm, có sự đàn hồi tạo cảm giác thoải mái cho người mặc.
Quần rất tôn dáng, giúp che đi khuyết điểm chân cong.
Thiết kế basic, chải màu tự nhiên tạo các sắc độ màu trẻ trung, dễ phối đồ', 0, N'449.000', 50, N'qjn4064-xdm4.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (14, N'Áo Thun Nữ Cotton USA In Hình Zebra Skin', 2, N'Trắng', N'Sử dụng chất liệu: 95% cotton + 5% spendex.
Phom dáng rộng giúp che khuyết điểm cơ thể, tạo sự thoải mái cho người mặc.
Thiết kế cổ tròn thanh lịch, hình in nổi bật trước ngực.
Áo không quá dày, thoáng mát, thấm hút mồ hôi, màu sắc thanh lịch.
Sản phẩm thích hợp mặc đi học, đi làm, đi chơi,', 22, N'249.000', 30, N'tsn5230-tra-2.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (17, N'Áo Polo Nam Mắt Chim Phối Màu In Kẻ', 1, N'Đỏ', N'Chất liệu Mắt chim Solid với 49%Cotton, 47% Polyester, 4% Spandex.
Thiết kế trẻ trung, phom ôm vừa phải phù hợp với mọi dáng người.
Áo có thể mặc đi làm, đi chơi, dạo phố.
Kết hợp với quần âu, jeans, short,... theo nhiều phong cách và hoàn cảnh khác nhau', 45, N'369.000', 27, N'ao-polo-nam-mat-chim-phoi-mau-in-ke-apm6075-ddo-6.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (18, N'Quần Jeans Trẻ Em Ống Suông Cạp Chun', 3, N'Xanh đậm', N'Chất liệu: Denim cotton với thành phần 98% cotton, 2% spandex.
Vải mang đến sự mềm mại, thoải mái và thoáng khí cho bé.
Sợi spandex giúp mang đến sự co giãn tối đa, tạo sự tiện lợi cho mọi hoạt động hằng ngày.
Nên ngâm phèn chua 1h hoặc để tủ đá 1 đêm trước khi giặt lần đầu để tránh phai màu nhiều.
Kiểu dáng suông phù hợp với nhiều vóc dáng các bé từ 8-15 tuổi', 19, N'399.000', 50, N'qjk5011-xdm-kid4206-keh-10.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (19, N'Áo Nỉ Trẻ Em Like Star', 3, N'Tím', N'Áo nỉ thu đông dành cho trẻ em, dễ thương - ấn tượng.
Chất vải nỉ dày dặn, ấm áp, giữ nhiệt tốt bảo vệ bé khỏi thời tiết giá lạnh.
Thiết kế in chữ công nghệ cao, bền đẹp, dễ thương.
Sản phẩm có 3 phiên bản màu sắc mưới mẻ, dễ mặc: tím, cam, trắng', 42, N'299.000', 50, N'atk5044-tim-14.jpg', 5)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (21, N'Quần Jeans Nữ Dáng Suông Ống Đứng Xắn Gấu', 2, N'Xanh đậm', N'Quần jeans nữ dáng suông đứng có chi tiết xắn gấu trẻ trung. Dáng quần vừa vặn giúp tôn đôi chân dài hơn và che đi khuyết điểm nếu bắp chân to.
Chất liệu jean co giãn 4 chiều thoải mãi, dễ dàng vận động.
Chiếc quần có thể kết hợp với áo T-shirt, Polo, Sơ mi, Tank-top... mặc được cả mùa đông và mùa hè. Sản phẩm sử dụng được trong nhiều hoàn cảnh đi làm, đi chơi', 30, N'499.000', 50, N'quan-jean-nu-qjn5066-xdm-plus-atn5170-tra-9-yodyvn.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (22, N'Áo Nỉ Trẻ Em Like Star', 3, N'Cam nhạt', N'Áo nỉ thu đông dành cho trẻ em, dễ thương - ấn tượng.
Chất vải nỉ dày dặn, ấm áp, giữ nhiệt tốt bảo vệ bé khỏi thời tiết giá lạnh.
Thiết kế in chữ công nghệ cao, bền đẹp, dễ thương.
Sản phẩm có 3 phiên bản màu sắc mưới mẻ, dễ mặc: tím, cam, trắng', 23, N'299.000', 50, N'atk5044-can-8.jpg', 5)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (23, N'Áo Polo Thể Thao Nam Umorfil', 1, N'Đỏ đô', N'Chất liệu 88% Recycle Polyester + 12% Elastane.
Sợi Poly tái chế bền chắc.
Chất liệu mềm mát mịn phù hợp mặc thời tiết hè nóng bức.
Áo polo nam thể thao form slim fit trẻ trung năng động.
Hình in phản quang nổi bật ở nẹp, ngực và sườn áo', 25, N'339.000', 50, N'sam5043-dod-5.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (24, N'Áo Sơ Mi Dài Tay Nữ Cafe Kẻ Dáng Rộng', 2, N'Hồng', N'Áo sơ mi dài tay vải Cafe sở hữu 1 loạt tính năng ưu việt.
Sợi cafe có cấu trúc lỗ, trên bề mặt sợi có hàng triệu lỗ nhỏ, các lỗ nhỏ này giúp mang lại nhiều công dụng tiên tiến.
Áo có khả năng Thấm hút nhanh, khô nhanh: các lỗ nhỏ trên cấu trúc xơ sợi cafe làm tăng diện tích tiếp xúc, làm cho hơi ẩm hoặc giọt nước lan nhanh ra diện rộng, làm cho nước hút vào vải rất nhanh và bốc hơi nhanh.
Không bám mùi hôi: các lỗ nhỏ trên bề mặt xơ sợi có chức năng chứa đựng chất thải tiết từ cơ thể, bụi bẩn từ môi trường. Khi giặt thì các lỗ này giải phóng hết các  bụi bẩn ra ngoài, không còn lưu lại trên vải nên không gây ra mùi hôi trên vải.
Chống tia UV: Các lỗ nhỏ trên xơ sợi cafe có khả năng khúc xạ lại ánh sáng và tia UV giúp chống tia UV hiệu quả.
Đặc biệt vải được dệt theo hiệu ứng Flannel cào lông nhẹ bề mặt tạo cảm giác mềm mượt cho da.
Một thiết kế không thể bỏ lỡ', 26, N'499.000', 50, N'smn5200-hog-6.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (27, N'Áo Thu Đông Trẻ Em In Gấu Puff', 3, N'Xanh dương', N'Áo nỉ cho bé in hình gấu Puff siêu đáng yêu.
Chất liệu:  95% CVC + 5% Spandex với kết cấu sợi tạo nên mặt vải đanh chắc giúp áo không bị bai dão, ít xù, độ bền cao.
Chiếc áo có khả năng thấm hút và co giãn tốt, mang đến trạng thái thoải mái nhất cho bé khi hoạt động.
Thiết kế dài tay giữ ấm cho cơ thể bé khi trời se lạnh', 20, N'249.000', 50, N'hdk5129-xdu17.jpg', 4)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (28, N'Áo Phao Nam 3s Plus', 1, N'Xanh cổ vịt', N'Có khả năng trượt nước tới 10 lần giặt.
Trọng lượng siêu nhẹ (chỉ ~300gram) nhưng vẫn giữ ấm cơ thể cực tốt, dễ dàng gấp lại và mang đi.
Thiết kế vừa vặn, khỏe khoắn thuận tiện cho các hoạt động ngoài trời.
Mũ có thể tháo rời, cổ tay áo và gấu chun ôm người, giữ ấm tốt.
Túi áo 2 bên có khóa kéo chắc chắn chống rơi đồ, túi rộng dễ để điện thoại, vật dụng cần thiết.
Màu sắc đa dạng lựa chọn, phát triển thêm bộ màu mới thời trang hơn', 32, N'699.000', 30, N'phm5017-xcv-05.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (29, N'Quần Short Nam Thể Thao Quốc Dân', 1, N'Đen', N'Quần short nam thể thao.
Thiết kế cạp chun cả vòng bản to vô cùng khỏe khoắn.
Dây rút chất lượng bền đẹp, có in logo chính hãng tại đầu dây.
Túi cạnh sườn có khóa kéo vô cùng thuận tiện cho các anh.
Thiết kế thể thao, khỏe khoắn, chất liệu mềm mại, nhẹ nhàng phù hợp vận động', 20, N'179.000', 10, N'sqm5021-den-1.jpg', 9)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (30, N'Quần Short Nam Phối Chỉ Nổi', 1, N'Vàng', N'Quần short nam thiết kế cơ bản dài ngang gối.
Chất liệu kaki mềm nhẹ. cạp quần to bản có đỉa tiện lợi.
Thiết kế túi cúc giúp các nh có thể đựng đồ nhỏ gọn như ví, chìa khóa.
Form trẻ trung, lịch lãm, thích hợp mặc ở nhà hoặc ra ngoài cafe, hẹn hò đều được', 35, N'359.000', 20, N'quan-sooc-nam-apm5351-den-qsm5055-vag-3-yodyvn.jpg', 9)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (31, N'Quần Âu Nam Slim Lé Sườn', 1, N'Tím than', N'Quần âu nam nano dáng slim.
Thiết kế cơ bản đặc trưng cho những chiếc quần âu lịch lãm.
Chi tiết logo thêu tỉ mỉ, chắc chắn.
Kẻ sọc trên bề mặt vải tạo nét riêng cho chiếc quần này.
Sợi vải nano mang đến sự thoải mái, co giãn vừa phải trong quá trình sử dụng', 21, N'549.000', 30, N'qam5023-tit-1.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (32, N'Quần Kaki Nam Slim', 1, N'Tím than', N'Chất liệu Kaki co giãn thoải mái khi mặc.
Thiết kế cơ bản túi chéo canh sườn và túi hậu có cái cúc, cạp quần to chắc chắn có đỉa để đeo thắt lưng.
Quần kaki nam slim phù hợp cho nam giới và có thể sử dụng trong nhiều hoàn cảnh khác nhau', 20, N'499.000', 30, N'qkm5123-tit-1.jpg', 10)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (34, N'Quần Kaki Nam Slim', 1, N'Xám', N'Chất liệu Kaki co giãn thoải mái khi mặc.
Thiết kế cơ bản túi chéo canh sườn và túi hậu có cái cúc, cạp quần to chắc chắn có đỉa để đeo thắt lưng.
Quần kaki nam slim phù hợp cho nam giới và có thể sử dụng trong nhiều hoàn cảnh khác nhau', 32, N'499.000', 30, N'qkm5123-xam-4.jpg', 10)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (36, N'Áo Polo Nữ Coolmax Thoáng Mát Bo Cổ Phối Màu', 2, N'Xanh Biển', N'Coolmax cho trải nghiệm thoáng mát khi mặc, mềm mại trên da và đặc biệt khoan khoái hơn so với những chất vải áo cotton, polyester thông thường.
Điểm nhấn phối màu bo cổ cùng nẹp áo trẻ trung.
Form áo ôm vừa phải được làm đơn giản nên có thể kết hợp với nhiều trang phục khác nhau.
Bạn có thể mặc áo khi đi làm nơi công sở, hay đi chơi xuống phố', 21, N'349.000', 0, N'apn5304-xbi-cjn4062-bee-3.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (38, N'Áo Polo Nữ Pique Mắt Chim Phối Tay Cổ Kẻ', 2, N'Trắng', N'Chất liệu: Pique mắt chim với thành phần 60% Cotton USA + 35% Polyester + 5% Spandex.
Sử dụng Cotton USA - sợi cotton tốt nhất trên thế giới.
Công nghệ nhuộm Solid Dyed tạo nên hiệu ứng bắt mắt.
Chất liệu vải độc đáo với hiệu ứng mắt chim độc đáo, mới lạ và trẻ trung.
Vải pique thông thoáng, thấm hút tốt có độ bền cao.
Áo co giãn tốt, luôn giữ được form và bền màu', 22, N'289.000', 0, N'apn5036-tra1-yody-vn.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (39, N'Áo Polo Nữ Pique Mắt Chim Phối Tay Cổ Kẻ', 2, N'Tím than', N'Chất liệu: Pique mắt chim với thành phần 60% Cotton USA + 35% Polyester + 5% Spandex.
Sử dụng Cotton USA - sợi cotton tốt nhất trên thế giới.
Công nghệ nhuộm Solid Dyed tạo nên hiệu ứng bắt mắt.
Chất liệu vải độc đáo với hiệu ứng mắt chim độc đáo, mới lạ và trẻ trung.
Vải pique thông thoáng, thấm hút tốt có độ bền cao.
Áo co giãn tốt, luôn giữ được form và bền màu', 22, N'289.000', 0, N'apn5036-tit0-yody-vn.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (43, N'Áo Polo Nữ Modal Phối Kẻ', 2, N'Xanh', N'Chất liệu: Vải Modal (95% Modal + 5% spandex).
Modal là loại vải được làm từ gỗ sồi - 1 loại cây phổ biến ở khu vực Bắc Âu.
Vải Modal sạch và lành tính mang lại cảm giác thoải mái, thoáng mát chon người mặc.
Co giãn nhẹ, form suông cơ bản.
Thiết kế kẻ ngang - Striped Polo mang đến nét trẻ trung ấn tượng', 22, N'329.000', 0, N'apn5394-xbi04.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (44, N'Áo Polo Thể Thao Nữ Airycool Phối Nẹp', 2, N'Đen', N'Chất liệu Airycool với thành phần: 85% Polyamide + 15% Spandex.
Sản phẩm nằm trong BST YODY Sport - Áo Polo thể thao mới.
Công nghệ làm mát FREEZING tiên tiến giúp giải nhiệt cơ thể cho ngày hè mát mẻ.
Áo mềm mịn, thoáng thoáng, hút ẩm tốt.
Đặc tính khô nhanh giúp dễ dàng giặt và bảo quản.
Thoải mái tham gia các vận động cường độ cao nhờ chất liệu co giãn, giữ form', 40, N'349.000', 0, N'san5028-den-4-jpeg.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (46, N'Áo Polo Thể Thao Nữ Airycool Phối Nẹp', 2, N'Đỏ', N'Chất liệu Airycool với thành phần: 85% Polyamide + 15% Spandex.
Sản phẩm nằm trong BST YODY Sport - Áo Polo thể thao mới.
Công nghệ làm mát FREEZING tiên tiến giúp giải nhiệt cơ thể cho ngày hè mát mẻ.
Áo mềm mịn, thoáng thoáng, hút ẩm tốt.
Đặc tính khô nhanh giúp dễ dàng giặt và bảo quản.
Thoải mái tham gia các vận động cường độ cao nhờ chất liệu co giãn, giữ form', 40, N'349.000', 0, N'san5028-ddo-5-jpeg.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (48, N'Áo Khoác Gió Nữ 3C Plus Năng Động', 2, N'Đen', N'Áo khoác gió nữ 3C PLUS: Cản gió, Cản bụi, Chống ngấm nước vào bên trong.
Phiên bản nâng cấp của Áo gió 3C.
Giữ ấm hiệu quả mà vẫn đảm bảo vẻ ngoài gọn gàng nhờ cấu trúc 2 lớp dày dặn, bền chắc.
Linh hoạt khi sử dụng với thiết kế mũ áo có thể tháo rời, gấu áo có chun rút tùy chỉnh theo yêu cầu mong muốn của khách hàng.
Chun tay ôm vừa vặn giúp cản gió trong quá trình di chuyển bằng xe máy, xe đạp....
Công nghệ in nhũ bạc mang đến sự sang trọng, cao cấp cho áo gió của bạn', 56, N'499.000', 0, N'akn5040-den-6.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (49, N'Áo Khoác Gió Nữ 3C Plus Năng Động', 2, N'Hồng', N'Áo khoác gió nữ 3C PLUS: Cản gió, Cản bụi, Chống ngấm nước vào bên trong.
Phiên bản nâng cấp của Áo gió 3C.
Giữ ấm hiệu quả mà vẫn đảm bảo vẻ ngoài gọn gàng nhờ cấu trúc 2 lớp dày dặn, bền chắc.
Linh hoạt khi sử dụng với thiết kế mũ áo có thể tháo rời, gấu áo có chun rút tùy chỉnh theo yêu cầu mong muốn của khách hàng.
Chun tay ôm vừa vặn giúp cản gió trong quá trình di chuyển bằng xe máy, xe đạp....
Công nghệ in nhũ bạc mang đến sự sang trọng, cao cấp cho áo gió của bạn', 56, N'499.000', 0, N'akn5040-hog-atn5100-tra-4.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (50, N'Áo Măng Tô Nữ Ngắn Đai Buộc Eo', 2, N'Đen', N'Áo khoác măng tô nữ dáng ngắn đai eo cổ V.
Có kèm dây đai chỉnh eo, mặc cực tôn dáng.
Thiết kế cổ V trẻ trung phù hợp với vóc dáng phụ nữ Việt Nam.
Có thể diện bất cứ đâu như đi chơi, hẹn hò, cafe vô cùng trẻ trung, lịch sự.
Chiếc áo khiến nàng tự tin với hình ảnh hiện đại, năng động và lôi cuốn', 56, N'349.000', 0, N'mtn5008-den-4.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (51, N'Áo Khoác Nữ Kaki Dáng Ngắn', 2, N'Xanh Rêu', N'Chất liệu sản phẩm: Vải kaki.
Đường may và sợi vải chắc chắn, thân thiện với người dùng.
Áo khoác nhẹ trong thời tiết sẽ lạnh cũng như chống nắng.
Thiết kế chi tiết túi điểm nhấn và cá tính.
Kiểu dáng ngắn, khỏe khoắn, dễ dàng mix với các trang phục như chân váy, jeans', 43, N'299.000', 0, N'akn5006-reu-5.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (58, N'Áo Thun Nữ Cổ Tròn Borip Dáng Ôm Basic', 2, N'Tím than', N'Chất liệu: 90% polyeste + 10% spandex.
Chất liệu vải mềm mại, thông thoáng, thấm hút nhanh tạo cảm giác cử động thoải mái.
Áo thun tay ngắn dáng ôm, khoe dáng tinh tế.
Thiết kiểu dáng áo kết hợp đa dạng với quần bò baggy, chân váy, quần short.
Áo mặc phù hợp cho mùa thu và mùa hè', 32, N'169.000', 0, N'tsn5002-tit-15.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (60, N'Áo T-Shirt Nữ Thun Ôm Vải Zip', 2, N'Đen', N'Chất liệu: 84% Nylon + 16% Spandex.
Sở hữu loạt ưu điểm nổi bật.
Mềm mịn, thông thoáng, thấm hút tốt.
Co giãn, giữ form hiệu quả.
Độ bền cao, bền màu', 23, N'199.000', 0, N'tshirt-nu-thun-om-vai-zip-tsn6290-den-4.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (61, N'Áo T-Shirt Nữ Thun Ôm Vải Zip', 2, N'Trắng', N'Chất liệu: 84% Nylon + 16% Spandex.
Sở hữu loạt ưu điểm nổi bật.
Mềm mịn, thông thoáng, thấm hút tốt.
Co giãn, giữ form hiệu quả.
Độ bền cao, bền màu', 23, N'199.000', 0, N'tshirt-nu-thun-om-vai-zip-tsn6290-tra-3.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (62, N'Áo Sơ Mi Tay Dài Nữ In Họa Tiết Loang', 2, N'Xanh', N'Chất liệu lụa Satin.
Sơ mi nữ - Thiết kế ấn tượng mới cho nàng tự tin khoe cá tính.
Sử dụng công nghệ tiên tiến giúp tạo hiệu ứng loang màu bắt mắt cho chiếc áo của bạn thêm màu sắc ấn tượng.
Bổ sung vào tủ đồ thời trang 1 item đầy phá cách, hiện đại.
Phù hợp phối với những item khác trơn màu để chiếc sơ mi thêm phần nổi bật', 22, N'499.000', 0, N'ao-o-mi-nu-smn6046-xlg-5-yodyvn.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (63, N'Áo Sơ Mi Tay Dài Nữ In Họa Tiết Loang', 2, N'Hồng', N'Chất liệu lụa Satin.
Sơ mi nữ - Thiết kế ấn tượng mới cho nàng tự tin khoe cá tính.
Sử dụng công nghệ tiên tiến giúp tạo hiệu ứng loang màu bắt mắt cho chiếc áo của bạn thêm màu sắc ấn tượng.
Bổ sung vào tủ đồ thời trang 1 item đầy phá cách, hiện đại.
Phù hợp phối với những item khác trơn màu để chiếc sơ mi thêm phần nổi bật', 22, N'499.000', 0, N'ao-o-mi-nu-smn6046-hlg-8-yodyvn.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (64, N'Áo Sơ Mi Tay Dài Nữ Suông Cúc Bọc', 2, N'Hồng', N'Chất liệu: Lụa satin.
Áo sơ mi nữ tay dài suông cúc bọc có tông màu thanh lịch.
Thiết kế đơn giản với đường may tinh tế và tỉ mỉ khiến các chi tiết tạo nên chiếc áo vô cùng bắt mắt và tinh xảo.
Kiểu dáng phổ thông dễ dàng kết hợp với nhiều item như quần âu, chân váy và phụ kiện khác nhau.
Sản phẩm hiện đại, trẻ trung phù hợp để mặc đi làm, đi chơi, dạo phố', 21, N'389.000', 0, N'smn5212-hog-6.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (66, N'Áo Sơ Mi Nữ Tay Dài Lụa Satin Mềm Mịn', 2, N'Đen', N'Chất liệu lụa satin mềm mướt, nhẹ nhàng.
Thích hợp mặc trong cả mùa thu, xuân khi tiết trời còn se lạnh.
Các phiên bản màu sắc tươi sáng, trẻ trung phù hợp mix & match đa dạng đi làm, đi chơi.
Có thể phối cùng quần biker, jeans, quần âu, chân váy...', 44, N'399.000', 0, N'smn5210-den-18.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (67, N'Áo Sơ Mi Nữ Tay Dài Lụa Satin Mềm Mịn', 2, N'Xanh', N'Chất liệu lụa satin mềm mướt, nhẹ nhàng.
Thích hợp mặc trong cả mùa thu, xuân khi tiết trời còn se lạnh.
Các phiên bản màu sắc tươi sáng, trẻ trung phù hợp mix & match đa dạng đi làm, đi chơi.
Có thể phối cùng quần biker, jeans, quần âu, chân váy...', 44, N'399.000', 0, N'smn5210-xah-19.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (68, N'Áo Sơ Mi Nữ Tay Dài Lụa Satin Mềm Mịn', 2, N'Hồng', N'Chất liệu lụa satin mềm mướt, nhẹ nhàng.
Thích hợp mặc trong cả mùa thu, xuân khi tiết trời còn se lạnh.
Các phiên bản màu sắc tươi sáng, trẻ trung phù hợp mix & match đa dạng đi làm, đi chơi.
Có thể phối cùng quần biker, jeans, quần âu, chân váy...', 44, N'399.000', 0, N'smn5210-hog-20.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (69, N'Áo Sơ Mi Nữ Tay Dài Form Rộng Thoáng Mát', 2, N'Trắng', N'Chất liệu vải thô đũi.
Thấm hút mồ hôi tốt, mềm mại & bền màu.
Thiết kế freesize thoải mái, linh hoạt nhiều kiểu mặc, phối đồ cho các chị em.
Không chỉ mặc đi làm mà còn có thể làm áo khoác ngoài, phối áo croptop cá tính để diện đi chơi', 21, N'449.000', 0, N'smn5056-tra-7.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (72, N'Áo Sơ Mi Nữ Tay Ngắn Nano Giữ Form Ít Nhăn', 2, N'Xanh', N'Chất liệu sản phẩm: 100% Polyester.
Được trang bị lớp Anti Bacterial kháng khuẩn, khử mùi tốt.
Thấm hút vượt trội gấp 3 lần cotton.
Chỉ số chống nắng UPF – 53, giúp điều hòa thân nhiệt trước tác động của thời tiết.
Mát hơn 2.7 độ C so với sợi tổng hợp, sợi bông....
Kiểu dáng đứng form lịch sự nhưng không hề mất đi nét nữ tính', 22, N'459.000', 0, N'scn3000-xnh-11.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (73, N'Áo Sơ Mi Nữ Tay Ngắn Nano Giữ Form Ít Nhăn', 2, N'Trắng', N'Chất liệu sản phẩm: 100% Polyester.
Được trang bị lớp Anti Bacterial kháng khuẩn, khử mùi tốt.
Thấm hút vượt trội gấp 3 lần cotton.
Chỉ số chống nắng UPF – 53, giúp điều hòa thân nhiệt trước tác động của thời tiết.
Mát hơn 2.7 độ C so với sợi tổng hợp, sợi bông....
Kiểu dáng đứng form lịch sự nhưng không hề mất đi nét nữ tính', 22, N'459.000', 0, N'scn3000-tra-8.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (74, N'Quần Jeans Nữ Ống Suông Xanh Nhạt', 2, N'Xanh', N'Chất liệu: Denim dệt thoi (98% cotton, 2% spandex).
Độ co giãn tốt tạo sự thỏa mái trong mọi hoạt động của cơ thể tạo nên nét cá tính và sự trẻ trung cho các bạn nữ.
Chất vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu.
Nên ngâm phèn chua 1h hoặc để tủ đá 1 đêm trước khi giặt lần đầu để tránh phai màu nhiều', 21, N'299.000', 0, N'smn4376-tra-qjn4026-xah-3.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (76, N'Quần Âu Nữ Relax Pants Co Giãn 4 Chiều', 2, N'Trắng', N'Thiết kế sang trọng, cho vẻ ngoài chỉn chu khi đi làm, phong cách xuống phố.
Chất liệu “thông minh” co giãn theo cả hai chiều: polyester giúp chiếc quần đứng dáng, kết hợp với viscose tạo nên độ mềm mại khi chạm vào da, cài thêm sợi spandex giúp chiếc quần co giãn tốt, thoải mái trong mọi chuyển động.
Vải hạn chế nhăn, tiết kiệm thời gian chăm sóc giúp bạn tận hưởng cuộc sống trọn vẹn hơn.
Thoáng mát, thấm hút', 22, N'499.000', 0, N'qan5176-bee-1.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (77, N'Quần Âu Nữ Relax Pants Co Giãn 4 Chiều', 2, N'Nâu', N'Thiết kế sang trọng, cho vẻ ngoài chỉn chu khi đi làm, phong cách xuống phố.
Chất liệu “thông minh” co giãn theo cả hai chiều: polyester giúp chiếc quần đứng dáng, kết hợp với viscose tạo nên độ mềm mại khi chạm vào da, cài thêm sợi spandex giúp chiếc quần co giãn tốt, thoải mái trong mọi chuyển động.
Vải hạn chế nhăn, tiết kiệm thời gian chăm sóc giúp bạn tận hưởng cuộc sống trọn vẹn hơn.
Thoáng mát, thấm hút', 22, N'499.000', 0, N'qan5176-nau-1.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (79, N'Quần Âu Nữ Dáng Sông Đai Oze', 2, N'Đen', N'Quần âu nữ dáng suông thoải mái và thanh lịch dành cho phái đẹp đi chơi, đi làm.
Màu sắc nhã nhặn, dễ lên đồ.
Mềm mại, thoáng mát, ít nhăn và bền màu.
Thiết kế  ống rộng, dáng sông giúp khéo léo che đi khuyết điểm bụng mỡ và chân to của người mặc.
Điểm nhấn với dây buộc trang trí phía trước cạp', 43, N'349.000', 0, N'qan5204-den-6.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (80, N'Quần Âu Nữ Dáng Sông Đai Oze', 2, N'Nâu', N'Quần âu nữ dáng suông thoải mái và thanh lịch dành cho phái đẹp đi chơi, đi làm.
Màu sắc nhã nhặn, dễ lên đồ.
Mềm mại, thoáng mát, ít nhăn và bền màu.
Thiết kế  ống rộng, dáng sông giúp khéo léo che đi khuyết điểm bụng mỡ và chân to của người mặc.
Điểm nhấn với dây buộc trang trí phía trước cạp', 43, N'349.000', 0, N'qan5204-nau-4.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (81, N'Quần Âu Nữ Relax Pants Yody', 2, N'Trắng', N'Quần tây nữ Relax Pants - thoải mái, thanh lịch, trẻ trung.
Chất liệu: 68% polyester, 28% Viscose, 4%Spandex.
Thiết kế sang trọng, cho vẻ ngoài chỉn chu khi đi làm hoặc cafe với bạn bè.
Vô cùng linh hoạt cùng chất liệu “thông minh” co giãn theo cả hai chiều.
Vải hạn chế nhăn, tiết kiệm thời gian chăm sóc giúp bạn tận hưởng cuộc sống trọn vẹn hơn.
Chất liệu Polyester giúp chiếc quần đứng dáng, kết hợp với viscose tạo nên độ mềm mại khi chạm vào da.
Thêm vào đó cài thêm sợi spandex giúp chiếc quần co giãn tốt, thoải mái trong mọi chuyển động', 20, N'649.000', 0, N'qan5198-ghi-14.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (82, N'Quần Âu Nữ Relax Pants Yody', 2, N'Đen', N'Quần tây nữ Relax Pants - thoải mái, thanh lịch, trẻ trung.
Chất liệu: 68% polyester, 28% Viscose, 4%Spandex.
Thiết kế sang trọng, cho vẻ ngoài chỉn chu khi đi làm hoặc cafe với bạn bè.
Vô cùng linh hoạt cùng chất liệu “thông minh” co giãn theo cả hai chiều.
Vải hạn chế nhăn, tiết kiệm thời gian chăm sóc giúp bạn tận hưởng cuộc sống trọn vẹn hơn.
Chất liệu Polyester giúp chiếc quần đứng dáng, kết hợp với viscose tạo nên độ mềm mại khi chạm vào da.
Thêm vào đó cài thêm sợi spandex giúp chiếc quần co giãn tốt, thoải mái trong mọi chuyển động', 0, N'649.000', 0, N'quan-au-nu-relax-pants-qan5198-den-atn5000-tan-15-yodyvn.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (83, N'Quần Tây Nữ Baggy Đai Phối Chun', 2, N'Trắng', N'Chất liệu: vải Tuytsi.
Ưu điểm cho bạn: Mềm mại, ít nhăn, thoáng mát, bền màu.
Nếu bạn đang tìm một chiếc quần mặc đi làm, đi chơi, đi ngao du thì QAN5074 đều có thể đáp ứng.
Đặc biệt nổi bật với thiết kế đai phối chun mang lại sự tiện lợi thoải mái với đa dạng kích thước vòng eo của nàng.
Kiểu dáng thông dụng, thiết kế cơ bản không cầu kỳ', 20, N'449.000', 0, N'qan5074-bee0.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (84, N'Quần Tây Nữ Baggy Đai Phối Chun', 2, N'Đen', N'Chất liệu: vải Tuytsi.
Ưu điểm cho bạn: Mềm mại, ít nhăn, thoáng mát, bền màu.
Nếu bạn đang tìm một chiếc quần mặc đi làm, đi chơi, đi ngao du thì QAN5074 đều có thể đáp ứng.
Đặc biệt nổi bật với thiết kế đai phối chun mang lại sự tiện lợi thoải mái với đa dạng kích thước vòng eo của nàng.
Kiểu dáng thông dụng, thiết kế cơ bản không cầu kỳ', 20, N'449.000', 0, N'qan5074-den1.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (86, N'Quần Lửng Nữ Lưng Cao Ống Rộng', 2, N'Xanh nhạt', N'Chất liệu: Denim - 100% cotton.
Vải DENIM làm từ sợi cotton tự nhiện nên có khả năng thấm hút mồ hôi rất tốt, giúp điều hòa nhiệt độ cơ thể.
Sản phẩm mặc thoáng mát, phù hợp với điều kiện thời tiết mùa xuân, mùa hè.
Chất liệu vải jean dày đẹp, có độ cứng cáp, giúp tôn dáng người mặc.
Thiết kế trẻ trung, cá tính, lưng cao ống rộng giúp nàng tự tin hack dáng và thoải mái di chuyển', 21, N'349.000', 0, N'sjn3052-xnh9.jpg', 9)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (87, N'Quần Short Nữ Kaki Suông Trơn', 2, N'Nâu sữa', N'Chất liệu sản phẩm: Vải kaki .
Đường may và sợi vải chắc chắn, thân thiện với người dùng.
Quần short nữ YODY mềm, thấm hút tốt mang lại trải nghiệm thông thoáng cho mùa hè.
Kiểu dáng suông khỏe khoắn, thiết kế basic không cầu kỳ và rườm rà giúp chị em thoải mái vận động', 21, N'299.000', 0, N'apn3340-tra-sjn4022-nsu-11.jpg', 9)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (89, N'Quần Short Nữ Kaki Suông Trơn', 2, N'Trắng', N'Chất liệu sản phẩm: Vải kaki .
Đường may và sợi vải chắc chắn, thân thiện với người dùng.
Quần short nữ YODY mềm, thấm hút tốt mang lại trải nghiệm thông thoáng cho mùa hè.
Kiểu dáng suông khỏe khoắn, thiết kế basic không cầu kỳ và rườm rà giúp chị em thoải mái vận động', 21, N'299.000', 0, N'tsn4438-den-sjn4022-kem-4.jpg', 9)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (90, N'Quần Short Kaki Nữ Túi Nắp', 2, N'Đen', N'Chất liệu sản phẩm: Vải kaki.
Đường may và sợi vải chắc chắn, thân thiện với người dùng.
Quần short nữ YODY mềm, thấm hút tốt mang lại trải nghiệm thông thoáng cho mùa hè.
Kiểu dáng suông khỏe khoắn, thiết kế basic không cầu kỳ và rườm rà giúp chị em thoải mái vận động', 34, N'349.000', 0, N'qsn5046-den-2.jpg', 9)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (93, N'Áo Polo Nam Airycool Thoáng Mát Phối Bo', 1, N'Vàng', N'Chất liệu vải: Airycool có thành phần 85% Polyamide và 15% spandex.
Sợi Polyamide là cấu tạo chính giúp tạo cảm giác thoải mái, dễ chịu khi mặc.
15% spandex giúp sợi vải thêm bền chắc, tạo form dáng thời trang.
Công nghệ làm mát Freezing giúp tạo lá chắn bảo vệ cơ thể khỏi môi trường bên ngoài.
Kết hợp được với nhiều trang phục khác nhau khi đi làm nơi công sở hoặc xuống phố dạo chơi.
Sản phẩm giúp bạn thoải mái, dễ chịu, khỏe khoắn hơn', 32, N'349.000', 0, N'ao-polo-nam-apm5351-vag-4-yodyvn.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (94, N'Áo Polo Nam Airycool Thoáng Mát Phối Bo', 1, N'Đen', N'Chất liệu vải: Airycool có thành phần 85% Polyamide và 15% spandex.
Sợi Polyamide là cấu tạo chính giúp tạo cảm giác thoải mái, dễ chịu khi mặc.
15% spandex giúp sợi vải thêm bền chắc, tạo form dáng thời trang.
Công nghệ làm mát Freezing giúp tạo lá chắn bảo vệ cơ thể khỏi môi trường bên ngoài.
Kết hợp được với nhiều trang phục khác nhau khi đi làm nơi công sở hoặc xuống phố dạo chơi.
Sản phẩm giúp bạn thoải mái, dễ chịu, khỏe khoắn hơn', 32, N'349.000', 0, N'ao-polo-nam-apm5351-den-4-yodyvn.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (95, N'Áo Polo Nam Cafe Phối Tay Raglan Ngực In Gấu', 1, N'Navy', N'Chất liệu vải Cafe với thành phần 50% sợi Cafe + 50% sợi PET tái chế.
Chất liệu vải mang nhiều tính đột phá với công nghệ dệt mới cùng nguồn gốc thiên nhiên.
Kiểm soát mùi gấp 2.26 lần vải cotton thông thường.
Nhanh khô - Qick Dry 1.9 lần vải thông thường.
Vải bền, chắc, và không xù lông, độ co rút vải đang chỉ có 3%.
Bảo vệ bạn khỏi tia UV độc hại.
Form dáng suông phù hợp với nhiều vóc dáng cơ thể.
Họa tiết phối gấu và vai tỉ mỉ từng chi tiết, tạo hình ấn tượng, nổi bật', 21, N'349.000', 0, N'apm5281-nav.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (96, N'Áo Polo Nam In Vạch Ngực Phối Màu', 1, N'Đỏ', N'Áo polo nam vải mắt chim phối ngực - thiết kế mới.
Vải pique mắt chim cao cấp thành phần kết hợp Cotton, Polyester và  Spandex với tỷ lệ hoàn hảo tạo nên độ, kháng nhàu tuyệt vời cho vải.
Bề mặt dệt được thiết kế óng ánh như mắt chim tinh anh, hiệu ứng trẻ trung, mới lạ cho chiếc áo.
Áo mềm mại, thấm hút mồ hôi hiệu quả

Co giãn tốt, giữ form ổn định trong quá trình sử dụng', 21, N'299.000', 0, N'apm5231-ddo5.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (97, N'Áo Polo Nam In Vạch Ngực Phối Màu', 1, N'Xanh', N'Áo polo nam vải mắt chim phối ngực - thiết kế mới.
Vải pique mắt chim cao cấp thành phần kết hợp Cotton, Polyester và  Spandex với tỷ lệ hoàn hảo tạo nên độ, kháng nhàu tuyệt vời cho vải.
Bề mặt dệt được thiết kế óng ánh như mắt chim tinh anh, hiệu ứng trẻ trung, mới lạ cho chiếc áo.
Áo mềm mại, thấm hút mồ hôi hiệu quả

Co giãn tốt, giữ form ổn định trong quá trình sử dụng', 21, N'299.000', 0, N'apm5231-xah2.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (98, N'Áo Polo Nam Airymax Thêu Panda', 1, N'Vàng', N'Thành phần vải: 47%cotton, 49%polyester, 4%spandex.
Áo mặc cho cảm giác mềm mại trên da, thông thoáng & thoải mái nhẹ nhàng.
Co giãn và đàn hồi tốt giúp cơ thể không hề bị gò bó khi di chuyển.
Sản phẩm nằm trong thiết kế Combo áo polo gia đình, thích hợp cho các bố mẹ mặc cùng con để tạo điểm nhấn', 21, N'339.000', 0, N'apm5417-vag-13.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (100, N'Áo Polo Nam Airymax Thêu Panda', 1, N'Xanh Biển', N'Thành phần vải: 47%cotton, 49%polyester, 4%spandex.
Áo mặc cho cảm giác mềm mại trên da, thông thoáng & thoải mái nhẹ nhàng.
Co giãn và đàn hồi tốt giúp cơ thể không hề bị gò bó khi di chuyển.
Sản phẩm nằm trong thiết kế Combo áo polo gia đình, thích hợp cho các bố mẹ mặc cùng con để tạo điểm nhấn', 21, N'339.000', 0, N'apm5417-xbi-13.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (101, N'Áo T-Shirt Thể Thao Nam Out Of Bounds', 1, N'Đen', N'Chất liệu:  88% Recycle Polyester + 12% Elastane.
Thấm hút siêu tốt, thông thoáng, kiểm soát mùi cơ thể.
Áo thun thể thao nam có khả năng co giãn, đàn hồi nhờ sợi spandex.
Chống tĩnh điện tốt, không xù lông rút sợi.
Phù hợp với chuyển động cơ thể đặc biệt là hoạt động thể thao', 21, N'349.000', 0, N'tshirt-the-thao-nam-out-of-bounds-stm6071-den-4.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (102, N'Áo T-Shirt Thể Thao Nam Out Of Bounds', 1, N'Xanh dương', N'Chất liệu:  88% Recycle Polyester + 12% Elastane.
Thấm hút siêu tốt, thông thoáng, kiểm soát mùi cơ thể.
Áo thun thể thao nam có khả năng co giãn, đàn hồi nhờ sợi spandex.
Chống tĩnh điện tốt, không xù lông rút sợi.
Phù hợp với chuyển động cơ thể đặc biệt là hoạt động thể thao', 21, N'349.000', 0, N'tshirt-the-thao-nam-out-of-bounds-stm6071-xdu-3.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (104, N'Áo T-Shirt Nam Cotton USA Phiên Bản Premium', 1, N'Vàng', N'Chất liệu 100% Cotton USA cao cấp.
Cotton bền vững: Góp phần bảo vệ môi trường sống.
Loại sợi chất lượng cao: Độ mảnh và khả năng nhuộm ưu việt.
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam.
Co giãn nhẹ, phù hợp với chuyển động của cơ thể.
Form dáng suông giúp tạo sự thoải mái cử động cho người mặc.
Đa dạng màu sắc dễ dàng kết hợp cùng quần shorts hoặc quần jeans', 20, N'289.000', 0, N'tsm5231-vag-3.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (106, N'Áo T-Shirt Nam Cotton USA Phiên Bản Premium', 1, N'Đỏ', N'Chất liệu 100% Cotton USA cao cấp.
Cotton bền vững: Góp phần bảo vệ môi trường sống.
Loại sợi chất lượng cao: Độ mảnh và khả năng nhuộm ưu việt.
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam.
Co giãn nhẹ, phù hợp với chuyển động của cơ thể.
Form dáng suông giúp tạo sự thoải mái cử động cho người mặc.
Đa dạng màu sắc dễ dàng kết hợp cùng quần shorts hoặc quần jeans', 20, N'289.000', 0, N'tsm5231-ddo-2.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (107, N'Áo Thun Nam Form Rộng In Chữ Comfortable', 1, N'Đen', N'Chất liệu: Thành phần vải  95% cotton + 5% spandex.
Sử dụng chất liệu vải Cotton mềm mại, bền bỉ với thời gian.
Sợi Spandex đan xen  vào trong vải giúp co dãn tốt hơn. 
Thoáng mát, thích hợp các hoạt động ngoài trời.
Thiết kế kiểu dáng cơ bản, vừa vặn với cơ thể, phù hợp khi mặc đi làm, đi chơi.', 32, N'299.000', 0, N'tsm5059-den-3.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (108, N'Áo Phao Nam Có Mũ Siêu Nhẹ Siêu Ấm', 1, N'Đen', N'Áo có cấu trúc 3 lớp chắc chắn: Lớp ngoài và lớp lót được làm từ 100% Nylon, Lớp giữa bông nhẹ 100% polyester.
Màu sắc sản phẩm đa dạng, thiết kế form dáng trẻ trung.
Có thiết kế túi đựng nhỏ gọn, dễ dàng mang theo sản phẩm.
Siêu nhẹ, có tác dụng giữ ấm cho cơ thể.
Áo có thể tránh mưa nhẹ, chống tĩnh điện', 40, N'599.000', 0, N'phm5001-den-11.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (109, N'Áo Phao Nam Có Mũ Siêu Nhẹ Siêu Ấm', 1, N'Tím than', N'Áo có cấu trúc 3 lớp chắc chắn: Lớp ngoài và lớp lót được làm từ 100% Nylon, Lớp giữa bông nhẹ 100% polyester.
Màu sắc sản phẩm đa dạng, thiết kế form dáng trẻ trung.
Có thiết kế túi đựng nhỏ gọn, dễ dàng mang theo sản phẩm.
Siêu nhẹ, có tác dụng giữ ấm cho cơ thể.
Áo có thể tránh mưa nhẹ, chống tĩnh điện', 40, N'599.000', 0, N'phm5001-tit-3.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (111, N'Áo Khoác Gió Thông Minh Nam Trượt Nước', 1, N'Navy', N'Áo khoác gió nam thông minh - thiết kế mới của YODY làm từ chất liệu vải gió, được cải tiến và nâng cấp với khả năng trượt nước và đặc biệt là tính thuận tiện khi mang theo.
Chiếc áo có thể lộn ngược thành 1 chiếc túi ngọn nhẹ, dễ dàng mang đi mọi nơi.
Thiết kế áo dạng cơ bản, phần gấu áo có chun rút điều chỉnh theo mong muốn của người sử dụng. Chun tay ôm vừa và chắc chắn tránh gió lùa.
Bên trong có lót lưới, mũ áo tháo rời linh hoạt. Khóa áo được in và khắc logo nổi bật. Ngực áo được in logo phản quang đầy tinh tế.
Sản phẩm phù hợp với nhiều độ tuổi khác nhau, vô cùng cần thiết trong thời tiết thu đông', 30, N'599.000', 0, N'akm5041-nav-7.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (112, N'Áo Khoác Gió Thông Minh Nam Trượt Nước', 1, N'Đen', N'Áo khoác gió nam thông minh - thiết kế mới của YODY làm từ chất liệu vải gió, được cải tiến và nâng cấp với khả năng trượt nước và đặc biệt là tính thuận tiện khi mang theo.
Chiếc áo có thể lộn ngược thành 1 chiếc túi ngọn nhẹ, dễ dàng mang đi mọi nơi.
Thiết kế áo dạng cơ bản, phần gấu áo có chun rút điều chỉnh theo mong muốn của người sử dụng. Chun tay ôm vừa và chắc chắn tránh gió lùa.
Bên trong có lót lưới, mũ áo tháo rời linh hoạt. Khóa áo được in và khắc logo nổi bật. Ngực áo được in logo phản quang đầy tinh tế.
Sản phẩm phù hợp với nhiều độ tuổi khác nhau, vô cùng cần thiết trong thời tiết thu đông', 30, N'599.000', 0, N'akm5041-den-5.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (113, N'Áo Khoác Gió Nam 3C 2 Lớp Thể Thao Phối Lưng', 1, N'Đen', N'Chất liệu vải 95% Polyester + 5% cotton.
Vải có bề mặt lỳ, mềm mịn, ít nhăn, chắc chắn hơn so với chất liệu vải gió thông thường.
Áo có thiết kế trẻ trung đơn giản, đường cắt xẻ khỏe khoắn nam tính.
Chun tại cổ tay giúp người mặc trông gọn gàng, vừa vặn hơn.
Phần mũ có thể tháo rời và miệng mũ có luồn chun rất trẻ trung và tinh tế', 42, N'499.000', 0, N'akm4027-den-qjm3077-xde-5.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (114, N'Áo Khoác Gió Nam 3C 2 Lớp Thể Thao Phối Lưng', 1, N'Xanh', N'Chất liệu vải 95% Polyester + 5% cotton.
Vải có bề mặt lỳ, mềm mịn, ít nhăn, chắc chắn hơn so với chất liệu vải gió thông thường.
Áo có thiết kế trẻ trung đơn giản, đường cắt xẻ khỏe khoắn nam tính.
Chun tại cổ tay giúp người mặc trông gọn gàng, vừa vặn hơn.
Phần mũ có thể tháo rời và miệng mũ có luồn chun rất trẻ trung và tinh tế', 42, N'499.000', 0, N'akm4027-xah-qjm3077-xde-4.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (115, N'Áo Phao Nam Siêu Nhẹ Có Mũ Siêu Ấm', 1, N'Xanh Rêu', N'Màu sắc sản phẩm đa dạng, thiết kế form dáng trẻ trung.
Có thiết kế túi đựng nhỏ gọn, dễ dàng mang theo sản phẩm.
Siêu nhẹ, có tác dụng giữ ấm cho cơ thể.
Chống thấm nước, tránh mưa nhẹ, chống tĩnh điện', 45, N'599.000', 0, N'phm4001-reu-4.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (117, N'Áo Khoác Nam Bomber Bổ Ngực', 1, N'Đỏ', N'Áo khoác bomber nam vải gió giúp giữ ấm cơ thể tốt.
Kiểu dáng thời trang cùng màu sắc trẻ trung, năng động, dễ dàng phối với nhiều trang phục khác nhau.
Thiết kế bo len cổ, tay và gấu áo tạo độ ôm vừa phải mang đến cảm giác thoải mái khi mặc.
Tay áo có túi khóa tạo sự khỏe khoắn và để đồ tiện lợi, chắc chắn.
Đường may tỉ mỉ, có độ bền cao khi sử dụng', 50, N'599.000', 0, N'akm5047-ddo-5.jpg', 2)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (118, N'Áo Sơ Mi Nam Trắng Dài Tay Nano Kháng Khuẩn Chống Nhăn', 1, N'Trắng', N'Chất liệu vài Nano được tạo nên từ sợi polyester.
Khả năng khử mùi, kháng khuẩn và thấm hút mồ hôi tốt.
Vải không nhăn với form áo đứng và giữ nếp giúp người mặc luôn diện những mẫu áo phẳng phiu.
Thiết kế mới, lá cổ mở rộng hơn về phía cầu vai, có ly gấp sau lưng', 54, N'499.000', 0, N'smm4073-tra-3.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (119, N'Áo Sơ Mi Nam Trắng Dài Tay Nano Kháng Khuẩn Chống Nhăn', 1, N'Tím than', N'Chất liệu vài Nano được tạo nên từ sợi polyester.
Khả năng khử mùi, kháng khuẩn và thấm hút mồ hôi tốt.
Vải không nhăn với form áo đứng và giữ nếp giúp người mặc luôn diện những mẫu áo phẳng phiu.
Thiết kế mới, lá cổ mở rộng hơn về phía cầu vai, có ly gấp sau lưng', -54, N'499.000', 0, N'smm4073-tit-qam3190-ghs-1.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (121, N'Sơ Mi Nam Dài Tay Có Túi Ngực', 1, N'Trắng', N'Sơ mi nam vải lụa nến lịch lãm, nam tính.
Chất liệu 100% Polyester.
Form dáng cơ bản, chỉn chu, có túi ngực, thoải mái khi lên đồ.
Vải siêu mướt, thoáng khí, thấm hút mồ hôi hiệu quả.
Áo bắt nhiệt nhanh tạo cảm giác mát mẻ cho người mặc.
Cổ áo và nẹp áo giữ form tốt trong thời gian dài', 30, N'299.000', 0, N'spm5005-tra-6.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (122, N'Áo Sơ Mi Nam Dài Tay Cafe Melange Khử Mùi Kháng Khuẩn', 1, N'Xám', N'Chất liệu vải Cafe.
Chất liệu thân thiện với môi trường.
Chống tia UV tự nhiên.
Sợi vải thoáng khí, nhanh khô tạo cảm giác dễ chịu cho người mặc.
Vải không xù kiểm soát được mùi', 25, N'289.000', 0, N'smm3011-ghd-2.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (124, N'Sơ Mi Cộc Tay Cao Cấp Yo.Smart', 1, N'Trắng', N'Áo sơ mi cao cấp vải knit Nhật - xu hướng mới của dòng sản phẩm sơ mi nam hiện nay.
Chất liệu được phát triển dựa trên sợi nhân tạo có tính năng vượt trội: mềm mại, thấm hút nhanh, thoáng mạt, kháng nhàu tốt.
Kiểu dệt kim tạo cho vải có độ co giãn phù hợp, tạo cảm giác thoải mái khi mặc.
Áo sơ mi nam cộc tay mang đến cho cánh mày râu vẻ lịch lãm, chỉn chu cùng sự thoải mái nhất định', 22, N'299.000', 0, N'scm5073-ktr10.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (125, N'Sơ Mi Cộc Tay Cao Cấp Yo.Smart', 1, N'Xám', N'Áo sơ mi cao cấp vải knit Nhật - xu hướng mới của dòng sản phẩm sơ mi nam hiện nay.
Chất liệu được phát triển dựa trên sợi nhân tạo có tính năng vượt trội: mềm mại, thấm hút nhanh, thoáng mạt, kháng nhàu tốt.
Kiểu dệt kim tạo cho vải có độ co giãn phù hợp, tạo cảm giác thoải mái khi mặc.
Áo sơ mi nam cộc tay mang đến cho cánh mày râu vẻ lịch lãm, chỉn chu cùng sự thoải mái nhất định', 22, N'299.000', 0, N'scm5073-kxm02.jpg', 3)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (126, N'Quần Jeans Nam Ống Đứng Năng Động', 1, N'Xanh', N'Thiết kế basic với 5 túi cơ bản, 2 túi sau, 2 túi trước và 1 túi đồng hồ nhỏ.
Quần có thêu túi ốp thân sau tạo điểm nhấn trẻ trung.
Thân quần được thiết kế với các chi tiết ly xếp tại gối.
Chất liệu jean cotton Mỹ co giãn 4 chiều với sợi cotton cao cấp được cả thế giới tin dùng.
Sợi bông sạch và gần như không bị nhiễm khuẩn.
Sản phẩm có độ bền hơn so với các loại bông thông thường', 45, N'499.000', 0, N'qjm4013-xah-apm5355-tny-2.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (127, N'Quần Jeans Nam Slim Thêu Túi', 1, N'Xám', N'Chất liệu Jean Denim.
Quần jeans nam dáng slim fit ôm vừa vặn giúp tôn lên đôi chân săn chắc của phái mạnh.
Kiểu quần có phần ống rộng ở đùi và thuôn dần xuống mắt cá chân để tạo cảm giác thoải mái cho người mặc.
Chiếc quần dễ dàng mix đồ để đi chơi, đi học, đi làm', 34, N'569.000', 0, N'qjm5021-xam-2.jpg', 7)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (128, N'Quần Âu Nam Ống Đứng Vải Nano Cao Cấp Giữ Phom, Co Giãn Thoải Mái', 1, N'Nâu', N'Chất liệu vải Nano được tạo thành từ 100% Polyester.
Vải sử dụng công nghệ Nano xoắn nhiều sợi li ti thành một sợi.
Nano thuộc nhóm vải công nghệ mới,là bước đột phá trong ngành vải sợi thế giới.
Vải dệt đôi 2 mặt là kiểu dệt khá phức tạp giúp định hình form dáng sản phẩm.
Cấu trúc dệt khác biệt, giúp tạo cảm giác thoải mái', 35, N'499.000', 0, N'qam3190-nau-2131231.jpg', 8)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (129, N'Áo Polo Trẻ Em Airycool Thoáng Mát Phối Bo', 3, N'Đỏ', N'Chất liệu sản phẩm: Airycool với thành phần sợi 85% nylon & 15% spandex.
Công nghệ làm mát FREEZING tiên tiến siêu khô thoáng.
Trong lượng nhẹ, thoáng khí hút ẩm cực tốt.
Thấm hút mồ hôi tốt, khả năng co giãn, giữ form tốt.
Thiết kế áo kiểu dáng suông gọn gàng vừa vặn đem đến sự thoải mái khi các bé vui chơi, vận động', 12, N'229.000', 0, N'apk5173-ddo-2-6219e525-b0d6-4b92-97aa-6e72ec84762b.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (130, N'Áo Polo Trẻ Em Airycool Thoáng Mát Phối Bo', 3, N'Vàng', N'Chất liệu sản phẩm: Airycool với thành phần sợi 85% nylon & 15% spandex.
Công nghệ làm mát FREEZING tiên tiến siêu khô thoáng.
Trong lượng nhẹ, thoáng khí hút ẩm cực tốt.
Thấm hút mồ hôi tốt, khả năng co giãn, giữ form tốt.
Thiết kế áo kiểu dáng suông gọn gàng vừa vặn đem đến sự thoải mái khi các bé vui chơi, vận động', 12, N'229.000', 0, N'apk5173-vag-2-deb25847-1dd1-4d5c-8a40-67f3fec27cd6.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (131, N'Áo Polo Trẻ Em Mắt Chim In Tràn Ngôi Sao', 3, N'Xanh lục', N'Chất liệu vải Mắt Chim mới với thành phần 49% cotton, 47% polyester, 4% spandex.
Công nghệ vải dệt 2 màu tạo hiệu ứng mắt chim đặc biệt.
Độ mềm mại, thấm hút mồ hôi của vải rất tốt.
Co giãn tốt nhưng vẫn giữ phom, có tính ổn định khi sử dụng.
Dáng suông  ôm vừa phải cơ thể, phù hợp với mọi dáng người', 15, N'299.000', 0, N'apk6092-xlu-6.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (132, N'Áo Polo Trẻ Em Mắt Chim In Tràn Ngôi Sao', 3, N'Đen', N'Chất liệu vải Mắt Chim mới với thành phần 49% cotton, 47% polyester, 4% spandex.
Công nghệ vải dệt 2 màu tạo hiệu ứng mắt chim đặc biệt.
Độ mềm mại, thấm hút mồ hôi của vải rất tốt.
Co giãn tốt nhưng vẫn giữ phom, có tính ổn định khi sử dụng.
Dáng suông  ôm vừa phải cơ thể, phù hợp với mọi dáng người', 15, N'299.000', 0, N'apk6092-den-2.jpg', 1)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (133, N'Áo Thun Cổ Tròn Cotton USA In Cá Sấu Vui Vẻ', 3, N'Trắng', N'Chất liệu 100% Cotton USA.
Vải Cotton tốt nhất nhận được chứng chỉ OEKO TEX*100.
Cotton bền vững: Góp phần bảo vệ môi trường sống.
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam.
Co giãn nhẹ, phù hợp với chuyển động của cơ thể.
Kiểu dáng rộng thoải mái', 17, N'169.000', 0, N'tsk6156-tr1-14.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (134, N'Áo Thun Dài Tay Trẻ Em Kẻ Sọc Tay Xếp Lớp', 3, N'Trắng', N'Chất liệu  95% CVC + 5% Spandex.
Áo thun dài tay cho bé - ấm áp mùa thu đông.
Kết cấu sợi  tạo nên mặt vải đanh chắc, không bị bai dão, ít xù.
Bề mặt vải được xử lý để giảm thoát nhiệt, giữ ấm tốt.
Áo có độ co giãn mềm mại cho bé thoải mái hoạt động hàng ngày', 11, N'299.000', 0, N'atk5000-ktr-4.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (135, N'Áo Thun Dài Tay Trẻ Em Kẻ Sọc Tay Xếp Lớp', 3, N'Đen', N'Chất liệu  95% CVC + 5% Spandex.
Áo thun dài tay cho bé - ấm áp mùa thu đông.
Kết cấu sợi  tạo nên mặt vải đanh chắc, không bị bai dão, ít xù.
Bề mặt vải được xử lý để giảm thoát nhiệt, giữ ấm tốt.
Áo có độ co giãn mềm mại cho bé thoải mái hoạt động hàng ngày', 11, N'299.000', 0, N'atk5000-kde-2.jpg', 6)
INSERT [dbo].[product] ([id], [name], [object_id], [color], [desc], [unit_in_stock], [unit_price], [discount], [img], [cate_id]) VALUES (136, N'Áo Phông Trẻ Em Dáng Suông In Human 8 - 15 Tuổi', 3, N'Xanh', N'Chất liệu 100% Cotton USA.
Vải Cotton được dệt từ sợi bông USA cao cấp.
Cotton bền vững: Góp phần bảo vệ môi trường sống.
Loại sợi chất lượng cao: Độ mảnh và khả năng nhuộm ưu việt.
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam.
Co giãn nhẹ, phù hợp với chuyển động của cơ thể.
Kiểu dáng rộng thoải mái', 32, N'299.000', 0, N'tsk5073-xbi-10-1.jpg', 6)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[size] ([id], [size]) VALUES (1, N'2-3')
INSERT [dbo].[size] ([id], [size]) VALUES (2, N'4-5')
INSERT [dbo].[size] ([id], [size]) VALUES (3, N'6-7')
INSERT [dbo].[size] ([id], [size]) VALUES (4, N'8-9')
INSERT [dbo].[size] ([id], [size]) VALUES (5, N'10-11')
INSERT [dbo].[size] ([id], [size]) VALUES (6, N'12-13')
INSERT [dbo].[size] ([id], [size]) VALUES (7, N'14')
INSERT [dbo].[size] ([id], [size]) VALUES (8, N'XS')
INSERT [dbo].[size] ([id], [size]) VALUES (9, N'S')
INSERT [dbo].[size] ([id], [size]) VALUES (10, N'M')
INSERT [dbo].[size] ([id], [size]) VALUES (11, N'L')
INSERT [dbo].[size] ([id], [size]) VALUES (12, N'XL')
INSERT [dbo].[size] ([id], [size]) VALUES (13, N'2XL')
GO
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (1, 19)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (1, 27)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 19)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 27)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 129)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 130)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 131)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 132)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 133)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 134)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (2, 135)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (3, 19)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (3, 129)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (3, 131)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (3, 133)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (3, 134)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (4, 130)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (4, 134)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (4, 135)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (5, 18)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (6, 18)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (6, 136)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (7, 18)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (7, 136)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (8, 13)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 12)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 13)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 24)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 36)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 38)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 39)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 44)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 48)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 49)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 51)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 61)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 64)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 67)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 68)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 82)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 87)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 94)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 106)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 108)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 109)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 112)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 114)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 118)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 119)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (9, 125)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 11)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 12)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 17)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 23)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 24)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 28)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 29)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 30)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 32)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 34)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 36)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 38)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 39)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 44)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 46)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 48)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 49)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 50)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 51)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 58)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 60)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 61)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 62)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 63)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 64)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 66)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 67)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 68)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 69)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 73)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 74)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 76)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 77)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 79)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 80)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 81)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 82)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 83)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 84)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 86)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 89)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 90)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 93)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 94)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 95)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 96)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 97)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 98)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 100)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 101)
GO
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 102)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 106)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 107)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 108)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 109)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 111)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 112)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 113)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 114)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 115)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 117)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 118)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 119)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 121)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 122)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 124)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 125)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 126)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 127)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (10, 128)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 3)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 4)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 6)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 8)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 10)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 11)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 12)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 13)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 14)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 17)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 23)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 24)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 28)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 29)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 30)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 31)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 32)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 34)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 36)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 38)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 43)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 44)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 46)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 48)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 49)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 50)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 58)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 60)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 61)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 62)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 63)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 64)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 66)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 67)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 68)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 69)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 72)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 73)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 74)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 76)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 77)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 80)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 81)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 82)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 83)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 84)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 86)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 87)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 89)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 90)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 93)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 94)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 95)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 97)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 98)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 100)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 101)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 102)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 104)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 106)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 108)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 111)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 112)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 113)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 114)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 115)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 117)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 118)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 119)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 122)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 124)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 125)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 126)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 127)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (11, 128)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 11)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 12)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 13)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 17)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 23)
GO
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 28)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 29)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 30)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 31)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 34)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 36)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 38)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 39)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 43)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 46)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 49)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 60)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 63)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 68)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 69)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 72)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 73)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 77)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 79)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 80)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 81)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 82)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 84)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 87)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 89)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 93)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 94)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 96)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 97)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 98)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 102)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 104)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 106)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 107)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 111)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 112)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 113)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 114)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 115)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 117)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 119)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 121)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 122)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 124)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 125)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 126)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (12, 128)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (13, 17)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (13, 119)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (13, 124)
INSERT [dbo].[size_product] ([id_size], [id_pro]) VALUES (13, 125)
GO
INSERT [dbo].[user] ([email], [firstname], [lastname], [pass], [phone], [gender], [DoB], [address], [image], [admin]) VALUES (N'412341@gmail.com', N'Nam', N'Nguyễn', N'432rasfA412dsA', N'2134214', 0, NULL, N'Hà Nội', N'no-profile-picture-icon-18.jpg', 1)
INSERT [dbo].[user] ([email], [firstname], [lastname], [pass], [phone], [gender], [DoB], [address], [image], [admin]) VALUES (N'nam@gmail.com', N'Nam', N'Van', N'Nam123456789', N'0983933097', NULL, NULL, N'Ha Noi', N'no-profile-picture-icon-18.jpg', 0)
INSERT [dbo].[user] ([email], [firstname], [lastname], [pass], [phone], [gender], [DoB], [address], [image], [admin]) VALUES (N'nam123@gmail.com', N'Nam', N'Van', N'Nam12345678', N'0983933097', NULL, NULL, N'Ha Noi', N'no-profile-picture-icon-18.jpg', 0)
INSERT [dbo].[user] ([email], [firstname], [lastname], [pass], [phone], [gender], [DoB], [address], [image], [admin]) VALUES (N'twe1@gmail.com', N'Nam', N'Nguyễn', N'432rasfA412dsA', N'2134214', 0, NULL, N'Hà Nội', N'no-profile-picture-icon-18.jpg', 0)
INSERT [dbo].[user] ([email], [firstname], [lastname], [pass], [phone], [gender], [DoB], [address], [image], [admin]) VALUES (N'twe2@gmail.com', N'Nam', N'Nguyễn', N'432rasfA412dsA', N'2134214', 0, NULL, N'Hà Nội', N'no-profile-picture-icon-18.jpg', 0)
INSERT [dbo].[user] ([email], [firstname], [lastname], [pass], [phone], [gender], [DoB], [address], [image], [admin]) VALUES (N'wth0zk@gmail.com', N'Tan', N'Pham Quang', N'Tan12345678', N'0983933097', 1, NULL, N'Ha Noi', N'no-profile-picture-icon-18.jpg', 1)
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([u_email])
REFERENCES [dbo].[user] ([email])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([object_id])
REFERENCES [dbo].[object] ([id])
GO
ALTER TABLE [dbo].[size_product]  WITH CHECK ADD FOREIGN KEY([id_pro])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[size_product]  WITH CHECK ADD FOREIGN KEY([id_size])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD CHECK  (([discount]>=(0) AND [discount]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [Tan_Shop1] SET  READ_WRITE 
GO
