-- Sarbpreet Boparai 
-- List the name, address and home phone of customers interested in any car which 
-- is on the lot unsold. Match on make, model, year and color. Include the 
-- matching criteria in the output.

SELECT DISTINCT cu.cname,chphone, cstreet, ccity, c.make,c.color,c.cyear
  FROM s1.car c, s1.prospect p, s1.customer cu
 WHERE cu.cname=p.cname
   AND c.make=p.make
   AND c.model=p.model
   AND c.color=p.color
   AND c.cyear=p.cyear
   AND c.cname IS NULL;
