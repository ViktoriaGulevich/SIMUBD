use TourOperator;

create table client
(
	clientId		bigint identity(1, 1) primary key,
	surname			varchar(100),
	name			varchar(100),
	lastname		varchar(100),
	passportNumber	varchar(100),
	dateOfBirth		date,
	address			varchar(100),
	city			varchar(100),
	phone			varchar(100)
);

create table pansionat
(
	pansionatId			bigint identity(1, 1) primary key,
	name				varchar(100),
	address				varchar(100),	
	city				varchar(100),
	country				varchar(100),
	phone				varchar(100),
	description			varchar(255),
	numberOfRoom		int,
	isHavewimmingPool	bit,
	isHaveMedService	bit,
	isHaveSpa			bit,
	pansionatLevel		int,
	distanceToSea		int
);

create table housType
(
	housTypeId		bigint identity(1, 1) primary key,
	name			varchar(100),
	housCategory	varchar(100),
	pansionatId		bigint,
	description		varchar(255),
	costPerDay		decimal(10, 2)
);

create table tour
(
	tourId			bigint identity(1, 1) primary key,
	name			varchar(100),
	transportType	varchar(100),
	housTypeId		bigint,
	foodType		varchar(100),
	costPerDay		decimal(10, 2)
);

create table voucher
(
	voucherId			bigint identity(1, 1) primary key,
	clientId			bigint,
	tourId				bigint,
	arrivalDate			date,
	departureDate		date,
	isHaveKids			bit,
	isHaveMedInsurance	bit,
	countOfPeople		int,
	price				decimal(10, 2),
	totalCost			decimal(10, 2)
);

alter table housType
add constraint fk_housType_pansionat_pansionatId foreign key(pansionatId)
references pansionat (pansionatId)
on delete cascade
on update cascade;

alter table tour
add constraint fk_tour_housType_housTypeId foreign key(housTypeId)
references housType (housTypeId)
on delete cascade
on update cascade;

alter table voucher
add constraint fk_voucher_tour_tourId foreign key(tourId)
references tour (tourId)
on delete cascade
on update cascade;

alter table voucher
add constraint fk_voucher_client_clientId foreign key(clientId)
references client (clientId)
on delete cascade
on update cascade;


insert into client(surname, name, lastname, passportNumber, dateOfBirth, address, city, phone)
values ('Ivanov','Ivan','','AB1234567','2000-01-01','','',''),
('Petrov','Petr','','AB1234568','2000-01-01','','',''),
('Sidorov','Sidor','','AB1234569','2000-01-01','','',''),
('Pavlov','Ivan','','AB1234560','2000-01-01','','',''),
('Svetlov','Svet','','AB1234570','2000-01-01','','','');

insert into pansionat(name, address, city, country, phone, description, numberOfRoom, 
isHavewimmingPool, isHaveMedService, isHaveSpa, pansionatLevel, distanceToSea)
values ('pansionat1', 'address1', 'Minsk', 'Belarus', '1234567', '', 100, 1, 1, 1, 3, 1000),
('pansionat2', 'address2', 'Minsk', 'Belarus', '1234567', '', 100, 1, 1, 1, 4, 1000),
('pansionat3', 'address3', 'Brest', 'Belarus', '1234567', '', 150, 1, 1, 0, 5, 1000),
('pansionat4', 'address4', 'Brest', 'Belarus', '1234567', '', 50, 1, 0, 1, 2, 1000),
('pansionat5', 'address5', 'Grodno', 'Belarus', '1234567', '', 100, 0, 1, 0, 3, 1000);

insert into housType(name, housCategory, pansionatId, description, costPerDay)
values ('hous','lux',1,'',10),
('bungalo','lux',2,'',10),
('space','demilux',3,'',10),
('bungalo','demilux',2,'',10),
('space','demilux',3,'',10),
('flat','demilux',1,'',10),
('hous','demilux',4,'',10),
('space','demilux',3,'',10),
('flat','demilux',1,'',10);

insert into tour(name, transportType, housTypeId, foodType, costPerDay)
values ('tour1','car',1,'3 time',20),
('tour2','car',3,'3 time',20),
('tour3','car',2,'3 time',20),
('tour4','car',6,'3 time',20),
('tour5','car',5,'3 time',20),
('tour6','car',4,'3 time',20),
('tour7','car',9,'3 time',20),
('tour8','car',7,'3 time',20),
('tour9','car',8,'3 time',20),
('tour10','car',4,'3 time',20),
('tour11','car',6,'3 time',20),
('tour12','car',7,'3 time',20),
('tour13','car',3,'3 time',20),
('tour14','car',1,'3 time',20),
('tour15','car',8,'3 time',20),
('tour16','car',2,'3 time',20),
('tour17','car',9,'3 time',20),
('tour18','car',3,'3 time',20),
('tour19','car',9,'3 time',20);

insert into voucher(clientId, tourId, arrivalDate, departureDate, isHaveKids, isHaveMedInsurance, countOfPeople, price, totalCost)
values (1, 1, '2022-09-21', '2022-10-21', 1, 1, 1, 1000, 1000),
(2, 2, '2022-09-22', '2022-10-20', 1, 0, 1, 1000, 1000),
(1, 3, '2022-09-23', '2022-10-10', 1, 1, 1, 1000, 1000),
(4, 4, '2022-09-24', '2022-10-15', 1, 1, 1, 1000, 1000),
(3, 5, '2022-09-25', '2022-10-20', 1, 1, 1, 1000, 1000),
(2, 6, '2022-09-21', '2022-10-21', 1, 0, 1, 1000, 1000),
(5, 7, '2022-09-22', '2022-10-20', 0, 1, 1, 1000, 1000),
(1, 8, '2022-09-23', '2022-10-10', 1, 1, 1, 1000, 1000),
(3, 9, '2022-09-24', '2022-10-21', 1, 0, 1, 1000, 1000),
(4, 10, '2022-09-25', '2022-10-21', 1, 1, 1, 1000, 1000),
(2, 11, '2022-09-21', '2022-10-15', 1, 0, 1, 1000, 1000),
(3, 12, '2022-09-22', '2022-10-10', 1, 1, 2, 1000, 2000),
(5, 13, '2022-09-23', '2022-10-15', 0, 0, 1, 1000, 1000),
(1, 14, '2022-09-24', '2022-10-21', 1, 1, 1, 1000, 1000),
(5, 15, '2022-09-25', '2022-10-10', 1, 0, 1, 1000, 1000),
(1, 16, '2022-09-21', '2022-10-20', 1, 1, 2, 1000, 1000),
(2, 17, '2022-09-22', '2022-10-15', 1, 0, 1, 1000, 1000),
(3, 18, '2022-09-23', '2022-10-15', 1, 1, 10, 1000, 10000),
(5, 19, '2022-09-24', '2022-10-10', 1, 1, 1, 1000, 1000),
(4, 1, '2022-09-25', '2022-10-21', 1, 0, 1, 1000, 1000),
(3, 2, '2022-09-21', '2022-10-15', 1, 1, 1, 1000, 1000),
(2, 3, '2022-09-22', '2022-10-20', 1, 0, 1, 1000, 1000),
(1, 4, '2022-09-23', '2022-10-10', 0, 1, 1, 1000, 1000),
(3, 5, '2022-09-24', '2022-10-21', 1, 1, 1, 1000, 1000),
(3, 6, '2022-09-25', '2022-10-15', 0, 1, 1, 1000, 1000),
(2, 7, '2022-09-21', '2022-10-21', 1, 0, 2, 1000, 2000),
(4, 8, '2022-09-22', '2022-10-20', 1, 1, 1, 1000, 1000),
(5, 9, '2022-09-23', '2022-10-21', 0, 1, 1, 1000, 1000),
(1, 7, '2022-09-25', '2022-10-15', 1, 1, 1, 1000, 1000);