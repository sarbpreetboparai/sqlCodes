-- Sarbpreet Boparai 
-- Show all customer information for people interested in blue Jaguars.

SELECT DISTINCT cu.* 
  FROM s1.customer cu, s1.prospect pr 
 WHERE cu.cname = pr.cname 
   AND make = 'JAGUAR' 
   AND UPPER(color) = 'BLUE';
