CREATE VIEW q2c AS
select sum(A.val*B.val) as dot_product from A,B
where  A.J = B.I and A.I = 1 and B.J = 2
;