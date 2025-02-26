USE [PRJ_Asignment_NhaHang_1]
GO
/****** Object:  Table [dbo].[DiscountItem]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountItem](
	[discountId] [int] IDENTITY(1,1) NOT NULL,
	[percentDiscount] [int] NULL,
	[condition] [nvarchar](10) NULL,
	[item_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[discountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[category] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[status] [nvarchar](10) NOT NULL,
	[item_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[reservation_date] [date] NULL,
	[number_of_people] [int] NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[table_id] [int] NULL,
	[time_slot] [varchar](20) NULL,
	[current_day] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[item_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[review_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[table_number] [int] NOT NULL,
	[location] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/10/2024 3:12:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiscountItem] ON 

INSERT [dbo].[DiscountItem] ([discountId], [percentDiscount], [condition], [item_id]) VALUES (1, 50, N'not apply', NULL)
INSERT [dbo].[DiscountItem] ([discountId], [percentDiscount], [condition], [item_id]) VALUES (4, 30, N'not apply', NULL)
SET IDENTITY_INSERT [dbo].[DiscountItem] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (1, N'Gà nướng', N'Ức gà nướng mọng nước', CAST(60211.20 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Ức GÀ Nướng.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (2, N'Bít tết bò', N'Bít tết bò mềm với bơ tỏi', CAST(125440.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/BeefSteak Bơ Tỏi.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (3, N'Mì Ý Carbonara', N'Mì Ý sốt kem truyền thống', CAST(75264.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/spaghetti carbonara.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (4, N'Cá hồi nướng', N'Cá hồi nướng với sốt bơ chanh', CAST(100352.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Cá Hồi Nướng Bơ Chanh.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (5, N'Mì Alfredo gà', N'Mì với sốt Alfredo kem và gà', CAST(85299.20 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Cá Hồi Nướng Bơ Chanh.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (6, N'Rau xào', N'Rau hỗn hợp xào với xì dầu', CAST(45158.40 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Rau Xào.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (7, N'Sườn BBQ', N'Sườn heo BBQ nấu chậm', CAST(110387.20 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Sườn heo BBQ nấu chậm.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (8, N'Sườn cừu', N'Sườn cừu nướng với hương thảo', CAST(150528.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Sườn cừu nướng với hương thảo.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (9, N'Paella hải sản', N'Cơm Tây Ban Nha với hải sản hỗn hợp', CAST(125440.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Paella hải sản.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (10, N'Cà ri gà', N'Cà ri gà cay với cơm', CAST(75264.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Cà ri gà cay với cơm.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (11, N'Tacos bò', N'Tacos mềm với thịt bò gia vị', CAST(60211.20 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Tacos bò.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (12, N'Schnitzel heo', N'Thịt heo chiên giòn', CAST(90316.80 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Thịt heo chiên giòn.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (13, N'Tôm Scampi', N'Tôm nấu với sốt bơ tỏi', CAST(100352.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Tôm nấu với sốt bơ tỏi''.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (14, N'Pizza chay', N'Pizza với rau củ hỗn hợp', CAST(75264.00 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Pizza với rau củ hỗn hợp.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (15, N'Gà Parmesan', N'Gà chiên với sốt marinara và phô mai', CAST(90316.80 AS Decimal(10, 2)), N'Món chính', N'assets/img/NormalFoods/Món Chính/Gà chiên với sốt marinara và phô mai.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (16, N'Salad trái cây', N'Trái cây tươi hỗn hợp', CAST(30105.60 AS Decimal(10, 2)), N'Hoa quả', N'assets/img/NormalFoods/Món Phụ/Trái cây tươi hỗn hợp.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (17, N'Táo cắt lát', N'Táo tươi cắt lát', CAST(20070.40 AS Decimal(10, 2)), N'Hoa quả', N'assets/img/NormalFoods/Món Phụ/Táo cắt lát.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (18, N'Chuối', N'Chuối tươi', CAST(10035.20 AS Decimal(10, 2)), N'Hoa quả', N'assets/img/NormalFoods/Món Phụ/Chuối tươi.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (19, N'Nho', N'Nho tươi', CAST(25088.00 AS Decimal(10, 2)), N'Hoa quả', N'assets/img/NormalFoods/Món Phụ/Nho.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (20, N'Cam cắt lát', N'Cam tươi cắt lát', CAST(20070.40 AS Decimal(10, 2)), N'Hoa quả', N'assets/img/NormalFoods/Món Phụ/Cam cắt lát.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (21, N'Coca Cola', N'Coca Cola lạnh', CAST(10035.20 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/gaz/Coca Cola Lạnh.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (22, N'Nước cam', N'Nước cam tươi vắt', CAST(20070.40 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Hoa Quả/Nước cam tươi vắt.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (23, N'Nước chanh', N'Nước chanh mát lạnh', CAST(15052.80 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Hoa Quả/Nước Chanh Tây Tươi.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (24, N'Trà đá', N'Trà đá lạnh', CAST(12544.00 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Trà đá.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (25, N'Cà phê', N'Cà phê nóng', CAST(15052.80 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Caffe/Cà phê Đen.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (26, N'Trà xanh', N'Trà xanh nóng', CAST(12544.00 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Trà/trà xanh.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (27, N'Sữa lắc', N'Sữa lắc kem', CAST(25088.00 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Sữa/Sữa lắc kem.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (28, N'Sinh tố', N'Sinh tố trái cây', CAST(30105.60 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Hoa Quả/Sinh tố trái cây.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (29, N'Nước lọc', N'Nước lọc đóng chai', CAST(5017.60 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Nước Lọc Lavie.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (30, N'Bia', N'Bia lạnh', CAST(20070.40 AS Decimal(10, 2)), N'Đồ uống', N'assets/img/Đồ Uống/Cồn/Bia Lạc Việt.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (31, N'Bánh chocolate', N'Bánh chocolate đậm đà', CAST(35123.20 AS Decimal(10, 2)), N'Đồ ngọt', N'assets/img/NormalFoods/Tráng Miêng/Kem socola.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (32, N'Kem', N'Kem vani', CAST(25088.00 AS Decimal(10, 2)), N'Đồ ngọt', N'assets/img/NormalFoods/Tráng Miêng/Kem Vani.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (33, N'Bánh cheesecake', N'Bánh cheesecake kem', CAST(30105.60 AS Decimal(10, 2)), N'Đồ ngọt', N'assets/img/NormalFoods/Tráng Miêng/Bánh cheesecake blueberry.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (34, N'Bánh brownie', N'Bánh brownie chocolate', CAST(20070.40 AS Decimal(10, 2)), N'Đồ ngọt', N'assets/img/NormalFoods/Tráng Miêng/Bánh brownie socola.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (35, N'Bánh táo', N'Bánh táo truyền thống', CAST(30105.60 AS Decimal(10, 2)), N'Đồ ngọt', N'assets/img/NormalFoods/Tráng Miêng/Bánh táo truyền thống.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (36, N'Khoai tây chiên', N'Khoai tây chiên giòn', CAST(15052.80 AS Decimal(10, 2)), N'Ăn nhanh', N'assets/img/NormalFoods/FastFood/Khoai/Khoai tây Chiên.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (37, N'Gà viên chiên', N'Gà viên chiên giòn', CAST(25088.00 AS Decimal(10, 2)), N'Ăn nhanh', N'assets/img/NormalFoods/FastFood/Gà viên chiên.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (38, N'Xúc xích', N'Xúc xích nướng', CAST(20070.40 AS Decimal(10, 2)), N'Ăn nhanh', N'assets/img/NormalFoods/FastFood/Xúc xích nướng.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (39, N'Hamburger', N'Hamburger cổ điển', CAST(30105.60 AS Decimal(10, 2)), N'Ăn nhanh', N'assets/img/NormalFoods/FastFood/hamburger/hamburger cổ điển.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (40, N'Hành tây chiên', N'Hành tây chiên giòn', CAST(20070.40 AS Decimal(10, 2)), N'Ăn nhanh', N'assets/img/NormalFoods/FastFood/hành tây chiên phô mai.jpg')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (54, N'test', N'', CAST(100000.00 AS Decimal(10, 2)), N'Món chính', N'cc')
INSERT [dbo].[MenuItems] ([item_id], [name], [description], [price], [category], [image]) VALUES (60, N'Lộckun', N'', CAST(123230.00 AS Decimal(10, 2)), N'Ăn nhanh', N'http://localhost:8080/Restaurant_1/assets/img/NormalFoods/M%C3%B3n%20Ch%C3%ADnh/Paella%20h%E1%BA%A3i%20s%E1%BA%A3n.jpg')
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (63, 21, CAST(N'2024-10-25' AS Date), N'pending', 17, 1, CAST(40960.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (80, 38, CAST(N'2024-10-26' AS Date), N'pending', 14, 1, CAST(153600.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (81, 38, CAST(N'2024-10-26' AS Date), N'pending', 10, 1, CAST(153600.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (82, 38, CAST(N'2024-10-26' AS Date), N'pending', 25, 1, CAST(30720.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (85, 35, CAST(N'2024-10-26' AS Date), N'pending', 7, 1, CAST(225280.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (97, 45, CAST(N'2024-10-27' AS Date), N'pending', 18, 2, CAST(20480.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (98, 45, CAST(N'2024-10-27' AS Date), N'pending', 30, 1, CAST(40960.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (125, 22, CAST(N'2024-10-28' AS Date), N'pending', 1, 1, CAST(86016.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (127, 22, CAST(N'2024-10-28' AS Date), N'pending', 4, 1, CAST(143360.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (129, 21, CAST(N'2024-10-29' AS Date), N'pending', 18, 1, CAST(14336.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (130, 24, CAST(N'2024-10-29' AS Date), N'pending', 3, 1, CAST(75264.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (131, 24, CAST(N'2024-10-29' AS Date), N'pending', 8, 1, CAST(150528.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (132, 23, CAST(N'2024-10-28' AS Date), N'pending', 2, 1, CAST(125440.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (133, 23, CAST(N'2024-10-28' AS Date), N'pending', 4, 1, CAST(100352.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [item_id], [quantity], [price]) VALUES (134, 23, CAST(N'2024-10-28' AS Date), N'pending', 2, 1, CAST(125440.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (110, 21, CAST(N'2024-10-25' AS Date), 2, N'pending', 1, N'morning', CAST(N'2024-10-24' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (113, 22, CAST(N'2024-10-26' AS Date), 2, N'pending', 9, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (114, 23, CAST(N'2024-10-28' AS Date), 3, N'pending', 3, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (115, 24, CAST(N'2024-10-26' AS Date), 6, N'pending', 1, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (116, 25, CAST(N'2024-10-28' AS Date), 4, N'pending', 1, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (119, 26, CAST(N'2024-10-26' AS Date), 5, N'pending', 1, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (120, 27, CAST(N'2024-10-27' AS Date), 3, N'pending', 5, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (122, 28, CAST(N'2024-10-26' AS Date), 4, N'pending', 9, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (123, 29, CAST(N'2024-10-28' AS Date), 4, N'pending', 9, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (124, 30, CAST(N'2024-10-26' AS Date), 4, N'pending', 4, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (126, 32, CAST(N'2024-10-26' AS Date), 3, N'pending', 3, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (129, 33, CAST(N'2024-10-26' AS Date), 4, N'pending', 6, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (132, 34, CAST(N'2024-10-27' AS Date), 2, N'pending', 7, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (136, 37, CAST(N'2024-10-28' AS Date), 2, N'pending', 4, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (137, 38, CAST(N'2024-10-26' AS Date), 2, N'pending', 2, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (140, 39, CAST(N'2024-10-26' AS Date), 3, N'pending', 4, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (142, 35, CAST(N'2024-10-26' AS Date), 2, N'pending', 5, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (151, 41, CAST(N'2024-10-26' AS Date), 3, N'pending', 7, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (152, 2, CAST(N'2024-10-28' AS Date), 2, N'pending', 4, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (153, 42, CAST(N'2024-10-26' AS Date), 2, N'pending', 8, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (155, 43, CAST(N'2024-10-26' AS Date), 4, N'pending', 7, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (156, 44, CAST(N'2024-10-27' AS Date), 3, N'pending', 2, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (157, 45, CAST(N'2024-10-27' AS Date), 4, N'pending', 5, N'evening', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (161, 46, CAST(N'2024-10-26' AS Date), 14, N'pending', 2, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (163, 47, CAST(N'2024-10-28' AS Date), 3, N'pending', 5, N'morning', CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (166, 12, CAST(N'2024-10-30' AS Date), 3, N'pending', 2, N'morning', CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (170, 24, CAST(N'2024-10-27' AS Date), 2, N'Pending', 2, N'morning', CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (177, 21, CAST(N'2024-10-27' AS Date), 2, N'Pending', 3, N'morning', CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (178, 22, CAST(N'2024-10-27' AS Date), 3, N'Pending', 3, N'evening', CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (180, 22, CAST(N'2024-10-28' AS Date), 3, N'Pending', 1, N'noon', CAST(N'2024-10-27' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (181, 21, CAST(N'2024-10-29' AS Date), 3, N'Pending', 6, N'noon', CAST(N'2024-10-27' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (182, 24, CAST(N'2024-10-29' AS Date), 2, N'Pending', 8, N'morning', CAST(N'2024-10-27' AS Date))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [reservation_date], [number_of_people], [status], [table_id], [time_slot], [current_day]) VALUES (183, 23, CAST(N'2024-10-28' AS Date), 3, N'Pending', 6, N'evening', CAST(N'2024-10-27' AS Date))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([review_id], [user_id], [item_id], [rating], [comment], [review_date]) VALUES (5, 21, NULL, 5, N'qua ngol
', CAST(N'2024-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([review_id], [user_id], [item_id], [rating], [comment], [review_date]) VALUES (6, 24, NULL, 4, N'ngol', CAST(N'2024-10-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (1, 1, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (2, 2, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (3, 3, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (4, 4, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (5, 5, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (6, 6, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (7, 7, N'Normal')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (8, 1, N'VIP')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (9, 2, N'VIP')
INSERT [dbo].[Tables] ([table_id], [table_number], [location]) VALUES (10, 3, N'VIP')
SET IDENTITY_INSERT [dbo].[Tables] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (1, N'Ngô Hoàng Giáp', N'123456', N'dgarmor2.0@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (2, N'Ngô Hoàng Giáp', N'123456', N'gdarmor2.0@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (3, N'', N'', N'', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (4, N'Ngô Hoàng Giáp', N'6', N'gdor2.0@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (5, N'Chu Nguyen Duy', N'123', N'duy@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (6, N'Ngô Hoàng Giáp', N'123', N'giapnhhe186581@fpt.edu.vn', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (7, N'HE186581 Ngô Hoàng Giáp', N'123', N'giapngo220@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (8, N'g', N'g', N'g', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (9, N'd', N'duy', N'd', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (10, N'ngu', N'ngu', N'ngu', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (11, N'admin', N'admin', N'admin', N'admin')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (12, N'1', N'1', N'1', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (13, N'2', N'2', N'2', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (14, N'3', N'3', N'3', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (15, N'quan', N'quan', N'quan', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (16, N'Ngô Hoàng Giáp_4', N'4', N'4', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (17, N'5', N'5', N'5', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (18, N'6', N'6', N'6', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (19, N'7', N'7', N'7', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (20, N'8', N'8', N'8', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (21, N'Giap', N'12345678', N'giap@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (22, N'Quân', N'123456789', N'quan@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (23, N'Thắng', N'123456789', N'thang@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (24, N'Đạt', N'123456789', N'dat@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (25, N'Vương', N'123456789', N'vuong@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (26, N'tet1', N'123456789', N'tet1@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (27, N'tet2', N'123456789', N'tet2@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (28, N'tet3', N'123456789', N'tet3@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (29, N'tet4', N'123456789', N'tet4@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (30, N'tet5', N'123456789', N'tet5@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (31, N'tet6', N'123456789', N'tet6@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (32, N'tet7', N'123456789', N'tet7@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (33, N'tet8', N'123456789', N'tet8@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (34, N'tet9', N'123456789', N'tet9@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (35, N'tet10', N'123456789', N'tet10@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (36, N'tet11', N'123456789', N'tet11@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (37, N'tet12', N'123456789', N'tet12@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (38, N'tet13', N'123456789', N'tet13@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (39, N'tet14', N'123456789', N'tet14@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (40, N'tet15', N'123456789', N'tet15@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (41, N'tet16', N'123456789', N'tet16@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (42, N'tet17', N'123456789', N'tet17@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (43, N'tet18', N'123456789', N'tet18@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (44, N'tet19', N'123456789', N'tet19@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (45, N'Lộckun', N'123456789', N'loc@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (46, N'tet20', N'123456789', N'tet20@gmail.com', N'customer')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (47, N'tet21', N'123456789', N'tet21@gmail.com', N'customer')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF_Reservations_CurrentDay]  DEFAULT (getdate()) FOR [current_day]
GO
ALTER TABLE [dbo].[DiscountItem]  WITH CHECK ADD FOREIGN KEY([item_id])
REFERENCES [dbo].[MenuItems] ([item_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([item_id])
REFERENCES [dbo].[MenuItems] ([item_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[Tables] ([table_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([item_id])
REFERENCES [dbo].[MenuItems] ([item_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[DiscountItem]  WITH CHECK ADD CHECK  (([condition]='not apply' OR [condition]='apply'))
GO
ALTER TABLE [dbo].[DiscountItem]  WITH CHECK ADD CHECK  (([percentDiscount]>=(1) AND [percentDiscount]<=(100)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]='Cancelled' OR [status]='Completed' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD CHECK  (([status]='Cancelled' OR [status]='Confirmed' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD CHECK  (([time_slot]='evening' OR [time_slot]='noon' OR [time_slot]='morning'))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Tables]  WITH CHECK ADD CHECK  (([location]='Normal' OR [location]='VIP'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([role]='customer' OR [role]='admin'))
GO
