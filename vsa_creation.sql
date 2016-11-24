--Vehichle Sales Accounting Supplement Creation
ACCEPT p_salesinv PROMPT 'ENTER SALES INVOICE NUMBER:'
ACCEPT p_licfee PROMPT 'ENTER LICENSE FEE:'
ACCEPT p_commission PROMPT 'ENTER COMMISION:'
--VARIABLE g_output VARCHAR2(200)
DECLARE
--	v_salesrec INTEGER;
--	v_numsalesrec EXCEPTION;
BEGIN
--	SELECT COUNT(*)
--	INTO v_salesrec
--	FROM saleinv 
--	WHERE saleinv = &p_salesinv;
	
	UPDATE saleinv
	SET licfee = &p_licfee
	WHERE saleinv = &p_salesinv;
	
	UPDATE saleinv
	SET commission = &p_commission
	WHERE saleinv = &p_salesinv;
	
--	IF v_salesrec = 0 THEN
--		RAISE v_numsalesrec;
--	END IF;
	
--EXCEPTION
--	WHEN v_numsalesrec THEN
--		:g_output:='Following sales invoice number does not exist: '||' '||'';
END;
/
