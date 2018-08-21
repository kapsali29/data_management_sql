CREATE VIEW q1a AS
select company_name, acquisitions.price_amount from company 
left outer join acquisitions on 
company.name = acquisitions.company_name 
where company.status = 'acquired'
;