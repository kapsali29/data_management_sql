CREATE VIEW q1b AS
select count(*) as STARTUPS from (
select company.name from company
where founded_at between '2012-01-01' and '2014-12-31'
)
;