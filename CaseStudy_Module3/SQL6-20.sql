use casestudy_furama_management;
--  6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các 
-- loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select sv.id_service , sv.name_service , sv.usable_area , sv.rental_cost , ts.name_type_service from service_furama sv
join type_service ts on sv.id_type_service = ts.id_type_service
join contract ct on ct.id_service = sv.id_service 
where sv.id_service not in(
select sv.id_service from service_furama sv
join type_service ts on sv.id_type_service = ts.id_type_service
join contract ct on ct.id_service = sv.id_service
where year(ct.date_start_contract) = '2021' and month(ct.date_start_contract) in (1,2,3)
)
group by sv.id_service
order by sv.usable_area desc
;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại 
-- dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select sv.id_service , sv.name_service , sv.usable_area , sv.rental_cost , ts.name_type_service from service_furama sv
join type_service ts on sv.id_type_service = ts.id_type_service
join contract ct on ct.id_service = sv.id_service 
where sv.id_service not in(
select sv.id_service from service_furama sv
join type_service ts on sv.id_type_service = ts.id_type_service
join contract ct on ct.id_service = sv.id_service
where year(ct.date_start_contract) = '2021' 
)
group by sv.id_service
order by sv.usable_area desc
;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cách 1 :
select name_customer from customer 
union 
select name_customer from customer;
-- Cách 2 : 
select  distinct name_customer from customer;
-- Cách 3 : 
select name_customer  from customer
group by name_customer;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ct.date_start_contract) as 'month' , count(ct.id_customer) as 'amount' from contract ct
where year(ct.date_start_contract) = '2021'
group by month(ct.date_start_contract)  
order by month(ct.date_start_contract)
;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select ct.id_contract , ct.date_start_contract , ct.date_end_contract , ct.deposit , ifnull(sum(cd.amount),  0) as 'amount' from contract ct
left join contract_details cd on ct.id_contract = cd.id_contract
left join accompanying_services ac on cd.id_service = ac.id_service
group by ct.id_contract
;