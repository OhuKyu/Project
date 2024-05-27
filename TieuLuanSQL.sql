CREATE DATABASE db_Starbucks_Coffee;

USE db_Starbucks_Coffee;

CREATE TABLE NHANVIEN(
	MANV CHAR(5) PRIMARY KEY NOT NULL,
	TENNV NVARCHAR(100),
	MACV CHAR(3),
	MACN CHAR(3),
	NGAYSINH DATETIME,
	GIOITINH BIT,
	SODT CHAR(10),
	EMAIL NVARCHAR(50),
	DIACHI NVARCHAR(100),
	NGAYVAO DATETIME,
	NGAYNGHI DATETIME
)

CREATE TABLE CHUCVU(
	MACV CHAR(3) PRIMARY KEY NOT NULL,
	TENCV NVARCHAR(100)
)

CREATE TABLE LOAITHUCUONG(
	MALOAI CHAR(10) PRIMARY KEY,
	TENLOAI NVARCHAR(100)
)

CREATE TABLE THUCUONG(
	MATU CHAR(5) PRIMARY KEY NOT NULL,
	MALOAI CHAR(10),
	TENTU NVARCHAR(100),
	DONGGIA DECIMAL
)

CREATE TABLE KHUVUC(
	MAKV CHAR(3) PRIMARY KEY NOT NULL,
	TENKV NVARCHAR(10),
	HESOGIA FLOAT
)

CREATE TABLE CONGTHUC(
	MATU CHAR(5),
	MANL CHAR(10),
	SOLUONG FLOAT,

	PRIMARY KEY(MATU, MANL)
)

CREATE TABLE CHINHANH(
	MACN CHAR(3) PRIMARY KEY NOT NULL,
	TENCN NVARCHAR(100),
	SODT CHAR(10),
	DIACHI NVARCHAR(100),
	HESOGIA FLOAT
)

CREATE TABLE BAOCAO(
	MABC CHAR(10) PRIMARY KEY NOT NULL,
	MANV CHAR(5),
	TENBC NVARCHAR(100),
	NGAYLAP DATETIME,
	NOIDUNG NVARCHAR(100)
)

CREATE TABLE NHACUNGCAP(
	MANCC CHAR(10) PRIMARY KEY,
	TENNCC NVARCHAR(10),
	SODT CHAR(10),
	EMAIL NVARCHAR(50),
	DIACHI NVARCHAR(100),
)

CREATE TABLE PHIEUPHUTHU(
	MAPHIEUPT CHAR(10) PRIMARY KEY NOT NULL,
	MANV CHAR(5),
	TENPPT NVARCHAR(100),
	NGAYLAP DATETIME,
	SOTIEN DECIMAL
)

CREATE TABLE PHIEUCHI(
	MAPC CHAR(50) PRIMARY KEY,
	MANV CHAR(5),
	NOIDUNGCHI NVARCHAR(MAX),
	NGAYLAP DATETIME,
	TONGTIEN DECIMAL,
)

CREATE TABLE PHIEUNHAP(
	MAPN CHAR(10) PRIMARY KEY NOT NULL,
	MANV CHAR(5),
	MANCC CHAR(10),
	NGAYLAP DATETIME,
	TONGTIEN DECIMAL
)

CREATE TABLE HOADON(
	MAHD NVARCHAR(20) PRIMARY KEY,
	MANV CHAR(5),
	MAKV CHAR(3),
	NGAYLAP DATETIME,
	TONGTIEN DECIMAL
)

CREATE TABLE CHITIET_HOADON(
	MATU CHAR(5),
	MAHD NVARCHAR(20),
	SOLUONG FLOAT,

	PRIMARY KEY(MATU, MAHD)
)

CREATE TABLE CHITIET_PHIEUNHAP(
	MANL CHAR(10),
	MAPN CHAR(10),
	SOLUONG FLOAT,

	PRIMARY KEY(MANL, MAPN),
)

CREATE TABLE NGUYENLIEU(
	MANL CHAR(10) PRIMARY KEY NOT NULL,
	TENNL NVARCHAR(100),
	SOLUONG FLOAT,
	DONVI NVARCHAR(25),
)

ALTER TABLE CHITIET_PHIEUNHAP
ADD CONSTRAINT FK_CHITIET_PHIEUNHAP_MANL FOREIGN KEY (MANL) REFERENCES NGUYENLIEU(MANL);
ALTER TABLE CHITIET_PHIEUNHAP
ADD CONSTRAINT FK_CHITIET_PHIEUNHAP_MAPN FOREIGN KEY (MAPN) REFERENCES PHIEUNHAP(MAPN);

ALTER TABLE PHIEUNHAP
ADD CONSTRAINT FK_PHIEUNHAP_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE PHIEUNHAP
ADD CONSTRAINT FK_PHIEUNHAP_MANCC FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_CHUCVU FOREIGN KEY (MACV) REFERENCES CHUCVU(MACV);
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_CHINHANH FOREIGN KEY (MACN) REFERENCES CHINHANH(MACN);

ALTER TABLE CONGTHUC
ADD CONSTRAINT FK_CONGTHUC_MANL FOREIGN KEY (MANL) REFERENCES NGUYENLIEU(MANL);
ALTER TABLE CONGTHUC
ADD CONSTRAINT FK_CONGTHUC_MATU FOREIGN KEY (MATU) REFERENCES THUCUONG(MATU);

ALTER TABLE THUCUONG
ADD CONSTRAINT FK_THUCUONG_MALOAI FOREIGN KEY (MALOAI) REFERENCES LOAITHUCUONG(MALOAI);

ALTER TABLE BAOCAO
ADD CONSTRAINT FK_BAOCAO_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);

ALTER TABLE PHIEUCHI
ADD CONSTRAINT FK_PHIEUCHI_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);

ALTER TABLE PHIEUPHUTHU
ADD CONSTRAINT FK_PHIEUPHUTHU_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);

ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_MAKV FOREIGN KEY (MAKV) REFERENCES KHUVUC(MAKV);

ALTER TABLE CHITIET_HOADON
ADD CONSTRAINT FK_CHITIET_HOADON_MATU FOREIGN KEY (MATU) REFERENCES THUCUONG(MATU);
ALTER TABLE CHITIET_HOADON
ADD CONSTRAINT FK_CHITIET_HOADON_MAHD FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD);

INSERT INTO CHINHANH(MACN, TENCN, SODT, DIACHI,HESOGIA) VALUES
('N1', N'Công ty TNHH Thành Cong', '0912356743', N'TP.HCM', '2.5'),
('N2', N'Công ty TNHH High Tech', '0954368932', N'Bạc Liêu', '1.4'),
('N3', N'Công ty TNHH Thuận An', '0942157443', N'Phú Yên', '1.25'),
('N4', N'Công ty TNHH An Dương', '0913683213', N'Huế', '2.3'),
('N5', N'Công ty TNHH Minh Phú', '0913632123', N'Bình Chánh', '1.35'),
('N6', N'Công ty TNHH Minh Anh', '0973124689', N'Mỹ Tho', '1.54'),
('N7', N'Công ty TNHH Ngọc Sơn', '0912357431', N'Hưng Yên', '1.5'),
('N8', N'Công ty TNHH Fast Travel', '0914658743', N'TP.HCM', '2.5'),
('N9', N'Công ty TNHH Minh Cường', '0914367793', N'Phú Yên', '1.8'),
('N10', N'Công ty TNHH Ánh Dương', '0912327893', N'Bến Tre', '1.2');

INSERT INTO CHUCVU(MACV, TENCV) VALUES
('CT', N'Chủ Tịch'),
('CEO', N'Giám Đốc Điều hành'),
('CFO', N'Giám Đốc Tài Chính'),
('CMO', N'Giám Đốc Marketing'),
('CLO', N'Giám Đốc Pháp Lý'),
('PGD', N'Phó Giám Đốc'),
('TK', N'Thư Ký'),
('QL', N'Quản Lý'),
('KT', N'Kiểm Toán'),
('NV', N'Nhân Viên');

INSERT INTO NHANVIEN(MANV, TENNV, MACV, MACN, NGAYSINH, GIOITINH, SODT, EMAIL, DIACHI, NGAYVAO, NGAYNGHI) VALUES
('NV001', N'Trần Bá Hoàng Duy', 'CT', 'N1', '2004-09-06', 1, '0919516089', 'hoangduy@gmail.com', N'TP.HCM', '2012-03-09', NULL),
('NV002', N'Nguyễn Lê Minh Phú', 'CEO', 'N5', '2004-08-02', 1, '0912536589', 'minhphu@gmail.com', N'Bình Chánh', '2012-05-06', NULL),
('NV003', N'Nguyễn Ngọc Thành', 'NV', 'N2', '2004-02-29', 1, '0916542159', 'ngocthanh@gmail.com', N'Cà Mau', '2024-05-08', '2024-06-23'),
('NV004', N'Nguyễn Thành Phúc', 'CMO', 'N10', '2004-12-31', 1, '0912557089', 'thanhphuc@gmail.com', N'Kom Tum', '2012-01-01', NULL),
('NV005', N'Nguyên Lê Hoàng Phúc', 'KT', 'N9', '2004-07-12', 1, '0969536589', 'hoangphuc@gmail.com', N'Hà Nội', '2021-01-01', '2024-07-23'),
('NV006', N'Nguyễn Vĩnh Tài', 'CLO', 'N2', '2004-01-01', 1, '0912545689', 'vinhtai@gmail.com', N'Hưng Yên', '2018-01-01', NULL),
('NV007', N'Hồ Ngọc Ánh', 'NV', 'N3', '2004-02-01', 2, '0914556019', 'ngocanh@gmail.com', N'TP.HCM', '2015-06-12', NULL),
('NV008', N'Hồ Ánh Sao', 'CFO', 'N4', '2004-02-21', 2, '0969790019', 'anhsao@gmail.com', N'Cà Mau', '2013-09-04', '2025-01-01'),
('NV009', N'Trịnh Ngọc Dương', 'NV', 'N8', '2004-05-01', 2, '0957596189', 'ngocduong@gmail.com', N'Hà Nội', '2023-12-21', NULL),
('NV010', N'Trần Văn Minh', 'NV', 'N9', '2004-05-12', 1, '0919456029', 'vanminh@gmail.com', N'Kom Tum', '2024-07-08', NULL),
('NV011', N'Phạm Thị Hương', 'TK', 'N3', '1990-08-15', 0, '0987654321', 'huong@gmail.com', N'Mỹ Tho', '2014-01-08', NULL),
('NV012', N'Nguyễn Thị Mai', 'NV', 'N3', '1995-05-20', 0, '0987654322', 'mai@gmail.com', N'Ba Đình', '2015-08-15', NULL),
('NV013', N'Trần Thị Lan', 'PGD', 'N6', '1992-03-10', 0, '0987654323', 'lan@gmail.com', N'Tuyên Quang', '2023-11-07', '2024-03-25'),
('NV014', N'Lê Thị Hà', 'NV', 'N7', '1997-01-05', 0, '0987654324', 'ha@gmail.com', N'Phú Yên', '2015-05-23', NULL),
('NV015', N'Hoàng Thị Thu', 'QL', 'N3', '1988-12-01', 0, '0987654325', 'thu@gmail.com', N'Hưng Khuê', '2013-09-21', NULL),
('NV016', N'Phan Thị Hồng', 'NV', 'N3', '1994-09-30', 0, '0987654326', 'hong@gmail.com', N'Bình Định', '2022-11-25', '2024-02-28'),
('NV017', N'Vũ Thị Hằng', 'NV', 'N3', '1993-07-25', 0, '0987654327', 'hang@gmail.com', N'Nam Định', '2021-12-05', NULL),
('NV018', N'Ngô Thị Huệ', 'QL', 'N3', '1996-04-17', 0, '0987654328', 'hue@gmail.com', N'Hà Nội', '2016-05-11', NULL),
('NV019', N'Mai Thị Ngọc', 'NV', 'N3', '1991-02-28', 0, '0987654329', 'ngoc@gmail.com', N'TP.HCM', '2022-07-21', '2024-03-20'),
('NV020', N'Trần Thị Thuỳ', 'NV', 'N3', '1998-11-10', 0, '0987654330', 'thuy@gmail.com', N'Ai Biết', '2013-06-21', NULL);

INSERT INTO BAOCAO(MABC, MANV, TENBC, NGAYLAP, NOIDUNG) VALUES
('BC001', 'NV005', N'Báo cáo doanh số tháng 1/2024', '2024-01-31', N'Báo cáo tổng doanh số bán hàng trong tháng 1/2024'),
('BC002', 'NV004', N'Báo cáo chiến lược marketing', '2024-02-10', N'Báo cáo về chiến lược marketing mới cho cửa hàng Starbucks'),
('BC003', 'NV002', N'Báo cáo nhân sự tháng 2/2024', '2024-03-01', N'Báo cáo về tình hình nhân sự trong tháng 2/2024'),
('BC004', 'NV014', N'Báo cáo phản hồi từ khách hàng', '2024-03-10', N'Báo cáo tổng hợp về phản hồi từ khách hàng qua các kênh giao tiếp'),
('BC005', 'NV015', N'Báo cáo doanh thu từ các loại thức uống', '2024-03-15', N'Báo cáo tổng doanh thu từ mỗi loại thức uống trong tháng 3/2024'),
('BC006', 'NV005', N'Báo cáo kiểm toán hàng tháng', '2024-03-20', N'Báo cáo kết quả kiểm toán hàng tháng về hàng tồn kho và thu chi'),
('BC007', 'NV007', N'Báo cáo kế hoạch phát triển sản phẩm', '2024-03-25', N'Báo cáo về kế hoạch phát triển sản phẩm mới cho tháng 4/2024'),
('BC008', 'NV018', N'Báo cáo tài chính quý 1/2024', '2024-04-05', N'Báo cáo tình hình tài chính tổng quát của công ty trong quý 1/2024'),
('BC009', 'NV009', N'Báo cáo hiệu suất nhân viên', '2024-04-10', N'Báo cáo về hiệu suất làm việc của nhân viên trong tháng 3/2024'),
('BC010', 'NV020', N'Báo cáo về chi phí vận hành', '2024-04-15', N'Báo cáo về chi phí vận hành cửa hàng Starbucks trong tháng 3/2024');

INSERT INTO KHUVUC(MAKV, TENKV, HESOGIA) VALUES
('K01', N'Khu vực A', 1.2),
('K02', N'Khu vực B', 1.1),
('K03', N'Khu vực C', 1.3),
('K04', N'Khu vực D', 1.15),
('K05', N'Khu vực E', 1.25),
('K06', N'Khu vực F', 1.2),
('K07', N'Khu vực G', 1.35),
('K08', N'Khu vực H', 1.1),
('K09', N'Khu vực I', 1.4),
('K10', N'Khu vực I', 1.4);

INSERT INTO HOADON(MAHD, MANV, MAKV, NGAYLAP, TONGTIEN) VALUES
('HD102', 'NV001', 'K02', '2023-03-01', 77500000),
('HD103', 'NV002', 'K03', '2023-03-02', 57000000),
('HD104', 'NV003', 'K04', '2024-03-03', 60000000),
('HD105', 'NV004', 'K05', '2023-03-04', 95000000),
('HD106', 'NV005', 'K06', '2024-03-05', 55000000),
('HD107', 'NV006', 'K07', '2024-03-06', 66500000),
('HD108', 'NV007', 'K08', '2023-03-07', 72000000),
('HD109', 'NV008', 'K09', '2024-03-08', 85000000),
('HD110', 'NV009', 'K10', '2023-03-09', 90000000);

INSERT INTO NGUYENLIEU(MANL, TENNL, SOLUONG, DONVI) VALUES
('NL001', N'Cà phê Arabica', 100, 'kg'),
('NL002', N'Cà phê Robusta', 120, 'kg'),
('NL003', N'Đường', 200, 'kg'),
('NL004', N'Sữa đặc', 150, 'l'),
('NL005', N'Kem', 80, 'kg'),
('NL006', N'Hạt giống Matcha', 50, 'kg'),
('NL007', N'Sirô caramel', 60, 'l'),
('NL008', N'Sốt vani', 70, 'l'),
('NL009', N'Bột cacao', 90, 'kg'),
('NL010', N'Bột trắng', 110, 'kg');

INSERT INTO LOAITHUCUONG(MALOAI, TENLOAI) VALUES
('TEA', N'Loại 01'),
('MILK', N'Loại 02'),
('SODA', N'Loại 03'),
('WATER', N'Loại 04'),
('COFFEE', N'Loại 05'),
('JUICE', N'Loại 06'),
('WINE', N'Loại 07'),
('BEER', N'Loại 08'),
('SMOOTHIE', N'Loại 09'),
('VODKA', N'Loại 10');

INSERT INTO THUCUONG(MATU, MALOAI, TENTU, DONGGIA) VALUES
('TU001', 'SODA', N'Nước có ga', 35000),
('TU002', 'TEA', N'Trà đá', 40000),
('TU003', 'MILK', N'Sữa đặc', 45000),
('TU004', 'WATER', N'Nước lọc', 42000),
('TU005', 'COFFEE', N'Cà phê', 30000),
('TU006', 'JUICE', N'Nước hoa quả', 38000),
('TU007', 'BEER', N'Bia tigger', 48000),
('TU008', 'VODKA', N'Rượu vodka', 55000),
('TU009', 'SMOOTHIE', N'Sinh tố bơ', 50000),
('TU010', 'WINE', N'Rượu vang', 50000);

INSERT INTO CONGTHUC(MATU, MANL, SOLUONG) VALUES
('TU001', 'NL001', '0.25'),
('TU002', 'NL002', '0.05'),
('TU003', 'NL003', '1'),
('TU004', 'NL004', '0.03'),
('TU005', 'NL005', '1'),
('TU006', 'NL006', '1'),
('TU007', 'NL007', '0.5'),
('TU008', 'NL008', '1'),
('TU009', 'NL009', '0.1'),
('TU010', 'NL010', '1');

INSERT INTO CHITIET_HOADON (MATU, MAHD, SOLUONG) VALUES 
('TU001', 'HD102', 2),
('TU002', 'HD103', 1),
('TU003', 'HD104', 3),
('TU004', 'HD105', 0),
('TU005', 'HD106', 2),
('TU006', 'HD107', 1),
('TU007', 'HD108', 0),
('TU008', 'HD109', 3),
('TU009', 'HD110', 1);

INSERT INTO NHACUNGCAP (MANCC, TENNCC, SODT, EMAIL, DIACHI) VALUES 
('NCC01', N'Cafe', '0123456789', 'cafe@example.com', N'TP.HCM'),
('NCC02', N'Nước', '0234567890', 'nuoc@example.com', N'Địa chỉ B'),
('NCC03', N'Sữa', '0345678901', 'sua@example.com', N'Địa chỉ C'),
('NCC04', N'Sôcôla', '0456789012', 'socola@example.com', N'Địa chỉ D'),
('NCC05', N'Đá', '0567890123', 'da@example.com', N'Địa chỉ E'),
('NCC06', N'Dụng cụ', '0678901234', 'dungcu@example.com', N'Địa chỉ F'),
('NCC07', N'Trái cây', '0789012345', 'traicay@example.com', N'Địa chỉ G'),
('NCC08', N'Điện', '0890123456', 'dien@example.com', N'Địa chỉ H'),
('NCC09', N'Caocao', '0901234567', 'caocao@example.com', N'Địa chỉ I'),
('NCC10', N'Zzz', '0912345678', 'zzz@example.com', N'Địa chỉ J');

INSERT INTO PHIEUCHI (MAPC, MANV, NOIDUNGCHI, NGAYLAP, TONGTIEN) VALUES
('PC51', 'NV005', N'Rút doanh thu ngày', '2023-02-11', 15000000), 
('PC52', 'NV006', N'Chi phí quảng cáo', '2024-03-05', 5000000),
('PC53', 'NV007', N'Lương nhân viên', '2023-03-10', 20000000),
('PC54', 'NV008', N'Mua vật liệu làm thức uống', '2023-03-15', 10000000),
('PC55', 'NV009', N'Chi phí vận chuyển hàng hóa', '2024-03-20', 8000000),
('PC56', 'NV010', N'Thanh toán hóa đơn điện nước', '2023-03-25', 6000000),
('PC57', 'NV011', N'Chi phí duy trì cơ sở vật chất', '2024-04-05', 7500000),
('PC58', 'NV012', N'Chi phí mua văn phòng phẩm', '2023-04-10', 3000000),
('PC59', 'NV013', N'Lương nhân viên', '2024-04-15', 20000000),
('PC60', 'NV014', N'Chi phí tiêu hao nguyên vật liệu', '2023-04-20', 9000000);

INSERT INTO PHIEUNHAP (MAPN, MANV, MANCC, NGAYLAP, TONGTIEN) VALUES
('PN54', 'NV003', 'NCC01', '2024-01-12', 1200000),
('PN56', 'NV004', 'NCC02', '2024-02-15', 1500000),
('PN57', 'NV005', 'NCC03', '2024-03-20', 1800000),
('PN58', 'NV006', 'NCC04', '2024-04-25', 2000000),
('PN59', 'NV007', 'NCC05', '2024-05-01', 2500000),
('PN60', 'NV008', 'NCC06', '2024-06-05', 2200000),
('PN61', 'NV009', 'NCC07', '2024-07-10', 1700000),
('PN62', 'NV010', 'NCC08', '2024-08-15', 1900000),
('PN63', 'NV011', 'NCC09', '2024-09-20', 1600000),
('PN64', 'NV012', 'NCC10', '2024-10-25', 2300000);

INSERT INTO CHITIET_PHIEUNHAP (MANL, MAPN, SOLUONG) VALUES 
('NL001', 'PN54', 100),
('NL002', 'PN56', 150),
('NL003', 'PN57', 120),
('NL004', 'PN58', 200),
('NL005', 'PN59', 180),
('NL006', 'PN60', 220),
('NL007', 'PN61', 250),
('NL008', 'PN62', 300),
('NL009', 'PN63', 130),
('NL010', 'PN64', 170);

INSERT INTO PHIEUPHUTHU (MAPHIEUPT, MANV, TENPPT, NGAYLAP, SOTIEN) VALUES
('PTT62', 'NV003', N'Khách làm vỡ ly', '2023-09-21', 30000),
('PTT64', 'NV004', N'Khách trả lại sản phẩm', '2024-02-14', 50000),
('PTT65', 'NV005', N'Khách nhận sản phẩm lỗi', '2024-01-30', 40000),
('PTT66', 'NV006', N'Khách không nhận hàng', '2024-01-30', 35000),
('PTT67', 'NV007', N'Khách trả hàng do không hài lòng', '2024-01-30', 45000),
('PTT68', 'NV008', N'Khách trả hàng do lỗi kỹ thuật', '2024-11-25', 60000),
('PTT69', 'NV009', N'Khách trả sản phẩm hỏng', '2024-12-14', 55000),
('PTT70', 'NV010', N'Hoàn trả tiền cho khách', '2024-02-14', 48000),
('PTT71', 'NV011', N'Khách trả sản phẩm không đúng', '2024-11-28', 52000),
('PTT72', 'NV012', N'Khách trả lại hàng', '2024-11-29', 38000),
('PTT73', 'NV003', N'Hoàn tiền cho khách vì sản phẩm hỏng', '2024-01-30', 42000);

-- Bài Tập:
-- Câu 4: Viết câu lệnh thêm bảng vào HOADON có mã hóa đơn là HD101, mã nhân viên NV1, mã khu vực KV1, ngày lập 12/2/2024, tổng tiền là 83000.
INSERT INTO HOADON(MAHD, MANV, MAKV, NGAYLAP, TONGTIEN) VALUES ('HD101', 'NV001', 'K01', '2024-02-12', 83000);

-- Câu 5: Viết câu lệnh thêm vào bảng CHITIET_HOADON các giá trị: mã hóa đơn là HD101, mã thức uống là TU10, số lượng là 1.
INSERT INTO CHITIET_HOADON (MATU, MAHD, SOLUONG) VALUES ('TU010', 'HD101', 1);

-- Câu 6: Viết câu lệnh thêm vào bảng PHIEUCHI có mã phiếu chi là PC51, mã nhân viên là NV5, nội dung chi là ‘rút doanh thu ngày’, ngày lập: 11/2/2024 và tổng tiền: 15000000.
INSERT INTO PHIEUCHI(MAPC, MANV, NOIDUNGCHI, NGAYLAP, TONGTIEN) VALUES ('PC50', 'NV005', 'rút doanh thu ngày', '2024-02-11', 15000000);

-- Câu 7: Viết câu lệnh thêm vào bảng PHIEUNHAP có mã phiếu nhập là PN55, mã nhân viên là NV3, mã nhà cung cấp là NCC1, ngày lập 12/1/2024 và tổng tiền là 1200000.
INSERT INTO PHIEUNHAP (MAPN, MANV, MANCC, NGAYLAP, TONGTIEN) VALUES ('PN55', 'NV003', 'NCC01', '2024-01-12', 1200000);

-- Câu 8: Viết câu lệnh thêm vào PHIEUPHUTHU có mã phiếu phụ thu PTT63, mã nhân viên là NV2, tên phiếu phụ thu là ‘Khách làm vỡ ly’, ngày lập 11/20/2024, số tiền phụ thu là 30000.
INSERT INTO PHIEUPHUTHU (MAPHIEUPT, MANV, TENPPT, NGAYLAP, SOTIEN) VALUES ('PTT63', 'NV002', N'Khách làm vỡ ly', '2024-11-20', 30000);

-- Câu 9: Viết câu lệnh sửa tất cả mã nhân viên trong bảng PHIEUPHUTHU thành 'NV2' trong duy nhất ngày 14/02/2024
UPDATE PHIEUPHUTHU
SET MANV = 'NV002'
WHERE NGAYLAP = '2024-02-14';

-- Câu 10: Viết câu lệnh sửa TENPPT của nhân viên có mã NV3 trong ngày 30/01/2024 thành 'Quay phim'.
UPDATE PHIEUPHUTHU
SET TENPPT = N'Quay phim'
WHERE MANV = 'NV003' AND NGAYLAP = '2024-01-30';

-- Câu 11: Tăng hệ số giá thêm 1 cho khu vực có nhiều người uống nhất.
UPDATE KHUVUC
SET HESOGIA = HESOGIA + 1
WHERE MAKV = (
    SELECT TOP 1 MAKV
    FROM HOADON
    GROUP BY MAKV
    ORDER BY COUNT(MAHD) DESC
);

-- Câu 12: Giảm 20% giá các thức uống không bán được trong tháng 1/2024.
UPDATE THUCUONG
SET DONGGIA = DONGGIA * 0.8
WHERE NOT EXISTS(
	SELECT MATU
	FROM CHITIET_HOADON JOIN HOADON ON HOADON.MAHD = CHITIET_HOADON.MAHD
	WHERE MONTH(NGAYLAP) = '1' AND YEAR(NGAYLAP) = '2024'
	);

-- Câu 13:. Tăng thêm 50% giá các thức uống bán chạy nhất.
UPDATE THUCUONG
SET DONGGIA = DONGGIA * 1.5
WHERE EXISTS(
	SELECT TOP 1 MATU, SUM(SOLUONG) AS SoLuongNhieuNhat
	FROM CHITIET_HOADON 
	GROUP BY MATU
	ORDER BY SUM(SOLUONG) DESC
);

-- Câu 14:. Viết câu lệnh xóa báo cáo của một nhân viên với MANV=NV5 vào ngày 31/01/2024.
DELETE FROM BAOCAO
WHERE MANV = 'NV005' AND NGAYLAP = '2024-01-31';

-- Câu 15:. Viết câu lệnh xóa phiếu phụ thu của nhân viên có mã là NV3 đã lập vào ngày 21/09/2023.
DELETE FROM PHIEUPHUTHU
WHERE MANV = 'NV003' AND NGAYLAP = '2023-09-21';

-- Câu 16:. Xuất ra danh sách các thức uống có loại là Tea (mã: tea)
SELECT *
FROM THUCUONG
WHERE MALOAI = 'TEA';

-- Câu 17: Xuất ra danh sách thức uống không chứa nguyên liệu sữa đặc.
SELECT MANL, TENNL
FROM NGUYENLIEU
WHERE MANL NOT IN (
    SELECT MANL
    FROM CHITIET_PHIEUNHAP
    WHERE TENNL = N'Sữa đặc'
);


-- Câu 18: Xuất ra danh sách những loại thức uống có giá thấp hơn 50 ngàn.
SELECT *
FROM THUCUONG
WHERE DONGGIA < 55000;

-- Câu 19: Hãy lọc ra những nguyên liệu được cung cấp bởi nhà cung cấp NCC1.
SELECT TENNCC
FROM NHACUNGCAP
WHERE MANCC = 'NCC01';

-- Câu 20: Viết câu lệnh thống kê toàn bộ những nhà cung cấp đang cung cấp hàng cho hệ thống.
SELECT * FROM NHACUNGCAP;

-- Câu 21: Hãy liệt kê danh sách nhân viên theo chi nhánh 1, 2, 3
SELECT NHANVIEN.MANV, NHANVIEN.TENNV, CHINHANH.TENCN FROM NHANVIEN
JOIN CHINHANH ON NHANVIEN.MACN = CHINHANH.MACN
WHERE CHINHANH.MACN IN ('N1', 'N2', 'N3');

-- Câu 22: Viết câu lệnh để liệt kê thức uống bán nhiều nhất.
SELECT TOP 1 TU.MATU, TU.TENTU, SUM(CTHD.SOLUONG) AS TONG_SOLUONG FROM THUCUONG TU
JOIN CHITIET_HOADON CTHD ON TU.MATU = CTHD.MATU
GROUP BY TU.MATU, TU.TENTU
ORDER BY TONG_SOLUONG DESC;

-- Câu 23: Viết câu lệnh tìm khu vực khách hàng chọn nhiều nhất. 
SELECT TOP 1 MAKV, COUNT(*) AS SOLAN_CHON FROM HOADON
GROUP BY MAKV
ORDER BY SOLAN_CHON;

-- Câu 24: Viết câu lệnh thống kê tổng chi theo từng quý.
SELECT 
    YEAR(NGAYLAP) AS NAM,
    CASE 
        WHEN MONTH(NGAYLAP) BETWEEN 1 AND 3 THEN 'Quý 1'
        WHEN MONTH(NGAYLAP) BETWEEN 4 AND 6 THEN 'Quý 2'
        WHEN MONTH(NGAYLAP) BETWEEN 7 AND 9 THEN 'Quý 3'
        ELSE 'Quý 4'
    END AS QUY,
    SUM(TONGTIEN) AS TONG_CHI
FROM 
    PHIEUCHI
GROUP BY 
    YEAR(NGAYLAP),
    CASE 
        WHEN MONTH(NGAYLAP) BETWEEN 1 AND 3 THEN 'Quý 1'
        WHEN MONTH(NGAYLAP) BETWEEN 4 AND 6 THEN 'Quý 2'
        WHEN MONTH(NGAYLAP) BETWEEN 7 AND 9 THEN 'Quý 3'
        ELSE 'Quý 4'
    END
ORDER BY 
    NAM,
    QUY;

-- Câu 25: Viết câu lệnh để thống kê tổng phụ thu.
SELECT SUM(TONGTIEN) AS TONGPHUTHU FROM HOADON;

-- Câu 26: Viết câu lệnh để tính doanh thu toàn hệ thống năm 2023.
SELECT SUM(TONGTIEN) AS DoanhThu
FROM HOADON
WHERE YEAR(NGAYLAP) = 2023;

-- Câu 27: Viết câu lệnh để tính doanh thu toàn hệ thống của quý 1 năm 2024.
SELECT SUM(TONGTIEN) AS DOANH_THU_QUY_1_2024 FROM HOADON
WHERE NGAYLAP BETWEEN '2024-01-01' AND '2024-03-31';

-- Câu 28: Tính lợi nhuận toàn hệ thống năm 2023.
SELECT SUM(HOADON.TONGTIEN) - SUM(PHIEUCHI.TONGTIEN) AS LOI_NHUAN_2023 FROM HOADON
LEFT JOIN PHIEUCHI ON HOADON.NGAYLAP BETWEEN '2023-01-01' AND '2023-12-31'
LEFT JOIN PHIEUNHAP ON PHIEUNHAP.NGAYLAP BETWEEN '2023-01-01' AND '2023-12-31';

-- Câu 29: Tính lợi nhuận theo từng chi nhánh.
SELECT CN.MACN, CN.TENCN, SUM(HD.TONGTIEN) - SUM(PC.TONGTIEN) AS LOINHUAN FROM CHINHANH CN
LEFT JOIN NHANVIEN NV ON CN.MACN = NV.MACN
LEFT JOIN HOADON HD ON HD.MANV = NV.MANV
LEFT JOIN PHIEUCHI PC ON NV.MANV = PC.MANV
GROUP BY CN.MACN, CN.TENCN
ORDER BY LOINHUAN DESC;

-- Câu 30: Thống kê số lượng tồn của tất cả các nguyên liệu còn dưới mức quy định.
SELECT *
FROM NguyenLieu
WHERE SoLuong < 100;

-- Câu 31: Liệt kê loại nguyên liệu được sử dụng nhiều nhất.
SELECT TOP 1 NL.MANL, NL.TENNL, SUM(CT.SOLUONG) AS TONG_SOLUONG
FROM NguyenLieu NL
JOIN CongThuc CT ON NL.MANL = CT.MANL
GROUP BY NL.MANL, NL.TENNL
ORDER BY TONG_SOLUONG DESC;

-- Câu 32: Hãy viết thủ tục thêm một nhân viên mới vào bảng NHANVIEN với tham số truyền
--vào là mã nhân viên, tên nhân viên, mã chức chức vụ, mã chi nhánh, giới tính, ngày
--vào, ngày nghĩ (có thể null). Kiểm tra ngày vào phải lớn hơn ngày thành lập hệ thống
--(01/01/2020) và ràng buộc tồn tại các mã chức vụ, mã chi nhánh.
GO
CREATE PROC ThemNhanVien(
    @p_MANV CHAR(5),
    @p_TENNV NVARCHAR(100),
    @p_MACV CHAR(3),
    @p_MACN CHAR(3),
    @p_GIOITINH BIT,
    @p_NGAYVAO DATE,
    @p_NGAYNGHI DATE
)
AS
BEGIN
    DECLARE @system_start_date DATE;
    
    SET @system_start_date = '2020-01-01';
    
    IF @p_NGAYVAO <= @system_start_date 
    BEGIN
        THROW 50000, 'Ngày vào phải lớn hơn ngày thành lập hệ thống (01/01/2020)', 1;
    END;
    
    IF NOT EXISTS (SELECT 1 FROM CHUCVU WHERE MACV = @p_MACV) 
    BEGIN
        THROW 50000, 'Mã chức vụ không tồn tại', 1;
    END;
    
    IF NOT EXISTS (SELECT 1 FROM CHINHANH WHERE MACN = @p_MACN) 
    BEGIN
        THROW 50000, 'Mã chi nhánh không tồn tại', 1;
    END;
    
    INSERT INTO NHANVIEN (MANV, TENNV, MACV, MACN, GIOITINH, NGAYVAO, NGAYNGHI)
    VALUES (@p_MANV, @p_TENNV, @p_MACV, @p_MACN, @p_GIOITINH, @p_NGAYVAO, @p_NGAYNGHI);
    
END
GO

EXEC ThemNhanVien 'NV021', N'Nguyễn Ngọc Hải', 'NV', 'N9', 1, '2024-04-13', NULL;

-- Câu 33: Viết thủ tục thêm một thức uống vào bảng THUCUONG với tham số truyền vào là
--mã thức uống, mã loại thức uống, tên thức uống, đơn giá. Kiểm tra tham số vào
--(kiểm tra tồn tại mã loại thức uống).
GO
CREATE PROC ThemThucUong(
    @MATU CHAR(5),
    @MALOAI CHAR(10),
    @TENTU NVARCHAR(100),
    @DONGGIA DECIMAL(18,0)
)
AS
BEGIN
    DECLARE @v_Count INT;

    SELECT @v_Count = COUNT(*) FROM LOAITHUCUONG WHERE MALOAI = @MALOAI;

    IF @v_Count = 0
    BEGIN
        RAISERROR('Mã loại thức uống không tồn tại', 16, 1);
        RETURN;
    END;

    INSERT INTO THUCUONG (MATU, MALOAI, TENTU, DONGGIA)
    VALUES (@MATU, @MALOAI, @TENTU, @DONGGIA);
END;
GO

EXEC ThemThucUong 'TU011', 'MILK', N'Trà sữa', 25000;

-- Câu 34: Viết thủ tục thêm mới một loại thức uống mới vào bảng LOAITHUCUONG với
--tham số truyền vào là mã loại, tên loại thức uống.
GO
CREATE PROC ThemLoaiThucUong(
    @MALOAI CHAR(10),
    @TENLOAI NVARCHAR(100)
)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM LOAITHUCUONG WHERE MALOAI = @MALOAI)
    BEGIN
        INSERT INTO LOAITHUCUONG (MALOAI, TENLOAI)
        VALUES (@MALOAI, @TENLOAI);
    END
    ELSE
    BEGIN
        THROW 51000, 'Mã loại thức uống đã tồn tại', 1;
    END;
END;
GO

EXEC ThemLoaiThucUong 'MILK TEA', N'Loại 11';

-- Câu 35: Viết thủ tục thêm mới một nguyên vào bảng NGUYENLIEU với tham số đầu vào
--là mã nguyên liệu, tên nguyên liệu, số lượng, đơn vị.
GO
CREATE PROC ThemNguyenLieu(
    @MANL CHAR(10),
    @TENNL NVARCHAR(100),
    @SOLUONG FLOAT,
    @DONVI NVARCHAR(25)
)
AS
BEGIN
    INSERT INTO NGUYENLIEU (MANL, TENNL, SOLUONG, DONVI)
    VALUES (@MANL, @TENNL, @SOLUONG, @DONVI);
END;
GO

EXEC ThemNguyenLieu 'NL011', N'Bột sữa', '130', 'kg';

-- Câu 36: Viết thủ tục để cập nhật thông tin của một thức uống trong bảng THUCUONG với
--tham số đầu vào là mã thức uống, mã loại thức uống, tên thức uống, đơn giá. Kiểm
--tra ràng buộc tồn tại thức uống và mã loại thức uống.
GO
CREATE PROC CapNhatThucUong(
    @MATU CHAR(5),
    @MALOAI CHAR(10),
    @TENTU NVARCHAR(100),
    @DONGGIA DECIMAL
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM THUCUONG WHERE MATU = @MATU)
    BEGIN
        IF EXISTS (SELECT 1 FROM LOAITHUCUONG WHERE MALOAI = @MALOAI)
        BEGIN
            UPDATE THUCUONG
            SET MALOAI = @MALOAI,
                TENTU = @TENTU,
                DONGGIA = @DONGGIA
            WHERE MATU = @MATU;
            PRINT N'Thông tin thức uống đã được cập nhật thành công.';
        END
        ELSE
        BEGIN
            PRINT N'Mã loại thức uống không tồn tại.';
        END
    END
    ELSE
    BEGIN
        PRINT N'Mã thức uống không tồn tại.';
    END
END;
GO

EXEC CapNhatThucUong 'TU011', N'MILK TEA', N'Trà Sữa', '30000';

-- Câu 37: Viết thủ tục liệt kê các thức uống thuộc một loại thức uống bất kì, với tham số truyền
--vào là tên loại. Kiểm tra ràng buộc tồn tại tên loại.
GO
CREATE PROC LietKeThucUongTheoLoai(
    @TENLOAI NVARCHAR(100)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM LOAITHUCUONG WHERE TENLOAI = @TENLOAI)
    BEGIN
        SELECT TU.MATU, TU.TENTU, TU.DONGGIA
        FROM THUCUONG TU
        INNER JOIN LOAITHUCUONG LTU ON TU.MALOAI = LTU.MALOAI
        WHERE LTU.TENLOAI = @TENLOAI;
    END
    ELSE
    BEGIN
        PRINT N'Tên loại thức uống không tồn tại.';
    END
END;
GO

EXEC LietKeThucUongTheoLoai N'Loại 01';

-- Câu 38: Viết thủ tục liệt kê thông tin tất cả các nguyên liệu (tên nguyên liệu, số lượng tồn
--kho, đơn vị) của một thức uống bất kì, với tham số truyền vào là tên thức uống. Kiểm
--tra ràng buộc tồn tại tên thức uống.
GO
CREATE PROCEDURE LietKeNguyenLieuTheoThucUong
    @TENTU NVARCHAR(100)
AS
BEGIN
    DECLARE @MATU CHAR(5);

    SELECT @MATU = MATU
    FROM THUCUONG
    WHERE TENTU = @TENTU;

    IF @MATU IS NULL
    BEGIN
        PRINT N'Không tìm thấy thức uống với tên đã nhập.';
    END
    ELSE
    BEGIN
        SELECT NL.TENNL AS TenNguyenLieu, CONG.SOLUONG AS SoLuongTonKho, NL.DONVI AS DonVi
        FROM CONGTHUC AS CONG
        JOIN NGUYENLIEU AS NL ON CONG.MANL = NL.MANL
        WHERE CONG.MATU = @MATU;
    END
END;
GO

EXEC LietKeNguyenLieuTheoThucUong N'Cà phê';

-- Câu 39: Viết thủ tục dùng để tìm những thức uống không bán được của chi nhánh bất kì trong
--khoảng thời gian nào đó. Với tham số đầu vào là tên chi nhánh, thời gian bắt đầu và
--thời gian kết thúc.
GO
CREATE PROC TimThucUongKhongBanDuoc (
    @TenChiNhanh NVARCHAR(100),
    @ThoiGianBatDau DATETIME,
    @ThoiGianKetThuc DATETIME
)
AS
BEGIN
    SELECT TU.TENTU AS 'Tên Thức Uống', SUM(ISNULL(CH.SOLUONG, 0)) AS 'Số Lượng Bán Được'
    FROM THUCUONG TU
    LEFT JOIN CHITIET_HOADON CH ON TU.MATU = CH.MATU
    LEFT JOIN HOADON HD ON CH.MAHD = HD.MAHD
    LEFT JOIN NHANVIEN NV ON HD.MANV = NV.MANV
    LEFT JOIN CHINHANH ON NV.MACN = CHINHANH.MACN
    WHERE CHINHANH.TENCN = @TenChiNhanh AND HD.NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc
    GROUP BY TU.TENTU
    HAVING SUM(ISNULL(CH.SOLUONG, 0)) = 0;
END;
GO

EXEC TimThucUongKhongBanDuoc 
    @TenChiNhanh = N'Công ty TNHH Ánh Dương', 
    @ThoiGianBatDau = '2023-01-01', 
    @ThoiGianKetThuc = '2024-12-31';

-- Câu 40: Viết thủ tục liệt kê tên các nguyên liệu của một nhà cung cấp bất kì, với tham số đầu
--vào là tên nhà cung cấp, kiểm tra ràng buộc tồn tại tên nhà cung cấp.
GO
CREATE PROC LietKeNguyenLieuCuaNhaCungCap (
    @TenNhaCungCap NVARCHAR(100)
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM NhaCungCap WHERE TENNCC = @TenNhaCungCap)
    BEGIN
        PRINT N'Tên nhà cung cấp không tồn tại.'
        RETURN;
    END

	SELECT NL.TENNL
    FROM NGUYENLIEU NL
    INNER JOIN CHITIET_PHIEUNHAP CP ON NL.MANL = CP.MANL
    INNER JOIN PHIEUNHAP PN ON CP.MAPN = PN.MAPN
    INNER JOIN NHACUNGCAP NCC ON PN.MANCC = NCC.MANCC
    WHERE NCC.TENNCC = @TenNhaCungCap
END;
GO

EXEC LietKeNguyenLieuCuaNhaCungCap N'Cafe';

-- Câu 41: Viết thủ tục tăng giá của một thức uống bất kì với tham số truyền vào là tên thức
--uống và hệ số giá. Điều kiện tên thức uống tồn tại và hệ số tăng giá phải nhỏ hơn 1
--đồng thời không nhỏ hơn -0.5.
GO
CREATE PROC TangGiaThucUong (
    @TenThucUong NVARCHAR(100),
    @HeSoGia DECIMAL(5,2)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM THUCUONG WHERE TENTU = @TenThucUong) AND @HeSoGia < 1 AND @HeSoGia >= -0.5
    BEGIN
        UPDATE THUCUONG
        SET DONGGIA = DONGGIA * (1 + @HeSoGia)
        WHERE TENTU = @TenThucUong;
        
        PRINT N'Đã tăng giá cho thức uống ' + @TenThucUong + N' thành công.';
    END
    ELSE
    BEGIN
        PRINT N'Tên thức uống không tồn tại hoặc hệ số tăng giá không hợp lệ.';
    END
END
GO

EXEC TangGiaThucUong N'Trà đá', 0.1;

-- Câu 42: Viết thủ tục tính tổng tiền phụ thu của một chi nhánh bất kì trong thời gian bất kì.
--Với tham số truyền vào là tên chi nhánh, thời gian bắt đầu và thời gian kết thúc. Điều
--kiện ràng buộc thời gian bắt đầu phải trước thời gian kết thúc.
GO
CREATE PROC TinhTongTienPhuThu (
    @TenChiNhanh NVARCHAR(100),
    @ThoiGianBatDau DATETIME,
    @ThoiGianKetThuc DATETIME
)
AS
BEGIN
    IF @ThoiGianBatDau >= @ThoiGianKetThuc
    BEGIN
        PRINT 'Thời gian bắt đầu phải trước thời gian kết thúc.';
        RETURN;
    END

    DECLARE @TongTienPhuThu DECIMAL(18, 2);

    SELECT @TongTienPhuThu = SUM(SOTIEN)
    FROM PHIEUPHUTHU
    WHERE MANV IN (
        SELECT MANV
        FROM NHANVIEN
        WHERE MACN = (SELECT MACN FROM CHINHANH WHERE TENCN = @TenChiNhanh)
    )
    AND NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc;

    SELECT @TongTienPhuThu AS TongTienPhuThu;
END;
GO

EXEC TinhTongTienPhuThu N'Công ty TNHH Minh Anh', '2023-01-01', '2024-12-31';

-- Câu 43: Viết thủ tục tính lợi nhuận của hệ thống trong khoảng thời gian bất kì. Với tham số
--đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng lợi nhuận của
--hệ thống (lợi nhuận = tổng doanh thu - tổng chi).
GO
CREATE PROC TinhLoiNhuan (
    @ThoiGianBatDau DATETIME,
    @ThoiGianKetThuc DATETIME
)
AS
BEGIN
    DECLARE @LoiNhuan DECIMAL(18, 2);

    DECLARE @TongDoanhThu DECIMAL(18, 2);
    SELECT @TongDoanhThu = SUM(TONGTIEN)
    FROM HOADON
    WHERE NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc;

    DECLARE @TongChi DECIMAL(18, 2);
    SELECT @TongChi = SUM(TONGTIEN)
    FROM PHIEUCHI
    WHERE NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc;

    SET @LoiNhuan = @TongDoanhThu - @TongChi;

    SELECT @LoiNhuan AS LoiNhuan;
END;
GO

EXEC TinhLoiNhuan '2024-01-01', '2024-12-31';

-- Câu 44: Viết thủ tục tìm thức uống bán chạy nhất của chi nhánh bất kì trong khoảng thời gian
--bất kì, với tham số truyền vào là tên chi nhánh, thời gian bắt đầu và thời gian kết
--thúc. Điều kiện thời gian bắt đầu trước thời gian kết thúc.
GO
CREATE PROCEDURE TimThucUongBanChayNhat(
    @TenChiNhanh NVARCHAR(100),
    @ThoiGianBatDau DATETIME,
    @ThoiGianKetThuc DATETIME
)
AS
BEGIN
    SELECT TOP 1 TU.TENTU AS [ThucUong], SUM(CTHD.SOLUONG) AS [SoLuongBan]
    FROM CHITIET_HOADON CTHD
    INNER JOIN THUCUONG TU ON CTHD.MATU = TU.MATU
    INNER JOIN HOADON HD ON CTHD.MAHD = HD.MAHD
    INNER JOIN NHANVIEN NV ON NV.MANV = HD.MANV
	INNER JOIN CHINHANH CN ON CN.MACN = NV.MACN
    WHERE CN.TENCN = @TenChiNhanh AND HD.NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc
    GROUP BY TU.TENTU
    ORDER BY SUM(CTHD.SOLUONG) DESC;
END;
GO

EXEC TimThucUongBanChayNhat N'Công ty TNHH Thành Cong', '2023-01-01', '2024-12-31';

-- Câu 45: Viết thủ tục tính tổng số tiền doanh thu của hệ thống trong một ngày bất kì với tham
--số đầu vào là ngày và tham số đầu ra là tổng doanh thu của ngày đó.
GO
CREATE PROC TinhTongDoanhThuTrongMotNgay
    @NgayLap DATETIME,
    @TongDoanhThu DECIMAL OUTPUT
AS
BEGIN
    SET @TongDoanhThu = (
        SELECT ISNULL(SUM(H.TONGTIEN), 0)
        FROM HOADON H
        WHERE CONVERT(DATE, H.NGAYLAP) = CONVERT(DATE, @NgayLap)
    );
END;
GO

DECLARE @NgayLap DATETIME = '2023-03-04';
DECLARE @TongDoanhThu DECIMAL;

EXEC TinhTongDoanhThuTrongMotNgay @NgayLap, @TongDoanhThu OUTPUT;

SELECT @TongDoanhThu AS 'TongDoanhThu';


-- Câu 46: Viết thủ tục tìm thức uống bán chạy nhất của hệ thống trong khoảng thời gian bất kì,
--với tham số truyền vào là thời gian bắt đầu và thời gian kết thúc. Điều kiện thời gian
--bắt đầu trước thời gian kết thúc.
GO
CREATE PROC TimThucUong_BanChayNhat
    @ThoiGianBatDau DATETIME,
    @ThoiGianKetThuc DATETIME
AS
BEGIN
    SELECT TOP 1 TU.TENTU AS ThucUongBanChayNhat, SUM(CH.SOLUONG) AS SoLuongBan
    FROM CHITIET_HOADON CH
    INNER JOIN THUCUONG TU ON CH.MATU = TU.MATU
    INNER JOIN HOADON H ON CH.MAHD = H.MAHD
    WHERE H.NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc
    GROUP BY TU.TENTU
    ORDER BY SUM(CH.SOLUONG) DESC;
END;
GO

EXEC TimThucUong_BanChayNhat '2023-01-01', '2024-12-31';

-- Câu 47: Viết thủ tục liệt kê các loại nguyên liệu (tên, số lượng tồn, đơn vị) của một phiếu
--nhập bất kì, với tham số đầu vào là mã phiếu nhập.
GO
CREATE PROC LietKeNguyenLieuTheoPhieuNhap
    @MaPhieuNhap CHAR(10)
AS
BEGIN
    SELECT NL.TENNL AS TenNguyenLieu, PN.SOLUONG AS SoLuongTon, NL.DONVI AS DonVi
    FROM CHITIET_PHIEUNHAP PN
    INNER JOIN NGUYENLIEU NL ON PN.MANL = NL.MANL
    WHERE PN.MAPN = @MaPhieuNhap;
END;
GO

EXEC LietKeNguyenLieuTheoPhieuNhap 'PN54'

-- Câu 48: Viết thủ tục tính tổng doanh thu của hệ thống trong khoảng thời gian bất kì. Với
--tham số đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng
--doanh thu của hệ thống (doanh thu= tổng tiền hóa đơn + tổng tiền phụ thu).
GO
CREATE PROC TongDoanhThu 
    @NgayBatDau DATETIME,
    @NgayKetThuc DATETIME,
    @TongDoanhThu DECIMAL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TongDoanhThuHoaDon DECIMAL;
    SELECT @TongDoanhThuHoaDon = ISNULL(SUM(TONGTIEN), 0)
    FROM HOADON
    WHERE NGAYLAP BETWEEN @NgayBatDau AND @NgayKetThuc;

    DECLARE @TongDoanhThuPhuThu DECIMAL;
    SELECT @TongDoanhThuPhuThu = ISNULL(SUM(SOTIEN), 0)
    FROM PHIEUPHUTHU
    WHERE NGAYLAP BETWEEN @NgayBatDau AND @NgayKetThuc;

    SET @TongDoanhThu = @TongDoanhThuHoaDon + @TongDoanhThuPhuThu;
END;
GO

DECLARE @NgayBatDau DATETIME = '2023-01-01';
DECLARE @NgayKetThuc DATETIME = '2024-12-31';
DECLARE @TongDoanhThu DECIMAL;

EXEC TongDoanhThu @NgayBatDau, @NgayKetThuc, @TongDoanhThu OUTPUT;

SELECT @TongDoanhThu AS 'TongDoanhThu';


-- Câu 49: Viết thủ tục tính tổng chi tiêu của hệ thống trong khoảng thời gian bất kì. Với tham
--số đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng tiền chi
--của hệ thống (tổng chi= tổng tiền phiếu nhập + tổng tiền phiếu chi).
GO
CREATE PROC TongChiTieu
    @ThoiGianBatDau DATETIME,
    @ThoiGianKetThuc DATETIME
AS
BEGIN
    DECLARE @TongChi DECIMAL(18, 2);

    SELECT @TongChi = ISNULL(SUM(TongTien), 0)
    FROM PhieuNhap PN
    WHERE PN.NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc;

    SELECT @TongChi = @TongChi + ISNULL(SUM(TongTien), 0)
    FROM PhieuChi PC
    WHERE PC.NGAYLAP BETWEEN @ThoiGianBatDau AND @ThoiGianKetThuc;

    SELECT @TongChi AS TongChiTieu;
END;

EXEC TongChiTieu '2024-01-01', '2024-12-31';

-- Câu 50: Viết một thủ tục với tùy chọn ‘with encryption’, mã hóa không cho người dùng xem
--được nội dung của thủ tục.
GO
CREATE PROC sp_EncryptedProcedure
WITH ENCRYPTION
AS
BEGIN
    PRINT N'Ai biết ghi gì đâu ;-;;';
END;
GO

EXEC sp_EncryptedProcedure;

-- Câu 51: Viết Trigger bắt lỗi cho lệnh Insert vào bảng CHITIET_HOADON. Khi thêm chi
--tiết hóa đơn thì kiểm tra trùng mã, kiểm tra nhập số lượng âm, thông báo không đủ
--nguyên liệu nếu hết và phải giảm số lượng tồn của nguyên liệu nếu thỏa các điều
--kiện còn lại.
GO
CREATE TRIGGER trg_ChiTietHoaDon
ON CHITIET_HOADON
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MATHANG_ID INT;
    DECLARE @SOLUONG INT;
    DECLARE @SOLUONG_TON INT;

    IF EXISTS (SELECT 1 FROM inserted WHERE inserted.MATU IN (SELECT MATU FROM CHITIET_HOADON))
    BEGIN
        RAISERROR (N'Mã tồn tại trong chi tiết hóa đơn.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM inserted WHERE inserted.SOLUONG <= 0)
    BEGIN
        RAISERROR (N'Số lượng phải lớn hơn 0.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    SELECT @MATHANG_ID = MATU, @SOLUONG = SOLUONG
    FROM inserted;

    SELECT @SOLUONG_TON = SOLUONG
    FROM NGUYENLIEU
    WHERE MANL = @MATHANG_ID;

    IF @SOLUONG_TON < @SOLUONG
    BEGIN
        RAISERROR (N'Không đủ nguyên liệu để thêm vào chi tiết hóa đơn.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    UPDATE NGUYENLIEU
    SET SOLUONG = SOLUONG - @SOLUONG
    WHERE MANL = @MATHANG_ID;

    INSERT INTO CHITIET_HOADON (MATU, MAHD, SOLUONG)
    SELECT MATU, MAHD, SOLUONG
    FROM inserted;
END;
GO

-- Câu 52: Viết Trigger bắt lỗi cho lệnh Update vào bảng CHITIET_HOADON. Khi sửa số
--lượng thức uống trong chi tiết hóa đơn thì phải sửa số lượng tồn của nguyên liệu.
GO
CREATE TRIGGER cap_nhat_so_luong_nguyen_lieu
ON CHITIET_HOADON
AFTER INSERT, UPDATE
AS
	DECLARE
		@soLuongTonCu INT,
		@soLuongTonMoi INT;
	BEGIN
	-- Lấy số lượng tồn của nguyên liệu trước khi cập nhật
	SELECT SOLUONG AS so_luong_ton_cu
	FROM NGUYENLIEU
	WHERE SOLUONG = @soLuongTonCu;

	-- Kiểm tra xem số lượng tồn mới có âm không
	IF @soLuongTonMoi < 0
		PRINT('Không đủ nguyên liệu.');

	-- Cập nhật số lượng tồn của nguyên liệu
	UPDATE NGUYENLIEU
	SET SOLUONG = @soLuongTonMoi
	WHERE MANL = @soLuongTonCu;
END
GO

--53.Viết Trigger bắt lỗi cho lệnh Delete vào bảng CHITIET_HOADON. Khi xóa chi tiết hóa đơn thì phải tăng số lượng tồn của nguyên liệu kiểm tra nếu xóa hết mã hóa đơn đó thì xóa lun bên bảng hóa đơn.
GO
CREATE TRIGGER Trg_Delete_CHITIET_HOADON
ON CHITIET_HOADON
AFTER DELETE
AS
BEGIN
    DECLARE @MATU NVARCHAR(10);
    DECLARE @SOLUONG INT;
    DECLARE @MAHD NVARCHAR(10);

    SELECT @MATU = DELETED.MATU, @SOLUONG = DELETED.SOLUONG, @MAHD = DELETED.MAHD
    FROM DELETED;

    UPDATE NGUYENLIEU
    SET SOLUONG = SOLUONG + @SOLUONG
    WHERE MANL = @MATU;

    IF NOT EXISTS (SELECT 1 FROM CHITIET_HOADON WHERE MAHD = @MAHD)
    BEGIN
        DELETE FROM HOADON WHERE MAHD = @MAHD;
    END
END;
GO

--54.Viết Trigger bắt lỗi cho lệnh Insert vào bảng CHITIET_PHIEUNHAP. Khi thêm chi tiết nhập thì kiểm tra trùng mã, bắt không được nhập số âm phải tăng số lượng tồn của nguyên liệu (nhập hàng).
GO
CREATE TRIGGER Trg_Insert_CHITIET_PHIEUNHAP
ON CHITIET_PHIEUNHAP
AFTER INSERT
AS
BEGIN
    DECLARE @MATU NVARCHAR(10);
    DECLARE @SOLUONG INT;

    SELECT @MATU = MATU, @SOLUONG = SOLUONG
    FROM CHITIET_HOADON;

    IF EXISTS (SELECT 1 FROM CHITIET_HOADON WHERE MATU = @MATU)
    BEGIN
        PRINT(N'Mã thức uống đã tồn tại trong chi tiết phiếu nhập.');
        ROLLBACK;
        RETURN;
    END

    -- Kiểm tra số lượng âm
    IF @SOLUONG < 0
    BEGIN
        PRINT(N'Số lượng không được âm.');
        ROLLBACK;
        RETURN;
    END

    UPDATE NGUYENLIEU
    SET SOLUONG = SOLUONG + @SOLUONG
    WHERE MANL = @MATU;
END;
GO


--55.Viết Trigger bắt lỗi cho lệnh Update vào bảng CHITIET_PHIEUNHAP. Khi sửa số lượng nguyên liệu trong chi tiết phiếu nhập thì: không được sửa số âm, phải sửa số lượng tồn của nguyên liệu.
GO
CREATE TRIGGER Trg_Update_CHITIET_PHIEUNHAP
ON CHITIET_PHIEUNHAP
AFTER UPDATE
AS
BEGIN
    DECLARE @MATU NVARCHAR(10);
    DECLARE @SOLUONG INT;
    DECLARE @OLD_SOLUONG INT;

    SELECT @MATU = MATU, @SOLUONG = NGUYENLIEU.SOLUONG, @OLD_SOLUONG = CONGTHUC.SOLUONG
    FROM NGUYENLIEU
    JOIN CONGTHUC ON CONGTHUC.MANL = NGUYENLIEU.MANL;

    IF @SOLUONG < 0
    BEGIN
        PRINT(N'Số lượng không được âm.');
        ROLLBACK;
        RETURN;
    END

    UPDATE NGUYENLIEU
    SET SOLUONG = SOLUONG - @OLD_SOLUONG + @SOLUONG
    WHERE MANL = @MATU;
END;
GO

--56.Viết Trigger bắt lỗi cho lệnh Delete vào bảng CHITIET_PHIEUNHAP. Khi xóa chi tiết nhập thì phải giảm số lượng tồn của nguyên liệu, kiểm tra chi tiết phiếu nhập của Mã phiếu nhập vừa xóa còn trong bảng chi tiết phiếu nhập hay không, nếu không thì xóa phiếu nhập đó bên bảng PHIEUNHAP.
GO
CREATE TRIGGER Trg_Delete_CHITIET_PHIEUNHAP
ON CHITIET_PHIEUNHAP
AFTER DELETE
AS
BEGIN
    DECLARE @MATU NVARCHAR(10);
    DECLARE @SOLUONG INT;
    DECLARE @MAHD NVARCHAR(10);

    SELECT @MATU = MATU, @SOLUONG = SOLUONG, @MAHD = MAHD
    FROM CHITIET_HOADON;

    -- Giảm số lượng tồn của nguyên liệu
    UPDATE NGUYENLIEU
    SET SOLUONG = SOLUONG - @SOLUONG
    WHERE MANL = @MATU;

    -- Kiểm tra nếu xóa hết mã hóa đơn thì xóa luôn bên bảng PHIEUNHAP
    IF NOT EXISTS (SELECT 1 FROM CHITIET_HOADON WHERE MAHD = @MAHD)
    BEGIN
        DELETE FROM PHIEUNHAP WHERE MAPN = @MAHD;
    END
END;
GO

--57.Viết Trigger cho lệnh Delete của bảng NHANVIEN. Khi xóa nhân viên thì tự động xóa các bảng có liên quan ( chỉ xóa nhân viên đã nghĩ hơn 12 tháng).
GO
CREATE TRIGGER Trg_Delete_NHANVIEN
ON NHANVIEN
AFTER DELETE
AS
BEGIN
    DECLARE @MANV NVARCHAR(10);
    DECLARE @NGAYNGHI DATE;

    SELECT @MANV = DELETED.MANV, @NGAYNGHI = DELETED.NGAYNGHI
    FROM DELETED;

    -- Kiểm tra nếu nhân viên đã nghỉ hơn 12 tháng thì xóa các bảng liên quan
    IF DATEDIFF(MONTH, @NGAYNGHI, GETDATE()) >= 12
    BEGIN
        DELETE FROM BAOCAO WHERE MANV = @MANV;
		DELETE FROM HOADON WHERE MANV = @MANV;
		DELETE FROM PHIEUPHUTHU WHERE MANV = @MANV;
        DELETE FROM PHIEUCHI WHERE MANV = @MANV;
         DELETE FROM PHIEUNHAP WHERE MANV = @MANV;
    END
END;
GO

--58.Viết Trigger bắt lỗi tuổi nhân viên khi Insert và khi Update bảng NHANVIEN. Điều kiện nhân viên phải trên 18 tuổi.
GO
CREATE TRIGGER Trg_Check_Age_NHANVIEN
ON NHANVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra tuổi của nhân viên
    IF EXISTS (SELECT 1 FROM INSERTED WHERE DATEDIFF(YEAR, NGAYSINH, GETDATE()) < 18)
    BEGIN
        PRINT('Nhân viên phải trên 18 tuổi.');
        ROLLBACK;
        RETURN;
    END
END;
GO

--59.Viết Trigger bắt lỗi dữ liệu không âm cho các trường số lượng , tổng tiền,.. (kiểu số) có các bảng dữ liệu.
GO
CREATE TRIGGER trg_CheckNonNegativeValues
ON HOADON
FOR INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra số lượng không âm
    IF EXISTS (SELECT 1 FROM CHITIET_HOADON WHERE SOLUONG < 0)
    BEGIN
        PRINT (N'Số lượng không thể âm.');
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Kiểm tra tổng tiền không âm
    IF EXISTS (SELECT 1 FROM HOADON WHERE TONGTIEN < 0)
    BEGIN
        PRINT (N'Tổng tiền không thể âm.');
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO

--60.Hệ thống có 4 nhóm quyền: BANHANG, KIEMKHO, QUANLY, GIAMDOC. Hãy phân quyền cho từng nhóm này theo mô tả ở Phần II.
CREATE ROLE BANHANG;
CREATE ROLE GIAMDOC;
CREATE ROLE KIEMKHO;
CREATE ROLE QUANLY;

GRANT SELECT, INSERT ON HOADON TO BANHANG;
GRANT SELECT, INSERT ON CHITIET_HOADON TO BANHANG;
GRANT SELECT, INSERT ON PHIEUPHUTHU TO BANHANG;
GRANT SELECT, INSERT ON PHIEUCHI TO BANHANG;
GRANT SELECT ON LOAITHUCUONG TO BANHANG;
GRANT SELECT ON THUCUONG TO BANHANG;
GRANT SELECT ON NGUYENLIEU TO BANHANG;
GRANT SELECT ON KHUVUC TO BANHANG;
GRANT SELECT ON CHINHANH TO BANHANG;
GRANT SELECT ON CONGTHUC TO BANHANG;

GRANT SELECT ON PHIEUNHAP TO KIEMKHO;
GRANT SELECT ON CHITIET_PHIEUNHAP TO KIEMKHO;
GRANT SELECT ON NGUYENLIEU TO KIEMKHO;

GRANT SELECT, INSERT, ALTER ON NHANVIEN TO QUANLY;
GRANT SELECT, INSERT, ALTER ON BAOCAO TO QUANLY;
GRANT SELECT, INSERT, ALTER ON CONGTHUC TO QUANLY;
GRANT SELECT, INSERT, ALTER ON KHUVUC TO QUANLY;
GRANT SELECT, INSERT, ALTER ON CHINHANH TO QUANLY;
GRANT SELECT, INSERT, ALTER ON LOAITHUCUONG TO QUANLY;
GRANT SELECT, INSERT, ALTER ON NHACUNGCAP TO QUANLY;
GRANT SELECT, INSERT ON HOADON TO QUANLY;
GRANT SELECT, INSERT ON CHITIET_HOADON TO QUANLY;
GRANT SELECT, INSERT ON PHIEUPHUTHU TO QUANLY;
GRANT SELECT, INSERT ON PHIEUNHAP TO QUANLY;
GRANT SELECT, INSERT ON CHITIET_PHIEUNHAP TO QUANLY;
GRANT SELECT, INSERT ON PHIEUCHI TO QUANLY;
GRANT SELECT, INSERT ON THUCUONG TO QUANLY;
GRANT SELECT ON CHUCVU TO QUANLY;

GRANT EXECUTE TO GIAMDOC;