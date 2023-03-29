create database build_database ;
use build_database ;

create table customer (
id int primary key auto_increment,
name_customer varchar(45) not null ,
age int 
);

create table order_product(
id int primary key auto_increment,
id_customer int ,
order_date date,
total_price double,
foreign key (id_customer) references customer(id)
);

create table product(
id int primary key auto_increment,
name_product varchar(45) not null ,
price double
);

create table order_detail(
order_id int ,
product_id int,
order_quantity varchar(45),
primary key (order_id ,product_id),
foreign key(order_id) references order_product(id),
foreign key(product_id) references product(id)
);

insert into customer(name_customer , age)
value ('Minh Quan' , 10) ,
		('Ngoc Oanh' , 20),
        ('Hong Ha' , 50);
select * from customer;

insert into order_product(id_customer , order_date )
value (1,'200603/21'),
		(2,'2006-3-23'),
        (1,'2006-3-16');
select * from order_product;

insert into product( name_product,price)
value ('May Giat', 3),
		('Tu Lanh',5),
        ('Dieu Hoa',7),
        ('Quat',1),
        ('Bep Dien',2);
select * from product;

insert into order_detail( order_id,product_id,order_quantity)
value (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
select * from order_product;

select
c.id, c.name_customer, c.age , p.name_product
from customer c
join order_product o
on c.id= o.id
join order_detail od
on od.order_id = c.id
join product p
on p.id = od.order_id;

select c.name_customer
from customer c
left join order_product on c.id = order_product.id_customer
where order_product.id is null;

select order_product.id, order_product.order_date, sum(order_detail.order_quantity*product.price) as total_price from order_product
inner join customer on customer.id = order_product.id_customer
inner join order_detail on order_detail.order_id = order_product.id
inner join product on order_detail.product_id = product.id
group by order_product.id;