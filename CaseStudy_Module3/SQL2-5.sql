use casestudy_furama_management;

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K”
select * from employee
where( name_employee like ('h%')
or name_employee like ('k%') 
or name_employee like ('t%'))
and char_length(name_employee) <= 15 ;

-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * , year(current_date()) - year(date_of_birth) as 'age' from customer
where year(current_date()) - year(date_of_birth) > 18 and year(current_date()) - year(date_of_birth) < 50
and (address like ('%Đà Nẵng') or address like ('%Quảng Trị'));

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select c.* , count(ct.id_customer) as 'order' from customer c  
inner join type_customer t on c.id_type_customer = t.id_type_customer
inner join contract ct on ct.id_customer = c.id_customer
where t.name_type_customer ='Diamond'
group by c.id_customer
order by count(ct.id_customer)
;

-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
--  tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select c.id_customer , c.name_customer , tc.name_type_customer , ct.id_contract , sv.name_service , ct.date_start_contract from customer c
join type_customer tc on c.id_type_customer = tc.id_type_customer
join contract ct on c.id_customer = ct.id_customer
join service_furama sv on ct.id_service = sv.id_service
;
