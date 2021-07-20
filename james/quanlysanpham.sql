create database quanlysnapham;

create table sanpham(
id int primary key not null,
tensp nvarchar(30) not null,
gia double,
madein nvarchar(30) not null
);

create table hoadon(
id int primary key not null,
ngay datetime,
tonggia double,
idkh int not null,
foreign key (idkh) references khachhang (idkh)
);

create table hoadonchitiet(
id int not null primary key,
idsp int not null,
foreign key (idsp) references sanpham (id),
idhd int not null,
foreign key (idhd) references hoadon (id),
idkh int not null,
foreign key (idkh) references khachhang (idkh),
soluong int not null
);

create table khachhang(
idkh int not null primary key,
hoten nvarchar(30) not null,
diachi nvarchar(30)
);

-- in hoa don va gia tri ban ra trong ngay 19 va 20.

select count(hoadon.id) as "số hóa đơn", hoadon.tonggia as " trị giá hóa đơn" from hoadon
where hoadon.ngay = "2006/6/19" or hoadon.ngay = "2006/6/20"
group by hoadon.id;

select count(hoadon.id), hoadon.tonggia 
from hoadon where hoadon.ngay between '2006/6/1' and "2006/6/30";

-- 8

select khachhang.idkh as "mã khách hàng", khachhang.hoten as "họ tên"
from khachhang join hoadon on khachhang.idkh = hoadon.idkh 
where hoadon.ngay = "2006/6/20";

-- 10

select sanpham.id as "mã sản phâm", sanpham.tensp as " tên sản phẩm" 
from sanpham join hoadonchitiet on sanpham.id = hoadonchitiet.idsp
join khachhang on hoadonchitiet.idkh = khachhang.idkh
join hoadon on hoadon.id = hoadonchitiet.idhd
where khachhang.hoten ="vo hai" and hoadon.ngay = "2006/6/20";

-- 11

select count(hoadon.id), sanpham.tensp 
from hoadon join hoadonchitiet on hoadon.id = hoadonchitiet.idhd
join sanpham on sanpham.id = hoadonchitiet.idsp
where sanpham.tensp = "máy giặt" or sanpham.tensp = "tủ lạnh"
group by sanpham.tensp;

-- 12

select count(hoadon.id), sanpham.tensp 
from hoadon join hoadonchitiet on hoadon.id = hoadonchitiet.idhd
join sanpham on sanpham.id = hoadonchitiet.idsp
where (sanpham.tensp = "máy giặt" or sanpham.tensp = "tủ lạnh") and hoadonchitiet.soluong >=10
group by sanpham.tensp;

-- 13

-- 15
select sanpham.id, sanpham.tensp from sanpham
where sanpham.id not in 
	(select sanpham.id
	from sanpham join hoadonchitiet on sanpham.id = hoadonchitiet.idsp
	group by sanpham.id);

-- 16 
select sanpham.id, sanpham.tensp from sanpham
where sanpham.id not in 
	(select sanpham.id
	from sanpham join hoadonchitiet on sanpham.id = hoadonchitiet.idsp
	group by sanpham.id);
    
-- 18 

-- 22
 select max(hoadon.tonggia), min(hoadon.tonggia) from hoadon;
 
 -- 23 
 select avg(hoadon.tonggia) as 'tổng doanh thu năm 2016' from hoadon where hoadon.ngay between "2006/6/1" and "2006/6/30";
 
 -- 24 doanh thu ban hang 2016
 select sum(hoadon.tonggia) from hoadon where hoadon.ngay between "2006/1/1" and "2006/12/30";
 
-- 25
select hoadon.id as 'mã hóa đơn' from hoadon where hoadon.tonggia = (select max(hoadon.tonggia) from hoadon);

-- 26 X
select khachhang.hoten from khach hang
join hoadonchitiet on hoadonchitiet.idkh = khachhang.idkh
join hoadon on hoadonchitiet.idhd = hoadon.id 
where hoadon.tonggia = ( select max(hoadon.tonggia) from hoadon);


-- 28 X
select sanpham.id, sanpham.tensp from sanpham
where sanpham.gia in (select sanpham.gia from sanpham order by sanpham.gia desc limit 3  );

-- 32 tổng sane phẩm giá <32
select count(sanpham.gia) as"tổng sản phẩm" from sanpham where sanpham.gia > 300;

-- 33 tổng sản phẩm theo từng giá
select  sanpham.gia ,count(sanpham.gia) as " số lượng"
from sanpham
group by sanpham.gia;

-- 34 sản phẩm giá bán cao nhất, thấp nhất, trung bình của sản phẩm bắt đầu bằng chữ M
select max(sanpham.gia), min( sanpham.gia), avg(sanpham.gia), sanpham.tensp
from sanpham where sanpham.tensp like "m%" group by sanpham.tensp;

-- 35 doanh thu mỗi ngày
select hoadon.ngay, sum(hoadon.tonggia)
from hoadon group by hoadon.ngay
order by sum(hoadon.tonggia) desc;

-- 36 tổng số lượng từng sản phẩm bán ra trong tháng 6

select sum(hoadonchitiet.soluong), hoadonchitiet.idsp 
from hoadonchitiet join hoadon on hoadon.id = hoadonchitiet.idhd
where hoadon.ngay between "2006/6/1" and '2006/6/30'
group by hoadonchitiet.idsp;

-- 37 doanh thu bán hàng thừng tháng



