-- Sarbpreet Boparai 
-- Print the total number and average dollar value of service visits for each of
-- Land Rovers, Mercedes and Jaguars sold between February 2006 and January 2008
-- inclusive.

SELECT DISTINCT c.make, COUNT(*), AVG(s.totalcost) 
  FROM s1.servinv s, s1.car c, s1.saleinv sa 
 WHERE s.serial=c.serial 
   AND s.serial=sa.serial 
   AND make IN ('JAGUAR', 'LAND ROVER', 'MERCEDES') 
   AND sa.saledate BETWEEN '1-Feb-2006' AND '31-Jan-2008' 
 GROUP BY make;
