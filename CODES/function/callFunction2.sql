set serveroutput on;

DECLARE
	theUserName varchar2(70);
	v_docName varchar2(70);
	v_status varchar2(20);
	v_time varchar2(20);

BEGIN
	theUserName := AppointInfo(v_docName,v_status,v_time, 1);
	DBMS_OUTPUT.PUT_LINE('USER NAME: '||theUserName||' DOCTOR NAME: '||v_docName||' APPOINTMENT STATUS: '||v_status);
	if v_status = 'cancel'
	then DBMS_OUTPUT.PUT_LINE('APPOINTMENT TIME: ' || v_time);
	end if;
	
END;
/