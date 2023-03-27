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
