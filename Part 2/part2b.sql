CREATE VIEW q2b AS
select sum(A.val*B.val) as dot_product from A,B
where  A.I = B.I and A.J = 1 and B.J = 2
;
