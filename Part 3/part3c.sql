

CREATE VIEW q3c_a AS
select A,B,ID,B1,B2 from(
((select A,B,ID from streets where direction = 'F' and B in (select B from streets where direction = 'F' group by B having count(B)>1))tmp1
join (select A as A1,B as B1 from streets where direction = 'F') 
on B = A1)
join (select A as A2,B as B2 from streets where direction = 'F')
on B1 = A2 and B2=A)
;


delete from streets2 where id in
(
select id from (
select A,B,ID,B1,B2 from(
((select A,B,ID from streets where direction = 'F' and B in (select B from streets where direction = 'F' group by B having count(B)>1))tmp1
join (select A as A1,B as B1 from streets where direction = 'F') 
on B = A1)
join (select A as A2,B as B2 from streets where direction = 'F')
on B1 = A2 and B2=A)
)
)
