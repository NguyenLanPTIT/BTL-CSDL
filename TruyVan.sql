--Truy vấn 1: Đếm xem mỗi nhân viên cho bao nhiêu độc giả mượn sách
SELECT m.ID_NhanVien, MAX(nv.HoTen) AS 'Tên Nhân viên', COUNT(DISTINCT dg.ID_DocGia) AS 'Số lượng độc giả mượn sách'
FROM MuonSach AS m
JOIN NhanVien AS nv
ON m.ID_NhanVien = nv.ID_NhanVien
JOIN DocGia AS dg
ON m.ID_DocGia = dg.ID_DocGia
GROUP BY m.ID_NhanVien
ORDER BY COUNT(DISTINCT dg.ID_DocGia) DESC

--Truy vấn 2: Thêm một nhân viên
INSERT INTO NhanVien VALUES
('NV16','Nguyen Huu Quang Hoa','2003-06-25','Nam','Kinh','001203045326','0945556655','nguyenhuuquanghoa@gmail.com','Ha Noi')

--Truy vấn 3: Sửa dân tộc của một nhân viên
UPDATE NhanVien
SET DanToc = 'Muong'
WHERE ID_NhanVien = 'NV16'

--Truy vấn 4: Liệt kê các nhân viên quê ở Hà nội thu phí độc giả vào ngày 2023-05-12
SELECT nv.ID_NhanVien, nv.HoTen AS 'Họ Tên', MAX(nv.DiaChi) AS 'Quê quán', MAX(tp.NgayThu) AS 'Ngày thu' 
FROM NhanVien AS nv
JOIN ThuPhi AS tp
ON tp.ID_NhanVien = nv.ID_NhanVien
WHERE tp.NgayThu = '2023-05-12' AND nv.DiaChi = 'Ha noi'
GROUP BY nv.ID_NhanVien, nv.HoTen

--Truy vấn 5: Liệt kê tổng số tiền lệ phí được thu bởi mỗi nhân viên theo thứ tự giảm dần 
SELECT nv.ID_NhanVien, nv.HoTen, SUM(lp.TienLePhi) AS 'Tổng tiền lệ phí thu'
FROM ThuPhi AS tp
JOIN LePhi AS lp
ON tp.ID_LePhi = lp.ID_LePhi
JOIN NhanVien AS nv
ON tp.ID_NhanVien = nv.ID_NhanVien
GROUP BY nv.ID_NhanVien,nv.HoTen
ORDER BY SUM(lp.TienLePhi) DESC

--Truy vấn 6: Xóa một nhân viên
DELETE FROM NhanVien
WHERE ID_NhanVien = 'NV16'

--Truy vấn 7: liệt kê tất cả các đầu sách được xuất bản vào ngày 2008-12-13 có chữ 'a' trong tên
SELECT ds.ID_DauSach, ds.TenDauSach, MAX(xb.NgayXuatBan) AS 'Ngày xuất bản'
FROM XuatBan AS xb
JOIN DauSach AS ds
ON xb.ID_DauSach = ds.ID_DauSach
WHERE xb.NgayXuatBan = '2008-12-13'
AND ds.TenDauSach LIKE '%a%'
GROUP BY ds.ID_DauSach,ds.TenDauSach

--Truy vấn 8: Tính tổng số sách thuộc mỗi thể loại
SELECT ds.TheLoai, SUM(ns.SoLuong) AS 'Tổng'
FROM DauSach AS ds
JOIN NhapSach AS ns
ON ns.ID_DauSach = ds.ID_DauSach
GROUP BY ds.TheLoai
ORDER BY sum(ns.SoLuong) DESC

--Truy vấn 9: Tính tổng số tiền nhập sách vào ngày 2023-09-01
SELECT SUM(n.SoLuong * ds.GiaTien) AS 'Tổng tiền'
FROM NhapSach AS n
JOIN DauSach AS ds
ON n.ID_DauSach = ds.ID_DauSach
WHERE n.NgayNhap = '2023-09-01'

--Truy vấn 10: Tính số lượng sách còn lại trong kho của mỗi đầu sách
SELECT MAX(ds.TenDauSach) AS 'Tên', (MAX(ns.SoLuong)- COUNT(m.ID_MuonSach)) AS 'Còn Lại'
FROM DauSach AS ds
JOIN NhapSach AS ns
ON ns.ID_DauSach = ds.ID_DauSach
JOIN Sach AS s
ON s.ID_DauSach = ds.ID_DauSach
LEFT JOIN MuonSach AS m
ON m.ID_Sach = s.ID_Sach
GROUP BY ds.ID_DauSach, ds.TenDauSach
ORDER BY (MAX(ns.SoLuong) - COUNT(m.ID_DocGia)) DESC

--Truy vấn 11: Hiển thị đầu sách được mượn nhiều nhất
SELECT TOP 1 ds.ID_DauSach, ds.TenDauSach, COUNT(DISTINCT m.ID_MuonSach) AS 'Số lần mượn'
FROM Sach AS s
JOIN DauSach AS ds
ON s.ID_DauSach = ds.ID_DauSach
JOIN MuonSach AS m
ON m.ID_Sach =  s.ID_Sach
GROUP BY ds.ID_DauSach, ds.TenDauSach
ORDER BY COUNT(DISTINCT m.ID_MuonSach) DESC

--Truy vấn 12: Liệt kê đầu sách có tên bắt đầu bằng chữ 'h' và có độc giả sinh năm 2001 mượn nhiều nhất
SELECT TOP 1 ds.ID_DauSach, ds.TenDauSach
FROM DauSach AS ds
JOIN Sach AS s
ON s.ID_DauSach = ds.ID_DauSach
JOIN MuonSach AS ms
ON ms.ID_Sach = s.ID_Sach
JOIN DocGia AS dg
ON ms.ID_DocGia = dg.ID_DocGia
WHERE ds.TenDauSach LIKE 'h%'
AND YEAR(dg.NgaySinh) = 2001
GROUP BY ds.ID_DauSach, ds.TenDauSach
ORDER BY COUNT(DISTINCT ms.ID_MuonSach)

--Truy vấn 13: Thêm cột NgayTra (kiểu dữ liệu DATE) vào bảng MuonSach
ALTER TABLE MuonSach
ADD NgayTra DATE;

--Truy vấn 14: Sửa cột NgayMuon thanh NgayMuonSach trong bang MuonSach
EXEC sp_rename 'MuonSach.NgayMuon', 'NgayMuonSach', 'COLUMN';
ALTER TABLE MuonSach
ALTER COLUMN NgayMuon DATETIME;

--Truy vấn 15: Xóa cột NgayTra
ALTER TABLE MuonSach
DROP COLUMN NgayTra;

--Truy vấn 16: Liệt kê các độc giả mượn sách vào ngày 2023-05-30
SELECT dg.ID_DocGia, MAX(dg.HoTen) AS 'Họ Tên'
FROM DocGia AS dg
JOIN MuonSach AS m
ON m.ID_DocGia = dg.ID_DocGia
JOIN NhanVien AS nv
ON m.ID_NhanVien = nv.ID_NhanVien
WHERE m.NgayMuon = '2023-05-30'
GROUP BY dg.ID_DocGia
ORDER BY MAX(dg.HoTen)

--Truy vấn 17: Tính tổng lệ phí của mỗi độc giả trong tên có chữ 'h'
SELECT dg.HoTen, SUM(lp.TienLePhi) AS 'Tổng tiền thu'
FROM ThuPhi AS tp
JOIN LePhi AS lp
ON tp.ID_LePhi = lp.ID_LePhi
JOIN DocGia AS dg
ON tp.ID_DocGia = dg.ID_DocGia
WHERE dg.HoTen like '%h%'
GROUP BY dg.ID_DocGia,dg.HoTen
ORDER BY SUM(lp.TienLePhi) DESC

--Truy vấn 18: Liệt kê độc giả có tên có chữ 'h' và chỉ mượn sách vào ngày 2023-05-21
SELECT dg.ID_DocGia, dg.HoTen AS 'Họ Tên', MAX(ms.NgayMuon) AS 'Ngày mượn'
FROM DocGia AS dg
JOIN MuonSach AS ms
ON ms.ID_DocGia = dg.ID_DocGia
WHERE dg.HoTen LIKE '%h%'
GROUP BY dg.ID_DocGia,dg.HoTen
HAVING COUNT(DISTINCT ms.NgayMuon) = 1 
AND MAX(ms.NgayMuon)= '2023-05-21'

--Truy vấn 19: Hiển thị thông tin của tất cả độc giả sinh vào năm 2000 và mượn sách vào ngày '2023-05-19'
SELECT dg.ID_DocGia, dg.HoTen, MAX(ms.NgayMuon) AS 'Ngày mượn', MAX(YEAR(dg.NgaySinh)) AS 'Năm sinh'
FROM DocGia AS dg
JOIN MuonSach AS ms
ON ms.ID_DocGia = dg.ID_DocGia
WHERE ms.NgayMuon = '2023-05-19' AND YEAR(dg.NgaySinh) = 2000
GROUP BY dg.ID_DocGia, dg.HoTen

--Truy vấn 20: Liệt kê tất các độc giả mượn sách của NXB Sai Gon vào ngày 2023-05-13
SELECT dg.ID_DocGia, dg.HoTen, ms.NgayMuon
FROM DauSach AS ds
JOIN Sach AS s
ON s.ID_DauSach = ds.ID_DauSach
JOIN MuonSach AS ms
ON ms.ID_Sach = s.ID_Sach
JOIN DocGia AS dg
ON ms.ID_DocGia = dg.ID_DocGia
JOIN XuatBan AS xb
ON xb.ID_DauSach = ds.ID_DauSach
JOIN NhaXuatBan as nxb
ON xb.ID_NXB = nxb.ID_NXB
WHERE nxb.TenNXB = 'Sai Gon'
AND ms.NgayMuon = '2023-05-13'

--Truy vấn 21: Liệt kê tất cả độc giả có giới tính nam, dân tộc kinh bị thu phí vào ngày 2023-05-12
SELECT dg.ID_DocGia, dg.HoTen, MAX(tp.NgayThu) AS 'Ngày thu'
FROM ThuPhi AS tp
JOIN LePhi AS lp
ON tp.ID_LePhi = lp.ID_LePhi
JOIN NhanVien AS nv
ON tp.ID_NhanVien = nv.ID_NhanVien
JOIN DocGia AS dg
ON tp.ID_DocGia = dg.ID_DocGia
WHERE dg.GioiTinh = 'Nam'
AND dg.DanToc = 'Kinh'
AND tp.NgayThu = '2023-05-12'
GROUP BY dg.ID_DocGia, dg.HoTen

--Truy vấn 22: Liệt số lượng độc giả mà mỗi nhân viên thu phí theo thứ tự giảm dần về số lượng độc giả
SELECT nv.ID_NhanVien, nv.HoTen AS 'Họ tên', COUNT(DISTINCT dg.ID_DocGia) AS 'Số lượng độc giả nộp phí'
FROM ThuPhi AS tp
JOIN LePhi AS lp
ON tp.ID_LePhi = lp.ID_LePhi
JOIN NhanVien AS nv
ON tp.ID_NhanVien = nv.ID_NhanVien
JOIN DocGia AS dg
ON tp.ID_DocGia = dg.ID_DocGia
GROUP BY nv.ID_NhanVien,nv.HoTen
ORDER BY COUNT(DISTINCT dg.ID_DocGia) DESC

--Truy vấn 23: Liệt kê các độc giả bị phạt trên 30000 trong tên có chữ 'a'
SELECT dg.ID_DocGia, dg.HoTen AS 'Họ Tên', sum(loi.TienPhat) AS 'Số tiền phạt'
FROM DocGia AS dg
JOIN Loi
ON loi.ID_DocGia = dg.ID_DocGia
GROUP BY dg.ID_DocGia,dg.HoTen
HAVING SUM(loi.TienPhat) > 30000

--Truy vấn 24: Liệt kê tất cả tất giả được thu phí bởi nhân viên Tran Quy Dat
SELECT dg.ID_DocGia, dg.HoTen
FROM ThuPhi AS tp
JOIN LePhi AS lp
ON tp.ID_LePhi = lp.ID_LePhi
JOIN NhanVien AS nv
ON tp.ID_NhanVien = nv.ID_NhanVien
JOIN DocGia AS dg
ON tp.ID_DocGia = dg.ID_DocGia
WHERE nv.HoTen = 'Tran Quy Dat'
GROUP BY dg.ID_DocGia, dg.HoTen

--Truy vấn 25: Liệt kê các độc giả bị phạt bởi nhân viên Tran Quy Dat vào ngày 2023-12-10
SELECT dg.ID_DocGia, dg.HoTen AS 'Họ Tên', MAX(l.NgayPhat) as 'Ngày phạt'
FROM Loi AS l
JOIN NhanVien AS nv
ON l.ID_NhanVien = nv.ID_NhanVien
JOIN DocGia AS dg
ON dg.ID_DocGia = l.ID_DocGia
WHERE nv.HoTen = 'Tran Quy Dat'
AND l.NgayPhat = '2023-12-10'
GROUP BY dg.ID_DocGia, dg.HoTen

--Truy vấn 26: Liệt kê số lượng đầu sách được dịch bởi mỗi dịch giả
SELECT d.ID_DichGia, d.HoTen, COUNT(DISTINCT ds.ID_DauSach) AS 'Số đầu sách'
FROM DichGia AS d
JOIN DauSach AS ds
ON d.ID_DauSach = ds.ID_DauSach
GROUP BY d.ID_DichGia, d.HoTen

--Truy vấn 27: Liệt kê số lượng đầu sách được dịch bởi dịch giả Nguyen Thuc Thuy Tien
SELECT ds.ID_DauSach, ds.TenDauSach
FROM DichGia AS d
JOIN DauSach AS ds
ON d.ID_DauSach = ds.ID_DauSach
WHERE d.HoTen = 'Nguyen Thuc Thuy Tien'
GROUP BY ds.ID_DauSach, ds.TenDauSach

--Truy vấn 28: Liệt kê tất cả đầu sách của tác giả 'David Lee'
SELECT ds.ID_DauSach, ds.TenDauSach, MAX(tg.HoTen) As 'Tác giả'
FROM DauSach AS ds
JOIN XuatBan AS xb
ON xb.ID_DauSach = ds.ID_DauSach
JOIN TacGia AS tg
ON xb.ID_TacGia = tg.ID_TacGia
WHERE tg.HoTen = 'David Lee'
GROUP BY ds.ID_DauSach, ds.TenDauSach

--Truy vấn 29: Liệt kê số lượng đầu sách đã xuất bản của mỗi tác giả 
SELECT tg.ID_TacGia,tg.HoTen, COUNT(DISTINCT ds.ID_DauSach) AS  'Số lượng đầu sách'
FROM DauSach AS ds
JOIN XuatBan AS xb
ON xb.ID_DauSach = ds.ID_DauSach
JOIN TacGia AS tg
ON xb.ID_TacGia = tg.ID_TacGia
GROUP BY tg.ID_TacGia, tg.HoTen

--Truy vấn 30: Liệt kê tất cả các đầu sách mà độc giả có ID DG01 đã mượn
SELECT Sach.ID_Sach, DauSach.TenDauSach, DauSach.GiaTien, DauSach.TheLoai, DauSach.SoTrang
FROM MuonSach
JOIN Sach 
ON MuonSach.ID_Sach = Sach.ID_Sach
JOIN DauSach
ON Sach.ID_DauSach = DauSach.ID_DauSach
WHERE MuonSach.ID_DocGia = 'DG01'

--Truy vấn 31: Liệt kê tất cả số lượng đầu sách của nhà xuất bản Kim Dong được dịch bởi mỗi dịch giả 
SELECT d.ID_DichGia, d.HoTen, COUNT(DISTINCT ds.ID_DauSach) AS 'Số lượng đầu sách dịch cho nhà xuất bản Kim Đồng'
FROM DichGia AS d
LEFT JOIN DauSach AS ds
ON d.ID_DauSach = ds.ID_DauSach
JOIN XuatBan AS xb
ON xb.ID_DauSach = ds.ID_DauSach
JOIN NhaXuatBan AS nxb
ON xb.ID_NXB = nxb.ID_NXB
WHERE nxb.TenNXB = 'Kim Dong'
GROUP BY d.ID_DichGia, d.HoTen

-- Truy vấn 32: Liệt kê thông tin của nhà xuất bản có số lượng sách nhiều nhất
SELECT TOP 1 nxb.ID_NXB, nxb.TenNXB, SUM(ns.SoLuong) AS 'Số lượng'
FROM DauSach AS ds
JOIN NhapSach AS ns
ON ns.ID_DauSach = ds.ID_DauSach
JOIN XuatBan AS xb
ON xb.ID_DauSach = ds.ID_DauSach
JOIN NhaXuatBan AS nxb
ON xb.ID_NXB = nxb.ID_NXB
GROUP BY nxb.ID_NXB, nxb.TenNXB
ORDER BY SUM(ns.SoLuong) DESC

--Truy vấn 33: Liệt kê tất cả các dịch giả trong tên có chữ 'a' dịch sách cho nhà xuất bản Kim đồng
SELECT d.ID_DichGia,d.HoTen
FROM DichGia AS d
JOIN DauSach as ds
ON d.ID_DauSach = ds.ID_DauSach
JOIN XuatBan AS xb
ON xb.ID_DauSach = ds.ID_DauSach
JOIN NhaXuatBan AS nxb
ON xb.ID_NXB = nxb.ID_NXB
WHERE nxb.TenNXB = 'Kim Dong'
AND d.HoTen LIKE '%a%'
GROUP BY d.ID_DichGia, d.HoTen
