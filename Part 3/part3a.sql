CREATE VIEW q3a AS
with basis as
(select temp2.ID,temp2.direction,temp2.A,temp2.B,temp2.D,temp2.id1,temp2.direction1,temp2.a1,temp2.b1,temp2.d1,streets.id as id2,streets.direction as direction2,streets.A as a2,streets.B as b2, streets.D as d2  from
(select temp.id, temp.direction, temp.A, temp.B, temp.D, streets.id as id1, streets.direction as direction1, streets.A as a1, streets.B as b1, streets.D as d1 from
(select * from streets
where direction = 'F' and A = 'AUEB') temp
join streets
on temp.B = streets.A
where streets.direction = 'F') temp2
join streets 
on temp2.B1 = streets.A
where streets.direction = 'F'
)

select distinct basis.B, D as total_distance from basis
where D<=10
union
select distinct basis.B1 as B, D+D1 as total_distance from basis
where D+D1 <=10
union
select distinct basis.B2 as B,D+D1+D2 as total_distance  from basis
where D+D1+D2 <=10
;