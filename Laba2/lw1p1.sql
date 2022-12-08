--drop database and create new one
drop database if exists TourOperator;
go

--create new database
create database TourOperator;
go 

use TourOperator;

-- add role and user MANAGER
exec sp_addrole 'manager';
grant DELETE, INSERT, UPDATE, SELECT to manager;

exec sp_addlogin 'Gulevich_Manager', '12345', TourOperator;
exec sp_adduser 'Gulevich_Manager', 'Gulevich_Manager';
exec sp_addrolemember 'manager', 'Gulevich_Manager';

-- add role and user DIRECTOR
exec sp_addrole 'director';
grant delete, insert, update, select, execute to director;

exec sp_addlogin 'Gulevich_Director', '12345', TourOperator;
exec sp_adduser 'Gulevich_Director', 'Gulevich_Director';
exec sp_addrolemember 'director', 'Gulevich_Director';