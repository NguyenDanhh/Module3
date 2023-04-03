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

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select ac.* from accompanying_services ac
join contract_details cd on ac.id_service = cd.id_service
join contract ct on ct.id_contract = cd.id_contract 
join customer c on c.id_customer = ct.id_customer 
join type_customer tc on c.id_type_customer = tc.id_type_customer
where tc.name_type_customer = 'Diamond' and (c.address like ('%Vinh') or c.address like ('%Quảng Ngãi'));

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
 -- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các
-- dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select ct.id_contract , e.name_employee , c.name_customer , c.phone , sv.name_service ,
ifnull(sum(cd.amount) , 0) as 'count' , ct.deposit from contract ct
left join employee e on ct.id_employee = e.id_employee
left join customer c on c.id_customer = ct.id_customer 
left join service_furama sv on ct.id_service = sv.id_service
left join contract_details cd on ct.id_contract = cd.id_contract
left join accompanying_services ac on cd.id_service = ac.id_service
where (year(ct.date_start_contract) = '2020' and month(ct.date_start_contract) in (10,11,12) )
and year(ct.date_start_contract) not in (
select ct.id_contract from contract ct
where year(ct.date_start_contract) = '2021' and month(ct.date_start_contract) in (1,2,3,4,5,6))
group by ct.id_contract
;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select ac.id_service , ac.name_service  , sum(cd.amount) from accompanying_services ac 
join contract_details cd on cd.id_service = ac.id_service
join contract ct on ct.id_contract = cd.id_contract 
group by ac.id_service
having sum(cd.amount) = '15'
;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu,
--  ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select ct.id_contract , ts.name_type_service , ac.name_service ,count(ac.id_service)
 from accompanying_services ac
join contract_details cd on ac.id_service = cd.id_service 
join contract ct on cd.id_contract = ct.id_contract 
join service_furama sv on ct.id_service = sv.id_service 
join type_service ts on sv.id_type_service = ts.id_type_service
group by ac.name_service
having count(ac.id_service) = '1'
order by ct.id_contract
;
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select e.id_employee , e.name_employee , qa.name_qualification , pc.name_partscode , e.phone ,  e.address   from employee e 
left join qualification_employee qa on e.id_qualification = qa.id_qualification
left join partscode_employee pc on e.id_partscode = pc.id_partscode
join contract ct on e.id_employee = ct.id_employee
group by e.id_employee 
having  count(e.id_employee) <= 3
;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select e.id_employee,e.name_employee from employee e
left join contract ct on ct.id_employee= e.id_employee
where ifnull(ct.id_contract,0)=0;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- customer, type_customer,contract,service,contract_details,accompaning
select c.id_customer,c.name_customer,tc.id_type_customer,tc.name_type_customer,ct.id_contract,
cd.id_contract_details,acs.id_service,((ct.deposit+sf.rental_cost)+ ifnull(sum(cd.amount*acs.price),0)) as 'total_bill' from customer c
join type_customer tc on tc.id_type_customer=c.id_type_customer
join contract ct on ct.id_customer=c.id_customer
join service_furama sf on sf.id_service= ct.id_service
join contract_details cd on cd.id_contract=ct.id_contract
join accompanying_services acs on acs.id_service=cd.id_service
group by c.id_customer
having total_bill >= 10000000
;

 set global sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 
select c.id_customer,c.name_customer from customer c
left join contract ct on ct.id_customer=c.id_customer
where year(date_start_contract) < 2021
;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
select*from accompanying_services;
select acs.id_service,acs.name_service,cd.amount,acs.price,ct.id_contract from accompanying_services acs
join contract_details cd on cd.id_service= acs.id_service
join contract ct on ct.id_contract= cd.id_contract
group by acs.id_service
having cd.amount > 10
;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 	e.id_employee , e.name_employee ,e.email,e.phone ,e.date_of_birth  ,e.address from employee e
left join contract ct on ct.id_employee= e.id_employee
left join customer c on c.id_customer= ct.id_customer
group by e.id_employee 
union 
select c.id_customer,c.name_customer,c.email,c.phone,c.date_of_birth,c.address
from customer c;