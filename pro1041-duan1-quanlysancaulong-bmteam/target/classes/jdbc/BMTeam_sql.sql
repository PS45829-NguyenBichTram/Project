CREATE DATABASE BMTeam
ON
	(NAME = BMTeam,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BMTeam.mdf',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB)
LOG ON
	(NAME = BMTeam_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BMTeam_log.ldf',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB );
go

USE BMTeam;
go

-- Bảng lưu thông tin tài khoản người dùng
CREATE TABLE TaiKhoan (
    maTaiKhoan INT PRIMARY KEY IDENTITY(1,1),
    hoVaTen NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    sdt VARCHAR(15),
    matKhau NVARCHAR(255) NOT NULL,
    trangThai BIT DEFAULT 1,
    hinhAnh NVARCHAR(255),
    maChucVu INT NOT NULL,
    FOREIGN KEY (maChucVu) REFERENCES Role(maChucVu)
);

-- Bảng lưu vai trò người dùng
CREATE TABLE Role (
    maChucVu INT PRIMARY KEY IDENTITY(1,1),
    tenChucVu NVARCHAR(50) UNIQUE NOT NULL
);

-- Bảng phân ca làm việc
CREATE TABLE PhanCa (
    maPhanCa INT PRIMARY KEY IDENTITY(1,1),
    caLam NVARCHAR(50) NOT NULL,
    ngayLam DATE NOT NULL,
    maTaiKhoan INT NOT NULL,
    FOREIGN KEY (maTaiKhoan) REFERENCES TaiKhoan(maTaiKhoan)
);

-- Bảng lịch sử hoạt động
CREATE TABLE LichSuHoatDong (
    maLichSuHoatDong INT PRIMARY KEY IDENTITY(1,1),
    maTaiKhoan INT NOT NULL,
    thoiGian DATETIME NOT NULL,
    hoatDong NVARCHAR(255),
    FOREIGN KEY (maTaiKhoan) REFERENCES TaiKhoan(maTaiKhoan)
);

-- Bảng khách hàng
CREATE TABLE KhachHang (
    maKhachHang INT PRIMARY KEY IDENTITY(1,1),
    hoVaTen NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    sdt VARCHAR(15)
);

-- Bảng sân
CREATE TABLE San (
    maSan INT PRIMARY KEY IDENTITY(1,1),
    tenSan NVARCHAR(100) NOT NULL,
    trangThai BIT DEFAULT 1
);

-- Bảng bảng giá thuê sân
CREATE TABLE GiaThueSan (
    maGia INT PRIMARY KEY IDENTITY(1,1),
    moTaGia NVARCHAR(100),
    giaTheo2h MONEY NOT NULL,
    loaiDat NVARCHAR(50) NOT NULL
);

-- Bảng đặt sân
CREATE TABLE DatSan (
    maDatSan INT PRIMARY KEY IDENTITY(1,1),
    maTaiKhoan INT NOT NULL,
    maKhachHang INT NOT NULL,
    maSan INT NOT NULL,
    maGia INT NOT NULL,
    trangThai NVARCHAR(50) DEFAULT N'Đang xử lý',
    thoiGianBatDau DATETIME NOT NULL,
    thoiGianKetThuc DATETIME NOT NULL,
    FOREIGN KEY (maTaiKhoan) REFERENCES TaiKhoan(maTaiKhoan),
    FOREIGN KEY (maKhachHang) REFERENCES KhachHang(maKhachHang),
    FOREIGN KEY (maSan) REFERENCES San(maSan),
    FOREIGN KEY (maGia) REFERENCES GiaThueSan(maGia)
);

-- Bảng lịch sử đặt sân
CREATE TABLE LichSuDatSan (
    maLichSuDatSan INT PRIMARY KEY IDENTITY(1,1),
    maTaiKhoan INT NOT NULL,
    maDatSan INT NOT NULL,
    thoiGian DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (maTaiKhoan) REFERENCES TaiKhoan(maTaiKhoan),
    FOREIGN KEY (maDatSan) REFERENCES DatSan(maDatSan)
);

-- Bảng giải đấu
CREATE TABLE GiaiDau (
    maGiaiDau INT PRIMARY KEY IDENTITY(1,1),
    tenGiaiDau NVARCHAR(100) NOT NULL,
    ketQua NVARCHAR(255),
    ngayBatDau DATE,
    ngayKetThuc DATE,
    lichThiDau NVARCHAR(255)
);

-- Bảng trận đấu gắn sân với giải đấu
CREATE TABLE TranDau (
    maSan INT NOT NULL,
    maGiaiDau INT NOT NULL,
    PRIMARY KEY (maSan, maGiaiDau),
    FOREIGN KEY (maSan) REFERENCES San(maSan),
    FOREIGN KEY (maGiaiDau) REFERENCES GiaiDau(maGiaiDau)
);

-- Bảng sản phẩm
CREATE TABLE SanPham (
    maSanPham INT PRIMARY KEY IDENTITY(1,1),
    tenSanPham NVARCHAR(100) NOT NULL,
    soLuongTonKho INT DEFAULT 0,
    donGia MONEY NOT NULL
);

-- Bảng hóa đơn
CREATE TABLE HoaDon (
    maHoaDon INT PRIMARY KEY IDENTITY(1,1),
    ngayLap DATE NOT NULL DEFAULT GETDATE(),
    maKhachHang INT NOT NULL,
    maTaiKhoan INT NOT NULL,
    FOREIGN KEY (maKhachHang) REFERENCES KhachHang(maKhachHang),
    FOREIGN KEY (maTaiKhoan) REFERENCES TaiKhoan(maTaiKhoan)
);

-- Bảng chi tiết hóa đơn
CREATE TABLE ChiTietHoaDon (
    maChiTiet INT PRIMARY KEY IDENTITY(1,1),
    maSanPham INT NOT NULL,
    maHoaDon INT NOT NULL,
    soLuong INT NOT NULL,
    donGia MONEY NOT NULL,
    FOREIGN KEY (maSanPham) REFERENCES SanPham(maSanPham),
    FOREIGN KEY (maHoaDon) REFERENCES HoaDon(maHoaDon)
);
