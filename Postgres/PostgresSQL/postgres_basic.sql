/*
    - select now();
    - Data types:
	    * integer 
	    * real
	    * serial (same as integer but with auto increment)
	    * numeric
	    * varchar(size)
	    * char (when I know the size)
	    * text = when we have no idea about the size
	    * boolean
	    * date
	    * time
	    * timestamp
*/

drop table student;

create database backoffice with owner = postgres encoding = 'UTF-8' connection limit = -1;

create table student(
	id serial,
	name varchar(255),
	cpf char(11),
	obs text,
	age integer,
	money numeric(10,2), -- 12345678.90 
	height real,
	active boolean,
	dof date,
	lecture_time time,
	enroll_time timestamp
);

insert into student (
	name,
	cpf,
	obs,
	age,
	money,
	height,
	active,
	dof,
	lecture_time,
	enroll_time
) values (
	'Felipe',
	'12345678901',
	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
	33,
	100.50,
	1.66,
	true,
	'1991-03-11',
	'17:30:00',
	'2020-02-08 12:32:45'
);

insert into student (name, obs) values ('Vinicius Dias', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

insert into student (name, obs) values ('Nico Steppat', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

insert into student (name, obs) values ('Joao Roberto', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

insert into student (name, obs) values ('Diego', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

select 
	name as "Student Name",
	obs as "Details about the stupid"
from student where id = 1;

update student 
	set name = 'Felipe Vieira Mota'
where id = 1;


update student 
	set cpf = '11111111111'
where id in ( select id from student where name = 'Diego' );

delete from student where id = 1;

select 
    cpf as " Identificador",
	name as "Student Name",
	obs as "Details about the stupid"
from student;

select * from student where name like '%o%'; 


select * from student where cpf is null;

select * from student where age = 35;

select * from student where age <> 35;

select * from student where age => 35;

select * from student where age <= 35;

select * from student where age < 35;

select * from student where age between 10 and 100;


select * from student where active = false;

select * from student where active = true;


select * from student 
	where name like '%D%' and cpf is not null;


select * from student 
	where name like '%D%' 
	or   name like '%Rodrigo%'
	or   name like '%Nico%';


drop table course;

create table course (
	--id integer not null unique,
	id integer primary key,
	name varchar(255) not null
);

insert into course (id, name) values(1, 'HTML');
insert into course (id, name) values(2, 'JavaScript');

select * from course;

drop table student;

create table student(
	id serial primary key,
	name varchar(255) not null
);


insert into student(name) values('Diogo');
insert into student(name) values('Vinicius');


select * from student;
select * from course;


-- without a foreign key we can add students 
-- who don't exist in the table students, 
-- the same is true about the course table

drop table student_course; 

create table student_course(
	student_id integer,
	course_id integer,
	primary key (student_id, course_id),
	foreign key (student_id) references student (id),
	foreign key (course_id) references course (id)
);


insert into student_course (student_id, course_id)
	values (1,1);


insert into student_course (student_id, course_id)
	values (2,1);


insert into student_course (student_id, course_id)
	values (3,1);


select * from student where id = 1;
select * from course  where id = 1;

select * from student where id = 2;
select * from course  where id = 1;

	
insert into student_course (student_id, course_id) values(2,2);

insert into student (name) values ('Jonh');

insert into student (name) values ('Nico');

insert into course (id, name) values (3, 'CSS');



-- Inner join
select student.name as "Student", course.name as "Course"
	from student
	join student_course on student_course.student_id = student.id
	join course         on course.id                 = student_course.course_id; 

-- left join -> priority is student table
select student.name as "Student", course.name as "Course"
	from student
	left join student_course on student_course.student_id = student.id
	left join course         on course.id                 = student_course.course_id;
	
-- right join -> priority is course table
select student.name as "Student", course.name as "Course"
	from student
	right join student_course on student_course.student_id = student.id
	right join course         on course.id                 = student_course.course_id;

-- full join -> priority is both tables
select student.name as "Student", course.name as "Course"
	from student
	full join student_course on student_course.student_id = student.id
	full join course         on course.id                 = student_course.course_id;
	
-- cross join -> multiplies the result of the student table for each course 
select student.name as "Student", course.name as "Course"
	from student
	cross join course;

	
drop table student_course; 


-- foreign key default is restricted
create table student_course(
	student_id integer,
	course_id integer,
	primary key (student_id, course_id),
	foreign key (student_id) references student (id) on delete cascade on update cascade,
	foreign key (course_id)  references course  (id) on delete cascade on update cascade
);
	
	
insert into student_course (student_id, course_id)
	values (1,1);


insert into student_course (student_id, course_id)
	values (2,1);


insert into student_course (student_id, course_id)
	values (3,1);
	
	
select student.id, student.name as "Student", course.name as "Course"
	from student
	join student_course on student_course.student_id = student.id
	join course         on course.id                 = student_course.course_id; 


delete from student where id = 1;
	
update student 
	set id = 10
	where id = 2;
	
	
-- Inner join
	select 
		student.id   as "Student ID",
		student.name as "Student", 
		course.id    as "Course ID",
		course.name  as "Course"
	from student
join student_course on student_course.student_id = student.id
join course         on course.id                 = student_course.course_id;


drop table employees; 

create table employees(
	id serial primary key,
	employee_code varchar(10),
	name varchar(255),
	surname varchar(255)
);

insert into employees (employee_code, name, surname) values ('M001', 'Diogo', 'Mascarenhas');
insert into employees (employee_code, name, surname) values ('M002', 'Vinícius', 'Dias');
insert into employees (employee_code, name, surname) values ('M003', 'Nico', 'Steppat');
insert into employees (employee_code, name, surname) values ('M004', 'João', 'Roberto');
insert into employees (employee_code, name, surname) values ('M005', 'Diogo', 'Mascarenhas');
insert into employees (employee_code, name, surname) values ('M006', 'Alberto', 'Martins');
insert into employees (employee_code, name, surname) values ('M007', 'Diogo', 'Oliveira');



select * 
	from employees 
	order by name desc;


select * 
	from employees 
	order by name, employee_code;


select * 
	from employees 
	order by name, employee_code desc;


select * 
	from employees 
	order by name desc, employee_code desc;


select * 
	from employees 
	order by 3, 4, 2; -- each number is a position of a column
	
	
select * 
	from employees 
	order by 4 desc, employees.name desc, 2 asc; -- each number is a position of a column

	
insert into student_course (student_id, course_id) values(4, 3);
	
select student.id, student.name as "Student", course.name as "Course"
from student
join student_course on student_course.student_id = student.id
join course         on course.id                 = student_course.course_id
order by student.name desc;	


select student.id, student.name as "Student", course.name as "Course"
from student
join student_course on student_course.student_id = student.id
join course         on course.id                 = student_course.course_id
order by student.name, course.name;	

select student.id, student.name as "Student", course.name as "Course"
from student
join student_course on student_course.student_id = student.id
join course         on course.id                 = student_course.course_id
order by course.name, student.name ;	



select * 
	from employees
	order by name
	limit 5;

--offset = 1 means, get from second register
--offset = 0 means, get the first one.
select * 
	from employees
	order by id
	limit 5
	offset 1;

select * 
	from employees
	order by id
	limit 5
	offset 3;

select * 
	from employees
	order by id
	limit 5
	offset 5;

-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros


SELECT COUNT (id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id),0)
  FROM employees;

 
 
 SELECT name, surname
  FROM employees
  order by name;
 
 SELECT distinct name
  FROM employees
  order by name;
 
 
 SELECT distinct name, surname
  FROM employees
  order by name;
 
 
 SELECT name, surname, count(*)
  FROM employees
  group by name, surname
  order by name;
 
 
 SELECT name, surname, count(*)
  FROM employees
  group by 1, 2
  order by 1;



select course.name, count(student.id)
	from student
	join student_course on student.id = student_course.student_id
	join course         on course .id = student_course.course_id
group by 1
order by 1;



select course.name, count(student.id)
	from student
	join student_course on student.id = student_course.student_id
	join course         on course .id = student_course.course_id
group by 1
order by 1;




select course.name as "Course", count(student.id) as "Total of students"
	 	from course
	left join student_course on course .id = student_course.course_id
	left join student        on student.id = student_course.student_id
--where course.name = ''
group by 1
	having count (student.id) = 0;



-- We use where to fielter fields, 
-- We use having when we use aggregate functions

select course.name as "Course", count(student.id) as "Total of students"
	 	from course
	left join student_course on course .id = student_course.course_id
	left join student        on student.id = student_course.student_id
--where course.name = ''
group by 1
	having count (student.id) > 0;



select name, count(name) from employees 
group by name
	having count (id) > 1;

select name, count(id) from employees 
group by name
	having count (id) > 1;


select name, count(id) from employees 
group by name
	having count (id) = 1;


select name, surname, count(name) from employees 
group by name, surname
	having count (id) > 1;



















	

