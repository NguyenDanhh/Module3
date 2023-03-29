use student_manager;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject
 where credit = (select max(credit) from subject);
 
 -- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject sj
inner join mark m on sj.sub_id = m.sub_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*, avg(mark) from student s
inner join mark m on s.student_id = m.student_id
group by student_id, student_name
order by avg(mark) desc;