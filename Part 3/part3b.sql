CREATE VIEW q3b AS
with t1 as (
select * from streets 
where A='AUEB')
,t2 as (
select t1.A,t1.D as D_AB,t1.B,streets.D as D_BC,streets.B as C  from t1,streets
where t1.B = streets.A and streets.direction = 'F'
)
,t3 as (
select t2.A,t2.D_AB,t2.B,t2.D_BC,t2.C,streets.D as D_Clast,streets.B as last from t2,streets 
where t2.C =streets.A 
)

,t4 as (
select * from t3
)

,basis as (
select t3.A,t3.D_AB,t3.B,t3.D_BC,t3.C,t3.D_CLAST,t3.LAST,t4.A as A1,t4.D_AB as D_AB1,t4.B as B1,t4.D_BC as D_BC1,t4.C as C1,t4.D_CLAST as D_CLAST1,t4.LAST as LAST1
from 
t3 
join 
t4 
on t4.A = t3.A
)
,total as (
select  B as A,B1 as B,(D_AB+D_AB1) as distance from basis
where D_AB+D_AB1 <= 15 
union
select C as A, B1 as B, (D_AB+D_BC+D_AB1) as distance from basis
where D_AB+D_BC+D_AB1 <=15
union
select B as A,C1 as B , (D_AB+D_AB1+D_BC1) as distance from basis
where D_AB+D_AB1+D_BC1 <=15
union
select  C as A,C1 as B, (D_BC+D_AB+D_AB1+D_BC1) as distance from basis
where D_BC+D_AB+D_AB1+D_BC1 <=15
union
select B as A, LAST1 as B, (D_AB+D_AB1+D_BC1+D_CLAST1) as distance from basis
where D_AB+D_AB1+D_BC1+D_CLAST1 <=15
union
select LAST as A, B as B, (D_CLAST+D_BC+D_AB+D_AB1) as distance from basis
where D_CLAST+D_BC+D_AB+D_AB1 <=15
union
select C as A, LAST1 as B,(D_BC+D_AB+D_AB1+D_BC1+D_CLAST1) as distance from basis
where D_BC+D_AB+D_AB1+D_BC1+D_CLAST1 <=15
)

select A,B,DISTANCE from total where A<>B
;