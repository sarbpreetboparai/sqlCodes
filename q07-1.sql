-- Sarbpreet Boparai 
-- Print the mailing label formatted name, full address, car make and model of 
-- the person who purchased the most expensive car from us.

SELECT cu.cname || CHR(10) || 
       cstreet || CHR(10) || 
       TRIM(ccity) || ', ' || TRIM(cprov) || ' ' || cpostal || CHR(10) || 
       'Make: ' || c.make || ' Model: ' || c.model AS "Address Label"
  FROM s1.customer cu, s1.car c, s1.saleinv si
  WHERE cu.cname = si.cname 
    AND si.serial = c.serial 
    AND si.net = (SELECT MAX(net) 
                    FROM s1.saleinv);
