create database student_management ;
use student_management;
set sql_safe_updates = 0 ;
create table class(
id int primary key auto_increment,
name_class varchar(45) not null
);
create table teacher(
id int primary key auto_increment,
name_teacher varchar(45) not null ,
age int ,
country varchar(45) not null
);
insert into teacher (name_teacher,age,country)
value('Nguyen hung', 12 , 'ZietLam' );

select * from teacher ; 
select name_teacher from teacher;
select age from teacher;

delete from teacher 
where id = 1 ;
update teacher 
set name_teacher = 'lo'
where id = 1
;
set sql_safe_updates = 1 ;

alter table teacher 
add email varchar(50) ;
set sql_safe_updates = 0 ;
update teacher 
set email = 'C1222@gmail.com';

select * from teacher ;
delete from teacher;
insert into teacher (email)
value('C11@gmail.com');

update teacher 
set name_teacher = 'đức'
where id = 3;
update teacher
set name_teacher ='hoàng'
where id =4 ;

alter table teacher 
add phone int ;
select * from teacher;

update teacher 
set phone = '123445'
where id = 3;

select phone from teacher ;

alter table teacher drop column phone ;
select * from teacher;
delete from teacher ;
select * from teacher;
insert into teacher (name_teacher , age , country , email)
value ('HungHandSome' , 12,'Lào', 'hung@gmail.com');

select * from teacher ;

delete from teacher where email = 'hung@gmail.com';
update teacher
set email = 'tri@gmail.com'
where id = 11;

select * from teacher ;
set sql_safe_updates = 0 ;
alter table class
rename to classes;
set sql_safe_updates = 1;
select * from classes;

