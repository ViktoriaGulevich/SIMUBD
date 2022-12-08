create database Univercity;

use Univercity;


create table facultet
(
	facultet_id		bigint identity(1, 1) primary key not null,
	facultet_name	varchar(100),
	fio_decana		varchar(50)
);

create table kafedra
(
	kafedra_id		bigint identity(1, 1) primary key not null,
	fakutltet_id	bigint foreign key references facultet (facultet_id),
	kafedra_name	varchar(100),
	fio_zavkaf		varchar(50)
);

create table student
(
	STUDENT_ID		bigint identity(1, 1) primary key not null,
	STU_NAME		varchar(50) not null,
	STU_SURNAME		varchar(50) not null,
	STIPEND			decimal(10, 5),
	KURS			int,
	CITY			varchar(50),
	BIRTDAY			date,
	GROUP_NUMBER	varchar(25),
	KAFEDRA_ID		bigint
);

alter table student 
add constraint constraint_stipend
check (stipend >=0 and stipend <= 500);

alter table student 
add constraint constraint_kurs
check (kurs >=1 and kurs <= 4);

alter table student
add constraint fk_student_kafedra_kafedraId foreign key(kafedra_id)
references kafedra (kafedra_id)
on delete cascade
on update cascade;


create table teacher
(
	teacher_id		bigint identity(1, 1) primary key not null,
	kafedra_id		bigint foreign key references kafedra (kafedra_id),
	surname			varchar(50),
	indef_kod		bigint unique,
	dolgnost		varchar(50) default 'assistent' check (dolgnost in('professor', 'decent', 'old teacher', 'assistent')),
	zvanie			varchar(50) default 'net' CHECK (zvanie IN('k.t.n', 'k.g.y', 'k.c.n', 'k.f.m.n.', 'd.t.n', 'd.g.y', 'd.c.n', 'd.f.m.n', 'net')),
	salary			decimal(10, 5) default 1000 check (salary >= 0),
	rise			decimal(10, 5) default 0 check(rise >= 0),
	data_hire		date default getdate(),
	birthday		date,
	pol				varchar(50) check (pol in('M', 'G')),
	tel_teacher		varchar(50) check (tel_teacher like '[1-9][0-9]-[0-9][0-9]-[0-9][0-9]')
);

insert into facultet (facultet_name, fio_decana)
values  ('FKP', 'Lihachevsky'),
		('FITY', 'Shilin'),
		('FKSIS', 'Nesterenkov'),
		('FRE', 'Korotkevich');

insert into kafedra (fakutltet_id, kafedra_name, fio_zavkaf)
values	(1,'kaf1','zavkaf'),
		(2,'kaf2','zavkaf'),
		(3,'kaf3','zavkaf'),
		(4,'kaf4','zavkaf');

insert into student (STU_NAME, STU_SURNAME, STIPEND, KURS, CITY, BIRTDAY, GROUP_NUMBER, KAFEDRA_ID)
values ( 'Misha', 'Sidorov', 93.682, 3, 'Gomel', '1999-10-15', '914301', 3 ),
( 'Sidor', 'Pashkevich', 120.199, 4, 'Minsk', '2001-12-16', '914302', 3 ),
( 'Misha', 'Petrov', 75.05, 4, 'Brest', '2000-10-15', '914301', 1 ),
( 'Sasha', 'Sidorov', 89.779, 1, 'Grodno', '1999-02-28', '914303', 2 ),
( 'Kolya', 'Klushkin', 61.084, 3, 'Vitebsk', '2001-02-16', '914305', 4 ),
( 'Sveta', 'Klushkin', 188.625, 3, 'Minsk', '1999-09-24', '914304', 4 ),
( 'Ivan', 'Petrov', 478.501, 1, 'Grodno', '2002-12-07', '914301', 3 ),
( 'Vika', 'Pushlin', 236.582, 1, 'Vitebsk', '2001-02-20', '914304', 3 ),
( 'Petr', 'Pushlin', 419.613, 3, 'Gomel', '1999-07-02', '914302', 3 ),
( 'Ivan', 'Ivanov', 256.52, 1, 'Gomel', '2000-09-19', '914302', 4 ),
( 'Sasha', 'Pushlin', 434.901, 2, 'Brest', '2002-09-23', '914304', 3 ),
( 'Kolya', 'Ivanov', 107.11, 1, 'Mogilev', '2001-03-04', '914301', 4 ),
( 'Kolya', 'Mishev', 471.828, 2, 'Vitebsk', '2002-01-06', '914305', 1 ),
( 'Ivan', 'Pashkevich', 47.595, 3, 'Minsk', '2001-09-22', '914303', 1 ),
( 'Sasha', 'Klushkin', 267.859, 3, 'Mogilev', '2002-07-02', '914302', 3 ),
( 'Sveta', 'Petrov', 87.656, 2, 'Gomel', '2000-05-26', '914302', 1 ),
( 'Ivan', 'Pushlin', 21.707, 3, 'Grodno', '2000-12-19', '914301', 1 ),
( 'Ivan', 'Sidorov', 405.669, 3, 'Grodno', '2000-07-02', '914301', 3 ),
( 'Kolya', 'Sidorov', 136.114, 2, 'Brest', '2001-07-11', '914302', 2 ),
( 'Sasha', 'Mishev', 251.909, 1, 'Grodno', '2001-09-23', '914305', 4 ),
( 'Petr', 'Plushikin', 247.819, 1, 'Grodno', '2002-11-18', '914304', 3 ),
( 'Ivan', 'Gulevich', 89.724, 4, 'Brest', '1999-08-12', '914301', 3 ),
( 'Katya', 'Sidorov', 135.84, 2, 'Gomel', '1999-08-08', '914301', 1 ),
( 'Petr', 'Mishev', 267.232, 2, 'Minsk', '1999-08-23', '914302', 3 ),
( 'Sidor', 'Pashkevich', 427.84, 1, 'Grodno', '2002-08-20', '914301', 4 ),
( 'Vika', 'Pashkevich', 254.77, 4, 'Grodno', '1999-05-03', '914303', 4 ),
( 'Petr', 'Mishev', 306.06, 2, 'Gomel', '2002-01-13', '914303', 3 ),
( 'Sasha', 'Pashkevich', 429.133, 3, 'Grodno', '2001-04-03', '914305', 3 ),
( 'Sveta', 'Plushikin', 149.18, 3, 'Brest', '2000-09-11', '914305', 4 ),
( 'Petr', 'Pushlin', 34.558, 3, 'Minsk', '2000-10-17', '914303', 4 ),
( 'Sveta', 'Pushlin', 234.44, 4, 'Grodno', '2001-05-04', '914301', 3 ),
( 'Petr', 'Gulevich', 302.464, 1, 'Minsk', '2002-08-04', '914304', 4 ),
( 'Ivan', 'Pushlin', 265.5, 3, 'Minsk', '2002-07-08', '914304', 2 ),
( 'Sveta', 'Petrov', 267.14, 1, 'Vitebsk', '2002-02-24', '914303', 3 ),
( 'Petr', 'Sidorov', 85.709, 3, 'Vitebsk', '1999-06-19', '914303', 1 ),
( 'Misha', 'Ivanov', 72.852, 2, 'Mogilev', '1999-01-23', '914302', 4 ),
( 'Vika', 'Petrov', 483.864, 4, 'Grodno', '2000-05-26', '914302', 2 ),
( 'Ivan', 'Plushikin', 29.301, 1, 'Brest', '1999-11-21', '914303', 4 ),
( 'Kolya', 'Sidorov', 499.989, 2, 'Grodno', '2000-01-17', '914301', 2 ),
( 'Sveta', 'Klushkin', 336.879, 4, 'Grodno', '2000-09-05', '914301', 1 ),
( 'Misha', 'Pushlin', 92.309, 1, 'Mogilev', '2000-04-28', '914304', 3 ),
( 'Kolya', 'Klushkin', 270.87, 1, 'Gomel', '1999-02-11', '914304', 1 ),
( 'Misha', 'Mishev', 433.298, 2, 'Vitebsk', '2002-07-28', '914304', 3 ),
( 'Kolya', 'Klushkin', 184.534, 4, 'Gomel', '2000-02-16', '914302', 3 ),
( 'Sidor', 'Klushkin', 462.589, 4, 'Brest', '2001-09-02', '914301', 2 ),
( 'Kolya', 'Mishev', 464.937, 1, 'Brest', '2002-02-08', '914301', 3 ),
( 'Kolya', 'Plushikin', 137.475, 3, 'Mogilev', '2001-01-19', '914305', 1 ),
( 'Vika', 'Ivanov', 52.446, 2, 'Gomel', '2002-04-26', '914303', 1 ),
( 'Ivan', 'Plushikin', 87.867, 2, 'Vitebsk', '2001-05-21', '914301', 3 ),
( 'Katya', 'Mishev', 314.98, 4, 'Vitebsk', '1999-11-09', '914301', 2 );