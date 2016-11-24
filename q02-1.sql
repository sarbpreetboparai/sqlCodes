-- Sarbpreet Boparai 
-- How many vehicles were sold with some kind of insurance?

SELECT COUNT(*)
  FROM s1.saleinv 
 WHERE fire = 'Y' 
    OR collision = 'Y' 
    OR liability = 'Y' 
    OR property = 'Y';


