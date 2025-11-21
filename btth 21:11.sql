create database btth6;

use btth6;

create table course (
course_id varchar (10) primary key,
course_name varchar (100),
category varchar (100),
start_date date,
end_date date,
fee float
);


create table student (
student_id varchar (10) primary key,
student_full_name varchar(150) not null,
student_email varchar (255) unique,
student_phone varchar(15) unique,
student_dob date,
gender enum ('Male', 'Female', 'Other' )
 ); 
 
 create table enrollment (
 enrollment_id int auto_increment primary key,
 student_id varchar (10) not null, 
 foreign key (student_id) REFERENCES student (student_id),
 course_id varchar (10) not null,
 foreign key (course_id) references course(course_id), 
 enroll_date date,
 enrollment_status enum ('Confỉrmed','Cancelled','Pending'),
 slot_count integer default (1) not null
 );
 
 create table payment (
 payment_id int primary key auto_increment, 
 enrollment_id int not null,
 foreign key (enrollment_id) references enrollment (enrollment_id ),
 payment_method enum ('Credit Card', ' Bank Transfer ', ' Cash' ),
 payment_amount float,
 payment_date date,
 payment_status enum ('success', 'failed','pending' )
 );
 
insert into student( student_id, student_full_name, student_email,student_phone, student_dob, gender ) values
( '0001', 'Le Hoang Nam' , 'nam.le@example.com','0901001001','1995-01-01','Male'),
('0002', 'Nguyen Minh Chau','chau.nguyen@example.com','0902002002','1996-02-02','Female'),
('0003', 'Pham Bao Anh', 'bao.pham@example.com', '0903003003', '1997-03-03', 'Male'),
('0004', 'Tran Kim Lien', 'lien.tran@example.com', '0904004004', '1998-04-04', 'Female'),
('0005', 'Hoang Tien Dat', 'dat.hoang@example.com', '0905005005', '1999-05-05', 'Male');

insert into Course values
('001', 'Web Development', 'Programming', '2025-07-01', '2025-08-01', 120.0),
('002', 'Data Analysis', 'Data Science', '2025-07-10', '2025-08-15', 150.0),
('003', 'Basic Photoshop', 'Design', '2025-07-05', '2025-07-30', 90.0),
('004', 'Intro to Marketing', 'Marketing', '2025-07-12', '2025-08-20', 110.0),
('005', 'UI/UX Fundamentals', 'Design', '2025-07-20', '2025-08-25', 100.0);

insert into Enrollment values
(1,'0001','001','2025-06-01','Confirmed',1),
(2,'0002','002','2025-06-02','Pending',2),
(3,'0003','003','2025-06-03','Cancelled',3),
(4,'0004','004','2025-06-04','Confirmed',1),
(5,'0005','001','2025-06-05','Pending',2);

update Payment
set payment_status = 'Success'
where payment_amount > 0
  and payment_method = 'Credit Card'
  and payment_date < current_date;
  
  update Payment
set payment_status = 'Pending'
where payment_method = 'Bank Transfer'
  and payment_amount < 100
  and payment_date < CURRENT_DATE;
  
  delete from payment
  where payment_status = 'Pending'
  and payment_method = 'cash';
  
  
  select student_id, student_full_name , student_dob, gender
  from student
  order by student_full_name asc;
  
  select course_id, course_name, category
  from course
  order by fee desc;
  
 select c.course_id, e.student_id, e.slot_count, count(e.slot_count) as sl_khoa_da_dat
from course c
join enrollment e on c.course_id=e.course_id
WHERE enrollment_status = 'Confirmed'
GROUP BY c.course_id, e.student_id, e.slot_count
ORDER BY e.slot_count DESC;

select s.student_full_name, e.student_id, e.course_id, e.slot_count
from enrollment e
join student s on s.student_id = e.student_id
where slot_count between 2 and 3
order by s.student_full_name asc;

select s.student_id, s.student_full_name, e.slot_count, p.payment_status
from enrollment e
join payment p on e.enrollment_id = p.enrollment_id
join student s on s.student_id = e.student_id
where e.slot_count >= 2
  and p.payment_status = 'Pending';
  
select s.student_id, s.student_full_name, p.payment_amount
from payment p
join enrollment e ON p.enrollment_id = e.enrollment_id
join student s ON e.student_id = s.student_id
where p.payment_status = 'Success';

select e.student_id, s.student_full_name, e.slot_count, e.enrollment_status
from enrollment e
join student s on s.student_id = e.student_id
where e.slot_count > 1
order by e.slot_count desc
limit 5;

select course_id, COUNT(enrollment_id) as total_enrollment
from enrollment
group by course_id
order by total_enrollment desc
limit 1;

set sql_safe_updates=0;

select distinct s.student_id, s.student_full_name, s.student_dob
from student s
join enrollment e on e.student_id = s.student_id
join payment p on p.enrollment_id = e.enrollment_id
where year(s.student_dob) < 2000
  and p.payment_status = 'Success';










