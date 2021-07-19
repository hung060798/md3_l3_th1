use quanlisinhvien;

select Address, count(StudentId) as "số lượng học sinh"
from student
group by Address;

select S.studentId, S.studentName, avg(mark)
from student S join mark M on S.studentId = M.StudentId
group by S.StudentId, S.StudentName;

select S.studentId, S.studentName, avg(mark)
from student S join mark M on S.studentId = M.StudentId
group by S.StudentId, S.StudentName
having avg(mark) <10;

select S.studentId, S.studentName, avg(mark)
from student S join mark M on S.studentId = M.StudentId
group by S.StudentId, S.StudentName
having avg(mark) >= all(select avg(mark) from mark group by mark.studentId);
