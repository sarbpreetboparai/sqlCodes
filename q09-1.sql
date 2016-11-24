-- Sarbpreet Boparai 
-- Print a list of salespersons names who have sold less than 3 cars.
 
SELECT salesman 
  FROM s1.saleinv si
 GROUP BY salesman   
HAVING COUNT(*) < 3;
