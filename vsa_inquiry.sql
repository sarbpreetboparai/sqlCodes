--Vehichle Sales Supplement 
ACCEPT p_saleinv PROMPT 'Enter Sales Inventory: '
VARIABLE g_output VARCHAR2(4000)
DECLARE
	v_customer saleinv.cname%TYPE;
	v_saledate saleinv.saledate%TYPE;
	v_serial saleinv.serial%TYPE;
	v_carcost car.purchcost%TYPE;
	v_carnet saleinv.net%TYPE;
	v_carsale saleinv.net%TYPE; --sale = saleinv(net) - car(freight) - totalinvoption
	v_totalinvoptionsale invoption.saleprice%TYPE;
	v_totalinvoptioncost options.ocost%TYPE;
	v_freight car.freightcost%TYPE;
	v_tax saleinv.tax%TYPE;
	v_licfee saleinv.licfee%TYPE;
	v_commission saleinv.commission%TYPE;
	v_costtotal car.purchcost%TYPE;
	v_saletotal saleinv.totalprice%TYPE; --get total price
	
	CURSOR inoptions IS
	SELECT  o.ocode, o.ocost, io.saleprice
	FROM invoption io, options o
	WHERE io.ocode = o.ocode
	AND io.saleinv = '&p_saleinv';
BEGIN
	SELECT s.cname, s.saledate, s.serial, c.purchcost, s.net, c.freightcost, s.tax, s.licfee, s.commission, s.totalprice
	INTO v_customer, v_saledate, v_serial, v_carcost, v_carnet, v_freight, v_tax, v_licfee, v_commission, v_saletotal 
	FROM saleinv s, car c
	WHERE s.serial = c.serial
	AND s.saleinv = '&p_saleinv';
	
	v_totalinvoptionsale := 0;
	
	FOR v_ioptions IN inoptions LOOP
		v_totalinvoptioncost := v_totalinvoptioncost + v_ioptions.ocost;
		v_totalinvoptionsale := v_totalinvoptionsale + v_ioptions.saleprice;
	END LOOP;
	
	v_carsale := v_carnet - v_freight - v_totalinvoptionsale;
	v_costtotal := v_carcost + v_freight + v_tax + v_licfee + v_commission;
	
	:g_output:= :g_output||'Sales Inv. No: '||'&p_saleinv'|| ' |Customer:'||v_customer||' |Date:'|| v_saledate||CHR(10)||'Serial#'||v_serial||' |Cost:'||v_carcost||' |Sale:'||v_carsale|| CHR(10);
	
	FOR v_ioptionsagain IN inoptions LOOP
		:g_output:= :g_output||'Option Code:'||v_ioptionsagain.ocode||' |Option Cost: '|| v_ioptionsagain.ocost|| '|Option Sale: '||v_ioptionsagain.saleprice||CHR(10); 
	END LOOP;
	
	:g_output:= :g_output||'Freight(Cost): '||v_freight||'|Freight(Sale):'||v_freight||CHR(10)||'Licence Fee (Cost):'||v_licfee||' |Licence Fee(Sale): '||v_licfee||CHR(10)||'Commission:'||v_commission||CHR(10)||'Total Cost:'||v_costtotal||'| Total Sales:'||v_saletotal;
END;
/
PRINT g_output