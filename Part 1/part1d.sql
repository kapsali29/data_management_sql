CREATE VIEW q1d AS
select city, acquirers, startups from
(select * from 
(select count(name) as startups, city from
(select * from company 
where city is not null)
group by city) 
join
(select count(acquirer_name) as acquirers, acquirer_city from
(select * from acquisitions 
where acquirer_city is not null)
group by acquirer_city) Y
on city = acquirer_city
) X
where X.startups < X.acquirers
;