

CREATE TABLE HangHoa (
  MaHang INT PRIMARY KEY,
  TenHang NVARCHAR(255),
  MaDVT INT,
  GiaMua FLOAT,
  GiaBan FLOAT,
  GiaBinhQuan FLOAT,
  SoLuongTon INT,
  NgayCapNhat DATE,
  GhiChu NVARCHAR(255),
);
CREATE TABLE DonViTinh (
  MaDVT INT PRIMARY KEY,
  TenDVT NVARCHAR(255),
  GhiChu NVARCHAR(255),
);
CREATE TABLE BangGia (
  MaBangGia INT PRIMARY KEY,
  MaHang INT,
  MaDVT INT,
  SoLuongDVT FLOAT,
  GiaMua FLOAT,
  GiaBan FLOAT,
  FOREIGN KEY (MaHang) REFERENCES HangHoa(MaHang),
  FOREIGN KEY (MaDVT) REFERENCES DonViTinh(MaDVT)
);
CREATE TABLE NhanVien (
  MaNV INT PRIMARY KEY,
  TenNV NVARCHAR(255),
  DienThoai NVARCHAR(20),
  DiaChi NVARCHAR(255),
  TaiKhoan NVARCHAR(255),
  MatKhau NVARCHAR(255),
  GhiChu NVARCHAR(255),
);
CREATE TABLE KhachHang (
  MaKH INT PRIMARY KEY,
  TenKH NVARCHAR(255),
  DienThoai NVARCHAR(20),
  DiaChi NVARCHAR(255),
  GhiChu NVARCHAR(255),
);

CREATE TABLE DonHangBan (
  MaDH INT PRIMARY KEY,
  NgayDH DATE,
  MaNV INT,
  MaKH INT,
  TongGiaTri FLOAT,
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE ChiTietDonHangBan (
  MaChiTiet INT PRIMARY KEY,
  MaDH INT,
  MaHang INT,
  GiaMua FLOAT,
  GiaBan FLOAT,
  SoLuong INT,
  ThanhTien FLOAT,
  FOREIGN KEY (MaDH) REFERENCES DonHangBan(MaDH),
  FOREIGN KEY (MaHang) REFERENCES HangHoa(MaHang)
);





CREATE TABLE NhaCungCap (
  MaNCC INT PRIMARY KEY,
  TenNCC NVARCHAR(255),
  DienThoai NVARCHAR(20),
  DiaChi NVARCHAR(255),
  GhiChu NVARCHAR(255),
);

CREATE TABLE DonHangMua (
  MaDH INT PRIMARY KEY,
  NgayDH DATE,
  MaNV INT,
  MaNCC INT,
  TongGiaTri FLOAT,
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);

CREATE TABLE ChiTietDonHangMua (
  MaChiTiet INT PRIMARY KEY,
  MaDH INT,
  MaHang INT,
  SoLuong INT,
  GiaMua FLOAT,
  ThanhTien FLOAT,
  FOREIGN KEY (MaDH) REFERENCES DonHangMua(MaDH),
  FOREIGN KEY (MaHang) REFERENCES HangHoa(MaHang)
);
CREATE TABLE NhapHang (
  MaNhap INT PRIMARY KEY,
  NgayNhap DATE,
  MaNV INT,
  MaNCC INT,
  TongTien FLOAT,
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);

CREATE TABLE ChiTietNhapHang (
  MaChiTietNhap INT PRIMARY KEY,
  MaNhap INT,
  MaHang INT,
  SoLuongNhap INT,
  GiaNhap FLOAT,
  ThanhTien FLOAT,
  FOREIGN KEY (MaNhap) REFERENCES NhapHang(MaNhap),
  FOREIGN KEY (MaHang) REFERENCES HangHoa(MaHang)
);

CREATE TABLE XuatHang (
  MaXuat INT PRIMARY KEY,
  NgayXuat DATE,
  MaNV INT,
  MaKH INT,
  TongTien FLOAT,
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE ChiTietXuatHang (
  MaChiTietXuat INT PRIMARY KEY,
  MaXuat INT,
  MaHang INT,
  SoLuongXuat INT,
  GiaXuat FLOAT,
  ThanhTien FLOAT,
  FOREIGN KEY (MaXuat) REFERENCES XuatHang(MaXuat),
  FOREIGN KEY (MaHang) REFERENCES HangHoa(MaHang)
);

INSERT INTO HangHoa (MaHang, TenHang, MaDVT, GiaMua, GiaBan, GiaBinhQuan, SoLuongTon, NgayCapNhat, GhiChu)VALUES 
(1, N'Paracetamol 500mg', 1, 5000, 7000, 6000, 100, '2022-03-25', N'Thuốc giảm đau hạ sốt'),
(2, N'Panadol Extra 500mg', 1, 7000, 10000, 8500, 50, '2022-03-25', N'Thuốc giảm đau hạ sốt'),
(3, N'Strepsils Hạt', 3, 15000, 20000, 18000, 30, '2022-03-25', N'Viên ngậm cho họng'),
(4, N'Tảo Spirulina', 2, 20000, 25000, 22000, 20, '2022-03-25', N'Bổ sung dinh dưỡng'),
(6, N'Thuốc An Thần', 1, 10000, 15000, 12500, 40, '2022-03-25', N'Giúp ngủ ngon, giảm căng thẳng'),
(7, N'Vitamin C 1000mg', 2, 8000, 12000, 10000, 80, '2022-03-25', N'Bổ sung Vitamin C, tăng sức đề kháng');

INSERT INTO DonViTinh (MaDVT, TenDVT, GhiChu)VALUES 
(101, N'Viên', N'Đơn vị tính của thuốc Paracetamol là viên'),
(102, N'Gói', N'Đơn vị tính của thuốc Tảo Spirulina là gói'),
(103, N'Chai', N'Đơn vị tính của thuốc Vitamin C 1000mg là chai');

INSERT INTO BangGia (MaBangGia, MaHang, MaDVT, SoLuongDVT, GiaMua, GiaBan)VALUES 
(1001, 1, 101, 10, 5000, 7000),
(1002, 2, 102, 10, 1500, 4000),
(1003, 3, 103, 10, 10000, 15000);

INSERT INTO NhanVien (MaNV, TenNV, DienThoai, DiaChi, TaiKhoan, MatKhau, GhiChu)VALUES 
(11, N'Nguyễn Văn A', '0123456789', N'Hà Nội', 'nguyenvana', '123456', N'Nhân viên bán hàng'),
(12, N'Nguyễn Văn B', '0999999999', N'Hà Nội', 'nguyenvanb', '123456', N'Nhân viên quản lý'),
(13, N'Nguyễn Văn C', '0987654321', N'Hà Nội', 'nguyenvanc', '123456', N'Nhân viên thủ kho');

INSERT INTO KhachHang (MaKH, TenKH, DienThoai, DiaChi, GhiChu)VALUES 
(110, N'Trần Thị Nhàn', '0868816820', N'TPHCM', N'Khách hàng thường'),
(210, N'Nguyễn Văn Trường', '0234567891', N'Hà Nội', N'Khách hàng VIP'),
(310, N'Lê Thị Mỹ', '0364230625', N'Đà Nẵng', N'Khách hàng thân thiết');


INSERT INTO DonHangBan (MaDH, NgayDH, MaNV, MaKH, TongGiaTri)VALUES 
(1, '2022-03-28', 11, 110, 70000),
(2, '2022-07-26', 12, 210, 70000),
(3, '2022-05-25', 13, 310, 70000),
(4, '2022-03-02', 11, 110, 70000);

INSERT INTO ChiTietDonHangBan (MaChiTiet, MaDH, MaHang, GiaMua, GiaBan, SoLuong, ThanhTien)VALUES

(1, 1, 1, 5000, 7000, 10, 70000),
(2, 4, 4, 20000, 25000, 10, 250000),
(3, 2, 6, 2000, 5000, 10, 50000),
(4, 3, 7, 1000, 3000, 10, 30000);

INSERT INTO NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi, GhiChu)VALUES 
(1, N'Nhà cung cấp A', '0986541237', N'Hà Nội', N'Nhà cung cấp thuốc'),
(2, N'Nhà cung cấp B', '0327568954', N'TPHCM', N'Nhà cung cấp thiết bị y tế'),
(3, N'Nhà cung cấp C', '0984821308', N'Hà Nội', N'Nhà cung cấp mỹ phẩm');

INSERT INTO DonHangMua (MaDH, NgayDH, MaNV, MaNCC, TongGiaTri)VALUES 
(1, '2022-03-28', 11, 1, 500000),
(2, '2021-09-25', 12, 2, 230000),
(3, '2021-07-22', 13, 3, 260000);

INSERT INTO ChiTietDonHangMua (MaChiTiet, MaDH, MaHang, SoLuong, GiaMua, ThanhTien)VALUES 
(1, 1, 3, 4, 5000, 20000),
(2, 3, 2, 6, 5000, 30000),
(3, 2, 6, 10, 5000, 50000);

INSERT INTO NhapHang (MaNhap, NgayNhap, MaNV, MaNCC, TongTien) VALUES
(1, '2022-03-15', 11, 1, 12000000),
(2, '2022-03-17', 12, 2, 15000000),
(3, '2022-03-19', 13, 3, 18000000);

INSERT INTO ChiTietNhapHang (MaChiTietNhap, MaNhap, MaHang, SoLuongNhap, GiaNhap, ThanhTien) VALUES
(1, 1, 1, 20, 100000, 2000000),
(2, 1, 2, 30, 120000, 3600000),
(3, 2, 3, 15, 80000, 1200000),
(4, 2, 4, 25, 150000, 3750000),
(5, 3, 7, 10, 200000, 2000000),
(6, 3, 6, 35, 90000, 3150000);

INSERT INTO XuatHang (MaXuat, NgayXuat, MaNV, MaKH, TongTien) VALUES
(1, '2022-03-16', 11, 110, 18000000),
(2, '2022-03-18', 12, 210, 15000000),
(3, '2022-03-20', 13, 310, 21000000);

INSERT INTO ChiTietXuatHang (MaChiTietXuat, MaXuat, MaHang, SoLuongXuat, GiaXuat, ThanhTien) VALUES
(1, 1, 1, 15, 1500000, 22500000),
(2, 1, 2, 25, 1300000, 32500000),
(3, 2, 3, 20, 900000, 18000000),
(4, 2, 4, 15, 1700000, 25500000),
(5, 3, 7, 5, 2500000, 12500000),
(6, 3, 6, 30, 1200000, 36000000);

select* from ChiTietXuatHang