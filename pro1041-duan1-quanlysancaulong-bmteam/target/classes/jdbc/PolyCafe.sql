CREATE DATABASE PolyCafe
ON
	(NAME = PolyCafe,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PolyCafe.mdf',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB)
LOG ON
	(NAME = PolyCafe_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PolyCafe_log.ldf',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB );
go

USE PolyCafe;
go

CREATE TABLE Categories(
    Id NVARCHAR(20) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    PRIMARY KEY(Id)
)

CREATE TABLE Drinks(
    Id NVARCHAR(20) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Discount FLOAT NOT NULL,
    Image NVARCHAR(50) NOT NULL,
    Available BIT NOT NULL,
    CategoryId NVARCHAR(20) NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(CategoryId) REFERENCES Categories(Id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
)

CREATE TABLE Cards(
    Id INT NOT NULL,
    Status INT NOT NULL,
    PRIMARY KEY(Id)
)

CREATE TABLE Users(
    Username NVARCHAR(20) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Enabled BIT NOT NULL,
    Fullname NVARCHAR(50) NOT NULL,
    Photo NVARCHAR(50) NOT NULL,
    Manager BIT NOT NULL,
    PRIMARY KEY(Username)
)

CREATE TABLE Bills(
    Id BIGINT NOT NULL IDENTITY(10000, 1),
    Username NVARCHAR(20) NOT NULL,
    CardId INT NOT NULL,
    Checkin DATETIME NOT NULL,
    Checkout DATETIME NULL,
    Status INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Username) REFERENCES Users(Username) 
        ON UPDATE CASCADE,
    FOREIGN KEY(CardId) REFERENCES Cards(Id) 
        ON UPDATE CASCADE
)

CREATE TABLE BillDetails(
    Id BIGINT NOT NULL IDENTITY(100000, 1),
    BillId BIGINT NOT NULL,
    DrinkId NVARCHAR(20) NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Discount FLOAT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(BillId) REFERENCES Bills(Id) 
        ON DELETE CASCADE,
    FOREIGN KEY(DrinkId) REFERENCES Drinks(Id) 
        ON UPDATE CASCADE
)

------------------------------------------------------
CREATE TABLE KhachHang (
    customerId INT PRIMARY KEY IDENTITY(1,1),
    fullname NVARCHAR(MAX) NULL,
    dateofbirth DATE NULL,
    gender BIT NULL,
    address NVARCHAR(MAX) NULL,
    phonenumber NVARCHAR(50) NULL,
    email NVARCHAR(250) NULL
);

INSERT INTO KhachHang (fullname, dateofbirth, gender, address, phonenumber, email)
VALUES
    (N'Nguyễn Văn An', '1990-05-15', 1, N'123 Đường Láng, Đống Đa, Hà Nội', '0987654321', 'nguyenvanan@gmail.com'),
    (N'Trần Thị Bình', '1985-08-22', 0, N'45 Nguyễn Huệ, TP Huế', '0912345678', 'tranbinh85@gmail.com'),
    (N'Phạm Minh Châu', '1995-03-10', 0, N'78 Lê Lợi, Quận 1, TP.HCM', '0935123456', 'phamchau95@gmail.com'),
    (N'Lê Quốc Đạt', '1988-11-30', 1, N'56 Trần Phú, Nha Trang, Khánh Hòa', '0908765432', 'lequocdat88@gmail.com'),
    (N'Hoàng Thị Mai', '1992-07-04', 0, N'12 Nguyễn Trãi, Thanh Hóa', '0971234567', 'hoangmai92@gmail.com'),
    (N'Vũ Đình Nam', '1983-12-25', 1, N'89 Phạm Văn Đồng, Cầu Giấy, Hà Nội', '0945678901', 'vudinam83@gmail.com'),
    (N'Đỗ Thị Lan', '1998-09-17', 0, N'34 Hùng Vương, Đà Nẵng', '0967890123', 'dothilan98@gmail.com'),
    (N'Bùi Văn Hùng', '1993-06-08', 1, N'67 Lý Thường Kiệt, Cần Thơ', '0923456789', 'buihung93@gmail.com'),
    (N'Ngô Thị Thanh', '1987-02-14', 0, N'23 Lê Đại Hành, Hải Phòng', '0956789012', 'ngothanh87@gmail.com'),
    (N'Tô Minh Tuấn', '1991-10-20', 1, N'101 Nguyễn Văn Cừ, Vinh, Nghệ An', '0981234567', 'tominhtuan91@gmail.com'),
    (N'Nguyễn Thị Hồng', '1994-04-12', 0, N'15 Tôn Đức Thắng, Quận 1, TP.HCM', '0976543210', 'nguyenhong94@gmail.com'),
    (N'Trần Văn Khôi', '1989-09-05', 1, N'88 Phạm Hùng, Nam Từ Liêm, Hà Nội', '0931234567', 'trankhoi89@gmail.com'),
    (N'Phạm Thị Ngọc', '1997-01-28', 0, N'27 Nguyễn Đình Chiểu, Đà Lạt, Lâm Đồng', '0965432109', 'phamngoc97@gmail.com'),
    (N'Lê Văn Hậu', '1986-06-19', 1, N'33 Hoàng Diệu, TP Quy Nhơn, Bình Định', '0989876543', 'levanhau86@gmail.com'),
    (N'Hoàng Minh Đức', '1990-03-03', 1, N'72 Lê Lai, TP Vinh, Nghệ An', '0918765432', 'hoangduc90@gmail.com'),
    (N'Vũ Thị Thu', '1984-11-11', 0, N'19 Nguyễn Công Trứ, Hải Phòng', '0943210987', 'vuthu84@gmail.com'),
    (N'Đỗ Văn Tùng', '1996-08-07', 1, N'41 Trần Hưng Đạo, TP Cần Thơ', '0926789012', 'dovantung96@gmail.com'),
    (N'Bùi Thị Linh', '1993-05-25', 0, N'64 Lý Thái Tổ, Huế, Thừa Thiên Huế', '0954321098', 'builinh93@gmail.com'),
    (N'Ngô Văn Phúc', '1988-12-15', 1, N'90 Nguyễn Văn Linh, Đà Nẵng', '0907654321', 'ngophuc88@gmail.com'),
    (N'Tô Thị Duyên', '1991-07-30', 0, N'25 Lê Văn Sỹ, Quận 3, TP.HCM', '0978901234', 'toduyen91@gmail.com');