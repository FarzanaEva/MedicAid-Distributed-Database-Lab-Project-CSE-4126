set serveroutput on;

DECLARE

	res varchar2(100);

BEGIN
	res:= updateAppointment(2);
	DBMS_OUTPUT.PUT_LINE(res);

commit;
END;
/