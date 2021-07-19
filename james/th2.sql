use quanlisinhvien;

select * from student where status = true;

select * from subject where Credit < 10;

select S.StudentId, S.Studentname, C.ClassName
from student S inner join class C on S.ClassId = C.ClassID 
where C.ClassName = "a1";

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';