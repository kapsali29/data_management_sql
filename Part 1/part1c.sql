CREATE VIEW q1c AS
select state_code, total from 
(select state_code, count(name) as total from
(select * from company 
where category_list like '%Security%' and state_code is not null)
group by state_code
) Y
where Y.total = (select max(total) as maximum from
(select state_code, count(name) as total from
(select * from company 
where category_list like '%Security%' and state_code is not null)
group by state_code
))
;