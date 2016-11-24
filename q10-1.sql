-- Sarbpreet Boparai 
-- List the names of all customers who purchased cars with sunroofs.   
-- (Description has 'SUN ROOF' in it.)

SELECT cname
  FROM s1.car c, s1.baseoption bo, s1.options o 
 WHERE c.serial = bo.serial   
   AND o.ocode = bo.ocode   
   AND UPPER(odesc) LIKE UPPER('%sun roof%')
   AND cname IN (SELECT DISTINCT cname
                   FROM s1.saleinv)
UNION 
SELECT cname  
  FROM s1.saleinv si, s1.invoption io, s1.options o 
 WHERE si.saleinv = io.saleinv   
   AND io.ocode = o.ocode 
   AND UPPER(odesc) LIKE UPPER('%sun roof%')
 ORDER BY 1;
