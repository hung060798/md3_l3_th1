create database test2;

create table students (
studentid int(4) not null primary key,
studentName varchar(50) not null,
age int(4),
email varchar(100)
);

create table classes(
classid int(4) primary key,
className nvarchar(50)
);

create table ClassStudent(
csId int(4) not null primary key,
studentid int not null,
classid int not null,
foreign key (classid) references classes (classid),
foreign key (studentid) references students (studentid) 

);

create table Subjects(
subjectid int(4) primary key,
subjectName nvarchar(50)
);

create table marks(
markid int(4) primary key,
mark int(4),
subjectId int not null,
studentId int(4),
foreign key (subjectId) references Subjects (subjectid),
foreign key (studentId) references students (studentid)
);

-- 1 hiển thi danh sách tất cả các học viên

select* from students;

-- 2  Hien thi danh sach tat ca cac mon hoc

create view viewfull as
select * from (classes, students)
join classstudent using (classid, studentid);

create view viewsub as
select * from ( students, subjects)
join marks using (studentid, subjectid);

select * from subjects ;

-- 3 Tinh diem trung binh 

select avg(mark) from marks;

-- 4 Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat

select studentName, subjectName, mark 
from viewsub where mark = (select max(mark) from viewsub );

-- 5 Danh so thu tu cua diem theo chieu giam

select mark, markid from marks 
group by mark 
order by mark desc;

-- 6 Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)

alter table subjects modify subjectName nvarchar(255);


-- 7 Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
update subjects set subjectName = concat(' day la mon hoc', subjectName) where subjectid = 1;

-- 8 Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
 alter table  students 
 add check (age > 15 and age <50);

-- 9 Loai bo tat ca quan he giua cac bang

alter table classstudent 
drop foreign key classstudent_ibfk_1,
drop foreign key classstudent_ibfk_2;

alter table marks 
drop foreign key marks_ibfk_1,
drop foreign key marks_ibfk_2;

-- 10 Xoa hoc vien co StudentID la 1

delete from students where studentid = 1;

-- 11 Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table Students
add Status bit default 1;

-- 12:Cap nhap gia tri Status trong bang Student thanh 0
update Students
set Status = 0 where studentid not in (0)






