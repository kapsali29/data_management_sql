CREATE VIEW q2d AS
select A.I , B.J ,sum(A.val * B.val) as new_val
from A,B  where A.J =B.I 
group by A.I, B.J order by A.I,B.J
;