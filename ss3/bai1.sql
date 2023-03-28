create database student_manager;
use student_manager;
create table Class (
    class_Id int not null auto_increment primary key,
    class_name varchar(60) not null,
    start_date datetime not null,
    status bit
);
create table Student
(
    student_id int not null auto_increment primary key,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status bit,
    class_id int not null,
    foreign key (class_id) references class (class_iD)
);

create table Subject
(
    sub_id int not null auto_increment primary key,
    sub_name varchar(30) not null,
    credit tinyint not null default 1 check ( credit >= 1 ),
    status bit default 1
);

create table Mark
(
    mark_id int not null auto_increment primary key,
    sub_id int not null,
    student_id int not null,
    mark float   default 0 check ( Mark between 0 and 100),
    exam_times tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references Subject (sub_id),
    foreign key (student_id) references Student (student_id)
);

insert into Class
values (1, 'A1', '2008-12-20', 1);

insert into Class
values (4, 'A4', '2012-11-22', 1);

insert into Class
values (3, 'B3', current_date, 0);

insert into Student (student_name, address, phone, status, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);

insert into Student (student_name, address, status, class_id)
values ('Hoa', 'Hai phong', 1, 1);

insert into Student (student_name, address, phone, status, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
insert into Mark (sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

select * from Student -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’--
where Student.student_name like 'h%';

select * from Class -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.--
where Class.start_date like '%-12-%';

select * from Subject -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.--
where Subject.credit >= 3 and Subject.credit <= 5;

select * from Student 
inner join Class 
on Student.class_id = Class.class_id;

set sql_safe_updates = 0;
update Student -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2. --
set class_id = 2 
where student_name = 'hung';
set sql_safe_updates = 1;

select s.student_name , sj.sub_name , m.mark 
from Student s
inner join Subject sj
on s.student_id = sj.sub_id
join Mark m
on sj.sub_id = m.mark_id
order by m.mark desc;


