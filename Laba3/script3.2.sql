use TourOperator;

--simple query with compare operators
select *
from voucher
where totalCost >= 2000;

select *
from voucher
where totalCost >= 3000;

select *
from voucher
where totalCost <= 2000;

--simple query with 'and', 'or', 'not'
select *
from voucher
where totalCost >= 2000 and totalCost <= 3000;

select *
from voucher
where totalCost <= 1000 or totalCost >= 3000;

select *
from voucher
where not ( totalCost <= 1000 or totalCost >= 3000 );

--with combination logical operators
select *
from voucher
where not countOfPeople != 1 and price >= 2000;

select *
from voucher
where countOfPeople != 1 and not isHaveKids = 1 or not isHaveMedInsurance = 0;

--with column operation
select count(voucherId)
from voucher

select max(arrivalDate)
from voucher

--with operator 'in'
select *
from voucher
where arrivalDate in ('2022-02-30', '2022-09-22', '2022-09-23');

select *
from voucher
where totalCost in (3000, 4000, 5000);

--with operator beetween
select *
from voucher
where arrivalDate between '2022-09-21' and '2022-09-23';

select *
from voucher
where totalCost between 3000 and 5000;

--with operator like
select *
from voucher
where arrivalDate like '2022-09-2[1-3]';

select *
from client
where passportNumber like '[A-Z][A-Z]123456[7-8]';

--is null
select *
from client
where lastname is null;

select *
from client
where lastname is not null;
