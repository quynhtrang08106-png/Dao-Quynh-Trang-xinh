Create database Truy_van_du_lieu_nang_cao;
use Truy_van_du_lieu_nang_cao;

-- Bài 1
-- Tạo bảng san_pham
CREATE TABLE san_pham (
    id INT PRIMARY KEY,
    ten_san_pham VARCHAR(255),
    danh_muc VARCHAR(100),
    gia_ban INT,
    so_luong_ton INT
);

INSERT INTO san_pham (id, ten_san_pham, danh_muc, gia_ban, so_luong_ton) VALUES
(1, 'Laptop Dell XPS 13', 'Laptop', 28000000, 15),
(2, 'iPhone 14 Pro Max', 'Điện thoại', 32000000, 30),
(3, 'Bàn phím cơ Logitech', 'Phụ kiện', 2500000, 50),
(4, 'Laptop MacBook Air M2', 'Laptop', 29500000, 20),
(5, 'Samsung Galaxy S23 Ultra', 'Điện thoại', 26000000, 25),
(6, 'Chuột không dây Fuhlen', 'Phụ kiện', 450000, 100),
(7, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8500000, 40),
(8, 'Laptop HP Envy 15', 'Laptop', 24000000, 18);

-- Tìm các sản phẩm có giá bán nằm trong khoảng từ 20,000,000 đến 30,000,000. (Sử dụng BETWEEN)
SELECT * FROM san_pham WHERE gia_ban BETWEEN 20000000 AND 30000000;

-- Tìm tất cả các sản phẩm có tên chứa từ "Laptop". (Sử dụng LIKE)
SELECT * FROM san_pham WHERE ten_san_pham LIKE '%Laptop%';

-- Đếm tổng số sản phẩm thuộc danh mục 'Phụ kiện'. Đặt tên cột kết quả là so_luong_phu_kien. (Sử dụng COUNT và AS)
SELECT COUNT(*) AS so_luong_phu_kien FROM san_pham WHERE danh_muc = 'Phụ kiện';

-- Liệt kê 3 sản phẩm có giá bán cao nhất. (Sử dụng ORDER BY và LIMIT)
SELECT * FROM san_pham ORDER BY gia_ban DESC LIMIT 3;


-- Bài 2
CREATE TABLE sach (
    id INT PRIMARY KEY,
    tieu_de VARCHAR(255),
    tac_gia VARCHAR(255),
    the_loai VARCHAR(100),
    nam_xuat_ban INT,
    trang_thai VARCHAR(50)
);

INSERT INTO sach (id, tieu_de, tac_gia, the_loai, nam_xuat_ban, trang_thai) VALUES
(1, 'Dế Mèn phiêu lưu ký', 'Tô Hoài', 'Văn học', 1941, 'Có sẵn'),
(2, 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'Văn học', 2008, 'Đã mượn'),
(3, 'Số đỏ', 'Vũ Trọng Phụng', 'Tiểu thuyết', 1936, 'Có sẵn'),
(4, 'Nhà giả kim', 'Paulo Coelho', 'Tiểu thuyết', 1988, 'Có sẵn'),
(5, 'Mắt biếc', 'Nguyễn Nhật Ánh', 'Văn học', 1990, 'Đã mượn'),
(6, 'Trên đường băng', 'Tony Buổi Sáng', 'Kỹ năng sống', 2015, 'Có sẵn'),
(7, 'Đắc nhân tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936, 'Có sẵn');

-- Tìm tất cả các cuốn sách của tác giả 'Nguyễn Nhật Ánh'.
SELECT * FROM sach WHERE tac_gia = 'Nguyễn Nhật Ánh';

-- Liệt kê tất cả các cuốn sách thuộc thể loại 'Văn học' hoặc 'Tiểu thuyết'. (Sử dụng IN)
SELECT * FROM sach WHERE the_loai IN ('Văn học', 'Tiểu thuyết');

-- Đếm số lượng sách hiện đang ở trạng thái 'Đã mượn'.
SELECT COUNT(*) AS so_luong_da_muon FROM sach WHERE trang_thai = 'Đã mượn';

-- Liệt kê 2 cuốn sách cũ nhất trong thư viện (dựa vào năm xuất bản).
SELECT * FROM sach ORDER BY nam_xuat_ban ASC LIMIT 2;


-- Bài 3
CREATE TABLE phim (
    id INT PRIMARY KEY,
    tieu_de VARCHAR(255),
    dao_dien VARCHAR(255),
    nam_phat_hanh INT,
    the_loai VARCHAR(100),
    diem_danh_gia DECIMAL(3, 1)
);

INSERT INTO phim (id, tieu_de, dao_dien, nam_phat_hanh, the_loai, diem_danh_gia) VALUES
(1, 'Inception', 'Christopher Nolan', 2010, 'Khoa học viễn tưởng', 8.8),
(2, 'The Dark Knight', 'Christopher Nolan', 2008, 'Hành động', 9.0),
(3, 'Parasite', 'Bong Joon Ho', 2019, 'Tâm lý', 8.5),
(4, 'Mắt Biếc', 'Victor Vũ', 2019, 'Lãng mạn', 7.8),
(5, 'Interstellar', 'Christopher Nolan', 2014, 'Khoa học viễn tưởng', 8.6),
(6, 'Avengers: Endgame', 'Anthony Russo', 2019, 'Hành động', 8.4),
(7, 'Joker', 'Todd Phillips', 2019, 'Tâm lý', 8.4);

-- Tìm tất cả các bộ phim của đạo diễn 'Christopher Nolan'.
SELECT * FROM phim WHERE dao_dien = 'Christopher Nolan';

-- Liệt kê các bộ phim được phát hành trong thập kỷ 2010 (từ năm 2010 đến 2019). (Sử dụng BETWEEN)
SELECT * FROM phim WHERE nam_phat_hanh BETWEEN 2010 AND 2019;

-- Tính điểm đánh giá trung bình của tất cả các bộ phim trong danh sách. Đặt tên cột là diem_trung_binh. (Sử dụng AVG và AS)
SELECT AVG(diem_danh_gia) AS diem_trung_binh FROM phim;

-- Liệt kê 3 bộ phim có điểm đánh giá cao nhất, sắp xếp theo thứ tự điểm từ cao đến thấp.
SELECT * FROM phim ORDER BY diem_danh_gia DESC LIMIT 3;


-- Bài 4
CREATE TABLE mon_an (
    id INT PRIMARY KEY,
    ten_mon VARCHAR(255),
    danh_muc VARCHAR(100),
    gia_tien INT,
    trang_thai_phuc_vu VARCHAR(50)
);

INSERT INTO mon_an (id, ten_mon, danh_muc, gia_tien, trang_thai_phuc_vu) VALUES
(1, 'Phở Bò Tái', 'Món chính', 50000, 'Đang phục vụ'),
(2, 'Cơm Gà Xối Mỡ', 'Món chính', 45000, 'Đang phục vụ'),
(3, 'Gỏi Cuốn Tôm Thịt', 'Khai vị', 30000, 'Đang phục vụ'),
(4, 'Bún Bò Huế', 'Món chính', 55000, 'Tạm ngưng'),
(5, 'Nước Cam Ép', 'Đồ uống', 25000, 'Đang phục vụ'),
(6, 'Chè Hạt Sen', 'Tráng miệng', 20000, 'Đang phục vụ'),
(7, 'Cà Phê Sữa Đá', 'Đồ uống', 22000, 'Đang phục vụ'),
(8, 'Bò Lúc Lắc', 'Món chính', 70000, 'Đang phục vụ');

-- Liệt kê các món ăn thuộc danh mục 'Món chính' hoặc 'Khai vị'. (Sử dụng IN)
SELECT * FROM mon_an WHERE danh_muc IN ('Món chính', 'Khai vị');

-- Tìm món ăn có giá rẻ nhất trong số các món đang được phục vụ ('Đang phục vụ'). (Kết hợp MIN và WHERE)
SELECT * FROM mon_an WHERE trang_thai_phuc_vu = 'Đang phục vụ' ORDER BY gia_tien ASC LIMIT 1;

-- Tìm tất cả các món ăn có chữ 'Bò' trong tên món. (Sử dụng LIKE)
SELECT * FROM mon_an WHERE ten_mon LIKE '%Bò%';

-- Liệt kê 3 món ăn có giá tiền từ thấp đến cao nhất. (Sử dụng ORDER BY và LIMIT)
SELECT * FROM mon_an ORDER BY gia_tien ASC LIMIT 3;

-- Bài 5
CREATE TABLE don_hang (
    id_don_hang INT PRIMARY KEY,
    id_khach_hang INT,
    danh_muc VARCHAR(100),
    tong_tien INT,
    ngay_dat DATE,
    trang_thai VARCHAR(50)
);

INSERT INTO don_hang (id_don_hang, id_khach_hang, danh_muc, tong_tien, ngay_dat, trang_thai) VALUES
(1, 101, 'Dien tu', 15000000, '2023-01-15', 'Hoan thanh'),
(2, 102, 'Thoi trang', 2500000, '2023-01-20', 'Hoan thanh'),
(3, 101, 'Dien tu', 8000000, '2023-02-10', 'Hoan thanh'),
(4, 103, 'Gia dung', 5000000, '2023-02-12', 'Da huy'),
(5, 102, 'Thoi trang', 3000000, '2023-03-05', 'Hoan thanh'),
(6, 101, 'Gia dung', 4500000, '2023-03-08', 'Hoan thanh'),
(7, 104, 'Dien tu', 22000000, '2023-04-18', 'Hoan thanh'),
(8, 103, 'Thoi trang', 1800000, '2023-04-22', 'Hoan thanh'),
(9, 102, 'Dien tu', 12000000, '2022-12-10', 'Hoan thanh');

-- Thống kê tổng số tiền chi tiêu cho mỗi khách hàng. Hiển thị id_khach_hang và tổng số tiền của họ, đặt tên cột tổng tiền là tong_chi_tieu. Sắp xếp kết quả theo tổng chi tiêu giảm dần.
SELECT id_khach_hang, SUM(tong_tien) AS tong_chi_tieu FROM don_hang GROUP BY id_khach_hang ORDER BY tong_chi_tieu DESC;

-- Đếm số lượng đơn hàng theo từng danh mục sản phẩm. Hiển thị danh_muc và số lượng đơn hàng tương ứng, đặt tên cột số lượng là so_luong_don.
SELECT danh_muc, COUNT(*) AS so_luong_don FROM don_hang GROUP BY danh_muc;

-- Tìm những khách hàng đã đặt nhiều hơn 1 đơn hàng. Chỉ hiển thị id_khach_hang của những khách hàng này. (Sử dụng GROUP BY và HAVING)
SELECT id_khach_hang FROM don_hang GROUP BY id_khach_hang HAVING COUNT(*) > 1;

-- Liệt kê các danh mục có tổng doanh thu (chỉ tính các đơn 'Hoan thanh') lớn hơn 10,000,000. Hiển thị danh_muc và tong_doanh_thu. (Kết hợp WHERE, GROUP BY, HAVING)
SELECT danh_muc, SUM(tong_tien) AS tong_doanh_thu FROM don_hang WHERE trang_thai = 'Hoan thanh' GROUP BY danh_muc HAVING SUM(tong_tien) > 10000000;

