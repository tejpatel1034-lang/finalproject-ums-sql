-- create database
create database university;

-- create students table
create table students (
    studentid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100),
    birthdate date,
    enrollmentdate date
);                                            

-- insert into students
insert into students values
(1,'john','doe','john@gmail.com','2000-01-15','2022-08-01'),
(2,'jane','smith','jane@gmail.com','1999-05-25','2021-08-01'),
(3,'tej','patel','tej@gmail.com','2001-03-10','2023-07-01'),
(4,'diya','patel','diya@gmail.com','2002-06-20','2023-08-14'),
(5,'heeva','patel','heeva@gmail.com','2001-09-09','2022-06-15'),
(6,'vandita','patel','vandita@patel.com','2000-11-11','2024-01-10'),
(7,'dhruvi','patel','rahul@gmail.com','2000-02-02','2020-06-01'),
(8,'pooja','patel','aman@gmail.com','1998-07-12','2019-06-01'),
(9,'reni','patel','neha@gmail.com','2001-08-19','2023-01-10'),
(10,'gresi','patel','karan@gmail.com','1999-09-09','2022-05-05'),
(11,'meet','patel','pooja@gmail.com','2000-03-03','2021-07-07'),
(12,'jeeny','patel','vikas@gmail.com','1997-04-04','2018-06-06'),
(13,'anita','patel','anita@gmail.com','2002-10-10','2023-09-09'),
(14,'rohit','sharma','rohit@gmail.com','1996-11-11','2017-06-06');

-- create departments table
create table departments (departmentid int primary key,departmentname varchar(50));

-- insert into departments
insert into departments values
(1,'computer science'),
(2,'mathematics'),
(3,'physics'),
(4,'commerce'),
(5,'arts');

-- create courses table
create table courses (
    courseid int primary key,
    coursename varchar(100),
    departmentid int,
    credits int,
    foreign key (departmentid) references departments(departmentid)
);

-- insert into courses
insert into courses values
(101,'sql',1,3),
(102,'data structures',1,4),
(103,'calculus',2,5),
(104,'algebra',2,4),
(105,'mechanics',3,3),
(106,'statistics',2,5);

-- create instructors table
create table instructors (
    instructorid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100),
    salary int,
    departmentid int,
    foreign key (departmentid) references departments(departmentid)
);

-- insert into instructors
insert into instructors values
(1,'alice','johnson','alice@uni.com',60000,1),
(2,'bob','lee','bob@uni.com',70000,2),
(3,'tej','patel','tej@uni.com',50000,1),
(4,'diya','patel','diya@uni.com',80000,1),
(5,'vandita','patel','vandita@uni.com',55000,2);

-- create enrollments table
create table enrollments (
    enrollmentid int primary key,
    studentid int,
    courseid int,
    enrollmentdate date,
    foreign key (studentid) references students(studentid),
    foreign key (courseid) references courses(courseid)
);

-- insert into enrollments
insert into enrollments values
(1,1,101,'2022-08-01'),(2,2,102,'2021-08-01'),(3,3,101,'2023-07-01'),(4,3,102,'2023-07-01'),(5,4,103,'2020-07-01'),(6,5,101,'2024-01-10'),(7,6,101,'2022-06-15'),
(8,6,102,'2022-06-15'),(9,1,102,'2022-08-01'),(10,2,101,'2021-08-01'),(11,7,101,'2020-06-01'),(12,8,101,'2019-06-01'),(13,9,101,'2023-01-10'),(14,10,101,'2022-05-05'),
(15,11,101,'2021-07-07'),(16,12,101,'2018-06-06'),(17,13,101,'2023-09-09'),(18,14,101,'2017-06-06'),(19,7,102,'2020-06-01'),(20,8,102,'2019-06-01'),(21,9,102,'2023-01-10'),
(22,10,102,'2022-05-05'),(23,11,102,'2021-07-07'),(24,12,102,'2018-06-06'),(25,7,103,'2020-06-01'),(26,8,104,'2019-06-01'),(27,9,105,'2023-01-10'),(28,10,106,'2022-05-05');

-- 1.perform crud operations on all tables

-- insert
insert into students values (15,'heer','patel','heer@gmail.com','2002-02-02','2024-01-01');
-- read
select * from students;
-- update
update students set firstname='jiyana' where studentid=15;
-- delete
delete from students where studentid=15;

-- 2.retrieve students who enrolled after 2022
select * from students where enrollmentdate > '2022-12-31';

-- 3.retrieve courses offered by the mathematics department with a limit of 5 courses
select c.* from courses c
join departments d on c.departmentid = d.departmentid
where d.departmentname = 'mathematics'
limit 5;

-- 4.get the number of students enrolled in each course, filtering for courses with more than 5 students
select courseid, count(studentid) as total_students
from enrollments
group by courseid
having count(studentid) > 5;

-- 5.find students who are enrolled in both introduction to sql and data structures
select s.*
from students s
where s.studentid in (
    select studentid from enrollments where courseid = 101
)
and s.studentid in (
    select studentid from enrollments where courseid = 102
);

-- 6.find students who are either enrolled in introduction to sql or data structures
select distinct s.*
from students s
join enrollments e on s.studentid = e.studentid
where e.courseid in (101,102);

-- 7.calculate the average number of credits for all courses
select avg(credits) as avg_credits from courses;

-- 8.find the maximum salary of instructors in the computer science department
select max(i.salary) as max_salary
from instructors i
join departments d on i.departmentid = d.departmentid
where d.departmentname = 'computer science';

-- 9.count the number of students enrolled in each department
select d.departmentname, count(e.studentid) as total_students
from departments d
join courses c on d.departmentid = c.departmentid
join enrollments e on c.courseid = e.courseid
group by d.departmentname;

-- 10.inner join: retrieve students and their corresponding courses
select s.firstname, c.coursename
from students s
inner join enrollments e on s.studentid = e.studentid
inner join courses c on e.courseid = c.courseid;

-- 11.left join: retrieve all students and their corresponding courses, if any
select s.firstname, c.coursename
from students s
left join enrollments e on s.studentid = e.studentid
left join courses c on e.courseid = c.courseid;

-- 12.subquery: find students enrolled in courses that have more than 10 students
select * from students
where studentid in (select studentid from enrollments
    where courseid in (
        select courseid from enrollments
        group by courseid
        having count(studentid) > 10
    )
);

-- 13.extract the year from the enrollmentdate of students
select studentid, year(enrollmentdate) as enrollment_year from students;

-- 14.concatenate the instructor's first and last name
select concat(firstname,' ',lastname) as full_name from instructors;

-- 15.calculate the running total of students enrolled in courses
select courseid, count(studentid) over (order by courseid) as running_total from enrollments;

-- 16.label students as senior or junior
select studentid, enrollmentdate,
case 
    when year(curdate()) - year(enrollmentdate) > 4 then 'senior'
    else 'junior'
end as status
from students;