Create database ss7_6789;
Use ss7_6789;

-- Bài 6
CREATE TABLE nhat_ky_nguoi_dung (
    id_nhat_ky INT PRIMARY KEY,
    id_nguoi_dung INT,
    id_bai_viet INT,
    chuyen_muc VARCHAR(100),
    thoi_gian_doc_giay INT,
    ngay_ghi_nhat_ky DATE
);

-- Chèn dữ liệu mẫu
INSERT INTO nhat_ky_nguoi_dung (id_nhat_ky, id_nguoi_dung, id_bai_viet, chuyen_muc, thoi_gian_doc_giay, ngay_ghi_nhat_ky) VALUES
(1, 1, 101, 'Lap trinh', 300, '2023-10-01'),
(2, 2, 102, 'Thiet ke', 180, '2023-10-01'),
(3, 1, 103, 'Lap trinh', 450, '2023-10-02'),
(4, 3, 104, 'Bao mat', 600, '2023-10-03'),
(5, 2, 101, 'Lap trinh', 240, '2023-10-03'),
(6, 1, 104, 'Bao mat', 500, '2023-10-04'),
(7, 4, 102, 'Thiet ke', 120, '2023-10-04'),
(8, 3, 101, 'Lap trinh', 320, '2023-10-05'),
(9, 2, 105, 'Thiet ke', 200, '2023-10-05');

-- Tính tổng thời gian đọc của mỗi người dùng. Hiển thị id_nguoi_dung và tổng thời gian (tính bằng giây), đặt tên cột tổng thời gian là tong_thoi_gian_doc. Sắp xếp kết quả theo tổng thời gian giảm dần.
SELECT id_nguoi_dung, SUM(thoi_gian_doc_giay) AS tong_thoi_gian_doc
FROM nhat_ky_nguoi_dung
GROUP BY id_nguoi_dung
ORDER BY tong_thoi_gian_doc DESC;

-- Đếm số lượt đọc cho mỗi chuyên mục. Hiển thị chuyen_muc và so_luot_doc.
SELECT chuyen_muc, COUNT(*) AS so_luot_doc
FROM nhat_ky_nguoi_dung
GROUP BY chuyen_muc;

-- Tìm những bài viết (id_bai_viet) được đọc bởi nhiều hơn 1 người dùng. Chỉ hiển thị id_bai_viet.
SELECT id_bai_viet
FROM nhat_ky_nguoi_dung
GROUP BY id_bai_viet
HAVING COUNT(DISTINCT id_nguoi_dung) > 1;

-- Liệt kê những người dùng có thời gian đọc trung bình cho mỗi bài viết lớn hơn 350 giây. Chỉ hiển thị id_nguoi_dung và thoi_gian_trung_binh. (Sử dụng GROUP BY, HAVING và AVG)
SELECT id_nguoi_dung, AVG(thoi_gian_doc_giay) AS thoi_gian_trung_binh
FROM nhat_ky_nguoi_dung
GROUP BY id_nguoi_dung
HAVING AVG(thoi_gian_doc_giay) > 350;

-- Bài 7
SELECT 
    id_khach_hang,
    SUM(so_luong * don_gia) AS tong_chi_tieu_2023
FROM giao_dich
WHERE YEAR(ngay_giao_dich) = 2023
GROUP BY id_khach_hang
HAVING SUM(so_luong * don_gia) > 30000000;

SELECT 
    khu_vuc,
    SUM(so_luong) AS tong_so_luong_ban,
    SUM(so_luong * don_gia) AS tong_doanh_thu
FROM giao_dich
WHERE ten_san_pham = 'Laptop A'
GROUP BY khu_vuc
HAVING SUM(so_luong) >= 1;

SELECT 
    danh_muc,
    AVG(so_luong * don_gia) AS gia_tri_trung_binh
FROM giao_dich
WHERE khu_vuc = 'TP.HCM'
GROUP BY danh_muc
HAVING AVG(so_luong * don_gia) > 5000000;

SELECT 
    id_khach_hang
FROM giao_dich
WHERE YEAR(ngay_giao_dich) = 2023
GROUP BY id_khach_hang
HAVING COUNT(DISTINCT danh_muc) >= 2;

-- Bài 8
SELECT 
    ten_giang_vien,
    SUM(gia_tien) AS tong_doanh_thu_q1
FROM ghi_danh
WHERE ngay_ghi_danh BETWEEN '2023-01-01' AND '2023-03-31'
GROUP BY ten_giang_vien
HAVING SUM(gia_tien) > 1000000;

SELECT
    ten_khoa_hoc,
    COUNT(*) AS so_luong_ghi_danh,
    (SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)) AS ty_le_hoan_thanh
FROM ghi_danh
GROUP BY ten_khoa_hoc
HAVING 
    COUNT(*) >= 2 
    AND (SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) < 50;
    
SELECT 
    id_hoc_vien,
    COUNT(DISTINCT id_khoa_hoc) AS so_khoa_hoc_da_dang_ky,
    SUM(gia_tien) AS tong_chi_tieu
FROM ghi_danh
GROUP BY id_hoc_vien
HAVING 
    COUNT(DISTINCT id_khoa_hoc) >= 2
    AND SUM(gia_tien) > 1000000;
    
SELECT 
    MONTH(ngay_ghi_danh) AS thang_ghi_danh,
    SUM(gia_tien) AS tong_doanh_thu
FROM ghi_danh
WHERE YEAR(ngay_ghi_danh) = 2023
GROUP BY MONTH(ngay_ghi_danh)
HAVING SUM(gia_tien) > 1000000
ORDER BY thang_ghi_danh ASC;

-- BTTH
CREATE TABLE nhan_vien (
    id INT PRIMARY KEY,
    ho_ten VARCHAR(255),
    phong_ban VARCHAR(100),
    luong INT,
    nam_sinh INT
);

INSERT INTO nhan_vien (id, ho_ten, phong_ban, luong, nam_sinh) VALUES
(1, 'Nguyễn Văn An', 'Kỹ thuật', 25000000, 1990),
(2, 'Trần Thị Bình', 'Kinh doanh', 18000000, 1992),
(3, 'Lê Văn Cường', 'Kỹ thuật', 30000000, 1988),
(4, 'Phạm Thị Dung', 'Nhân sự', 16000000, 1995),
(5, 'Hoàng Văn Giang', 'Kỹ thuật', 22000000, 1991),
(6, 'Vũ Thị Hà', 'Kinh doanh', 19000000, 1996),
(7, 'Nguyễn Minh Hùng', 'Kỹ thuật', 35000000, 1989),
(8, 'Đặng Thu Lan', 'Marketing', 21000000, 1994),
(9, 'Bùi Văn Kiên', 'Nhân sự', 17000000, 1997),
(10, 'Ngô Bảo Ngọc', 'Kinh doanh', 20000000, 1993);

-- Phần 1
SELECT *
FROM nhan_vien
WHERE ho_ten LIKE 'Nguyễn%';

SELECT *
FROM nhan_vien
WHERE luong BETWEEN 15000000 AND 20000000;

SELECT *
FROM nhan_vien
WHERE phong_ban IN ('Kinh doanh', 'Nhân sự');

-- Phần 2
SELECT COUNT(*) AS tong_nhan_vien
FROM nhan_vien;

SELECT 
    MAX(luong) AS luong_cao_nhat,
    MIN(luong) AS luong_thap_nhat
FROM nhan_vien;

SELECT AVG(luong) AS luong_trung_binh
FROM nhan_vien;

-- Phần 3
SELECT 
    phong_ban,
    COUNT(*) AS so_luong
FROM nhan_vien
GROUP BY phong_ban;

SELECT
    phong_ban,
    AVG(luong) AS luong_trung_binh
FROM nhan_vien
GROUP BY phong_ban;

SELECT
    phong_ban,
    COUNT(*) AS so_luong
FROM nhan_vien
GROUP BY phong_ban
HAVING COUNT(*) > 3;

SELECT *
FROM nhan_vien
ORDER BY luong DESC
LIMIT 3;