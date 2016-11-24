-- Sarbpreet Boparai 
-- List all 2006 cars which are not sold (serial#, make, model). Add (option#, 
-- optiondesc, option list price) if they have options.


SELECT c.serial, c.make , c.model, o.ocode, o.odesc, o.olist 
  FROM s1.car c, s1.baseoption bo, s1.options o 
 WHERE c.serial = bo.serial(+)
   AND bo.ocode = o.ocode(+) 
   AND c.cyear = '2009'
   AND c.cname IS NULL;
