--Vehichle Sales Accounting Supplement Creation
ACCEPT p_invno PROMPT 'ENTER SALES INVOICE NUMBER:'
ACCEPT p_ocode PROMPT 'ENTER OPTION CODE:'
ACCEPT p_optionsale PROMPT 'ENTER OPTION SALE:'
VARIABLE g_output VARCHAR2(4000)
DECLARE
	v_salesrec INTEGER;
	v_ocodecount INTEGER;
	v_inocodecount INTEGER;
	v_numsalesrec EXCEPTION;
	v_numocode EXCEPTION;
	v_numinocode EXCEPTION;
BEGIN
	SELECT COUNT(*)
	INTO v_salesrec
    FROM saleinv 
	WHERE saleinv = '&p_invno';

	SELECT COUNT(*)
	INTO v_ocodecount
    FROM options 
	WHERE ocode = '&p_ocode';
	
	SELECT COUNT(*)
	INTO v_inocodecount
    FROM invoption 
	WHERE TRIM(ocode) = '&p_ocode'
	AND saleinv = '&p_invno';	
	
	IF v_salesrec = 0 THEN
		RAISE v_numsalesrec;
	END IF;
	
	IF v_ocodecount = 0 THEN
		RAISE v_numocode;
	END IF;
	
	IF v_inocodecount > 0 THEN
		RAISE v_numinocode;
	END IF;
	
	INSERT INTO invoption (saleinv, ocode, saleprice)
	VALUES ('&p_invno','&p_ocode','&p_optionsale');
	
	EXCEPTION
		WHEN v_numsalesrec THEN
			:g_output:='Following sales invoice number does not exist: '||' '||'&p_salesinv';
		WHEN v_numocode THEN
			:g_output:='Following option code does not exist: '||' '||'&p_ocode';
		WHEN v_numinocode THEN
			:g_output:='Option already included in sale';
		WHEN INVALID_NUMBER THEN
			:g_output:='Please enter a number for the sale price';
END;
/

PRINT g_output

