-- Sarbpreet Boparai 
-- List the name and phone number of all customers who have  purchased a car 
-- from us but have never come in for servicing.

SELECT DISTINCT cu.cname, cu.chphone, cu.cbphone 
  FROM s1.customer cu, s1.saleinv sal 
 WHERE cu.cname = sal.cname 
   AND sal.cname NOT IN (
       SELECT DISTINCT cname 
         FROM s1.servinv);
