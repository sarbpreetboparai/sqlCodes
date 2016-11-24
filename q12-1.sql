-- Sarbpreet Boparai 
-- Who are the customers living in Brampton who have purchased a car with $1000 
-- or more of extra options?  Include the total amount of the extra options in 
-- the output. (Ascending order)

COLUMN "Total Options" FORMAT $9,999,990.99

SELECT s.cname AS "Customer", serial as "Serial", sum(o.saleprice) AS "Total Options"
  FROM s1.saleinv s, s1.invoption o, s1.customer c
 WHERE s.saleinv=o.saleinv
   AND c.cname=s.cname
   AND UPPER(c.ccity)=UPPER('brampton')
 GROUP BY s.cname, serial
HAVING sum(o.saleprice)>='1000'
 ORDER BY sum(o.saleprice) ASC;
