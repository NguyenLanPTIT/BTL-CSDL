CREATE TABLE NhanVien(
ID_NhanVien VARCHAR(25),
HoTen VARCHAR(255),
NgaySinh DATE,
GioiTinh VARCHAR(255),
DanToc VARCHAR(255),
CCCD VARCHAR(255),
SoDienThoai VARCHAR(255),
Email VARCHAR(255),	
DiaChi VARCHAR(255),
PRIMARY KEY(ID_NhanVien)
);

CREATE TABLE DocGia(
ID_DocGia VARCHAR(25),
HoTen VARCHAR(255),
NgaySinh DATE,
GioiTinh VARCHAR(255),
DanToc VARCHAR(255),
CCCD VARCHAR(255),
SoDienThoai VARCHAR(255),
Email VARCHAR(255),	
DiaChi VARCHAR(255)
PRIMARY KEY(ID_DocGia)
);

CREATE TABLE Loi(
ID_Loi VARCHAR(25),
ID_NhanVien VARCHAR(25),
ID_DocGia VARCHAR(25),
TenLoi VARCHAR(255),
NgayPhat DATE,
TienPhat INT,
PRIMARY KEY(ID_Loi),
FOREIGN KEY(ID_NhanVien) REFERENCES NhanVien(ID_NhanVien),
FOREIGN KEY(ID_DocGia) REFERENCES DocGia(ID_DocGia)
);

CREATE TABLE LePhi(
ID_LePhi VARCHAR(25),
TenLePhi VARCHAR(255),
TienLePhi INT,
PRIMARY KEY(ID_LePhi)
);

CREATE TABLE ThuPhi(
ID_ThuPhi VARCHAR(25),
ID_NhanVien VARCHAR(25),
ID_DocGia VARCHAR(25),	
ID_LePhi VARCHAR(25),
NgayThu DATE,
PRIMARY KEY(ID_ThuPhi),
FOREIGN KEY(ID_NhanVien) REFERENCES NhanVien(ID_NhanVien),
FOREIGN KEY(ID_DocGia) REFERENCES DocGia(ID_DocGia),
FOREIGN KEY(ID_LePhi) REFERENCES LePhi(ID_LePhi)
);

CREATE TABLE DauSach(
ID_DauSach VARCHAR(25) PRIMARY KEY,
TenDauSach VARCHAR(255),
GiaTien INTEGER,
TheLoai VARCHAR(255),
SoTrang INTEGER
);

CREATE TABLE NhapSach(
ID_NhapSach VARCHAR(25) PRIMARY KEY,
ID_NhanVien VARCHAR(25) REFERENCES NhanVien(ID_NhanVien) ON UPDATE CASCADE,
ID_DauSach VARCHAR(25) REFERENCES DauSach(ID_DauSach) ON UPDATE CASCADE,
NgayNhap DATE,
SoLuong INTEGER
);

CREATE TABLE DichGia(
ID_DichGia VARCHAR(25) PRIMARY KEY,
ID_DauSach VARCHAR(25) REFERENCES DauSach(ID_DauSach) ON UPDATE CASCADE,
HoTen VARCHAR(255),
NgaySinh DATE,
GioiTinh VARCHAR(255),
DanToc VARCHAR(255),
CCCD VARCHAR(255),
SoDienThoai VARCHAR(255),
Email VARCHAR(255),	
DiaChi VARCHAR(255)
);

CREATE TABLE TacGia(
ID_TacGia VARCHAR(25) PRIMARY KEY,
HoTen VARCHAR(255),
NgaySinh DATE,
GioiTinh VARCHAR(255),
QuocTich VARCHAR(255),	
SoDienThoai VARCHAR(255),
Email VARCHAR(255),	
DiaChi VARCHAR(255)
);

CREATE TABLE NhaXuatBan(
ID_NXB VARCHAR(25) PRIMARY KEY,
TenNXB VARCHAR(255),
Email VARCHAR(255),
SDT VARCHAR(255),
DiaChi VARCHAR(255)
);

CREATE TABLE XuatBan(
ID_XuatBan VARCHAR(25) PRIMARY KEY,
ID_DauSach VARCHAR(25) REFERENCES DauSach(ID_DauSach) ON UPDATE CASCADE,
ID_NXB VARCHAR(25) REFERENCES NhaXuatBan(ID_NXB) ON UPDATE CASCADE,
ID_TacGia VARCHAR(25) REFERENCES TacGia(ID_TacGia) ON UPDATE CASCADE,
NgayXuatBan DATE
);

CREATE TABLE Sach(
ID_Sach VARCHAR(25) PRIMARY KEY,
ID_DauSach VARCHAR(25) REFERENCES DauSach(ID_DauSach) ON UPDATE CASCADE,
ViTri INTEGER
);

CREATE TABLE MuonSach(
ID_MuonSach VARCHAR(25),
ID_NhanVien VARCHAR(25) REFERENCES NhanVien(ID_NhanVien) ON UPDATE CASCADE,
ID_DocGia VARCHAR(25) REFERENCES DocGia(ID_DocGia) ON UPDATE CASCADE,
ID_Sach VARCHAR(25) REFERENCES Sach(ID_Sach) ON UPDATE CASCADE,
NgayMuon DATE
);

INSERT INTO NhanVien VALUES
('NV01','Tran Quy Dat','2002-12-13','Nam','Kinh','001203045326','0968575393','tranquydat@gmail.com','Ha Noi'),
('NV02', 'Nguyen Van Anh', '2000-01-01', 'Nam', 'Kinh', '001200111111', '0915982955', 'nguyenvananh@gmail.com', 'Ho Chi Minh'),
('NV03', 'Le Thi Be', '1998-05-05', 'Nu', 'Kinh', '001980505050', '0987654321', 'lethibe@gmail.com', 'Ha Noi'),
('NV04', 'Tran Van Cuong', '1995-11-15', 'Nam', 'Kinh', '001951115151', '0962775501', 'tranvancuong@gmail.com', 'Da Nang'),
('NV05', 'Pham Thi Thuy', '1997-07-20', 'Nu', 'Kinh', '001970720202', '0952455343', 'phamthithuy@gmail.com', 'Hue'),
('NV06', 'Ho Van En', '1996-03-25', 'Nam', 'Kinh', '001960325252', '0923458791', 'hovanen@gmail.com', 'Can Tho'),
('NV07', 'Nguyen Van Phong', '2002-09-30', 'Nam', 'Kinh', '001200930303', '0962775518', 'nguyenvanphong@gmail.com', 'Hai Phong'),
('NV08', 'Tran Van Hung', '2001-06-05', 'Nam', 'Kinh', '001010605505', '0934569123', 'tranvanhung@gmail.com', 'Da Lat'),
('NV09', 'Nguyen Van Lam', '2000-02-03', 'Nam', 'Tay', '001200203737', '0958390191', 'nguyenvanlam@gmail.com', 'Phu Quoc'),
('NV10', 'Ho Thi Hao', '2000-03-21', 'Nu', 'Thai', '001200321979', '093459567761', 'hothihao@gmail.com', 'Hoa Binh'),
('NV11', 'Nguyen Van Ich', '2001-11-15', 'Nam', 'Dao', '001111511010', '0918764778', 'nguyenvanich@gmail.com', 'Yen Bai'),
('NV12', 'Le Khanh Van', '1997-12-01', 'Nu', 'Tay', '001970120868', '0946734458', 'lekhanhvan@gmail.com', 'Lao Cai'),
('NV13', 'Tran Van Loc', '1998-04-30', 'Nam', 'Muong', '001980430909', '09445882119', 'tranvanloc@gmail.com', 'Sapa'),
('NV14', 'Pham nguyet Minh', '1993-10-17', 'Nu', 'Muong', '001931017010', '09334777945', 'phamnguyetminh@gmail.com', 'Lai Chau'),
('NV15', 'Ho Van Ngoc', '1995-03-21', 'Nam', 'Thai', '001950321121', '0444786891', 'hovangoc@gmail.com', 'Son La');


INSERT INTO  DocGia VALUES
('DG01','Nguyen Bang Linh','2000-12-9','Nam','Kinh','001412454343','0933223334','nguyenbanglinh@email.com','Hai Phong'),
('DG02', 'Le Thi Bao', '1998-05-05', 'Nu', 'Tay', '001980505050', '0947589101', 'lethibao@email.com', 'Ha Noi'),
('DG03', 'Tran Van Cuong', '1995-11-15', 'Nam', 'Muong', '001951115151', '0959783678', 'tranvancuong@email.com', 'Da Nang'),
('DG04', 'Pham Van Dung', '1997-07-20', 'Nu', 'Thai', '001970720202', '0912309856', 'phamvandung@email.com', 'Hue'),
('DG05', 'Ho Van Eo', '1996-03-25', 'Nam', 'Dao', '001960325252', '0956722381', 'hovaneo@email.com', 'Can Tho'),
('DG06', 'Nguyen Van Fai', '2002-09-30', 'Nam', 'Cham', '001200930303', '0959873978', 'nguyenvanfai@email.com', 'Hai Phong'),
('DG07', 'Le Van Gia', '1999-08-10', 'Nu', 'Kinh', '001990810404', '0942786225', 'levangia@email.com', 'Nha Trang'),
('DG08', 'Tran Van Hau', '2001-06-05', 'Nam', 'Tay', '001010605505', '0958252589', 'tranvanhau@email.com', 'Da Lat'),
('DG09', 'Pham Van Tho', '1994-04-22', 'Nu', 'Muong', '001940422606', '0952553048', 'phamvantho@email.com', 'Vung Tau'),
('DG10', 'Nguyen Van An', '2000-02-03', 'Nam', 'Thai', '001200203737', '0913209478', 'nguyenvanan@email.com', 'Phu Quoc'),
('DG11', 'Le Van Thinh', '1997-12-01', 'Nu', 'Dao', '001970120868', '0941424577', 'levanthinh@email.com', 'Lao Cai'),
('DG12', 'Tran Van Lan', '1998-04-30', 'Nam', 'Cham', '001980430909', '0954433494', 'tranvanlan@email.com', 'Sapa'),
('DG13', 'Pham Van Mai', '1993-10-17', 'Nu', 'Kinh', '001931017010', '0952435573', 'phamvanmai@email.com', 'Mai Chau'),
('DG14', 'Ho Van Tuan', '1995-03-21', 'Nam', 'Tay', '001950321121', '0944578898', 'hovantuan@email.com', 'Son La'),
('DG15', 'Nguyen Van Quang', '2002-05-10', 'Nu', 'Muong', '001200510232', '0977878675', 'nguyenvanquang@email.com', 'Moc Chau'),
('DG16', 'Le Van Van', '1996-08-29', 'Nam', 'Thai', '001960829343', '0933255552', 'levanvan@email.com', 'Hoa Binh'),
('DG17', 'Tran Van Duc', '1994-11-27', 'Nu', 'Dao', '001941127454', '0955423867', 'tranvanduc@email.com', 'Yen Bai'),
('DG18', 'Pham Van Tai', '2000-07-14', 'Nam', 'Cham', '001200714565', '0952245595', 'phamvantai@email.com', 'Quy Nhon'),
('DG19', 'Nguyen Van Tinh', '1999-12-25', 'Nu', 'Kinh', '001991225676', '0957523464', 'nguyenvantinh@email.com', 'Phan Thiet'),
('DG20', 'Le Van Hoa', '1999-01-10', 'Nam', 'Muong', '001990110707', '0952357686', 'levanhoa@email.com', 'Soc Trang'),
('DG21', 'Tran Van Quoc', '2001-02-20', 'Nu', 'Tay', '001102202010', '0943444465', 'tranvanquoc@email.com', 'Bac Lieu'),
('DG22', 'Pham Van Tam', '1997-03-30', 'Nam', 'Dao', '001970330101', '0999775886', 'phamvantam@email.com', 'Long An'),
('DG23', 'Ho Van Hung', '1998-04-15', 'Nu', 'Thai', '001980415303', '0952523587', 'hovanhung@email.com', 'Tay Ninh'),
('DG24', 'Nguyen Van Luong', '2000-06-25', 'Nam', 'Kinh', '001200625404', '0952523987', 'nguyenvanluong@email.com', 'Dong Thap'),
('DG25', 'Le Van Nam', '2002-07-05', 'Nu', 'Cham', '001200705505', '0954543587', 'levannam@email.com', 'Binh Duong'),
('DG26', 'Tran Van Dinh', '1996-08-17', 'Nam', 'Kinh', '001960817606', '0952578587', 'tranvandinh@email.com', 'Binh Phuoc'),
('DG27', 'Pham Van Hoang', '1994-09-22', 'Nu', 'Dao', '001940922707', '0972523587', 'phamvanhoang@email.com', 'Tien Giang'),
('DG28', 'Ho Van Khanh', '2000-10-07', 'Nam', 'Tay', '001001007808', '0957723587', 'hovankhanh@email.com', 'Lam Dong'),
('DG29', 'Nguyen Van Phuc', '1999-11-18', 'Nu', 'Thai', '001991118909', '0952523597', 'nguyenvanphuc@email.com', 'Ben Tre'),
('DG30', 'Le Van Sang', '1998-01-30', 'Nam', 'Muong', '001980130131', '0955237587', 'levansang@email.com', 'Ca Mau'),
('DG31', 'Tran Van Tinh', '2000-02-10', 'Nu', 'Tay', '001002100202', '0952525687', 'tranvantinh@email.com', 'Hai Duong'),
('DG32', 'Pham Van Trung', '1997-03-25', 'Nam', 'Dao', '001970325303', '0959993587', 'phamvantrung@email.com', 'Ninh Binh'),
('DG33', 'Ho Van Luong', '1998-04-15', 'Nu', 'Thai', '001980415404', '0952523544', 'hovanluong@email.com', 'Lai Chau'),
('DG34', 'Nguyen Van Duc', '2000-06-25', 'Nam', 'Kinh', '001200625505', '0907023587', 'nguyenvanduc@email.com', 'Bac Ninh'),
('DG35', 'Le Van Tho', '2002-07-05', 'Nu', 'Cham', '001200705606', '0952523777', 'levantho@email.com', 'Nam Dinh'),
('DG36', 'Tran Van Cuong', '1996-08-17', 'Nam', 'Kinh', '001960817707', '0952555587', 'tranvancuong@email.com', 'Gia Lai'),
('DG37', 'Pham Van Tuan', '1994-09-22', 'Nu', 'Dao', '001940922808', '0925253587', 'phamvantuan@email.com', 'Bac Kan'),
('DG38', 'Ho Van Dinh', '2000-10-07', 'Nam', 'Tay', '001001007909', '0952525557', 'hovandinh@email.com', 'Cao Bang'),
('DG39', 'Nguyen Van Cuong', '1999-11-18', 'Nu', 'Thai', '001991118010', '0945666543', 'nguyenvancuong@email.com', 'Phu Yen');


INSERT INTO Loi VALUES
('L01','NV01','DG01','Qua Han','2023-12-10',20000),
('L02', 'NV01', 'DG02', 'Qua Han Muon', '2023-01-11', 20000),
('L03', 'NV01', 'DG07', 'Hong Sach', '2023-02-12', 50000),
('L04', 'NV01', 'DG09', 'Mat Sach', '2023-03-13', 70000),
('L05', 'NV05', 'DG06', 'Qua Han Muon', '2023-04-14', 20000),
('L06', 'NV06', 'DG08', 'Hong Sach', '2023-05-15', 50000),
('L07', 'NV06', 'DG10', 'Mat Sach', '2023-06-16', 70000),
('L08', 'NV08', 'DG15', 'Qua Han Muon', '2023-07-17', 20000),
('L09', 'NV08', 'DG16', 'Hong Sach', '2023-08-18', 50000),
('L10', 'NV08', 'DG17', 'Mat Sach', '2023-09-19', 70000),
('L11', 'NV08', 'DG22', 'Qua Han Muon', '2023-10-20', 20000),
('L12', 'NV12', 'DG23', 'Hong Sach', '2023-11-21', 50000),
('L13', 'NV13', 'DG25', 'Mat Sach', '2023-12-22', 70000),
('L14', 'NV13', 'DG26', 'Qua Han Muon', '2023-01-23', 20000),
('L15', 'NV13', 'DG29', 'Hong Sach', '2023-02-24', 50000),
('L16', 'NV13', 'DG30', 'Mat Sach', '2023-03-25', 70000),
('L17', 'NV14', 'DG18', 'Qua Han Muon', '2023-04-26', 20000),
('L18', 'NV14', 'DG19', 'Hong Sach', '2023-05-27', 50000),
('L19', 'NV15', 'DG20', 'Mat Sach', '2023-06-28', 70000),
('L20', 'NV15', 'DG21', 'Qua Han Muon', '2023-07-29', 20000);


INSERT INTO LePhi VALUES
('LP01','The Ngay',10000),
('LP02','The Tuan',50000),
('LP03','The Thang',150000),
('LP04','The Nam',1200000);

INSERT INTO ThuPhi VALUES
('TP01', 'NV01', 'DG04', 'LP02', '2023-06-01'),
('TP02', 'NV02', 'DG05', 'LP03', '2023-05-15'),
('TP03', 'NV03', 'DG06', 'LP04', '2023-07-10'),
('TP04', 'NV04', 'DG07', 'LP01', '2023-06-20'),
('TP05', 'NV05', 'DG08', 'LP02', '2023-06-25'),
('TP06', 'NV06', 'DG09', 'LP03', '2023-08-12'),
('TP07', 'NV07', 'DG10', 'LP04', '2023-07-05'),
('TP08', 'NV08', 'DG11', 'LP01', '2023-07-15'),
('TP09', 'NV09', 'DG12', 'LP02', '2023-06-05'),
('TP10', 'NV10', 'DG13', 'LP03', '2023-05-30'),
('TP11', 'NV11', 'DG14', 'LP04', '2023-08-01'),
('TP12', 'NV12', 'DG15', 'LP01', '2023-06-12'),
('TP13', 'NV13', 'DG16', 'LP02', '2023-05-20'),
('TP14', 'NV14', 'DG17', 'LP03', '2023-07-27'),
('TP15', 'NV15', 'DG18', 'LP04', '2023-08-29'),
('TP16', 'NV01', 'DG19', 'LP01', '2023-07-18'),
('TP17', 'NV12', 'DG20', 'LP02', '2023-06-08'),
('TP18', 'NV14', 'DG21', 'LP03', '2023-07-30'),
('TP19', 'NV13', 'DG22', 'LP04', '2023-06-15'),
('TP20', 'NV09', 'DG23', 'LP01', '2023-08-05'),
('TP21', 'NV01', 'DG24', 'LP02', '2023-05-12'),
('TP22', 'NV02', 'DG25', 'LP03', '2023-07-22'),
('TP23', 'NV03', 'DG26', 'LP04', '2023-05-08'),
('TP24', 'NV04', 'DG27', 'LP01', '2023-06-10'),
('TP25', 'NV05', 'DG28', 'LP02', '2023-08-20'),
('TP26', 'NV06', 'DG29', 'LP03', '2023-07-25'),
('TP27', 'NV07', 'DG30', 'LP04', '2023-07-02'),
('TP28', 'NV08', 'DG31', 'LP01', '2023-06-17'),
('TP29', 'NV09', 'DG32', 'LP02', '2023-08-18'),
('TP30', 'NV10', 'DG33', 'LP03', '2023-06-28'),
('TP31', 'NV11', 'DG34', 'LP04', '2023-05-05'),
('TP32', 'NV12', 'DG35', 'LP01', '2023-07-14'),
('TP33', 'NV13', 'DG36', 'LP02', '2023-08-10'),
('TP34', 'NV14', 'DG37', 'LP03', '2023-07-21'),
('TP35', 'NV15', 'DG38', 'LP04', '2023-06-30'),
('TP36', 'NV02', 'DG39', 'LP01', '2023-05-25'),
('TP37', 'NV03', 'DG33', 'LP02', '2023-08-25'),
('TP38', 'NV04', 'DG01', 'LP03', '2023-07-23'),
('TP39', 'NV05', 'DG02', 'LP04', '2023-07-07'),
('TP40', 'NV01', 'DG03', 'LP01', '2023-06-21'),
('TP41', 'NV08', 'DG04', 'LP02', '2023-07-08'),
('TP42', 'NV06', 'DG05', 'LP03', '2023-08-15'),
('TP43', 'NV03', 'DG06', 'LP04', '2023-06-14'),
('TP44', 'NV04', 'DG07', 'LP01', '2023-05-18'),
('TP45', 'NV05', 'DG08', 'LP02', '2023-08-22');

INSERT INTO DauSach VALUES
('DS01', 'Lap Trinh C', 120000, 'Lap Trinh', 200),
('DS02', 'Toan Hoc Co Ban', 95000, 'Toan Hoc', 150),
('DS03', 'Tieng Anh Giao Tiep', 80000, 'Ngoai Ngu', 120),
('DS04', 'Lich Su The Gioi', 110000, 'Lich Su', 180),
('DS05', 'Vat Ly Hoc Co Ban', 105000, 'Vat Ly', 160),
('DS06', 'Hoa Hoc Hoc Co Ban', 98000, 'Hoa Hoc', 140),
('DS07', 'Tu Duong Hoc', 75000, 'Du Lich', 220),
('DS08', 'Khoa Hoc May Tinh', 125000, 'Khoa Hoc', 250),
('DS09', 'Ngon Ngu Lap Trinh Python', 90000, 'Lap Trinh', 190),
('DS10', 'Kinh Te Hoc Co Ban', 115000, 'Kinh Te', 210),
('DS11', 'Truyen Tranh Nhat Ban', 85000, 'Truyen Tranh', 120),
('DS12', 'Am Nhac The Gioi', 100000, 'Am Nhac', 170),
('DS13', 'Dia Ly The Gioi', 95000, 'Dia Ly', 200),
('DS14', 'Cong Nghe Thong Tin', 110000, 'Cong Nghe', 180),
('DS15', 'Ky Thuat Dien Tu', 98000, 'Dien Tu', 150),
('DS16', 'Lap Trinh Java', 120000, 'Lap Trinh', 220),
('DS17', 'Ky Nang Lanh Dao', 105000, 'Ky Nang', 160),
('DS18', 'Ky Thuat Sua Xe May', 90000, 'Ky Thuat', 130),
('DS19', 'Cong Nghe Sinh Hoc', 115000, 'Sinh Hoc', 210),
('DS20', 'Khoa Hoc Dat', 75000, 'Khoa Hoc', 180),
('DS21', 'Truyen Kinh Di', 85000, 'Truyen Kinh Di', 140),
('DS22', 'Toan Hoc Tren Mang', 110000, 'Toan Hoc', 230),
('DS23', 'Giao Duc Nguoi Tre', 98000, 'Giao Duc', 190),
('DS24', 'Khoa Hoc Moi', 100000, 'Khoa Hoc', 200),
('DS25', 'Vat Ly Hoc Co So', 95000, 'Vat Ly', 150),
('DS26', 'Cong Nghe Thong Tin', 125000, 'Cong Nghe', 240),
('DS27', 'Truyen Cuoi', 90000, 'Truyen Cuoi', 100),
('DS28', 'Tuoi Tre Hien Dai', 115000, 'Gia Tri Tre', 170),
('DS29', 'Lich Su Viet Nam', 75000, 'Lich Su', 160),
('DS30', 'Lap Trinh Web', 85000, 'Lap Trinh', 180);

INSERT INTO NhapSach VALUES
('NS01', 'NV01', 'DS01', '2023-09-01', 1),
('NS02', 'NV02', 'DS02', '2023-09-02', 1),
('NS03', 'NV03', 'DS03', '2023-09-03', 2),
('NS04', 'NV04', 'DS04', '2023-09-04', 1),
('NS05', 'NV05', 'DS05', '2023-09-05', 1),
('NS06', 'NV06', 'DS06', '2023-09-06', 1),
('NS07', 'NV07', 'DS07', '2023-09-07', 1),
('NS08', 'NV08', 'DS08', '2023-09-08', 3),
('NS09', 'NV09', 'DS09', '2023-09-09', 1),
('NS10', 'NV10', 'DS10', '2023-09-10', 1),
('NS11', 'NV11', 'DS11', '2023-09-11', 1),
('NS12', 'NV12', 'DS12', '2023-09-12', 2),
('NS13', 'NV13', 'DS13', '2023-09-13', 1),
('NS14', 'NV14', 'DS14', '2023-09-14', 1),
('NS15', 'NV15', 'DS15', '2023-09-15', 1),
('NS16', 'NV01', 'DS16', '2023-09-16', 1),
('NS17', 'NV02', 'DS17', '2023-09-17', 2),
('NS18', 'NV03', 'DS18', '2023-09-18', 3),
('NS19', 'NV04', 'DS19', '2023-09-19', 1),
('NS20', 'NV05', 'DS20', '2023-09-20', 2),
('NS21', 'NV06', 'DS21', '2023-09-21', 1),
('NS22', 'NV07', 'DS22', '2023-09-22', 1),
('NS23', 'NV08', 'DS23', '2023-09-23', 2),
('NS24', 'NV09', 'DS24', '2023-09-24', 1),
('NS25', 'NV10', 'DS25', '2023-09-25', 1),
('NS26', 'NV11', 'DS26', '2023-09-26', 2),
('NS27', 'NV12', 'DS27', '2023-09-27', 3),
('NS28', 'NV13', 'DS28', '2023-09-28', 1),
('NS29', 'NV14', 'DS29', '2023-09-29', 2),
('NS30', 'NV15', 'DS30', '2023-09-30', 3);

INSERT INTO DichGia VALUES
('D01', 'DS01', 'Nguyen Thuc Thuy Tien', '1999-12-13', 'Nu', 'Kinh', '001275834732', '0969311111', 'dattq@gmail.com', 'Ha Noi'),
('D02', 'DS02', 'Le Van Minh', '1995-08-20', 'Nam', 'Tay', '002124568732', '0987654321', 'minhlv@gmail.com', 'Ho Chi Minh'),
('D03', 'DS03', 'Nguyen Thanh Son', '1997-05-10', 'Nam', 'Muong', '003398765432', '0978123456', 'sonnt@gmail.com', 'Ha Noi'),
('D04', 'DS04', 'Pham Thi Lan', '2000-03-25', 'Nu', 'Thai', '004238765123', '0947123456', 'lanpt@gmail.com', 'Da Nang'),
('D05', 'DS05', 'Tran Van Quyet', '1998-11-02', 'Nam', 'Dao', '005138765900', '0946666543', 'quyettv@gmail.com', 'Hue'),
('D06', 'DS06', 'Le Thi Kim Ngan', '2001-01-18', 'Nu', 'Cham', '006237890112', '0945111543', 'nganltk@gmail.com', 'Nha Trang'),
('D07', 'DS07', 'Vo Van Toan', '1999-06-12', 'Nam', 'Kinh', '007357890134', '0945126543', 'toanvv@gmail.com', 'Hai Phong'),
('D08', 'DS08', 'Tran Quang Vinh', '1996-04-30', 'Nam', 'Tay', '008475890156', '0977123456', 'vinhtq@gmail.com', 'Vung Tau'),
('D09', 'DS09', 'Pham Minh Duc', '1994-07-09', 'Nam', 'Muong', '009498760123', '0947001234', 'ducpm@gmail.com', 'Da Nang'),
('D10', 'DS10', 'Le Thi Hoa', '2002-02-05', 'Nu', 'Thai', '010257890189', '0937005678', 'hoalh@gmail.com', 'Ha Noi'),
('D11', 'DS11', 'Tran Thi Anh', '2000-10-15', 'Nu', 'Cham', '011297890100', '0967554321', 'anhtt@gmail.com', 'Da Nang'),
('D12', 'DS12', 'Nguyen Van Hieu', '1997-09-08', 'Nam', 'Dao', '012398760122', '0923456789', 'hieunv@gmail.com', 'Hue'),
('D13', 'DS13', 'Ho Van Thang', '1996-03-31', 'Nam', 'Kinh', '013478760145', '0945543543', 'thanghv@gmail.com', 'Vinh'),
('D14', 'DS14', 'Nguyen Thi Lan', '2001-04-27', 'Nu', 'Muong', '014578760178', '0995556432', 'lannt@gmail.com', 'Quang Nam'),
('D15', 'DS15', 'Le Van Trung', '1998-07-14', 'Nam', 'Tay', '015698760156', '0934567890', 'trunglv@gmail.com', 'Da Nang')

INSERT INTO TacGia VALUES
('TG01', 'Vu Ha My', '2000-12-09', 'Nu', 'Viet Nam', '0933223334', 'vuhamy@stu.ptit.edu.vn', 'Hai Phong'),
('TG02', 'John Smith', '1985-08-15', 'Nam', 'My', '555-123-4567', 'john.smith@stu.ptit.edu.vn', 'New York'),
('TG03', 'Alice Johnson', '1990-04-25', 'Nu', 'Anh', '44-20-1234-5678', 'alice.johnson@stu.ptit.edu.vn', 'London'),
('TG04', 'Pierre Dupont', '1980-10-30', 'Nam', 'Phap', '33-1-2345-6789', 'pierre.dupont@stu.ptit.edu.vn', 'Paris'),
('TG05', 'Maria Garcia', '1995-06-20', 'Nu', 'My', '555-987-6543', 'maria.garcia@stu.ptit.edu.vn', 'Los Angeles'),
('TG06', 'David Lee', '1988-03-12', 'Nam', 'My', '555-555-5555', 'david.lee@stu.ptit.edu.vn', 'San Francisco'),
('TG07', 'Sophie Martin', '1992-09-05', 'Nu', 'Phap', '33-1-9876-5432', 'sophie.martin@stu.ptit.edu.vn', 'Paris'),
('TG08', 'Daniel Brown', '1982-01-10', 'Nam', 'Anh', '44-20-5555-1234', 'daniel.brown@stu.ptit.edu.vn', 'London'),
('TG09', 'Hoa Nguyen', '1987-07-01', 'Nu', 'Viet Nam', '0988765432', 'hoa.nguyen@stu.ptit.edu.vn', 'Hanoi'),
('TG10', 'Ethan Wilson', '1993-12-24', 'Nam', 'My', '555-333-2222', 'ethan.wilson@stu.ptit.edu.vn', 'Chicago'),
('TG11', 'Sophia Adams', '1989-04-14', 'Nu', 'Anh', '44-20-1234-5678', 'sophia.adams@stu.ptit.edu.vn', 'Manchester'),
('TG12', 'Lucas Martin', '1983-11-05', 'Nam', 'My', '555-777-8888', 'lucas.martin@stu.ptit.edu.vn', 'Boston'),
('TG13', 'Claire Brown', '1998-07-22', 'Nu', 'Phap', '33-1-9876-5432', 'claire.brown@stu.ptit.edu.vn', 'Paris'),
('TG14', 'Antoine Dupont', '1981-06-15', 'Nam', 'Phap', '33-1-5555-1234', 'antoine.dupont@stu.ptit.edu.vn', 'Marseille'),
('TG15', 'Anna Wilson', '1996-03-30', 'Nu', 'Anh', '44-20-8888-8888', 'anna.wilson@stu.ptit.edu.vn', 'London'),
('TG16', 'Linh Nguyen', '1986-05-18', 'Nu', 'Viet Nam', '0945333333', 'linh.nguyen@stu.ptit.edu.vn', 'Ho Chi Minh'),
('TG17', 'Thomas Smith', '1994-08-08', 'Nam', 'My', '555-222-1111', 'thomas.smith@stu.ptit.edu.vn', 'New York'),
('TG18', 'Isabelle Johnson', '1987-09-29', 'Nu', 'Anh', '44-20-1234-5678', 'isabelle.johnson@stu.ptit.edu.vn', 'London'),
('TG19', 'Michel Dupont', '1984-02-16', 'Nam', 'Phap', '33-1-9876-5432', 'michel.dupont@stu.ptit.edu.vn', 'Paris'),
('TG20', 'Emily Davis', '1991-10-11', 'Nu', 'My', '555-666-4444', 'emily.davis@stu.ptit.edu.vn', 'Los Angeles'),
('TG21', 'George Wilson', '1980-12-02', 'Nam', 'My', '555-111-9999', 'george.wilson@stu.ptit.edu.vn', 'Chicago'),
('TG22', 'Julie Smith', '1997-11-28', 'Nu', 'My', '555-999-7777', 'julie.smith@stu.ptit.edu.vn', 'New York');

INSERT INTO NhaXuatBan VALUES
('NXB01', 'Kim Dong', 'KimDong@pth.com', '0953344422', 'Ha Noi'),
('NXB02', 'Vinh Hoa', 'VinhHoa@pth.com', '0932456789', 'Da Nang'),
('NXB03', 'Minh Triet', 'MinhTriet@pth.com', '0978567341', 'Ho Chi Minh'),
('NXB04', 'Xuan Thanh', 'XuanThanh@pth.com', '0987123456', 'Hue'),
('NXB05', 'Van Hoc', 'VanHoc@pth.com', '0945123456', 'Can Tho'),
('NXB06', 'Sai Gon', 'SaiGon@pth.com', '0967234567', 'Quang Ninh'),
('NXB07', 'Nha Nam', 'NhaNam@pth.com', '0934567890', 'Vung Tau'),
('NXB08', 'Hai Phong', 'HaiPhong@pth.com', '0987654321', 'Nam Dinh'),
('NXB09', 'Giai Phong', 'GiaiPhong@pth.com', '0956677889', 'Thai Binh');

INSERT INTO XuatBan VALUES
('XB01', 'DS01', 'NXB02', 'TG05', '2008-12-13'),
('XB02', 'DS02', 'NXB03', 'TG08', '2010-08-25'),
('XB03', 'DS03', 'NXB05', 'TG01', '2009-05-17'),
('XB04', 'DS04', 'NXB07', 'TG04', '2011-11-30'),
('XB05', 'DS05', 'NXB08', 'TG09', '2012-07-22'),
('XB06', 'DS06', 'NXB01', 'TG10', '2013-03-15'),
('XB07', 'DS07', 'NXB06', 'TG15', '2015-10-18'),
('XB08', 'DS08', 'NXB04', 'TG07', '2016-04-29'),
('XB09', 'DS09', 'NXB09', 'TG11', '2014-12-05'),
('XB10', 'DS10', 'NXB02', 'TG14', '2012-09-07'),
('XB11', 'DS11', 'NXB03', 'TG06', '2013-01-01'),
('XB12', 'DS12', 'NXB05', 'TG13', '2015-08-14'),
('XB13', 'DS13', 'NXB07', 'TG12', '2014-07-26'),
('XB14', 'DS14', 'NXB08', 'TG03', '2011-04-12'),
('XB15', 'DS15', 'NXB01', 'TG02', '2010-02-10'),
('XB16', 'DS16', 'NXB06', 'TG22', '2016-06-29'),
('XB17', 'DS17', 'NXB04', 'TG20', '2013-11-11'),
('XB18', 'DS18', 'NXB09', 'TG19', '2015-03-03'),
('XB19', 'DS19', 'NXB02', 'TG18', '2014-12-30'),
('XB20', 'DS20', 'NXB03', 'TG16', '2017-09-25'),
('XB21', 'DS21', 'NXB05', 'TG17', '2018-10-02'),
('XB22', 'DS22', 'NXB07', 'TG21', '2019-05-12'),
('XB23', 'DS23', 'NXB08', 'TG22', '2020-04-14'),
('XB24', 'DS24', 'NXB01', 'TG19', '2018-12-09'),
('XB25', 'DS25', 'NXB06', 'TG06', '2019-08-17'),
('XB26', 'DS26', 'NXB04', 'TG09', '2020-07-21'),
('XB27', 'DS27', 'NXB09', 'TG17', '2017-06-26'),
('XB28', 'DS28', 'NXB02', 'TG16', '2016-03-01'),
('XB29', 'DS29', 'NXB03', 'TG11', '2018-05-30'),
('XB30', 'DS30', 'NXB05', 'TG14', '2020-09-10');

INSERT INTO Sach VALUES
('S01','DS01',1),
('S02','DS02',2),
('S03','DS03',3),
('S04','DS03',4),
('S05','DS04',5),
('S06','DS05',6),
('S07','DS06',7),
('S08','DS07',8),
('S09','DS08',9),
('S10','DS08',10),
('S11','DS08',11),
('S12','DS09',12),
('S13','DS10',13),
('S14','DS11',14),
('S15','DS12',15),
('S16','DS12',16),
('S17','DS13',17),
('S18','DS14',18),
('S19','DS15',19),
('S20','DS16',20),
('S21','DS17',21),
('S22','DS17',22),
('S23','DS18',23),
('S24','DS18',24),
('S25','DS18',25),
('S26','DS19',26),
('S27','DS20',27),
('S28','DS20',28),
('S29','DS21',29),
('S30','DS22',30),
('S31','DS23',31),
('S32','DS23',32),
('S33','DS24',33),
('S34','DS25',34),
('S35','DS26',35),
('S36','DS26',36),
('S37','DS27',37),
('S38','DS27',38),
('S39','DS27',39),
('S40','DS28',40),
('S41','DS29',41),
('S42','DS29',42),
('S43','DS30',43),
('S44','DS30',44),
('S45','DS30',45);

INSERT INTO MuonSach VALUES
('MS01', 'NV01', 'DG03', 'S01', '2023-05-06'),
('MS02', 'NV02', 'DG05', 'S02', '2023-05-07'),
('MS03', 'NV03', 'DG08', 'S03', '2023-05-08'),
('MS04', 'NV04', 'DG11', 'S04', '2023-05-09'),
('MS05', 'NV05', 'DG13', 'S05', '2023-05-10'),
('MS06', 'NV06', 'DG17', 'S06', '2023-05-11'),
('MS07', 'NV07', 'DG21', 'S07', '2023-05-12'),
('MS08', 'NV08', 'DG26', 'S08', '2023-05-13'),
('MS09', 'NV09', 'DG31', 'S09', '2023-05-14'),
('MS10', 'NV10', 'DG35', 'S10', '2023-05-15'),
('MS11', 'NV11', 'DG37', 'S11', '2023-05-16'),
('MS12', 'NV12', 'DG02', 'S12', '2023-05-17'),
('MS13', 'NV13', 'DG12', 'S13', '2023-05-18'),
('MS14', 'NV14', 'DG24', 'S14', '2023-05-19'),
('MS15', 'NV15', 'DG01', 'S15', '2023-05-20'),
('MS16', 'NV01', 'DG09', 'S16', '2023-05-21'),
('MS17', 'NV02', 'DG07', 'S17', '2023-05-22'),
('MS18', 'NV05', 'DG19', 'S18', '2023-05-23'),
('MS19', 'NV07', 'DG06', 'S19', '2023-05-24'),
('MS20', 'NV09', 'DG22', 'S20', '2023-05-25'),
('MS21', 'NV01', 'DG28', 'S21', '2023-05-26'),
('MS22', 'NV02', 'DG34', 'S22', '2023-05-27'),
('MS23', 'NV03', 'DG03', 'S23', '2023-05-28'),
('MS24', 'NV04', 'DG05', 'S24', '2023-05-29'),
('MS25', 'NV05', 'DG21', 'S25', '2023-05-30'),
('MS26', 'NV06', 'DG11', 'S26', '2023-05-31'),
('MS27', 'NV07', 'DG13', 'S27', '2023-06-01'),
('MS28', 'NV08', 'DG17', 'S28', '2023-06-02'),
('MS29', 'NV09', 'DG21', 'S29', '2023-06-03'),
('MS30', 'NV10', 'DG26', 'S30', '2023-06-04');