use TourOperator;

--query with cross join
select client.clientId, pansionat.pansionatId 
from client
cross join pansionat;

select client.clientId, housType.housTypeId 
from client, housType;

--query with =
select *
from pansionat, housType
where pansionat.pansionatId = housType.pansionatId;

select *
from tour, housType
where tour.tourId = housType.pansionatId;

--query with = and condition
select *
from pansionat, housType
where pansionat.pansionatId = housType.pansionatId and isHaveMedService = 1 and pansionatLevel >= 3;

select *
from tour, housType
where tour.tourId = housType.pansionatId and transportType = 'car';

--query with 3 tables
select *
from voucher, client, tour
where client.clientId = voucher.clientId and tour.tourId = voucher.tourId;

select *
from tour, housType, pansionat
where tour.housTypeId = housType.housTypeId and housType.pansionatId = pansionat.pansionatId;

--query with full outer join
--query with =
select *
from pansionat
full outer join housType on pansionat.pansionatId = housType.pansionatId;

select *
from tour
full outer join housType on tour.tourId = housType.pansionatId;

--query with = and condition
select *
from pansionat
full outer join housType on pansionat.pansionatId = housType.pansionatId 
where isHaveMedService = 1 and pansionatLevel >= 3;

select *
from tour
full outer join housType on tour.tourId = housType.pansionatId 
where transportType = 'car';

--query with left join
select *
from client 
left join voucher on client.clientId = voucher.clientId;

select *
from pansionat
left join housType on pansionat.pansionatId = housType.pansionatId;

--query with right join
select *
from voucher
right join client on client.clientId = voucher.clientId;

select *
from housType
right join pansionat on pansionat.pansionatId = housType.pansionatId;

--query with simmetric

select distinct ht1.housTypeId, ht1.name, ht1.housCategory, ht1.pansionatId
from housType ht1, housType ht2
where ht1.pansionatId = ht2.pansionatId and ht2.name = 'bungalo'
order by ht1.housTypeId;


select distinct v1.voucherId, v2.clientId, v1.tourId, v1.arrivalDate, v1.departureDate
from voucher v1, voucher v2
where v1.clientId = v2.clientId and v2.voucherId = 1;