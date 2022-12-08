use TourOperator;
go

--------------------------------------------------
--					tmp table					--
--------------------------------------------------
declare @tmp_table 
table (
	id		int,
	name	varchar(50)
);

insert into @tmp_table (id, name)
values (1, 'first row name'),
(2, 'second row name');

select *
from @tmp_table;

go

--------------------------------------------------
--					use 'if'					--
--------------------------------------------------
declare @countRows int;

set @countRows = ( select count(clientId) from client );

if @countRows > 10
	select *
	from voucher;
else
	select *
	from client;

--------------------------------------------------
declare @str varchar(100);

declare @countRows int;

set @countRows = ( select count(clientId) from client );

if @countRows < 10
begin
	set @str = 'any text in if block';

	select @str;
end 
else
begin
	set @str = 'any text in else block';

	select @str;
end;

go

--------------------------------------------------
--					use 'while'					--
--------------------------------------------------
declare @i int;

set @i = 0;

while @i < 5
begin
	print @i;

	set @i = @i + 1;
end;

--------------------------------------------------
declare @i int;

set @i = 0;

while @i < 10
begin
	print @i;

	if @i % 3 = 0
	begin
		set @i = @i + 1;
	end;

	set @i = @i + 1;
end;

go


--------------------------------------------------
--					scalar fun					--
--------------------------------------------------
create function getNumber() returns int
begin
	return 1;
end;

go

select dbo.getNumber();

go

--------------------------------------------------
--					table fun					--
--------------------------------------------------
create function getTable(@tourId int) returns table
as return ( select * from voucher where tourId > @tourId );

go

declare @tourId int;

set @tourId = 5;

select * from dbo.getTable(@tourId);

go


--------------------------------------------------
--			  proc without params				--
--------------------------------------------------
create procedure count_vouchers
as
select count(*)
from voucher;

go

execute count_vouchers;

go

--------------------------------------------------
create procedure avg_voucher_total
as
select avg(totalCost)
from voucher;

go

execute avg_voucher_total;

go


--------------------------------------------------
--			  proc with params					--
--------------------------------------------------
create procedure count_voucher_there_totalCost_more
@totalCost int
as
select count(voucherId)
from voucher
where totalCost >= @totalCost;

go

execute count_voucher_there_totalCost_more 3000;

go

--------------------------------------------------
create procedure select_voucher
@name varchar(100)
as
select distinct ht1.housTypeId, ht1.name, ht1.housCategory, ht1.pansionatId
from housType ht1, housType ht2
where ht1.pansionatId = ht2.pansionatId and ht2.name = @name
order by ht1.housTypeId;

go

execute select_voucher 'bungalo';

go


--------------------------------------------------
--		    proc with params and return			--
--------------------------------------------------
drop procedure if exists count_and_return
go 

create procedure count_and_return
@id int
as
if ( select count(*) from voucher where clientId > @id) > 10
	return 2;
else
	return 1;

go

declare @returnStatus int;

execute @returnStatus = count_and_return 3;

select 'return status' = @returnStatus;

go

--------------------------------------------------
create procedure find_and_return
@name varchar(100)
as
if ( select count(*) from client where client.name = @name ) > 1
	return 1;
else
	return 2;

go

declare @returnValue int;

execute @returnValue = find_and_return 'Ivanov';

select 'status' = @returnValue;

go



--------------------------------------------------
--					 update						--
--------------------------------------------------
drop procedure if exists update1 
go 

create procedure update1 
as
update dbo.client
set [name] = 'updatedClient'
where clientId = 5;

go

execute update1;

go

--------------------------------------------------
drop procedure if exists update2
go

create procedure update2
as
update pansionat
set name = 'updatedPansionat'
where pansionatId = 6;

go

execute update2;

go

--------------------------------------------------
--					 select						--
--------------------------------------------------
create procedure select1
as
select * from client;

go

execute select1;

go

--------------------------------------------------
create procedure select2
as
select * from pansionat;

go

execute select1;

go

select * from client
where name like 'I%'