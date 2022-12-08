use TourOperator;

--query with count
select count(voucherId)
from voucher
where totalCost >= 3000;

select count(voucherId)
from voucher
where totalCost < 3000;

--query with sum
select sum(totalCost)
from voucher;

select sum(price)
from voucher;

--query with upper, lower
select upper(name)
from client;

select lower(surname)
from client;

--query with time
select voucherId, day( arrivalDate ) as arrivalDate, departureDate 
from voucher;

select voucherId, datename( month, arrivalDate ) as arrivalDate, departureDate 
from voucher;

--query with group by
select arrivalDate, count( arrivalDate ) as count
from voucher
group by arrivalDate;

select name, count( name ) as count
from housType
group by name;

--query with group by 
select arrivalDate, departureDate
from voucher
group by arrivalDate, departureDate;

select isHaveKids, isHaveMedInsurance, countOfPeople
from voucher 
group by isHaveKids, isHaveMedInsurance, countOfPeople;

--query with having
select tourId, sum(totalCost) as totalCostForAll
from voucher
group by tourId
having sum(totalCost) >= 5000;

select departureDate, count(departureDate) as departureDate
from voucher
group by departureDate
having count(departureDate) = 6;

--query with having without group by
select min(totalCost) as min, avg(totalCost) as avg
from voucher
having avg(totalCost) > 1000;

select max(totalCost) as max, avg(totalCost) as avg
from voucher
having avg(totalCost) > 1000;

--query with order by
select *
from voucher 
order by arrivalDate desc;

select *
from voucher 
order by totalCost asc;

--query with insert with subquery
insert into voucher( clientId, tourId, arrivalDate, departureDate, isHaveKids, isHaveMedInsurance, countOfPeople, price, totalCost )
values ( 3, 15, '2022-09-27', '2022-10-22', 1, 1, 1, 1000, (select max(totalCost) from voucher) );

insert into voucher( clientId, tourId, arrivalDate, departureDate, isHaveKids, isHaveMedInsurance, countOfPeople, price, totalCost )
values ( 3, 15, (select min(arrivalDate) from voucher), (select max(departureDate) from voucher), 1, 1, 1, 1000, (select avg(totalCost) from voucher) );

--query with update
update client
set name = 'update name'
where clientId = 6;

update client
set surname = 'update surname'
where clientId = 6;

--query with update with subquery
update voucher
set price = 2 * price
where voucherId = (select voucherId from voucher join tour on voucher.tourId = tour.tourId where tour.name = 'tour12')

update voucher
set totalCost = 2*totalCost
where voucherId in (select voucherId from voucher where totalCost != price * countOfPeople)

--query with drop
delete from voucher
where voucherId = 5;

delete from voucher;