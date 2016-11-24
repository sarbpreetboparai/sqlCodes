-- Sarbpreet Boparai 
 -- What is the average cost of service visits on 2006 Mercedes?

SELECT AVG(ser.totalcost) 
  FROM s1.servinv ser, s1.car c 
 WHERE ser.serial = c.serial 
   AND c.make = 'MERCEDES' 
   AND c.cyear = '2006';
